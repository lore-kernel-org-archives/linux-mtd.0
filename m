Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F5z-0006U4-Tp
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:31:53 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/18] mtd/fsmc_nand: ECC1 & ECC4 layout separated for
 different page sizes
Date: Wed, 7 Mar 2012 17:00:50 +0530
Message-ID: <b349613ffcc0749bfe5dbd4207cb77b073927fec.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Artem.Bityutskiy@nokia.com, linus.walleij@linaro.org,
 Bhavna Yadav <bhavna.yadav@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bhavna Yadav <bhavna.yadav@st.com>

ECC1 & ECC4 layout for NAND of different pages sizes for e.g. 512bytes, 2K, 4K
and 8K are separated. Previously there existed one ECC4 layout for 2K & 4K page
size due to which oob test module available in drivers/mtd/nand/test was failing

Signed-off-by: Bhavna Yadav <bhavna.yadav@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |  176 ++++++++++++++++++++++++++++++++++++++----
 1 files changed, 159 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 9c7d9d8..abbff77 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -34,7 +34,7 @@
 #include <linux/amba/bus.h>
 #include <mtd/mtd-abi.h>
 
-static struct nand_ecclayout fsmc_ecc1_layout = {
+static struct nand_ecclayout fsmc_ecc1_128_layout = {
 	.eccbytes = 24,
 	.eccpos = {2, 3, 4, 18, 19, 20, 34, 35, 36, 50, 51, 52,
 		66, 67, 68, 82, 83, 84, 98, 99, 100, 114, 115, 116},
@@ -50,7 +50,91 @@ static struct nand_ecclayout fsmc_ecc1_layout = {
 	}
 };
 
-static struct nand_ecclayout fsmc_ecc4_lp_layout = {
+static struct nand_ecclayout fsmc_ecc1_64_layout = {
+	.eccbytes = 12,
+	.eccpos = {2, 3, 4, 18, 19, 20, 34, 35, 36, 50, 51, 52},
+	.oobfree = {
+		{.offset = 8, .length = 8},
+		{.offset = 24, .length = 8},
+		{.offset = 40, .length = 8},
+		{.offset = 56, .length = 8},
+	}
+};
+
+static struct nand_ecclayout fsmc_ecc1_16_layout = {
+	.eccbytes = 3,
+	.eccpos = {2, 3, 4},
+	.oobfree = {
+		{.offset = 8, .length = 8},
+	}
+};
+
+/*
+ * ECC4 layout for NAND of pagesize 8192 bytes & OOBsize 256 bytes. 13*16 bytes
+ * of OB size is reserved for ECC, Byte no. 0 & 1 reserved for bad block and 46
+ * bytes are free for use.
+ */
+static struct nand_ecclayout fsmc_ecc4_256_layout = {
+	.eccbytes = 208,
+	.eccpos = {  2,   3,   4,   5,   6,   7,   8,
+		9,  10,  11,  12,  13,  14,
+		18,  19,  20,  21,  22,  23,  24,
+		25,  26,  27,  28,  29,  30,
+		34,  35,  36,  37,  38,  39,  40,
+		41,  42,  43,  44,  45,  46,
+		50,  51,  52,  53,  54,  55,  56,
+		57,  58,  59,  60,  61,  62,
+		66,  67,  68,  69,  70,  71,  72,
+		73,  74,  75,  76,  77,  78,
+		82,  83,  84,  85,  86,  87,  88,
+		89,  90,  91,  92,  93,  94,
+		98,  99, 100, 101, 102, 103, 104,
+		105, 106, 107, 108, 109, 110,
+		114, 115, 116, 117, 118, 119, 120,
+		121, 122, 123, 124, 125, 126,
+		130, 131, 132, 133, 134, 135, 136,
+		137, 138, 139, 140, 141, 142,
+		146, 147, 148, 149, 150, 151, 152,
+		153, 154, 155, 156, 157, 158,
+		162, 163, 164, 165, 166, 167, 168,
+		169, 170, 171, 172, 173, 174,
+		178, 179, 180, 181, 182, 183, 184,
+		185, 186, 187, 188, 189, 190,
+		194, 195, 196, 197, 198, 199, 200,
+		201, 202, 203, 204, 205, 206,
+		210, 211, 212, 213, 214, 215, 216,
+		217, 218, 219, 220, 221, 222,
+		226, 227, 228, 229, 230, 231, 232,
+		233, 234, 235, 236, 237, 238,
+		242, 243, 244, 245, 246, 247, 248,
+		249, 250, 251, 252, 253, 254
+	},
+	.oobfree = {
+		{.offset = 15, .length = 3},
+		{.offset = 31, .length = 3},
+		{.offset = 47, .length = 3},
+		{.offset = 63, .length = 3},
+		{.offset = 79, .length = 3},
+		{.offset = 95, .length = 3},
+		{.offset = 111, .length = 3},
+		{.offset = 127, .length = 3},
+		{.offset = 143, .length = 3},
+		{.offset = 159, .length = 3},
+		{.offset = 175, .length = 3},
+		{.offset = 191, .length = 3},
+		{.offset = 207, .length = 3},
+		{.offset = 223, .length = 3},
+		{.offset = 239, .length = 3},
+		{.offset = 255, .length = 1}
+	}
+};
+
+/*
+ * ECC4 layout for NAND of pagesize 4096 bytes & OOBsize 128 bytes. 13*8 bytes
+ * of OOB size is reserved for ECC, Byte no. 0 & 1 reserved for bad block & 22
+ * bytes are free for use.
+ */
+static struct nand_ecclayout fsmc_ecc4_128_layout = {
 	.eccbytes = 104,
 	.eccpos = {  2,   3,   4,   5,   6,   7,   8,
 		9,  10,  11,  12,  13,  14,
@@ -82,6 +166,45 @@ static struct nand_ecclayout fsmc_ecc4_lp_layout = {
 };
 
 /*
+ * ECC4 layout for NAND of pagesize 2048 bytes & OOBsize 64 bytes. 13*4 bytes of
+ * OOB size is reserved for ECC, Byte no. 0 & 1 reserved for bad block and 10
+ * bytes are free for use.
+ */
+static struct nand_ecclayout fsmc_ecc4_64_layout = {
+	.eccbytes = 52,
+	.eccpos = {  2,   3,   4,   5,   6,   7,   8,
+		9,  10,  11,  12,  13,  14,
+		18,  19,  20,  21,  22,  23,  24,
+		25,  26,  27,  28,  29,  30,
+		34,  35,  36,  37,  38,  39,  40,
+		41,  42,  43,  44,  45,  46,
+		50,  51,  52,  53,  54,  55,  56,
+		57,  58,  59,  60,  61,  62,
+	},
+	.oobfree = {
+		{.offset = 15, .length = 3},
+		{.offset = 31, .length = 3},
+		{.offset = 47, .length = 3},
+		{.offset = 63, .length = 1},
+	}
+};
+
+/*
+ * ECC4 layout for NAND of pagesize 512 bytes & OOBsize 16 bytes. 13 bytes of
+ * OOB size is reserved for ECC, Byte no. 4 & 5 reserved for bad block and One
+ * byte is free for use.
+ */
+static struct nand_ecclayout fsmc_ecc4_16_layout = {
+	.eccbytes = 13,
+	.eccpos = { 0,  1,  2,  3,  6,  7, 8,
+		9, 10, 11, 12, 13, 14
+	},
+	.oobfree = {
+		{.offset = 15, .length = 1},
+	}
+};
+
+/*
  * ECC placement definitions in oobfree type format.
  * There are 13 bytes of ecc for every 512 byte block and it has to be read
  * consecutively and immediately after the 512 byte data block for hardware to
@@ -103,16 +226,6 @@ static struct fsmc_eccplace fsmc_ecc4_lp_place = {
 	}
 };
 
-static struct nand_ecclayout fsmc_ecc4_sp_layout = {
-	.eccbytes = 13,
-	.eccpos = { 0,  1,  2,  3,  6,  7, 8,
-		9, 10, 11, 12, 13, 14
-	},
-	.oobfree = {
-		{.offset = 15, .length = 1},
-	}
-};
-
 static struct fsmc_eccplace fsmc_ecc4_sp_place = {
 	.eccplace = {
 		{.offset = 0, .length = 4},
@@ -733,15 +846,44 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	}
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
-		if (host->mtd.writesize == 512) {
-			nand->ecc.layout = &fsmc_ecc4_sp_layout;
+		switch (host->mtd.oobsize) {
+		case 16:
+			nand->ecc.layout = &fsmc_ecc4_16_layout;
 			host->ecc_place = &fsmc_ecc4_sp_place;
-		} else {
-			nand->ecc.layout = &fsmc_ecc4_lp_layout;
+			break;
+		case 64:
+			nand->ecc.layout = &fsmc_ecc4_64_layout;
+			host->ecc_place = &fsmc_ecc4_lp_place;
+			break;
+		case 128:
+			nand->ecc.layout = &fsmc_ecc4_128_layout;
+			host->ecc_place = &fsmc_ecc4_lp_place;
+			break;
+		case 256:
+			nand->ecc.layout = &fsmc_ecc4_256_layout;
 			host->ecc_place = &fsmc_ecc4_lp_place;
+			break;
+		default:
+			printk(KERN_WARNING "No oob scheme defined for "
+			       "oobsize %d\n", mtd->oobsize);
+			BUG();
 		}
 	} else {
-		nand->ecc.layout = &fsmc_ecc1_layout;
+		switch (host->mtd.oobsize) {
+		case 16:
+			nand->ecc.layout = &fsmc_ecc1_16_layout;
+			break;
+		case 64:
+			nand->ecc.layout = &fsmc_ecc1_64_layout;
+			break;
+		case 128:
+			nand->ecc.layout = &fsmc_ecc1_128_layout;
+			break;
+		default:
+			printk(KERN_WARNING "No oob scheme defined for "
+			       "oobsize %d\n", mtd->oobsize);
+			BUG();
+		}
 	}
 
 	/* Second stage of scan to fill MTD data-structures */
-- 
1.7.0.4
