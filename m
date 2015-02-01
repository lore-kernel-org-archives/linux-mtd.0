From: Nicholas Mc Guire <hofrat@osadl.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] mtd: pxa3xx_nand: cleanup wait_for_completion handling
Date: Sun,  1 Feb 2015 11:55:37 -0500
Message-Id: <1422809737-3991-1-git-send-email-hofrat@osadl.org>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Mc Guire <hofrat@osadl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

return type of wait_for_completion_timeout is unsigned long not int, this
patch uses the return value of wait_for_completion_timeout in the condition
directly rather than assigning it to an incorrect type variable.

The timeout declaration cleanup is just for readability

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

The variable used for handling the return of wait_for_cmpletion_timeout
was int but should be unsigned long, where it was not in use for anything
else and the return value in case of completion (>0) is not used it was
removed and wait_for_completion_timeout() used directly in the if condition.

To make the timeout values a bit simpler to read and also handle all of
the corner cases correctly the declarations are moved to msecs_to_jiffies().

This patch was only compile tested for pxa3xx_defconfig 
(implies CONFIG_MTD_NAND_PXA3xx=y)

Patch is against 3.0.19-rc6 -next-20150130 

 drivers/mtd/nand/pxa3xx_nand.c |   24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 96b0b1d..ef6545b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -38,8 +38,8 @@
 
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
-#define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
-#define NAND_STOP_DELAY		(2 * HZ/50)
+#define	CHIP_DELAY_TIMEOUT	msecs_to_jiffies(200)
+#define NAND_STOP_DELAY		msecs_to_jiffies(40)
 #define PAGE_CHUNK_SIZE		(2048)
 
 /*
@@ -915,7 +915,7 @@ static void nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
-	int ret, exec_cmd;
+	int exec_cmd;
 
 	/*
 	 * if this is a x16 device ,then convert the input
@@ -947,9 +947,8 @@ static void nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		info->need_wait = 1;
 		pxa3xx_nand_start(info);
 
-		ret = wait_for_completion_timeout(&info->cmd_complete,
-				CHIP_DELAY_TIMEOUT);
-		if (!ret) {
+		if (!wait_for_completion_timeout(&info->cmd_complete,
+		    CHIP_DELAY_TIMEOUT)) {
 			dev_err(&info->pdev->dev, "Wait time out!!!\n");
 			/* Stop State Machine for next command cycle */
 			pxa3xx_nand_stop(info);
@@ -964,7 +963,7 @@ static void nand_cmdfunc_extended(struct mtd_info *mtd,
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
-	int ret, exec_cmd, ext_cmd_type;
+	int exec_cmd, ext_cmd_type;
 
 	/*
 	 * if this is a x16 device then convert the input
@@ -1027,9 +1026,8 @@ static void nand_cmdfunc_extended(struct mtd_info *mtd,
 		init_completion(&info->cmd_complete);
 		pxa3xx_nand_start(info);
 
-		ret = wait_for_completion_timeout(&info->cmd_complete,
-				CHIP_DELAY_TIMEOUT);
-		if (!ret) {
+		if (!wait_for_completion_timeout(&info->cmd_complete,
+		    CHIP_DELAY_TIMEOUT)) {
 			dev_err(&info->pdev->dev, "Wait time out!!!\n");
 			/* Stop State Machine for next command cycle */
 			pxa3xx_nand_stop(info);
@@ -1162,13 +1160,11 @@ static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
-	int ret;
 
 	if (info->need_wait) {
-		ret = wait_for_completion_timeout(&info->dev_ready,
-				CHIP_DELAY_TIMEOUT);
 		info->need_wait = 0;
-		if (!ret) {
+		if (!wait_for_completion_timeout(&info->dev_ready,
+		    CHIP_DELAY_TIMEOUT)) {
 			dev_err(&info->pdev->dev, "Ready time out!!!\n");
 			return NAND_STATUS_FAIL;
 		}
-- 
1.7.10.4
