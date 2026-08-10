Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB788C5AD55
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnsfGgCUt42sQ6bodRkx4yE2dOrVquLalKTOMtLm7Rs=; b=DeliijX9cOSE7v
	yMrPldJpp3AJJ/xIk0CJ/GPqwiq5K0eUXG9bEvqzi2/nFhnxv9ts6xddJETri0WWM9hMXeAFrEuUi
	bT87j8Nsga0HCcTpv1JAJrr61naX+9BLur3l5CXoUJ678luKVyqpWsz11ACOF9IHHeWNz0ie+KKql
	qZWHg9m8cyxHsl8f4Vj6c6MlHTX8ZgkeX9BO4WJguHDr3caYzxHaCLvIXWUaUwAJKeShHy2THemMs
	dFdr7DAD4k2fN1uBuR7rjhYF57cxHilh28+cIGuw7APYSLzrNWeTxdbfAzT/X16d+BwDwWZj5OGFa
	2Ptygw6zMPto9B1Q6aJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQoK-0000000ByMN-0ohK;
	Mon, 10 Aug 2026 14:17:04 +0000
Received: from 12.mo550.mail-out.ovh.net ([87.98.162.229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQoH-0000000ByLS-2oVP
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 14:17:03 +0000
Received: from director7.ghost.mail-out.ovh.net (unknown [10.110.37.160])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4hJcJT3mCzz5yyb
	for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 14:16:57 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-7df7p (unknown [10.108.54.148])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5AC5EC0198;
	Mon, 10 Aug 2026 14:16:53 +0000 (UTC)
Received: from m-works.net ([37.59.142.101])
	by ghost-submission-7d8d68f679-7df7p with ESMTPSA
	id I14hO1TdeWq3KC0Alk6qAw
	(envelope-from <maciej.andrzejewski@m-works.net>); Mon, 10 Aug 2026 14:16:53 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004796ca3e8-0880-49c0-a3d2-70d64670ab19,
                    ED6AA3D647CD945153C5C800EF75597CE9F2D384) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 144.125.48.245
Date: Mon, 10 Aug 2026 16:16:52 +0200
From: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	broonie@kernel.org, linux-spi@vger.kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maciej.andrzejewski@m-works.net
Cc: linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
Subject: [PATCH 1/2] gpiolib: of: Only apply the SPI CS quirk to SPI
 peripherals
Message-ID: <20260810141629.81650-2-maciej.andrzejewski@m-works.net>
References: <20260810141629.81650-1-maciej.andrzejewski@m-works.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810141629.81650-1-maciej.andrzejewski@m-works.net>
X-Mailer: git-send-email 2.43.0
x-ovh-tracer-id: 15949779557479752483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFkKUw8dTwvfjd4/KP70uzwoCMB5S1Nh1xoCtlKl9zTFZzwWOg+RBpw5P0civI9C611B1wrLGnfL3FNYmECOnjsVZKgynKuLG6Jhd3Uc8cbYV256q4EDW1EJopIsVe6nfKjRwsKIAKDeHxGys67ywGuGjynKrr0p4f+W1tRSR6L8yRsQUchqkYbufFkmr7AL7eeCcTKmnSxggk9Am6xY3yqfHbxzDDXnNa07eo3ri956RbXgeCfNKnKA1gany5tMxKjWt3sHbxNpzbfY66hukbKbQQTBIAx2rECu5ovgOzajdg1Fxma7zv7UmoNQovbLAGQzJu4D89RflMM5EwN9mbnsXIcQz1zjyAevK1aGSBRMVAVSL5W6DeuYhnqOsaIckI2TTAdxx3+Q/CtbWfsB/jvrNkihLevZuetn/htQDvsx0biKTKHq0G+VaFG78HYKXIB4SxtZ+9gYTRwN9OEhtEgWyn3ErfpsRwJs7rY3kJp+D7B+4NMB5EbfVsuZ4iwTZBrkIhlg2BFBFnBbosg4NC4RW8HXA+R0gu13eYd/slkem0gV3vu4afjgrWDjqrJbmgZs1k7Dsdw0xRXAnGpIvSA8atgsnBuH+NXmOrt1DcyzhprPXfHAyBmOVvtO/YL64ssIJl8K8eNRVvKNT5IdnmmB2XRb5PhOBHUJoEyUD5hUQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071702_006413_4CFF57BD 
X-CRM114-Status: GOOD (  19.62  )
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

The legacy SPI chip-select polarity quirk in of_gpio_flags_quirks() is
keyed on nothing but the property name "cs-gpios". That name is not
exclusive to SPI: nand-controller.yaml documents the very same property
for NAND controllers, and rawnand_dt_parse_gpio_cs() requests those
lines with gpiod_count(dev, "cs"), which gpiolib expands to "cs-gpios".
A NAND controller therefore has SPI chip-select semantics forced onto
its chip selects, and any chip node whose first reg cell matches a GPIO
index is silently flipped to active low. The NAND core requests the
descriptors GPIOD_OUT_HIGH and drivers assert with a logical 0, so the
inversion leaves the die permanently deselected.

The example in nand-controller.yaml is itself affected: it pairs a
native chip select with a GPIO one and gives the second chip a reg of 1,
which trips the quirk whenever CONFIG_SPI_MASTER is enabled. In-tree the
collision is real but latent. 36 board trees, all Atmel/Microchip at91,
give their nand@3 controller a cs-gpios line, and they escape only
because the sole child of those nodes is a partitions container with no
reg for the quirk to match against.

Device tree carries no bus type marker, so identify the bus from what
the peripheral advertises about itself. Properties of an SPI peripheral
are namespaced with "spi-" (spi-max-frequency, spi-cpol, spi-cs-high and
the rest of spi-peripheral-props.yaml), whereas a NAND chip node carries
only reg, nand-* and its partition table. Skip the quirk when the
matched child has no "spi-" prefixed property.

This is a convention rather than a guarantee: compatible and reg are the
only properties spi-controller.yaml makes mandatory for a peripheral, so
a minimal one may carry no "spi-" property at all. The next patch covers
those by looking at the controller instead.

Signed-off-by: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
---
 drivers/gpio/gpiolib-of.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 940b566946ce..bd9a623f2ae1 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -340,6 +340,25 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 	}
 }
 
