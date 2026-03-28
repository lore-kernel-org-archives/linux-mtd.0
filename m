Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B78110F3DEC
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2026 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c2cYwkG2FHPPeF8IN+Qd/rsPcOElvWnUMqPtI8y8+s=; b=tmF1KMfWDQLota
	DHYFJh+HSMkXNJoYml7r9VL+/YYmSH9H7WhpGAtgwFPLr4W8sAZ9lF+mrEUpznQxtYkpWwacrjMQ6
	f7EY+nsCnXIUrzIjrftxTDqh9eR1lY/IRgSmT3GfTDTsLRE1I+Re1MId8Xv23coQZ4sHug7GBb8t9
	7TxFbd4p0X/3Xlc+91AX4ikL/HoHnJeO/bEbNl50Tn9hwG1/srUvpKZnACVuEmvuuYZffjYEKoBwD
	wCNR+HVhswpe/LP38WTvIXNN5lwawbvDo0KwtCOmQFnFzdM06iYwZsmSxwmsrnLp9+84L6EggLFEp
	NfC/d7tRUXw/xQnqxCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6W12-000000095Up-0Clj;
	Sat, 28 Mar 2026 15:56:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6W0z-000000095US-2b7q
	for linux-mtd@lists.infradead.org;
	Sat, 28 Mar 2026 15:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA5D8600AE;
	Sat, 28 Mar 2026 15:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A26C2BC86;
	Sat, 28 Mar 2026 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774713356;
	bh=UD/TwSuuylvsTVk6WuLqLc/i823tJemYw2VTGjQDzOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bm7fMoYFkUbimvOYpNbqJa1zS9jOSlu3hhkd1VIWosEKAiRFMr0AbqbdeuoXQ6za1
	 slZjp+JbOw4XGUTyGKd83DJdlyE5RLol1fN1LxQZS3Qy5C5ae/SHwu7NvyvLNl+7Kl
	 Tmy9K7uxnwDUIRiXkcR4sy4eXorE6OLiKOqpKde6NYgCh+LgD0jhwG5nfFsQoePwmZ
	 5NBVj5J41BY1UqisNpeBe79Z7tqOQ3DxRnBATawJnrhNFinStUy9sE6tcHzv/y5sVB
	 +qsZ1B1KWFzbeMgHRm8nwy9ZbvEPdthwa1FuEKJx/2bZcB7mlBXeONsodKpwPcFNS7
	 d0+YXPgPSQ2hA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Mar 2026 16:55:48 +0100
Subject: [PATCH 2/2] MIPS/mtd: Handle READY GPIO in generic NAND platform
 data
MIME-Version: 1.0
Message-Id: <20260328-mips-input-rb532-button-v1-2-98e201621501@kernel.org>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
In-Reply-To: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

The callbacks into the MIPS RB532 platform to read the GPIO pin
indicating that the NAND chip is ready are oldschool and does
not assign GPIOs as properties to the NAND device.

Add a capability to the generic platform NAND chip driver to use
a GPIO line to detect if a NAND chip is ready and override the
platform-local drv_ready() callback with this check if the GPIO
is present.

This makes it possible to drop the legacy include header
<linux/gpio.h> from the RB532 devices.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/mips/rb532/devices.c        | 36 +++++++++++++++++++++---------------
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 3f56d9feb73a..c3d8d96d0ef5 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -14,7 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/mtd/platnand.h>
 #include <linux/mtd/mtd.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/gpio_keys.h>
@@ -135,12 +134,6 @@ static struct platform_device cf_slot0 = {
 	.num_resources = ARRAY_SIZE(cf_slot0_res),
 };
 
