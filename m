Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D960711CC
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbuWdhUT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kzkgabUz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N/cFuJSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k0g8g+6UlOghsWRUvaxjE9KaPfPru3b9CMzR1QHl6qU=; b=wbuWdhUTZda4ercLzZ1RHRwsaM
	U2YfBJD+bLJ7y1YUdQHuv7vtcR5JQ9zrAklnQTgUX574u97z++N3NRC8IElxAbTYcOY+xCYr9Xiy5
	DoCoTqCcB5nx9RyovlHuCzP3WzxbhFdT9VMaA3y0nZdL9LMe5uXflXz2Ee5h1weT1R4syy+pSXoHH
	0FUh8Tv6Js9RkFjpq+QgyfQcLvMd/KT/V/DS6i3f8/9muFpIXON2fnJ1umSYhVJFo+hdeAew9KWY3
	72fkGZGxR3J9hLyeMGvHKb67L98lB7vj/yvUdHSB+rWcTI+Uwin1tarm2E+ZfFLQGk/h35YjYFXS8
	ApeZBrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXU-00000002x9Z-1iQF;
	Tue, 10 Nov 2026 07:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXK-00000002wmX-2vjJ
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DaAKG9GqMtdplQAd/Y1trIoVdi+3obNoCtIC3s0V3Fw=; b=kzkgabUzLYGNrnSc5+Qcbu8Wxb
	rSv2gMGp84+Ox6022xVaWvH1sqZeQb7EBOm1AIuOnch2fB0LUp27Zs6oZEy2ibNoaXlb4VtL/zLBJ
	donFylMPFCF4xYAa+UwK0MjDBz2Om25nJwny4xOER/0zR9Wque5jft/CEiXIBaTN1T7xVpcA2p1sq
	/1ns44vTy0BfrphC5FgSEJvMBh9fCg1PKepadhXD2WC5IPsjjEs2nn05Qg5W75bgpNCp1fOI9xwVy
	lLmuBZRY2xG7f9TD1oJdvmhNGurPz+o7y6OQl2q8fTR31N585rmIhvy5efChJoWqldjMVbmXaOqPi
	8/l7FbQg==;
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX5-00000007dzR-2SFa
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:56 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4a451915d8aso984594b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296681; x=1794901481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaAKG9GqMtdplQAd/Y1trIoVdi+3obNoCtIC3s0V3Fw=;
        b=N/cFuJSpBNKkA+bA2SX27hkxEoUxPTqgv5Cc7nn7P1mrNL7sdGH5dd7HPgLIyZctCc
         N7SLZjFPfgEA1/RXT+bm8izQ+F/tp/O7pyim8ClSTJ2JRmqNpQijL4Vce6monTxIsqM6
         fAyRhxY8BpW/ImQJf7iXsCLE1EyRV3s6ebblIzSr9R8BJolsrjAhHyNfJ1hs2osdl309
         svDGddEVvZXu7624OdbD9NbFbQYtI0fMfIAehqED1T9CsPbh/4c1gUmNN2JVVUZpP9eC
         6hAbNyTW1uBh2hHgwOiitoA59l8wsi6uCHaLjtkIZTRsz6jCMFDc+6JvFSY2qwPbpdgX
         2MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296681; x=1794901481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaAKG9GqMtdplQAd/Y1trIoVdi+3obNoCtIC3s0V3Fw=;
        b=mUE1dV90z53iRI36YYHrL7xTUgfey3c8kbkqE4iefmMR6uuqCsfYTScoyklUPwW8OG
         nEZy8meNy/iN48/xQ7FZwZy6QUcGDxcgbB+DEd7XA698o7Ka+5sNTvXsBPWRB1BFOcHi
         nWoUEuKW2TyTCUb/4ucqG8Lv+ozwVDp4DRsMLTe0NtZMr0A3Dnsd/83ZHPvgrQe0sp6t
         k2Lp155UQhLPqPeauJh2Pzxjm6ShbPb8VMaasP0WeqOhdw52w7Nv4t6U6sfXCESHu976
         ggV+DlBsnEo9q9/vxmvPSRa6F+1tuneWNchl2JPYw0U8O24gWtlHrdNVDul+r9G2IDRS
         tg2w==
