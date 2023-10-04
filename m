Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF82E7B5E1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RPmve0TeQ9oE8HHEvGwRN96YMKyqqWaMFqWs/uZTOOw=; b=UQ0SA1tUY/a/gt
	yFALkpBP2NPX7pezj8IeZoFgMa+Xmb+nUSlTZxTYcFp+Mg3wLkCZsntXwWroE7P26OCPHngtV/aEr
	DehYTyD+HyUX8Uq2ogJthdjd/MFrS9luFrlT7pTnutmNqtn20QXWdCuRDbsqE52de8u0kfrcgo6Mb
	/3hgD+NExeVZWmcg3VXxL8uQZUbHmgSR/KwmxZFnEf+TfbDE5S5ebuhMwfkWrgX2Tw8yXR8RaxEgr
	Uq+RfvUmleXgwf6pf00aKoujv0iL0ZHopW7lXY7wBmKwQiZzplHMS95F9M+Ptb83F506XOmK7gsYd
	ehdk8FvwMVZ3bntK37lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyDC-00H44u-2P;
	Wed, 04 Oct 2023 09:30:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxAF-00GnQY-0p
	for linux-mtd@bombadil.infradead.org;
	Wed, 04 Oct 2023 08:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NBlXq2/znwEY79YbEQPznFhggdABhgMjN7KtvmANE5g=; b=dPs/wG/JsauJXQvAIrYI5R+K/W
	Olx74AAwiZLJg2uqRd34auKv2GEBOs17IOE6n7YZTYwj3JP1zpbzk4xL7vrzfY4q8CFHknAP7dmDT
	x4auFPV5jl6ESYd3kyJALREbHXN6OAklFod7WSCNXDIAhtAvM4N4f9/tQoJLDvXRVGGziL80s19yZ
	FfWOdeTTNoXY/ZTvk4nFoIsDuOYcV4mupcym6orpo9dco/Rl/5CU8m381YwlqNwIXuIJG8DajGczt
	eve6Fm7nHv6h2SEK3bL6UO44cLuKet1BmpAIEI/0wQjoNmtIt9IIetUBq5JlbbNKjB+yJxIpy0H94
	HNNVkvlg==;
Received: from forward102a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d102])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnx9b-00Abdu-1s
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 08:23:21 +0000
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:170e:0:640:d60c:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTP id 9B05346C79;
	Wed,  4 Oct 2023 11:22:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id ZMSiN1UDWuQ0-6ZdMzIvA;
	Wed, 04 Oct 2023 11:22:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1696407756; bh=NBlXq2/znwEY79YbEQPznFhggdABhgMjN7KtvmANE5g=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=YzfPvXUuO0vFJkNmGFnUGxqnbMX3bWst2lR9xnJyiIjz0+97bKcYmgRVyY7c9Pkjg
	 SWFi1oU/DX0Lvu5hSmQpYbfBhWtjNj6fQK/pssoWmccyVavPRusmmFJ7pSgq3vb0a7
	 ZWuSS2r22kb6QK81K2goaepfW1BfPiIn1jOeeD04=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [RFC PATCH v2] mtd: nand: add support for ts72xx
Date: Wed,  4 Oct 2023 11:22:23 +0300
Message-Id: <20231004082223.12762-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_092250_698009_E8EB3D9F 
X-CRM114-Status: GOOD (  25.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Technologic Systems has it's own nand controller implementation in CPLD.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
Changelog v2:
- dropped check for READCACHE
- reordered Makefile

Link: https://lore.kernel.org/linux-mtd/20230926132725.5d570e1b@xps-13/T/#md7e5e944a6a08e24f4f1e20068a49f94794ab945
---
 drivers/mtd/nand/raw/Kconfig                  |   7 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 .../nand/raw/technologic-nand-controller.c    | 220 ++++++++++++++++++
 3 files changed, 228 insertions(+)
 create mode 100644 drivers/mtd/nand/raw/technologic-nand-controller.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b523354dfb00..16219909d4c3 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -456,6 +456,13 @@ config MTD_NAND_RENESAS
 	  Enables support for the NAND controller found on Renesas R-Car
 	  Gen3 and RZ/N1 SoC families.
 
+config MTD_NAND_TS72XX
+	tristate "ts72xx NAND controller"
+	depends on ARCH_EP93XX && HAS_IOMEM
+	help
+	  Enables support for NAND controller on ts72xx SBCs.
+	  This is a legacy driver based on gen_nand.
+
 comment "Misc"
 
 config MTD_SM_COMMON
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index d93e861d8ba7..c0c42385d1ed 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_MTD_NAND_MLC_LPC32XX)      += lpc32xx_mlc.o
 obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
 obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
 obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
+obj-$(CONFIG_MTD_NAND_TS72XX)           += technologic-nand-controller.o
 obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
 obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
 obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
new file mode 100644
index 000000000000..2d163a523dcc
--- /dev/null
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -0,0 +1,220 @@
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
+	case NAND_ECC_ENGINE_TYPE_SOFT:
+		if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
+			chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+		break;
+	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		return -EINVAL;
+	default:
+		break;
+	}
+
+	return 0;
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
+	unsigned int i, timeout_us;
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
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			iowrite8(instr->ctx.addr.addrs[i], data->base);
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
+	struct nand_chip *chip = &data->chip;
+	int ret;
+
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_cleanup(chip);
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
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
