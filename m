Received: from mail-wi0-f179.google.com ([209.85.212.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4nRA-0000Fw-Uv
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 09:45:45 +0000
Received: by wiwd19 with SMTP id d19so98294444wiw.0
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 02:45:20 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Linux MTD Mailinglist <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, Rafal Milecki <zajec5@gmail.com>
Subject: [RFC Patch 3/3] mtd: nand: Add custom timings for Hynix
 H27UBG8T2BTR-BC
Date: Tue, 16 Jun 2015 11:45:04 +0200
Message-Id: <1434447904-31748-4-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
References: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Roy Spliet <r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This particular chip has a tADL so high that only ONFI mode 0 matches all
timings. Using this custom timing definition, we can ramp the clock up to
50MHz, having a significant positive effect on performance (e.g. boot time
reduction of 30%).
---
 drivers/mtd/nand/nand_ids.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index dd620c1..15b4a03 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -19,6 +19,49 @@
 #define SP_OPTIONS16 (SP_OPTIONS | NAND_BUSWIDTH_16)
 
 /*
+ * Hynix H27UBG8T2BTR timings
+ * This chip has an exceptionally large tADL, which results in only supporting
+ * ONFI timing mode 0. Using these timings, the clock can be raised from
+ * 12.5MHz to 50MHz.
+ */
+const struct nand_sdr_timings hynix_h27ubg8t2btr_sdr_timing = {
+	.tADL_min = 200000,
+	.tALH_min = 5000,
+	.tALS_min = 10000,
+	.tAR_min = 10000,
+	.tCEA_max = 100000,
+	.tCEH_min = 20000,
+	.tCH_min = 5000,
+	.tCHZ_max = 50000,
+	.tCLH_min = 5000,
+	.tCLR_min = 10000,
+	.tCLS_min = 10000,
+	.tCOH_min = 15000,
+	.tCS_min = 20000,
+	.tDH_min = 5000,
+	.tDS_min = 10000,
+	.tFEAT_max = 1000000,
+	.tIR_min = 0,
+	.tITC_max = 1000000,
+	.tRC_min = 20000,
+	.tREA_max = 16000,
+	.tREH_min = 8000,
+	.tRHOH_min = 15000,
+	.tRHW_min = 100000,
+	.tRHZ_max = 100000,
+	.tRLOH_min = 5000,
+	.tRP_min = 10000,
+	.tRST_max = 500000000,
+	.tWB_max = 100000,
+	.tRR_min = 20000,
+	.tWC_min = 20000,
+	.tWH_min = 10000,
+	.tWHR_min = 80000,
+	.tWP_min = 8000,
+	.tWW_min = 100000,
+};
+
+/*
  * The chip ID list:
  *    name, device ID, page size, chip size in MiB, eraseblock size, options
  *
@@ -50,6 +93,10 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
 		  4 },
+	{"H27UBG8T2BTR-BC 64G 3.3V 8-bit",
+		{ .id = {0xad, 0xd7, 0x94, 0xda, 0x74, 0xc3} },
+		  SZ_8K, SZ_4K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
+		  0, &hynix_h27ubg8t2btr_sdr_timing },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
-- 
2.4.3


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
