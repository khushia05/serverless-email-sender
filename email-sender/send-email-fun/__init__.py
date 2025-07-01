import logging
import os
import azure.functions as func
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        # Input from request
        req_body = req.get_json()
        to_email = req_body.get('to')
        name = req_body.get('name', 'Candidate')  # Default 'Candidate' if not provided

        # Fixed Subject & Body with personalized name
        subject = "Thank you for applying!"
        body = f"""
        <p>Dear {name},</p>
        <p>Thank you for applying for the job. We have received your application and will get back to you soon.</p>
        <p>Regards,<br/>Khushi's Company</p>
        """

        message = Mail(
            from_email='kagrahari2024@gmail.com',   # ✅ Make sure this is a verified sender
            to_emails=to_email,
            subject=subject,
            html_content=body
        )

        sg = SendGridAPIClient(os.environ['SENDGRID_API_KEY'])
        response = sg.send(message)

        logging.info(f"SendGrid response status: {response.status_code}")
        logging.info(f"Response body: {response.body}")

        return func.HttpResponse(
            f"Email sent to {to_email}",
            status_code=200
        )

    except Exception as e:
        logging.exception("Exception occurred while sending email")   # ✅ This line prints full stack trace
        return func.HttpResponse(
            f"Error sending email: {str(e)}",   # ✅ Include error message in HTTP response for debugging
            status_code=500
        )
