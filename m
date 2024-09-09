Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DE0ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vr5VrAlTviqOgtWmBkI/BqrZQlr+nzgAHcwUb+Pr0cg=; b=Yo3PD7uakAk3U+
	0jTkgqPiA7aPUI67yDsMIKCh9pMrT+X8XJOQDOdiqPsPFVYknTZBPAsJQoTy2PWMN4NtjPjPngr8g
	ACXwsGF70TsgFyaA3QNtQOofk00k8qKXeBJ9SnSdAa9PH0zW3QzqYnEYrzLQw3m0FYdW+aFn6UxZS
	68pFWikS3PTCiqYFWij3nReohdaRNTpse00iDZhiYz35P9ylm4gRL+tM18ocDvEFvfmaNSBaM3oRA
	uTcjzqx/z5c5c0MJ5DDYNDrELWjDGkRzCpZjPQMwBHApBeYHrwpvuxddjrjNmagWy0+JHQXMrkwjR
	SOsDaAExQ0j0B4feB7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZWX-0000000112s-2Xb9;
	Mon, 09 Sep 2024 08:13:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZVS-000000010f5-25gp
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 08:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4079F5C566C;
	Mon,  9 Sep 2024 08:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65898C4AF60;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725869536;
	bh=zGI156K8DbqWoyw2ocH/B3ba1rwdCj+JCkaO4wk5b44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rkFteN07UtiLpNUZEPTwB/LpOg4o5kAAcsS6/CybwPBD9Il1BluzTW2xhB22Gg0VT
	 QsCgcoBTQiEFgX9N/h8ug2S4hbaLuq3LuXdtNSp7lsRYwqapQ8ixfjRmUC1ECzAqH5
	 nq+OjH8yYPSIbHAkedhpI6d1AOGuqQgO2qfFmUVbvoHna4JNsgLOY4/5wudAz9KGS5
	 9XkH10VidIkmFCrPaZXQOg/JKBlq8rlbL06EGtGPLpWOO17h8TphIV7LZyBtxNjqyX
	 eXYTkCV/Qx6Ys8+Ae/ovLigfH6eRSBInnZ3JmYlAXNEGU0BjxgnY3jLKFxwn847J8h
	 AvfmbX76hGFeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEBBECE57E;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 09 Sep 2024 11:10:44 +0300
Subject: [PATCH v12 19/38] mtd: rawnand: add support for ts72xx
MIME-Version: 1.0
Message-Id: <20240909-ep93xx-v12-19-e86ab2423d4b@maquefel.me>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
In-Reply-To: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nikita Shubin <nikita.shubin@maquefel.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725869532; l=8042;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=i/4O3b5aty7o4SjMM+K+gfL7IYliyRXUOlGZwklL65Y=;
 b=Yhwm8qxEDZzAicb2tJObDWkHSztAff/5BvgRFYTCHYWeIn2RyuSxjuynBqx4W2PWDw+kfupydm5A
 ZbYTB7f1AfwmWnqlDAPZHcznsCnjVh8vSu9Usd2yBBs/Xi9i3sd5
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_011218_778098_FA523C4D 
X-CRM114-Status: GOOD (  23.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: nikita.shubin@maquefel.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Nikita Shubin <nikita.shubin@maquefel.me>

Technologic Systems has it's own nand controller implementation in CPLD.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/Kconfig                       |   6 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/technologic-nand-controller.c | 222 +++++++++++++++++++++
 3 files changed, 229 insertions(+)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 614257308516..d0aaccf72d78 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -448,6 +448,12 @@ config MTD_NAND_RENESAS
 	  Enables support for the NAND controller found on Renesas R-Car
 	  Gen3 and RZ/N1 SoC families.
 
+config MTD_NAND_TS72XX
+	tristate "ts72xx NAND controller"
+	depends on ARCH_EP93XX && HAS_IOMEM
+	help
+	  Enables support for NAND controller on ts72xx SBCs.
+
 comment "Misc"
 
 config MTD_SM_COMMON
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 25120a4afada..d0b0e6b83568 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_MTD_NAND_MLC_LPC32XX)      += lpc32xx_mlc.o
 obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
 obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
 obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
+obj-$(CONFIG_MTD_NAND_TS72XX)           += technologic-nand-controller.o
 obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
 obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
 obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
