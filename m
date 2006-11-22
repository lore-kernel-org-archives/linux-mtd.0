Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmu9Z-0001Gu-Bv
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 10:37:02 -0500
Received: from unknown (HELO [213.235.233.178]) (301615@[213.235.233.178])
	(envelope-sender <iliev@ronetix.at>)
	by smtprelay01.ispgateway.de (qmail-ldap-1.03) with AES256-SHA
	encrypted SMTP
	for <linux-mtd@lists.infradead.org>; 22 Nov 2006 15:36:44 -0000
Message-ID: <45646E70.1020703@ronetix.at>
Date: Wed, 22 Nov 2006 16:36:16 +0100
From: Ilko Iliev <iliev@ronetix.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND Flashing over JTAG
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am Ilko Iliev from Austrian company RONETIX (www.ronetix.at).
We produce the JTAG Emulator and Flash Programmer PEEDI.

One week ago we added a JFFS2 support to our PEEDI JTAG Flash Programmer 
- www.ronetix.at
It enables the programming of a jffs2 image to a NAND Flash without 
having any bootloader.
Supported are NAND chips with 512 and 2048 bytes pages.

I would like to ask the MTD community if there are some suggestions and 
comments to the JFFS2 support.

Regards,
Ilko Iliev