-/* Resources and device for NAND */
-static int rb532_dev_ready(struct nand_chip *chip)
-{
-	return gpio_get_value(GPIO_RDY);
-}
-
 static void rb532_cmd_ctrl(struct nand_chip *chip, int cmd, unsigned int ctrl)
 {
 	unsigned char orbits, nandbits;
@@ -166,16 +159,23 @@ static struct resource nand_slot0_res[] = {
 };
 
 static struct platform_nand_data rb532_nand_data = {
-	.ctrl.dev_ready = rb532_dev_ready,
 	.ctrl.cmd_ctrl	= rb532_cmd_ctrl,
 };
 
-static struct platform_device nand_slot0 = {
-	.name = "gen_nand",
-	.id = -1,
-	.resource = nand_slot0_res,
-	.num_resources = ARRAY_SIZE(nand_slot0_res),
-	.dev.platform_data = &rb532_nand_data,
+static const struct property_entry nand0_properties[] = {
+	PROPERTY_ENTRY_GPIO("ready-gpios", &rb532_gpio0_node,
+			    GPIO_RDY, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct platform_device_info nand0_info  __initconst = {
+	.name		= "gen_nand",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= nand_slot0_res,
+	.num_res	= ARRAY_SIZE(nand_slot0_res),
+	.data		= &rb532_nand_data,
+	.size_data	= sizeof(struct platform_nand_data),
+	.properties	= nand0_properties,
 };
 
 static struct mtd_partition rb532_partition_info[] = {
@@ -234,7 +234,6 @@ static struct platform_device rb532_uart = {
 
 static struct platform_device *rb532_devs[] = {
 	&korina_dev0,
-	&nand_slot0,
 	&cf_slot0,
 	&rb532_led,
 	&rb532_uart,
@@ -321,6 +320,13 @@ static int __init plat_setup_devices(void)
 	 */
 	software_node_register(&rb532_gpio0_node);
 
+	pd = platform_device_register_full(&nand0_info);
+	ret = PTR_ERR_OR_ZERO(pd);
+	if (ret) {
+		pr_err("failed to create NAND slot0 device: %d\n", ret);
+		return ret;
+	}
+
 	pd = platform_device_register_full(&rb532_button_info);
 	ret = PTR_ERR_OR_ZERO(pd);
 	if (ret) {
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index 0bcd455328ef..fe31551bcf5f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -17,6 +18,7 @@ struct plat_nand_data {
 	struct nand_controller	controller;
 	struct nand_chip	chip;
 	void __iomem		*io_base;
+	struct gpio_desc	*ready_gpio;
 };
 
 static int plat_nand_attach_chip(struct nand_chip *chip)
@@ -32,6 +34,14 @@ static const struct nand_controller_ops plat_nand_ops = {
 	.attach_chip = plat_nand_attach_chip,
 };
 
+/* Resources and device for NAND */
+static int plat_nand_gpio_dev_ready(struct nand_chip *chip)
+{
+	struct plat_nand_data *data = nand_get_controller_data(chip);
+
+	return gpiod_get_value(data->ready_gpio);
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -41,6 +51,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 	struct plat_nand_data *data;
 	struct mtd_info *mtd;
 	const char **part_types;
+	struct nand_chip *chip;
 	int err = 0;
 
 	if (!pdata) {
@@ -59,9 +70,17 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
+						   GPIOD_IN);
+	if (IS_ERR(data->ready_gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->ready_gpio),
+				     "could not get READY GPIO\n");
+
 	data->controller.ops = &plat_nand_ops;
 	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
+	chip = &data->chip;
+	nand_set_controller_data(chip, data);
 
 	data->io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->io_base))
@@ -74,7 +93,10 @@ static int plat_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.IO_ADDR_R = data->io_base;
 	data->chip.legacy.IO_ADDR_W = data->io_base;
 	data->chip.legacy.cmd_ctrl = pdata->ctrl.cmd_ctrl;
-	data->chip.legacy.dev_ready = pdata->ctrl.dev_ready;
+	if (data->ready_gpio)
+		data->chip.legacy.dev_ready = plat_nand_gpio_dev_ready;
+	else
+		data->chip.legacy.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.legacy.select_chip = pdata->ctrl.select_chip;
 	data->chip.legacy.write_buf = pdata->ctrl.write_buf;
 	data->chip.legacy.read_buf = pdata->ctrl.read_buf;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