new file mode 100644
index 000000000000..0e45a6fd91dd
--- /dev/null
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Technologic Systems TS72xx NAND controller driver
+ *
+ * Copyright (C) 2023 Nikita Shubin <nikita.shubin@maquefel.me>
+ *
+ * Derived from: plat_nand.c
+ *  Author: Vitaly Wool <vitalywool@gmail.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/platnand.h>
+
+#define TS72XX_NAND_CONTROL_ADDR_LINE	BIT(22)	/* 0xN0400000 */
+#define TS72XX_NAND_BUSY_ADDR_LINE	BIT(23)	/* 0xN0800000 */
+
+#define TS72XX_NAND_ALE			BIT(0)
+#define TS72XX_NAND_CLE			BIT(1)
+#define TS72XX_NAND_NCE			BIT(2)
+
+#define TS72XX_NAND_CTRL_CLE		(TS72XX_NAND_NCE | TS72XX_NAND_CLE)
+#define TS72XX_NAND_CTRL_ALE		(TS72XX_NAND_NCE | TS72XX_NAND_ALE)
+
+struct ts72xx_nand_data {
+	struct nand_controller	controller;
+	struct nand_chip	chip;
+	void __iomem		*base;
+	void __iomem		*ctrl;
+	void __iomem		*busy;
+};
+
+static inline struct ts72xx_nand_data *chip_to_ts72xx(struct nand_chip *chip)
+{
+	return container_of(chip, struct ts72xx_nand_data, chip);
+}
+
+static int ts72xx_nand_attach_chip(struct nand_chip *chip)
+{
+	switch (chip->ecc.engine_type) {
+	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		return -EINVAL;
+	case NAND_ECC_ENGINE_TYPE_SOFT:
+		if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
+			chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+		fallthrough;
+	default:
+		return 0;
+	}
+}
+
+static void ts72xx_nand_ctrl(struct nand_chip *chip, u8 value)
+{
+	struct ts72xx_nand_data *data = chip_to_ts72xx(chip);
+	unsigned char bits = ioread8(data->ctrl) & ~GENMASK(2, 0);
+
+	iowrite8(bits | value, data->ctrl);
+}
+
+static int ts72xx_nand_exec_instr(struct nand_chip *chip,
+				const struct nand_op_instr *instr)
+{
+	struct ts72xx_nand_data *data = chip_to_ts72xx(chip);
+	unsigned int timeout_us;
+	u32 status;
+	int ret;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		ts72xx_nand_ctrl(chip, TS72XX_NAND_CTRL_CLE);
+		iowrite8(instr->ctx.cmd.opcode, data->base);
+		ts72xx_nand_ctrl(chip, TS72XX_NAND_NCE);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		ts72xx_nand_ctrl(chip, TS72XX_NAND_CTRL_ALE);
+		iowrite8_rep(data->base, instr->ctx.addr.addrs, instr->ctx.addr.naddrs);
+		ts72xx_nand_ctrl(chip, TS72XX_NAND_NCE);
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		ioread8_rep(data->base, instr->ctx.data.buf.in, instr->ctx.data.len);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		iowrite8_rep(data->base, instr->ctx.data.buf.in, instr->ctx.data.len);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		timeout_us = instr->ctx.waitrdy.timeout_ms * 1000;
+		ret = readb_poll_timeout(data->busy, status, status & BIT(5), 0, timeout_us);
+		if (ret)
+			return ret;
+
+		break;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+
+	return 0;
+}
+
+static int ts72xx_nand_exec_op(struct nand_chip *chip,
+			       const struct nand_operation *op, bool check_only)
+{
+	unsigned int i;
+	int ret;
+
+	if (check_only)
+		return 0;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = ts72xx_nand_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct nand_controller_ops ts72xx_nand_ops = {
+	.attach_chip = ts72xx_nand_attach_chip,
+	.exec_op = ts72xx_nand_exec_op,
+};
+
+static int ts72xx_nand_probe(struct platform_device *pdev)
+{
+	struct ts72xx_nand_data *data;
+	struct fwnode_handle *child;
+	struct mtd_info *mtd;
+	int err;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	nand_controller_init(&data->controller);
+	data->controller.ops = &ts72xx_nand_ops;
+	data->chip.controller = &data->controller;
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+	data->ctrl = data->base + TS72XX_NAND_CONTROL_ADDR_LINE;
+	data->busy = data->base + TS72XX_NAND_BUSY_ADDR_LINE;
+
+	child = fwnode_get_next_child_node(dev_fwnode(&pdev->dev), NULL);
+	if (!child)
+		return dev_err_probe(&pdev->dev, -ENXIO,
+				"ts72xx controller node should have exactly one child\n");
+
+	nand_set_flash_node(&data->chip, to_of_node(child));
+	mtd = nand_to_mtd(&data->chip);
+	mtd->dev.parent = &pdev->dev;
+	platform_set_drvdata(pdev, data);
+
+	/*
+	 * This driver assumes that the default ECC engine should be TYPE_SOFT.
+	 * Set ->engine_type before registering the NAND devices in order to
+	 * provide a driver specific default value.
+	 */
+	data->chip.ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+
+	/* Scan to find existence of the device */
+	err = nand_scan(&data->chip, 1);
+	if (err)
+		goto err_handle_put;
+
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err)
+		goto err_clean_nand;
+
+	return 0;
+
+err_clean_nand:
+	nand_cleanup(&data->chip);
+err_handle_put:
+	fwnode_handle_put(child);
+	return err;
+}
+
+static void ts72xx_nand_remove(struct platform_device *pdev)
+{
+	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
+	struct nand_chip *chip = &data->chip;
+	int ret;
+
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_cleanup(chip);
+	fwnode_handle_put(fwnode);
+}
+
+static const struct of_device_id ts72xx_id_table[] = {
+	{ .compatible = "technologic,ts7200-nand" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ts72xx_id_table);
+
+static struct platform_driver ts72xx_nand_driver = {
+	.driver = {
+		.name = "ts72xx-nand",
+		.of_match_table = ts72xx_id_table,
+	},
+	.probe = ts72xx_nand_probe,
+	.remove_new = ts72xx_nand_remove,
+};
+module_platform_driver(ts72xx_nand_driver);
+
+MODULE_AUTHOR("Nikita Shubin <nikita.shubin@maquefel.me>");
+MODULE_DESCRIPTION("Technologic Systems TS72xx NAND controller driver");
+MODULE_LICENSE("GPL");

-- 
2.43.2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
