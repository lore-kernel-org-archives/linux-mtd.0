Received: from masquerade.micron.com ([137.201.242.130])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTKkg-00087P-1Z
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 16:30:31 +0000
Received: from ntxsjombx02.micron.com (ntxsjombx02.micron.com [10.50.198.3])
	by masquerade.micron.com (8.13.6/8.13.6) with ESMTP id l2JGULoN022245
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 10:30:21 -0600
From: sshahrom@micron.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] [MTD] NAND: Adding Micron MFR Id
Date: Mon, 19 Mar 2007 09:30:21 -0700
Message-ID: <809D758398CC1F49AA8E493528AD4A27014DF5FB@ntxsjombx02.micron.com>
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


Hello,
Adding Micron manufacturing ID.

Signed-off-by: Shahrom Sharif <sshahrom@micron.com>
---

 drivers/mtd/nand/nand_ids.c |    1 +
 include/linux/mtd/nand.h    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 2e2cdf2..9002077 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -137,6 +137,7 @@ struct nand_manufacturers nand_manuf_ids
        {NAND_MFR_RENESAS, "Renesas"},
        {NAND_MFR_STMICRO, "ST Micro"},
        {NAND_MFR_HYNIX, "Hynix"},
+       {NAND_MFR_MICRON, "Micron"},
        {0x0, "Unknown"}
 };
=20
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9752388..cf197ad 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -431,6 +431,7 @@ struct nand_chip {
 #define NAND_MFR_RENESAS       0x07
 #define NAND_MFR_STMICRO       0x20
 #define NAND_MFR_HYNIX         0xad
+#define NAND_MFR_MICRON                0x2c
=20
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
