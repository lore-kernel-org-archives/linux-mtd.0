Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26660A6F5A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AxcLWoFE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OGYPw/Se;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h82NC3E+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V3xTLLHulTdK7v6U85HZhltT5cryNhUVO4E9foyybqo=; b=AxcLWoFEhMMgGaEe2j3V6zwwgJ
	ICyvhF+XI9uFCHdQqJjiaeZRty6SIn177FoykjHWDjvwaRxZHf6etyzcymwZs0oWI/w2EaFkZf79R
	5uICzLeG5Nzu4xNVgCQ2+VtwnD9ZJWrONDLmPi9pp/vrYJy4kNQacsFN6h49Tmu/Ngvn+/Z4erZZA
	A79uvjuD4jmcFfp0r0T1D7UbqGWpcrRCymH63EiCo6RNLrWa2VS9fgMlPk0+V3vsUZpYhA+2Dj6/l
	ARIFscexyghl3X2hOQr+75J5NL1aWSKBUUH8QOXmj6qCdHU4jiPesrKw38SNuz2c1ENR1dQ07/5b8
	gCD5LVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqES-00000001FdV-3Q7I;
	Mon, 16 Nov 2026 06:30:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEN-00000001FUO-0BA6
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=; b=OGYPw/SeO6f7kPyTEDcGwzxvi9
	o/lbPuod6KcjNmh9Ni7IOvU61zpHizeGt+xPI0MLrG/x3NUWARHzp0tou32Mw3fe4YMWHMnmxUbhz
	7vBq/haTp/YakjWl/vpxmJHBEmCnaFOrY0za+r/Al+mcDzVv33dFv6GMXYmCgFMGjUtQPdj5u1JL2
	IYi0AJq3yCOXJcbshirn3dc/Max4WIUYJ/uTPmO/3fRUIbCdEPqdm7PwdzQ1+Ome9F7vcykcskL98
	W43+no1Em4IYe/YUAKsvERVuWf0MxZL+xVNsRHo5vAsN3HT6fF0w1BWQRnhnlpw4WwyQFzMoTQTkD
	uSoxKaiA==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqED-0000000CeKv-2VGR
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:17 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-71ada4644f8so660380eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810607; x=1795415407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=h82NC3E+a3p1HCgySQCAfwcNkgbk81NwsAZOg3v7KWuXP1kZF52sttSgpKV3mgbV/I
         pLjM8T3uAftIIsxOXHz1AAE7KmTVLn5/RbzUecHDw3p2g4qXdAOIgfcrZuvrXuN4AqkU
         PEsUDYXoMbdPCFlDYh+XKmBuD2AVFh7Mh+NRYpqGERkFvluZj3ALErQu01dSGM2QfhD6
         z5VYZMT29k8Ofbw2FjTBe5f0tFvRbAXE95llKgerEvMuN4sZkLBf3k2D6cObsbQbBklg
         i3e1ph7cRhbX81SIWgnl5BZDSFwv35YdsPrRy/mhh0sgMXpgxkm64WyG8YyM78dOf9UQ
         dR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810607; x=1795415407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=sBsNuCXl+Oi2+JKguWqltY6vJagXIAiu4ZH7i1Zb1JPdwnfAcJMftDiFOKVshJd3bc
         6eaXJrHVR50G01RhuuM2hj6TnRUpUOHSOZOgOvC2dO3EbxQ0vMh/LC+8xghggvzubgQ3
         0EQG6lwCEg/gM79ifH2NOgrEtpAxBGKRUXA4KiasHUboicNpBVHICwxzXJVTa6Io6Bmt
         hLLZZH9aI3Hu5b7oAK/9Et2OKTs+8an9BCNVKrprLMGHNWBMiqwQyoU6NuJYRnX3GH0C
         kvww9M9oaWDrd2RZSrj2KNhGqNFlgmeO5zJsXGXJhsPsXDwjyYcd5FQmmh1KrkayfJwB
         muBg==
