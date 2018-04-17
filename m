Received: from ch3vs03.rockwellcollins.com ([205.175.226.47])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8W0r-0000pn-Q1
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2018 19:11:35 +0000
From: Ronak Desai <ronak.desai@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Cc: prabhakar.kushwaha@nxp.com,
	ronak.desai@rockwellcollins.com
Subject: [PATCH] Added set feature command in FSL IFC nand controller driver
 for ONFI nand
Date: Tue, 17 Apr 2018 14:10:59 -0500
Message-Id: <1523992259-56588-1-git-send-email-ronak.desai@rockwellcollins.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds set feature command (EFh) support in Freescale IFC nand
controller driver.

The SET FEATURES (EFh) command is used to modify the target's default
power-on behavior. This command uses one-byte feature address to
determine which sub-feature parameters will be modified.

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |   51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index af85c4b..20b97ef 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -613,6 +613,23 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
		fsl_ifc_run_command(mtd);
		return;

+	case NAND_CMD_SET_FEATURES: {
+		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
+			(IFC_FIR_OP_UA << IFC_NAND_FIR0_OP1_SHIFT) |
+			(IFC_FIR_OP_WBCD << IFC_NAND_FIR0_OP2_SHIFT),
+			&ifc->ifc_nand.nand_fir0);
+
+		ifc_out32((NAND_CMD_SET_FEATURES << IFC_NAND_FCR0_CMD0_SHIFT),
+			&ifc->ifc_nand.nand_fcr0);
+
+		ifc_out32(column, &ifc->ifc_nand.row3);
+
+		 /* Write only 4 bytes from flash buffer */
+		ifc_out32(4, &ifc->ifc_nand.nand_fbcr);
+		fsl_ifc_run_command(mtd);
+		return;
+	}
+
	case NAND_CMD_RNDOUT: {
		__le16 Tccs = 0;
		chip->onfi_version ? (Tccs = chip->onfi_params.t_ccs)
@@ -905,6 +922,39 @@ static void fsl_ifc_sram_init(struct fsl_ifc_mtd *priv)
	ifc_out32(csor_ext, &ifc_global->csor_cs[cs].csor_ext);
 }

+/**
+ * fsl_ifc_onfi_set_features- set features for ONFI nand
+ * @mtd: MTD device structure
+ * @chip: nand chip info structure
+ * @addr: feature address.
+ * @subfeature_param: the subfeature parameters, a four bytes array.
+ */
+static int fsl_ifc_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
+			int addr, uint8_t *subfeature_param)
+{
+	int status;
+	int i;
+
+#ifdef CONFIG_SYS_NAND_ONFI_DETECTION
+	if (!chip->onfi_version ||
+	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
+	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+		return -EINVAL;
+#endif
+
+	/* Want data from start of the buffer */
+	set_addr(mtd, 0, 0, 0);
+
+	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
+		chip->write_byte(mtd, subfeature_param[i]);
+
+	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, 0);
+
+	status = chip->waitfunc(mtd, chip);
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
+	return 0;
+}
 static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 {
	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
@@ -932,6 +982,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
	chip->select_chip = fsl_ifc_select_chip;
	chip->cmdfunc = fsl_ifc_cmdfunc;
	chip->waitfunc = fsl_ifc_wait;
+	chip->onfi_set_features = fsl_ifc_onfi_set_features;

	chip->bbt_td = &bbt_main_descr;
	chip->bbt_md = &bbt_mirror_descr;
--
1.7.9.5
