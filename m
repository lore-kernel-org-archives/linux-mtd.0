Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELTEt-0000Th-IA
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 18:20:33 -0400
Received: from pgrayson1.inrealm.net (unknown [66.239.3.2])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by ba.realmsys.com (Spam Firewall) with ESMTP id 3B4CA17981
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Sep 2005 16:20:21 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-lQT5jgtNl5YqVoVaf+A3"
Date: Fri, 30 Sep 2005 16:20:24 -0600
Message-Id: <1128118824.6926.96.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [PATCH] Micron NAND Mfg ID
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lQT5jgtNl5YqVoVaf+A3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is a patch to add the Micron nand flash manufacturer id (0x2c) to
mtd. This datasheet corroborates the id:

http://download.micron.com/pdf/datasheets/flash/nand/2gb_nand_m29b.pdf

Pete



--=-lQT5jgtNl5YqVoVaf+A3
Content-Disposition: attachment; filename=mtd-micronid.patch
Content-Type: text/x-patch; name=mtd-micronid.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

[MTD] Adds Micron NAND id
[From: Peter Grayson <pgrayson@realmsys.com>]
diff -uNr mtd/drivers/mtd/nand/nand_ids.c mtd-micronid/drivers/mtd/nand/nand_ids.c
--- mtd/drivers/mtd/nand/nand_ids.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-micronid/drivers/mtd/nand/nand_ids.c	2005-09-30 16:14:18.105466416 -0600
@@ -125,7 +125,8 @@
 	{NAND_MFR_NATIONAL, "National"},
 	{NAND_MFR_RENESAS, "Renesas"},
 	{NAND_MFR_STMICRO, "ST Micro"},
-        {NAND_MFR_HYNIX, "Hynix"},
+	{NAND_MFR_HYNIX, "Hynix"},
+	{NAND_MFR_MICRON, "Micron"},
 	{0x0, "Unknown"}
 };
 
diff -uNr mtd/include/linux/mtd/nand.h mtd-micronid/include/linux/mtd/nand.h
--- mtd/include/linux/mtd/nand.h	2005-09-16 15:30:34.000000000 -0600
+++ mtd-micronid/include/linux/mtd/nand.h	2005-09-30 16:14:55.583768848 -0600
@@ -388,7 +388,8 @@
 #define NAND_MFR_NATIONAL	0x8f
 #define NAND_MFR_RENESAS	0x07
 #define NAND_MFR_STMICRO	0x20
-#define NAND_MFR_HYNIX          0xad
+#define NAND_MFR_HYNIX		0xad
+#define NAND_MFR_MICRON		0x2c
 
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure

--=-lQT5jgtNl5YqVoVaf+A3--
