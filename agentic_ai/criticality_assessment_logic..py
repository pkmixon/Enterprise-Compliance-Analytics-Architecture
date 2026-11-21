import pandas as pd

def assess_criticality(df):
    """
    Simulates agentic AI assessing the criticality of complaints and flagging high-risk cases.
    """
    # Define high-risk keywords
    high_risk_keywords = ['fraud', 'harassment', 'discrimination', 'regulatory', 'violation']
    
    # Assess criticality based on keywords in the issue description
    def check_criticality(text):
        text_lower = str(text).lower()
        if any(keyword in text_lower for keyword in high_risk_keywords):
            return 'High Risk'
        return 'Standard Risk'
    
    df['criticality_rating'] = df['issue'].apply(check_criticality)
    
    return df

def generate_criticality_report(df):
    """
    Generates a summary of criticality assessments.
    """
    summary = df['criticality_rating'].value_counts().to_dict()
    
    report = f"""
    CRITICALITY ASSESSMENT REPORT
    -----------------------------
    High-Risk Cases Flagged: {summary.get('High Risk', 0)}
    Standard Cases: {summary.get('Standard Risk', 0)}
    """
    return report

# Sample Data Integration
data = {
    'issue': ['Unauthorized charge', 'Harassment claim', 'Defective product', 'Discrimination issue', 'Billing error'],
    'consumer_disputed': ['Yes', 'Yes', 'No', 'Yes', 'No']
}

df = pd.DataFrame(data)
df = assess_criticality(df)
print(generate_criticality_report(df))
