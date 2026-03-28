Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601FC10F3DEB
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2026 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peQNdrexbNt56SBjvEB27ekjhcnoBgDL+5oaJH3UzGE=; b=Wvf6GaDEsCPSGX
	3toV+QhKjCdXVocS8b8xkyQdapWIlFvkgr3W3pd9xY0j4ftDCeHLlGTX9vdpXE/BSsVXDXTTF0xxW
	ZbBjeszCs6Fr5BnTNrFAh+iTiItZwGYzwv4FMPYzhO/v/c+cwtogIu9VlfkkRc/etm8Lr1mIzCYvo
	GWSR2nGlLRCwkB1CUuE1QM5baKON1KwruMLwojf7Tji7vf/hRM/l5liANnuGBFBD9LsSlalJfnZZj
	INoV56lf5yMBpGLDIPINnHGHwo9K9XFoe40rMCL7Gt6X4+XZRn1KZzeY2JtiDBZmFfhyd5wl9FoG1
	G1mefzYacow2s7ZKXipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6W10-000000095Uh-3RHW;
	Sat, 28 Mar 2026 15:55:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6W0x-000000095UB-1rQv
	for linux-mtd@lists.infradead.org;
	Sat, 28 Mar 2026 15:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44BD1600AC;
	Sat, 28 Mar 2026 15:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E16C2BCB1;
	Sat, 28 Mar 2026 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774713354;
	bh=43UWjfwmGTJsvatojEzQ6a+djIbk4+udgzPTzi5vJy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tpFKCaCbTTyDGqXi3yWG6BVj5ObYU89fGMLU9/IJtb5tNISlKPrfcj+GpsGSDNxNR
	 rT9HTpLkzPGWCydC0sCHje+KrvUXRm3fXOh1XUqmUFCMjvrHimJQzGNR8+0MZR7mdg
	 1xFEAhAC0gmMNCq8gXsccRa5Up6bZDAjyil4NKJtvrCBC2seVnlh7R1ThCTIpf6D/U
	 FsTBBuhRTlrJ+WttXdcghPWrBYJlWVLbCvvJ9iWdv7Wul2VT/j3s6WWR/DT44rjqmo
	 hgtZWEJVYsTEhZIDPHa8wM8OAh9jnxYHENmFEuKNBGJFefSXFa2aJGV+cLWCMWwDHG
	 CQkOdY0ISBqHw==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Mar 2026 16:55:47 +0100
Subject: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
MIME-Version: 1.0
Message-Id: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
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

Convert the Mikrotik RouterBoard RB532 to use GPIO descriptors
by defining a software node for the GPIO chip, then register
the button platform device with full info passing the GPIO
as a device property.

This can be used as a base to move more of the RB532 devices
over to passing GPIOs using device properties.

Use the GPIO_ACTIVE_LOW flag and drop the inversion in the
rb532_button_pressed() function.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/mips/rb532/devices.c         | 47 +++++++++++++++++++++++++++++++++------
 drivers/input/misc/rb532_button.c | 35 ++++++++++++++++++++++++-----
 2 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 4f027efbf27b..3f56d9feb73a 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -16,8 +16,10 @@
 #include <linux/mtd/mtd.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
 
 #include <asm/bootinfo.h>
@@ -38,6 +40,10 @@ extern unsigned int idt_cpu_freq;
 
 static struct mpmc_device dev3;
 
