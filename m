Received: from eu1sys200aog119.obsmtp.com ([207.126.144.147])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6B-0006Xk-9a
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:04 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/18] fsmc_nand.c: Support of 224-bytes OOB area length
Date: Wed, 7 Mar 2012 17:00:55 +0530
Message-ID: <5e7cace8b77e91fa058691515d77b2ee89e37a78.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Armando Visconti <armando.visconti@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Armando Visconti <armando.visconti@st.com>

The current patch is required to support EVALSPEAR1340CPU
Revision 2 where a new (ONFI compliant) MT29F16G08 NAND
flash from Micron is present.

This NAND flash device defines a OOB area which is
224 bytes long (oobsize).

Signed-off-by: Armando Visconti <armando.visconti@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   40 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 5b217f2..4a018d0 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -130,6 +130,42 @@ static struct nand_ecclayout fsmc_ecc4_256_layout = {
 };
 
 /*
+ * ECC4 layout for NAND of pagesize 4096 bytes & OOBsize 224 bytes. 13*8 bytes
+ * of OOB size is reserved for ECC, Byte no. 0 & 1 reserved for bad block & 118
+ * bytes are free for use.
+ */
+static struct nand_ecclayout fsmc_ecc4_224_layout = {
+	.eccbytes = 104,
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
+		121, 122, 123, 124, 125, 126
+	},
+	.oobfree = {
+		{.offset = 15, .length = 3},
+		{.offset = 31, .length = 3},
+		{.offset = 47, .length = 3},
+		{.offset = 63, .length = 3},
+		{.offset = 79, .length = 3},
+		{.offset = 95, .length = 3},
+		{.offset = 111, .length = 3},
+		{.offset = 127, .length = 97}
+	}
+};
+
+/*
  * ECC4 layout for NAND of pagesize 4096 bytes & OOBsize 128 bytes. 13*8 bytes
  * of OOB size is reserved for ECC, Byte no. 0 & 1 reserved for bad block & 22
  * bytes are free for use.
@@ -856,6 +892,10 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			nand->ecc.layout = &fsmc_ecc4_128_layout;
 			host->ecc_place = &fsmc_ecc4_lp_place;
 			break;
+		case 224:
+			nand->ecc.layout = &fsmc_ecc4_224_layout;
+			host->ecc_place = &fsmc_ecc4_lp_place;
+			break;
 		case 256:
 			nand->ecc.layout = &fsmc_ecc4_256_layout;
 			host->ecc_place = &fsmc_ecc4_lp_place;
-- 
1.7.0.4
