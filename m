Received: from mail5.asianet.co.th ([203.144.222.214] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwdOw-0001Us-VL
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 04:35:52 -0500
Received: from virscan1.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.197]) (envelope-sender <jay4mail@yahoo.com>)
	by mail5.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 3 Feb 2005 16:35:42 +0700
Received: from ppp-210.86.146.92.revip.asianet.co.th (HELO [10.1.1.33]) ([21
	0.86.146.92])(envelope-sender <jay4mail@yahoo.com>)by mx1.asianet.co.th
	(qm ail-ldap-1.03) with SMTPfor <linux-mtd@lists.infradead.org>;
	3 Feb 2005 16: 35:40 +0700
Message-ID: <4201F06F.4030207@yahoo.com>
Date: Thu, 03 Feb 2005 16:35:43 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2_scan_eraseblock scan only 1 KiB not 4 KiB of 0xFF
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In scan.c, jffs2_scan_eraseblock() scan only 1 KiB of 0xFF not 4 KiB as 
said in the comment. I think the comment is not correct. Do I get it right?


Thanks,
Pathompong Puengrostham

--- scan.c	27 Jan 2005 04:35:22 -0000	1.3
+++ scan.c	3 Feb 2005 09:29:24 -0000
@@ -325,7 +325,7 @@
  	/* We temporarily use 'ofs' as a pointer into the buffer/jeb */
  	ofs = 0;

-	/* Scan only 4KiB of 0xFF before declaring it's empty */
+	/* Scan only 1KiB of 0xFF before declaring it's empty */
  	while(ofs < EMPTY_SCAN_SIZE && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
  		ofs += 4;
