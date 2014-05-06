Received: from mail.dev.rtsoft.ru ([213.79.90.226] helo=dev.rtsoft.ru)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Whbwa-0003Np-VF
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 09:45:50 +0000
From: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@linaro.org>,
 Rob Herring <rob.herring@calxeda.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: [PATCH] mtd: fsl_elbc_nand: set NAND_NO_SUBPAGE_WRITE flag if using
 hardware ECC
Date: Tue,  6 May 2014 13:14:38 +0400
Message-Id: <1399367678-31878-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Cc: lugovskoy@dev.rtsoft.ru, Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per MPC8572E manual, sec 14.4.3.1.3: "Transfers shorter than a full page,
however, require software to prepare the appropriate ECC in the spare
region"

Need to set NAND_NO_SUBPAGE_WRITE flag. If this is not done, then
generic nand_write_subpage_hwecc() is called instead of driver's
write routine, which results into OOPS dereferencing NULL chip->ecc.hwctl
pointer.

Signed-off-by: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index ec549cd..bb146a0 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -766,6 +766,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
 	    BR_DECC_CHK_GEN) {
 		chip->ecc.mode = NAND_ECC_HW;
+		/* hardware can't calculate ECC for subpages */
+		chip->options |= NAND_NO_SUBPAGE_WRITE;
 		/* put in small page settings and adjust later if needed */
 		chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
 				&fsl_elbc_oob_sp_eccm1 : &fsl_elbc_oob_sp_eccm0;
-- 
1.7.10.4