+static const struct software_node rb532_gpio0_node = {
+	.name = "gpio0",
+};
+
 void set_latch_u5(unsigned char or_mask, unsigned char nand_mask)
 {
 	unsigned long flags;
@@ -189,11 +195,6 @@ static struct platform_device rb532_led = {
 	.id = -1,
 };
 
-static struct platform_device rb532_button = {
-	.name	= "rb532-button",
-	.id	= -1,
-};
-
 static struct resource rb532_wdt_res[] = {
 	{
 		.name = "rb532_wdt_res",
@@ -236,11 +237,23 @@ static struct platform_device *rb532_devs[] = {
 	&nand_slot0,
 	&cf_slot0,
 	&rb532_led,
-	&rb532_button,
 	&rb532_uart,
 	&rb532_wdt
 };
 
+static const struct property_entry rb532_button_properties[] = {
+	PROPERTY_ENTRY_GPIO("button-gpios", &rb532_gpio0_node,
+			    GPIO_BTN_S1, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct platform_device_info rb532_button_info  __initconst = {
+	.name		= "rb532-button",
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= rb532_button_properties,
+};
+
+
 /* NAND definitions */
 #define NAND_CHIP_DELAY 25
 
@@ -267,6 +280,9 @@ static void __init rb532_nand_setup(void)
 
 static int __init plat_setup_devices(void)
 {
+	struct platform_device *pd;
+	int ret;
+
 	/* Look for the CF card reader */
 	if (!readl(IDT434_REG_BASE + DEV1MASK))
 		rb532_devs[2] = NULL;	/* disable cf_slot0 at index 2 */
@@ -295,7 +311,24 @@ static int __init plat_setup_devices(void)
 	rb532_uart_res[0].uartclk = idt_cpu_freq;
 
 	gpiod_add_lookup_table(&cf_slot0_gpio_table);
-	return platform_add_devices(rb532_devs, ARRAY_SIZE(rb532_devs));
+	ret = platform_add_devices(rb532_devs, ARRAY_SIZE(rb532_devs));
+	if (ret)
+		return ret;
+
+	/*
+	 * Stack devices using full info and properties here, after we
+	 * register the node for the GPIO chip.
+	 */
+	software_node_register(&rb532_gpio0_node);
+
+	pd = platform_device_register_full(&rb532_button_info);
+	ret = PTR_ERR_OR_ZERO(pd);
+	if (ret) {
+		pr_err("failed to create RB532 button device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 #ifdef CONFIG_NET
diff --git a/drivers/input/misc/rb532_button.c b/drivers/input/misc/rb532_button.c
index 190a80e1e2c1..40173bf7a235 100644
--- a/drivers/input/misc/rb532_button.c
+++ b/drivers/input/misc/rb532_button.c
@@ -8,7 +8,7 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <asm/mach-rc32434/gpio.h>
 #include <asm/mach-rc32434/rb.h>
@@ -18,6 +18,14 @@
 #define RB532_BTN_RATE 100 /* msec */
 #define RB532_BTN_KSYM BTN_0
 
+/**
+ * struct rb532_button - RB532 button information
+ * @gpio: GPIO connected to the button
+ */
+struct rb532_button {
+	struct gpio_desc	*gpio;
+};
+
 /* The S1 button state is provided by GPIO pin 1. But as this
  * pin is also used for uart input as alternate function, the
  * operational modes must be switched first:
@@ -31,35 +39,48 @@
  * The GPIO value occurs to be inverted, so pin high means
  * button is not pressed.
  */
-static bool rb532_button_pressed(void)
+static bool rb532_button_pressed(struct rb532_button *button)
 {
 	int val;
 
 	set_latch_u5(0, LO_FOFF);
-	gpio_direction_input(GPIO_BTN_S1);
+	gpiod_direction_input(button->gpio);
 
-	val = gpio_get_value(GPIO_BTN_S1);
+	val = gpiod_get_value(button->gpio);
 
 	rb532_gpio_set_func(GPIO_BTN_S1);
 	set_latch_u5(LO_FOFF, 0);
 
-	return !val;
+	return val;
 }
 
 static void rb532_button_poll(struct input_dev *input)
 {
-	input_report_key(input, RB532_BTN_KSYM, rb532_button_pressed());
+	struct rb532_button *button = input_get_drvdata(input);
+
+	input_report_key(input, RB532_BTN_KSYM, rb532_button_pressed(button));
 	input_sync(input);
 }
 
 static int rb532_button_probe(struct platform_device *pdev)
 {
+	struct rb532_button *button;
 	struct input_dev *input;
 	int error;
 
+	button = devm_kzalloc(&pdev->dev, sizeof(*button), GFP_KERNEL);
+	if (!button)
+		return -ENOMEM;
+
+	button->gpio = devm_gpiod_get(&pdev->dev, "button", GPIOD_IN);
+	if (IS_ERR(button->gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(button->gpio),
+				     "error getting button GPIO\n");
+
 	input = devm_input_allocate_device(&pdev->dev);
 	if (!input)
 		return -ENOMEM;
+	input_set_drvdata(input, button);
 
 	input->name = "rb532 button";
 	input->phys = "rb532/button0";
@@ -77,6 +98,8 @@ static int rb532_button_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	platform_set_drvdata(pdev, button);
+
 	return 0;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
