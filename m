Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqic7-00011d-J9
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 10:33:19 +0000
Received: by yhjj52 with SMTP id j52so1793037yhj.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 03:33:12 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] mtd: s3c2410: Fix line over 80 characters warning
Date: Mon, 16 Jul 2012 16:02:27 +0530
Message-Id: <1342434747-27622-6-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, dwmw2@infradead.org, David.Woodhouse@intel.com,
 ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following checkpatch warnings:
WARNING: line over 80 characters

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |   30 ++++++++++++++++++++----------
 1 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 3e891e8..6ee85c8 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -540,7 +540,8 @@ static void s3c2412_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 	unsigned long ctrl;
 
 	ctrl = readl(info->regs + S3C2440_NFCONT);
-	writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC, info->regs + S3C2440_NFCONT);
+	writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC,
+					info->regs + S3C2440_NFCONT);
 }
 
 static void s3c2440_nand_enable_hwecc(struct mtd_info *mtd, int mode)
@@ -552,7 +553,8 @@ static void s3c2440_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 	writel(ctrl | S3C2440_NFCONT_INITECC, info->regs + S3C2440_NFCONT);
 }
 
-static int s3c2410_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+static int s3c2410_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
+					u_char *ecc_code)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
 
@@ -566,7 +568,8 @@ static int s3c2410_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u
 	return 0;
 }
 
-static int s3c2412_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+static int s3c2412_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
+					u_char *ecc_code)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
 	unsigned long ecc = readl(info->regs + S3C2412_NFMECC0);
@@ -575,12 +578,14 @@ static int s3c2412_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u
 	ecc_code[1] = ecc >> 8;
 	ecc_code[2] = ecc >> 16;
 
-	pr_debug("calculate_ecc: returning ecc %02x,%02x,%02x\n", ecc_code[0], ecc_code[1], ecc_code[2]);
+	pr_debug("calculate_ecc: returning ecc %02x,%02x,%02x\n",
+				ecc_code[0], ecc_code[1], ecc_code[2]);
 
 	return 0;
 }
 
-static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
+					u_char *ecc_code)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
 	unsigned long ecc = readl(info->regs + S3C2440_NFMECC0);
@@ -619,13 +624,15 @@ static void s3c2440_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	}
 }
 
-static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf,
+					int len)
 {
 	struct nand_chip *this = mtd->priv;
 	writesb(this->IO_ADDR_W, buf, len);
 }
 
-static void s3c2440_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+static void s3c2440_nand_write_buf(struct mtd_info *mtd, const u_char *buf,
+					int len)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
 
@@ -669,7 +676,8 @@ static inline int s3c2410_nand_cpufreq_register(struct s3c2410_nand_info *info)
 					 CPUFREQ_TRANSITION_NOTIFIER);
 }
 
-static inline void s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *info)
+static inline void s3c2410_nand_cpufreq_deregister(
+						struct s3c2410_nand_info *info)
 {
 	cpufreq_unregister_notifier(&info->freq_transition,
 				    CPUFREQ_TRANSITION_NOTIFIER);
@@ -681,7 +689,8 @@ static inline int s3c2410_nand_cpufreq_register(struct s3c2410_nand_info *info)
 	return 0;
 }
 
-static inline void s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *info)
+static inline void s3c2410_nand_cpufreq_deregister(
+						struct s3c2410_nand_info *info)
 {
 }
 #endif
@@ -1004,7 +1013,8 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 	nmtd = info->mtds;
 
 	for (setno = 0; setno < nr_sets; setno++, nmtd++) {
-		pr_debug("initialising set %d (%p, info %p)\n", setno, nmtd, info);
+		pr_debug("initialising set %d (%p, info %p)\n",
+						setno, nmtd, info);
 
 		s3c2410_nand_init_chip(info, nmtd, sets);
 
-- 
1.7.4.1
