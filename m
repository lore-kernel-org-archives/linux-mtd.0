Received: from masquerade.micron.com ([137.201.242.130])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HUCPS-0007B2-KC
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 01:48:13 +0000
Received: from ntxsjombx02.micron.com (ntxsjombx02.micron.com [10.50.198.3])
	by masquerade.micron.com (8.13.6/8.13.6) with ESMTP id l2M1m285031928
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 19:48:02 -0600
From: sshahrom@micron.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] [MTD] NAND: Adding Micron MFR ID
Date: Wed, 21 Mar 2007 18:48:02 -0700
Message-ID: <809D758398CC1F49AA8E493528AD4A27014DF5FF@ntxsjombx02.micron.com>
To: <linux-mtd@lists.infradead.org>
Cc: sshahrom@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,=20
Sorry for confusion, cleaned up from white space. Added Micron
Manufacturing ID.

Signed-off-by: Shahrom Sharif <sshahrom@micron.com>
---
:100644 100644 2e2cdf2... 0000000... M	drivers/mtd/nand/nand_ids.c
:100644 100644 9752388... 0000000... M	include/linux/mtd/nand.h

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 2e2cdf2..9002077 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -137,6 +137,7 @@ struct nand_manufacturers nand_manuf_ids
 	{NAND_MFR_RENESAS, "Renesas"},
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_HYNIX, "Hynix"},
+	{NAND_MFR_MICRON, "Micron"},
 	{0x0, "Unknown"}
 };
=20
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9752388..cf197ad 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -431,6 +431,7 @@ struct nand_chip {
 #define NAND_MFR_RENESAS	0x07
 #define NAND_MFR_STMICRO	0x20
 #define NAND_MFR_HYNIX		0xad
+#define NAND_MFR_MICRON		0x2c
=20
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
