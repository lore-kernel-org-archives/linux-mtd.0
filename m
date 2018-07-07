Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgzY-00064H-Eg
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:46:50 +0000
From: Daniel Mack <daniel@zonque.org>
To: miquel.raynal@bootlin.com
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>,
 stable@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: rawnand: marvell: add suspend and resume hooks
Date: Sat,  7 Jul 2018 08:46:29 +0200
Message-Id: <20180707064631.799-1-daniel@zonque.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch restores the suspend and resume hooks that the old driver used
to have. Apart from stopping and starting the clocks, the resume callback
also nullifies the selected_chip pointer, so the next command that is issued
will re-select the chip and thereby restore the timing registers.

Without this patch, a PXA3xx based system would cough up an error similar to
the one below after resume.

[   44.660162] marvell-nfc 43100000.nand-controller: Timeout waiting for  RB signal
[   44.671492] ubi0 error: ubi_io_write: error -110 while writing 2048 bytes to PEB 102:38912, written 0 bytes
[   44.682887] CPU: 0 PID: 1417 Comm: remote-control Not tainted 4.18.0-rc2+ #344
[   44.691197] Hardware name: Marvell PXA3xx (Device Tree Support)
[   44.697111] Backtrace:
[   44.699593] [<c0106458>] (dump_backtrace) from [<c0106718>] (show_stack+0x18/0x1c)
[   44.708931]  r7:00000800 r6:00009800 r5:00000066 r4:c6139000
[   44.715833] [<c0106700>] (show_stack) from [<c0678a60>] (dump_stack+0x20/0x28)
[   44.724206] [<c0678a40>] (dump_stack) from [<c0456cbc>] (ubi_io_write+0x3d4/0x630)
[   44.732925] [<c04568e8>] (ubi_io_write) from [<c0454428>] (ubi_eba_write_leb+0x690/0x6fc)
...

Signed-off-by: Daniel Mack <daniel@zonque.org>
Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
---
 drivers/mtd/nand/raw/marvell_nand.c | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 00d9f29bbdb6..4644f6e3b930 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2825,6 +2825,54 @@ static int marvell_nfc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused marvell_nfc_suspend(struct device *dev)
+{
+	struct marvell_nfc *nfc = dev_get_drvdata(dev);
+	struct marvell_nand_chip *chip;
+
+	list_for_each_entry(chip, &nfc->chips, node)
+		marvell_nfc_wait_ndrun(&chip->chip);
+
+	clk_disable_unprepare(nfc->reg_clk);
+	clk_disable_unprepare(nfc->core_clk);
+
+	return 0;
+}
+
+static int __maybe_unused marvell_nfc_resume(struct device *dev)
+{
+	struct marvell_nfc *nfc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(nfc->core_clk);
+	if (ret < 0)
+		return ret;
+
+	if (!IS_ERR(nfc->reg_clk)) {
+		ret = clk_prepare_enable(nfc->reg_clk);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * Reset nfc->selected_chip so the next command will cause the timing
+	 * registers to be restored in marvell_nfc_select_chip().
+	 */
+	nfc->selected_chip = NULL;
+
+	/* Reset registers that have lots its contents */
+	writel_relaxed(NDCR_ALL_INT | NDCR_ND_ARB_EN | NDCR_SPARE_EN |
+		       NDCR_RD_ID_CNT(NFCV1_READID_LEN), nfc->regs + NDCR);
+	writel_relaxed(0xFFFFFFFF, nfc->regs + NDSR);
+	writel_relaxed(0, nfc->regs + NDECCCTRL);
+
+	return 0;
+}
+
+static const struct dev_pm_ops marvell_nfc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(marvell_nfc_suspend, marvell_nfc_resume)
+};
+
 static const struct marvell_nfc_caps marvell_armada_8k_nfc_caps = {
 	.max_cs_nb = 4,
 	.max_rb_nb = 2,
@@ -2909,6 +2957,7 @@ static struct platform_driver marvell_nfc_driver = {
 	.driver	= {
 		.name		= "marvell-nfc",
 		.of_match_table = marvell_nfc_of_ids,
+		.pm		= &marvell_nfc_pm_ops,
 	},
 	.id_table = marvell_nfc_platform_ids,
 	.probe = marvell_nfc_probe,
-- 
2.17.1