X-Gm-Message-State: APuU4Z+1SgLJQyGqfmjdW49PcvqWMxL/yd36trFCyXqkAFojwz/StaXu
	3pAmn1kdNlMD0ThiKYDK294Oej8QKVn4+Ty9Gv/rMlNwgeWcFyCYqENm
X-Gm-Gg: AYBFou1Ssglk3u6DAHkqAQKOteNJdxhRxnH6Xz8RO30IDdTr75vlRr89W0tqeeSs7Yi
	2O451oqtxQJmjLqONVM7tO0h6wkjsyH7UzXtsmZpuxwh8w9BN43tHaXnrB1I9DxJuUyY1Tl1mMZ
	lKzHP087k7N1Z3URfbdCJNnZf0DTDbYURdpmB/RE034NfBrgEqDATUZCWZVJO5mZvdJdhghpLac
	gRpNJdNcoXOVNmF5PCtMBIaEUibWHtid+kfpp4bTqSUraB8XQhGrmsGnjBonWaD1JELmOukUHC2
	GbpnsSpUaqm0v/gKavKZxe/N8lsORv9B3xhKHNZJvkZtBR2wlQ0n6aSqW4zBpGDk7ibx4LyssiJ
	k6/9NpEwtv6AMZ7AqyWi5iqvRREuatcjE51X6gV5ClTyy/Ka0B8TFyEL3pJPamMhMrjvTn/tf7e
	PukpI1IQgMN6lZnBf7CFgN1z1nfwft32p92Xbf1ona6/zWwCmiIesqiMEAroPyENWHble3ljmgB
	H57YgrY/z1zZvCIlh0UAGtNOmrGafwCrtpS68mHK+X+ebav+3YM56cBYBlR1yXZCxQhybifx5uh
	5oTcU3b3yFBlktf0PgSWDQTBR9pN1+wOSrhM2zJqFnAIRWG9rQyPCASaGrJk2vwiwvzAA7E7rxk
	oBQilwmJiraYss0ZRb1j6yaHc8LmX26Dfrs0i5FrWVUyYiyZAPLMblQir+Uq1KzZtUau5s8G0no
	8CxSdLaLYwDDMmN8JoTW/idYPiPp3O+5WE+K3s+r44xHJuZyx2cUM=
X-Received: by 2002:a05:6808:15a0:b0:53d:55e9:246e with SMTP id 5614622812f47-5683cdfaef9mr1338214b6e.61.1794296680666;
        Mon, 09 Nov 2026 23:44:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:21 -0700
Subject: [PATCH v2 18/58] mtd: rawnand: atmel: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-18-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074454_483901_09D7A20F 
X-CRM114-Status: GOOD (  18.64  )
X-Spam-Score: 0.1 (/)
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

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 59 ++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 9a724de67624..ed8b703f5684 100644
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
 
@@ -1735,7 +1737,12 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
+}
+
+static void atmel_nand_release(struct nand_chip *chip)
+{
+	kfree(to_atmel_nand(chip));
 }
 
 static int
@@ -1749,6 +1756,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1757,19 +1765,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, atmel_nand_release);
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
@@ -1792,7 +1810,6 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1800,7 +1817,8 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1858,7 +1876,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2044,7 +2062,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2353,6 +2370,11 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	return 0;
 }
 
+static void atmel_hsmc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_hsmc_nand_controller(controller));
+}
+
 static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2360,9 +2382,13 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_hsmc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2432,6 +2458,11 @@ static const struct atmel_nand_controller_caps atmel_sama5_nand_caps = {
 	.legacy_of_bindings = true,
 };
 
+static void atmel_smc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_smc_nand_controller(controller));
+}
+
 static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2439,9 +2470,13 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_smc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
