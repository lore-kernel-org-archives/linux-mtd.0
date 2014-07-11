Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Vgj-0001Ow-K4
 for linux-mtd@lists.infradead.org; Fri, 11 Jul 2014 07:56:14 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: define struct nand_timings
Date: Fri, 11 Jul 2014 09:49:41 +0200
Message-Id: <1405064982-11456-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Define a struct containing the standard NAND timings as described in NAND
datasheets.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 include/linux/mtd/nand.h | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2f0af28..a3a45f2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -947,4 +947,53 @@ static inline int jedec_feature(struct nand_chip *chip)
 	return chip->jedec_version ? le16_to_cpu(chip->jedec_params.features)
 		: 0;
 }
+
+/**
+ * struct nand_sdr_timings - SDR NAND chip timings
+ *
+ * This struct defines the timing requirements of a SDR NAND chip.
+ * These informations can be found in every NAND datasheets and the timings
+ * meaning are described in the ONFI specifications:
+ * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
+ * Parameters)
+ *
+ * All these timings are expressed in picoseconds.
+ */
+
+struct nand_sdr_timings {
+	u32 tALH_min;
+	u32 tADL_min;
+	u32 tALS_min;
+	u32 tAR_min;
+	u32 tCEA_max;
+	u32 tCEH_min;
+	u32 tCH_min;
+	u32 tCHZ_max;
+	u32 tCLH_min;
+	u32 tCLR_min;
+	u32 tCLS_min;
+	u32 tCOH_min;
+	u32 tCS_min;
+	u32 tDH_min;
+	u32 tDS_min;
+	u32 tFEAT_max;
+	u32 tIR_min;
+	u32 tITC_max;
+	u32 tRC_min;
+	u32 tREA_max;
+	u32 tREH_min;
+	u32 tRHOH_min;
+	u32 tRHW_min;
+	u32 tRHZ_max;
+	u32 tRLOH_min;
+	u32 tRP_min;
+	u32 tRR_min;
+	u64 tRST_max;
+	u32 tWB_max;
+	u32 tWC_min;
+	u32 tWH_min;
+	u32 tWHR_min;
+	u32 tWP_min;
+	u32 tWW_min;
+};
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.8.3.2