X-Gm-Message-State: APuU4Z8t3Zy6zKqE4ACXpjMSuglt83xGM5b42AxH1FriYCB7IzOUqJIa
	pKn0XYTdwIneIJS9VJPupc28s7aYBrcTshviUksPSDER5QYghDCaoJPp
X-Gm-Gg: AYBFou1ZdAIx+rfG7hA75ldxnz7mp+lxW2Qhp3gcc2j/Gh46iuG6B2S8JOB4vrPZJLB
	sL9x9q6gFsuAr5OT8n8JEYEDa+z90U1EkDW9IiBQLusAARL9MivcG/4i6Rh50S+vjHMNaQAIlqG
	DYeAj47yH58ggcO9tzEGFb5idexXU0VHbJMonuDjgxaUcyDygoUW1V/QYO4ZsNT+XUfaRgpLG6c
	bfeYW7s2uI6EjxiIiFe02yBR2i+vrMc5s/jsj+lqSp6OlqpN7BKXPQMRLeJfODj+VYgnDci2GDv
	TxNiXI1FzaPglfGUOrALM0dSuBrmBaEvZP96N0/KyHnN0ZaRJUJcZLROnAilgE4lgl2WUi6r9b9
	bQhlqHG5LhcbtCLVV4nH47LZUrtipeKw78vi9obaiep1NqaXqbgESoc5ksC/l1TPN5ViOq6KLF2
	hEdIE22b8LHHE2QoShjflYYGPNZ9NTcy4jTD574fJe2rxoo0TEVXPiD3cgdwAYBxZxtGAjJlTuy
	vfypmHWIuNHhEEpG4PSfL6rOjh2I+oAxNNTv2xGbsozvvKaznv6qNblMT7djqUl1aECjdbdoy5L
	C2L/XKbhUTQyVj6cF4TIjZZwfSnurP8bFUGiTAxIkKeZsiMxrcmSdIkswb3Hn6sMBM37yfb7HR0
	5iSr+J76O+p4J5vHTyu8iqzSApZFnl9oLOtH3ckYKJZFzobH+7yZdAnYgn5yOKbf1OtQ7wXu6Vy
	7Xs+j7ZccpETy64mvICvok4s32ZWSMvZVmAXGVCkoxqUSRV/lNd/c=
X-Received: by 2002:a05:6820:16a4:b0:71a:d76b:fb39 with SMTP id 006d021491bc7-71ad76c0212mr3490029eaf.2.1794810607608;
        Sun, 15 Nov 2026 22:30:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:33 -0700
Subject: [PATCH v5 18/58] mtd: rawnand: atmel: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-18-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063010_561398_09670B04 
X-CRM114-Status: GOOD (  16.10  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep NAND chip metadata and SMC or HSMC controller storage until
retained MTD references have been released. Disconnect registered chips
before releasing DMA, SRAM and clock resources. Give chip initialization
ownership of its allocation on both success and failure, including
absent SmartMedia cards.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 42 ++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0c79d30b9e30..087b7b5fe987 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -62,6 +62,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <soc/at91/atmel-sfr.h>
 
 #include "pmecc.h"
@@ -1629,8 +1630,9 @@ static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 	if (ret)
 		return ret;
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	list_del(&nand->node);
+	mtd_put_master(mtd);
 
 	return 0;
 }
@@ -1639,7 +1641,6 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 					    struct device_node *np,
 					    int reg_cells)
 {
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	int numcs, ret, i;
 
@@ -1650,7 +1651,8 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, numcs), GFP_KERNEL);
 	if (!nand)
 		return ERR_PTR(-ENOMEM);
 
@@ -1735,7 +1737,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
 }
 
 static int
@@ -1749,6 +1751,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1757,19 +1760,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_lifetime(chip, to_atmel_nand(chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->node, &nc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static int
@@ -1792,7 +1805,6 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1800,7 +1812,8 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1858,7 +1871,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2044,7 +2057,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2360,9 +2372,12 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base, nc);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2439,9 +2454,12 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base, nc);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
