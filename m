Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CC1C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:05:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AECF22AAA
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AECF22AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/dmjdDwGYIehTniF05UG9kw++c9OsFiuYZ0qRMUUIU=; b=w5IfwJyhOWusgpEWyC9bQlbBj3
	L7teSIxv9EvlB6+beYOKn2aD1QTE2CMV4+rnJ7FjRN2X0Jpz5RkW34eVWRJG1u4uow9GlJyuFjSqR
	Dy7it+9jSQ3D8VdVq4TK2dlzRhJCg/PrBl9vDiLqeF5Mtllt8SJrqEEwtnXWlbDETNIY9mfO8Ia3T
	BTeNK2HOMBM57/wRFJagzLRedMDzIQNzvcp4A15E9DyVumV4Bi+7qaBKGal0fgBZrNLKAo8dtE1UZ
	401ynWsdWqM2jnqVsQd2tf3Yi4yikMMBVQV5AHEVej4A9B1o7QbDI0l1g2oKsJjP2a0hn/g7WPOUQ
	mMV2GT9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwmwM-0002Z4-VN; Tue, 05 Jan 2021 14:04:03 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwmw5-0002Sr-Ti
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 14:03:50 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C617AAD19;
 Tue,  5 Jan 2021 14:03:44 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 07/10] char: hw_random: Remove tx4939 driver
Date: Tue,  5 Jan 2021 15:02:52 +0100
Message-Id: <20210105140305.141401-8-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_090346_229401_070486B4 
X-CRM114-Status: GOOD (  25.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

CPU support for TX49xx is getting removed, so remove hw_random driver
for it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/char/hw_random/Kconfig      |  13 ---
 drivers/char/hw_random/Makefile     |   1 -
 drivers/char/hw_random/tx4939-rng.c | 157 ----------------------------
 3 files changed, 171 deletions(-)
 delete mode 100644 drivers/char/hw_random/tx4939-rng.c

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 1fe006f3f12f..9d13d640384a 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -226,19 +226,6 @@ config HW_RANDOM_VIRTIO
 	  To compile this driver as a module, choose M here: the
 	  module will be called virtio-rng.  If unsure, say N.
 
-config HW_RANDOM_TX4939
-	tristate "TX4939 Random Number Generator support"
-	depends on SOC_TX4939
-	default HW_RANDOM
-	help
-	  This driver provides kernel-side support for the Random Number
-	  Generator hardware found on TX4939 SoC.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called tx4939-rng.
-
-	  If unsure, say Y.
-
 config HW_RANDOM_MXC_RNGA
 	tristate "Freescale i.MX RNGA Random Number Generator"
 	depends on SOC_IMX31
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 8933fada74f2..b2aa37162e24 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_HW_RANDOM_OMAP) += omap-rng.o
 obj-$(CONFIG_HW_RANDOM_OMAP3_ROM) += omap3-rom-rng.o
 obj-$(CONFIG_HW_RANDOM_PASEMI) += pasemi-rng.o
 obj-$(CONFIG_HW_RANDOM_VIRTIO) += virtio-rng.o
-obj-$(CONFIG_HW_RANDOM_TX4939) += tx4939-rng.o
 obj-$(CONFIG_HW_RANDOM_MXC_RNGA) += mxc-rnga.o
 obj-$(CONFIG_HW_RANDOM_IMX_RNGC) += imx-rngc.o
 obj-$(CONFIG_HW_RANDOM_INGENIC_RNG) += ingenic-rng.o
