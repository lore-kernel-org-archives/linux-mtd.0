Received: from mail-by2nam05on0617.outbound.protection.outlook.com
 ([2a01:111:f400:fe52::617]
 helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKyv0-00020F-Kf
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 05:01:20 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <michals@xilinx.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasuresh12@gmail.com>, <robh@kernel.org>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v12 2/3] mtd: rawnand: Add an option to get sdr timing
 mode number
Date: Fri, 9 Nov 2018 10:30:40 +0530
Message-ID: <1541739641-17789-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some NAND controllers need SDR timing mode value, instead of timings.
i.e the NAND controller will change its operating mode by
just configuring the sdr timing mode number. So add a mode field to
struct nand_sdr_timings

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v12:
 - Typo corrections as suggested by Boris
Changes in v11:
 - None
Changes in v10:
 - None
Changes in v9:
 - None
Changes in v8:
 - None
Changes in v7:
 - None
Changes in v6:
 - None
Changes in v5:
 - None
Changes in v4:
 - None
Changes in v3:
 - None
Changes in v2:
 - None
---
 drivers/mtd/nand/raw/nand_timings.c | 6 ++++++
 include/linux/mtd/rawnand.h         | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index bea3062..500c16b 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -57,6 +57,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tWHR_min = 120000,
 			.tWP_min = 50000,
 			.tWW_min = 100000,
+			.mode = 0,
 		},
 	},
 	/* Mode 1 */
@@ -99,6 +100,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tWHR_min = 80000,
 			.tWP_min = 25000,
 			.tWW_min = 100000,
+			.mode = 1,
 		},
 	},
 	/* Mode 2 */
@@ -141,6 +143,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tWHR_min = 80000,
 			.tWP_min = 17000,
 			.tWW_min = 100000,
+			.mode = 2,
 		},
 	},
 	/* Mode 3 */
@@ -183,6 +186,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tWHR_min = 80000,
 			.tWP_min = 15000,
 			.tWW_min = 100000,
+			.mode = 3,
 		},
 	},
 	/* Mode 4 */
@@ -225,6 +229,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tWHR_min = 80000,
 			.tWP_min = 12000,
 			.tWW_min = 100000,
+			.mode = 4,
 		},
 	},
 	/* Mode 5 */
@@ -267,6 +272,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 			.tWHR_min = 80000,
 			.tWP_min = 10000,
 			.tWW_min = 100000,
+			.mode = 5,
 		},
 	},
 };
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e10b126..223b656 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -466,6 +466,7 @@ struct nand_ecc_ctrl {
  * @tWHR_min: WE# high to RE# low
  * @tWP_min: WE# pulse width
  * @tWW_min: WP# transition to WE# low
+ * @mode: sdr timing mode value
  */
 struct nand_sdr_timings {
 	u64 tBERS_max;
@@ -506,6 +507,7 @@ struct nand_sdr_timings {
 	u32 tWHR_min;
 	u32 tWP_min;
 	u32 tWW_min;
+	u32 mode;
 };
 
 /**
-- 
2.7.4