+/*
+ * The legacy SPI chip select binding below is keyed on a property name that
+ * other subsystems reuse for the same purpose, notably NAND controllers (see
+ * Documentation/devicetree/bindings/mtd/nand-controller.yaml), whose chip
+ * selects carry no SPI polarity semantics. Device tree has no bus type
+ * marker, so go by what the peripheral advertises about itself: properties
+ * of an SPI peripheral are namespaced with "spi-".
+ */
+static bool of_gpio_child_is_spi_peripheral(const struct device_node *child)
+{
+	struct property *pp;
+
+	for_each_property_of_node(child, pp)
+		if (str_has_prefix(pp->name, "spi-"))
+			return true;
+
+	return false;
+}
+
 static void of_gpio_flags_quirks(const struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
@@ -374,6 +393,11 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 			if (ret)
 				continue;
 			if (cs == index) {
+				bool active_high;
+
+				if (!of_gpio_child_is_spi_peripheral(child))
+					break;
+
 				/*
 				 * SPI children have active low chip selects
 				 * by default. This can be specified negatively
@@ -386,8 +410,8 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 				 * conflict and the "spi-cs-high" flag will
 				 * take precedence.
 				 */
-				bool active_high = of_property_read_bool(child,
-								"spi-cs-high");
+				active_high = of_property_read_bool(child,
+								    "spi-cs-high");
 				of_gpio_quirk_polarity(child, active_high,
 						       flags);
 				break;
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