diff --git a/drivers/char/hw_random/tx4939-rng.c b/drivers/char/hw_random/tx4939-rng.c
deleted file mode 100644
index c8bd34e740fd..000000000000
--- a/drivers/char/hw_random/tx4939-rng.c
+++ /dev/null
@@ -1,157 +0,0 @@
-/*
- * RNG driver for TX4939 Random Number Generators (RNG)
- *
- * Copyright (C) 2009 Atsushi Nemoto <anemo@mba.ocn.ne.jp>
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- */
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/platform_device.h>
-#include <linux/hw_random.h>
-#include <linux/gfp.h>
-
-#define TX4939_RNG_RCSR		0x00000000
-#define TX4939_RNG_ROR(n)	(0x00000018 + (n) * 8)
-
-#define TX4939_RNG_RCSR_INTE	0x00000008
-#define TX4939_RNG_RCSR_RST	0x00000004
-#define TX4939_RNG_RCSR_FIN	0x00000002
-#define TX4939_RNG_RCSR_ST	0x00000001
-
-struct tx4939_rng {
-	struct hwrng rng;
-	void __iomem *base;
-	u64 databuf[3];
-	unsigned int data_avail;
-};
-
-static void rng_io_start(void)
-{
-#ifndef CONFIG_64BIT
-	/*
-	 * readq is reading a 64-bit register using a 64-bit load.  On
-	 * a 32-bit kernel however interrupts or any other processor
-	 * exception would clobber the upper 32-bit of the processor
-	 * register so interrupts need to be disabled.
-	 */
-	local_irq_disable();
-#endif
-}
-
-static void rng_io_end(void)
-{
-#ifndef CONFIG_64BIT
-	local_irq_enable();
-#endif
-}
-
-static u64 read_rng(void __iomem *base, unsigned int offset)
-{
-	return ____raw_readq(base + offset);
-}
-
-static void write_rng(u64 val, void __iomem *base, unsigned int offset)
-{
-	return ____raw_writeq(val, base + offset);
-}
-
-static int tx4939_rng_data_present(struct hwrng *rng, int wait)
-{
-	struct tx4939_rng *rngdev = container_of(rng, struct tx4939_rng, rng);
-	int i;
-
-	if (rngdev->data_avail)
-		return rngdev->data_avail;
-	for (i = 0; i < 20; i++) {
-		rng_io_start();
-		if (!(read_rng(rngdev->base, TX4939_RNG_RCSR)
-		      & TX4939_RNG_RCSR_ST)) {
-			rngdev->databuf[0] =
-				read_rng(rngdev->base, TX4939_RNG_ROR(0));
-			rngdev->databuf[1] =
-				read_rng(rngdev->base, TX4939_RNG_ROR(1));
-			rngdev->databuf[2] =
-				read_rng(rngdev->base, TX4939_RNG_ROR(2));
-			rngdev->data_avail =
-				sizeof(rngdev->databuf) / sizeof(u32);
-			/* Start RNG */
-			write_rng(TX4939_RNG_RCSR_ST,
-				  rngdev->base, TX4939_RNG_RCSR);
-			wait = 0;
-		}
-		rng_io_end();
-		if (!wait)
-			break;
-		/* 90 bus clock cycles by default for generation */
-		ndelay(90 * 5);
-	}
-	return rngdev->data_avail;
-}
-
-static int tx4939_rng_data_read(struct hwrng *rng, u32 *buffer)
-{
-	struct tx4939_rng *rngdev = container_of(rng, struct tx4939_rng, rng);
-
-	rngdev->data_avail--;
-	*buffer = *((u32 *)&rngdev->databuf + rngdev->data_avail);
-	return sizeof(u32);
-}
-
-static int __init tx4939_rng_probe(struct platform_device *dev)
-{
-	struct tx4939_rng *rngdev;
-	int i;
-
-	rngdev = devm_kzalloc(&dev->dev, sizeof(*rngdev), GFP_KERNEL);
-	if (!rngdev)
-		return -ENOMEM;
-	rngdev->base = devm_platform_ioremap_resource(dev, 0);
-	if (IS_ERR(rngdev->base))
-		return PTR_ERR(rngdev->base);
-
-	rngdev->rng.name = dev_name(&dev->dev);
-	rngdev->rng.data_present = tx4939_rng_data_present;
-	rngdev->rng.data_read = tx4939_rng_data_read;
-
-	rng_io_start();
-	/* Reset RNG */
-	write_rng(TX4939_RNG_RCSR_RST, rngdev->base, TX4939_RNG_RCSR);
-	write_rng(0, rngdev->base, TX4939_RNG_RCSR);
-	/* Start RNG */
-	write_rng(TX4939_RNG_RCSR_ST, rngdev->base, TX4939_RNG_RCSR);
-	rng_io_end();
-	/*
-	 * Drop first two results.  From the datasheet:
-	 * The quality of the random numbers generated immediately
-	 * after reset can be insufficient.  Therefore, do not use
-	 * random numbers obtained from the first and second
-	 * generations; use the ones from the third or subsequent
-	 * generation.
-	 */
-	for (i = 0; i < 2; i++) {
-		rngdev->data_avail = 0;
-		if (!tx4939_rng_data_present(&rngdev->rng, 1))
-			return -EIO;
-	}
-
-	platform_set_drvdata(dev, rngdev);
-	return devm_hwrng_register(&dev->dev, &rngdev->rng);
-}
-
-static struct platform_driver tx4939_rng_driver = {
-	.driver		= {
-		.name	= "tx4939-rng",
-	},
-};
-
-module_platform_driver_probe(tx4939_rng_driver, tx4939_rng_probe);
-
-MODULE_DESCRIPTION("H/W Random Number Generator (RNG) driver for TX4939");
-MODULE_LICENSE("GPL");
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
