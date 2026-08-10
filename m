Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E15FC5AE49
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sEuc99RbBafFzU9VUIywulTiVngt9IQ9FsSWvlYBHc=; b=HxUgZn5+3cClKc
	o9tMANq8Ou+0l0UGXSA3EI2a9xoNmgjmPuZvHTz2VfXf1j0hUda0ODNl4FgttHfeeHdC2UM/qPm6z
	XMITa6mYXasW3LPNg+h1CbwESc/yuIogPNWLVc3pKvUk0aQaWI4V3bjAL2kTQi3Iv5lWdjClxLmIi
	+JmO+SUl8OgAzlgdB3tpTfloiCKpO3hNHSdGztgqLQXRpOf9ZkI19QLcb1xgvcWGjZPZmOO9m6Pl7
	HIgjG1HQzZHrCniY/ke0IOo5dovM67jJOgr1ibGDz8b+nsAI+mcQaXD0K/32fsWkzzBuPuY0S50Gr
	dlbiyir6fF0I9BFePJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQoO-0000000ByOQ-3Q9B;
	Mon, 10 Aug 2026 14:17:08 +0000
Received: from 9.mo584.mail-out.ovh.net ([46.105.40.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQoL-0000000ByMH-3Nlu
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 14:17:07 +0000
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.189])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4hJcJZ5PVRz8Cyr
	for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 14:17:02 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5z4sg (unknown [10.110.168.82])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 44E7F80F5E;
	Mon, 10 Aug 2026 14:17:00 +0000 (UTC)
Received: from m-works.net ([37.59.142.108])
	by ghost-submission-7d8d68f679-5z4sg with ESMTPSA
	id 4EegBlzdeWqH/wUAQ8H/aw
	(envelope-from <maciej.andrzejewski@m-works.net>); Mon, 10 Aug 2026 14:17:00 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002f1246bdd-25f1-4367-ad77-4adbbe4a8bb8,
                    ED6AA3D647CD945153C5C800EF75597CE9F2D384) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 144.125.48.245
Date: Mon, 10 Aug 2026 16:16:59 +0200
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
Subject: [PATCH 2/2] gpiolib: of: Identify SPI controllers by nodename
Message-ID: <20260810141629.81650-3-maciej.andrzejewski@m-works.net>
References: <20260810141629.81650-1-maciej.andrzejewski@m-works.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810141629.81650-1-maciej.andrzejewski@m-works.net>
X-Mailer: git-send-email 2.43.0
x-ovh-tracer-id: 15951186934430573347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFkKUw8dTwvfjd4/KP70uzwoCMB5S1Nh1xoCtlKl9zTFZzwWOg+RBpw5P0civI9C611B1wrLGnfL3FNYmECOnjsVZKgynKuLG6Jhd3Uc8cbYV256q4EDW1EJopIsVe6nfKjRwsKIAKDeHxGys67ywGuGjynKrr0p4f+W1tRSR6L8yRsQUchqkYbufFkmr7AL7eeCcTKmnSxggk9Am6xY3yqfHbxzDDXnNa07eo3ri956RbXgeCfNKnKA1gany5tMxKjWt3sHbxNpzbfY66hukbKbQQTBIAx2rECu5ovgOzajdg1Fxma7zv7UmoNQovbLAGQzJu4D89RflMM5EwN9mbnB9wCGi/c8hgD4Ya3Qk4fQ7jti39SG/C5HJAuT/JAT73c74iI3OrrwDjWCQQ7u3sNU8yBsKB0F2T6TaliMw8jc/hsylCmG47D5EwUhoswW6FSqbdRBE44psmnMQTJodWxYmsjbe8rXaTeDSLryKiw4NJ3/KVut/UTOtkvQJ5JSafEvS0fxCpNGZrlrnxDKTEXwNG5k4MuKjX3FC7DP/s4JZTKYQ3/LufdZlmr2pbBR/35axh3lQCQupbK5SQmMs4q/DMdxN26Jw3IrtHFYy4IqrCYsdPEoI5YiJyJm/QQZIctWPwKyAkvWz41G1JtvX3GdPKkTdBvZ6JD3Z9sPY1j9Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071706_452051_BAAF63C4 
X-CRM114-Status: GOOD (  16.54  )
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

The "spi-" property scan added by the previous patch misses SPI
peripherals that declare nothing beyond compatible and reg, which are
the only two properties spi-controller.yaml makes mandatory for a child
node. Let the controller settle those cases: spi-controller.yaml
constrains the controller nodename to ^spi(@.*|-[0-9]+)?$, so the name
is the one bus marker every conforming SPI controller has to carry, and
of_node_name_prefix() is the existing helper for testing it.

Both tests were scored over every board device tree in the kernel,
expanded with the same cpp and scripts/dtc pipeline the build uses, at
v7.2-rc7. All 3620 trees under arch/*/boot/dts expand; 503 of them hold
at least one GPIO chip select that can reach the quirk, 765 such chip
selects in total. 761 are matched by both tests, and none are matched by
neither, so no in-tree board changes behaviour.

One needs the property scan on its own: psc@11400 on ac14xx, a
fsl,mpc5121-psc-spi named after the hardware block rather than the bus,
whose m25p128@0 child carries spi-max-frequency.

Three need the nodename on its own, all peripherals with no "spi-"
property of any kind:

  - panel@0 under the spi-gpio controller on rk3566-anbernic-rg503
  - can@0, an mcp251xfd, under ecspi3 on imx8mn-vhip4-evalboard-v1
  - spi@1 under ecspi1 on imx53-ppd

of_gpio_spi_cs_get_count() in this file identifies SPI controllers with
of_device_is_compatible() instead, but it only has to name three legacy
controllers whose bindings are closed. An allow-list here would have to
name every SPI controller binding in the tree, 71 distinct compatible
strings among the candidates alone, and grow with every new one.

Signed-off-by: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
---
 drivers/gpio/gpiolib-of.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bd9a623f2ae1..959b32b3bea0 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -359,6 +359,17 @@ static bool of_gpio_child_is_spi_peripheral(const struct device_node *child)
 	return false;
 }
 
+/*
+ * A minimal SPI peripheral may carry no "spi-" property at all, so also let
+ * the controller identify the bus. spi-controller.yaml constrains the
+ * controller nodename to ^spi(@.*|-[0-9]+)?$, which makes the name the one
+ * bus marker a controller is required to have.
+ */
+static bool of_gpio_node_is_spi_controller(const struct device_node *np)
+{
+	return of_node_name_prefix(np, "spi");
+}
+
 static void of_gpio_flags_quirks(const struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
@@ -395,7 +406,8 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 			if (cs == index) {
 				bool active_high;
 
-				if (!of_gpio_child_is_spi_peripheral(child))
+				if (!of_gpio_child_is_spi_peripheral(child) &&
+				    !of_gpio_node_is_spi_controller(np))
 					break;
 
 				/*
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
