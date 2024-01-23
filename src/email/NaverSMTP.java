//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package email;

import java.util.Map;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class NaverSMTP {
    private final Properties serverInfo = new Properties();
    private final Authenticator auth;

    public NaverSMTP() {
        this.serverInfo.put("mail.smtp.host", "smtp.naver.com");
        this.serverInfo.put("mail.smtp.port", "465");
        this.serverInfo.put("mail.smtp.starttls.enable", "true");
        this.serverInfo.put("mail.smtp.auth", "true");
        this.serverInfo.put("mail.smtp.debug", "true");
        this.serverInfo.put("mail.smtp.socketFactory.port", "465");
        this.serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        this.serverInfo.put("mail.smtp.socketFactory.fallback", "false");
        this.serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
        this.auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("이메일주소", "비밀번호");
            }
        };
    }

    public void emailSending(Map<String, String> mailInfo) throws MessagingException {
        Session session = Session.getInstance(this.serverInfo, this.auth);
        session.setDebug(true);
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress((String)mailInfo.get("from")));
        msg.addRecipient(RecipientType.TO, new InternetAddress((String)mailInfo.get("to")));
        msg.setSubject((String)mailInfo.get("subject"));
        msg.setContent(mailInfo.get("content"), (String)mailInfo.get("format"));
        Transport.send(msg);
    }
}
