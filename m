Received: from msr56.hinet.net ([168.95.4.156] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17byj3-0005Rs-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 08:25:53 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id PAA07673
	for <linux-mtd@lists.infradead.org>; Tue, 6 Aug 2002 15:26:52 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: NAND Configuration
Date: Tue, 6 Aug 2002 15:25:41 +0800
Message-ID: <001601c23d1a$7c6a4ae0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Does I have to set CONFIG_MTD_NAND_ECC_JFFS2=y and
CONFIG_JFFS2_FS_NAND=y to use NAND flash? Weh I set these settings, I
will get the following easily. If  I did not set these settings and the
condition is better, still has problem, but it will not halt the system.
If I need not set CONFIG_MTD_NAND_ECC_JFFS2=y and
CONFIG_JFFS2_FS_NAND=y, I can trace my problem easily. I use
mtd-snapshot-20020731.tar.bz2 with uClinux.


Steve Tsai


ARGH. About to write node to 0x0018de8c on flash, but there are data
already the
re:
0x0018de8c: 85 19 04 20 74 01 00 00 4d 62 52 56 ff ff ff ff
pid 24: failed 256

jffs2_flush_wbuf(): Write failed with -5
Write of 68 bytes at 0x004da000 failed. returned -5, retlen 0
Not marking the space at 0x004da000 as dirty because the flash driver
returned r
etlen zero
