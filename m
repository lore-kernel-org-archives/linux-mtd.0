Received: from mail1.asianet.co.th ([203.144.222.229] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cu0Vo-0004mB-QH
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2005 22:40:07 -0500
Received: from virscan1.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.197]) (envelope-sender <jay4mail@yahoo.com>)
	by mail1.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 27 Jan 2005 10:39:57 +0700
Received: from ppp-210.86.146.220.revip.asianet.co.th (HELO [10.1.1.33]) ([2
	10.86.146.220])(envelope-sender <jay4mail@yahoo.com>)by
	mx1.asianet.co.th (
	qmail-ldap-1.03) with SMTPfor <linux-mtd@lists.infradead.org>;
	27 Jan 2005 10:39:37 +0700
Message-ID: <41F8627B.1060809@yahoo.com>
Date: Thu, 27 Jan 2005 10:39:39 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Subject: AM29LV800BB not detected by jedec_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

My board has 1 AM29LV800BB chip in 16-bit mode with 16-bit buswidth. 
jedec_probe v 1.61 cannot detect it but v 1.51 can. After I commented 
out the line in finfo_uaddr() that force the unlock addresses to be 
8-bit mode, it detected the chip and ran just fine. Has anybody 
experienced this?

Best regards,
Pathompong Puengrostham
