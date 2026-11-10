Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8F60A5BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ro8gW7mG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKqSVyZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BEVuWA8XR/+xiTpK4dPmoX7xElPrVQkd0SBCLxXndiU=; b=Ro8gW7mGb3RKnpzk3mjcJi3H/v
	ZYMa8o6VczrasxisWu+QujxO5kEalQL3Sjnq71/3IjYXxcMCUNmAqvQ3HGGWln7Y3wwCMH8M7o0hY
	oqs8jt80MfnLkD4wHkg/biJdJiVNSGPlKoaSmVxG3+77H6a6pZ6FpY18m2krZyKDDnu1kwG8r+nlE
	Ukc1zOftTWr9tycyTH60UeD3jVIQTcHmHImSFu7yhu+KejbIQJ95EBniElzsU7jr3N/2Xuy4SPZFf
	Lz0jKaKKa81drrg6yXSZIDyTnhtc0KJInGj23e+1CqLtSEDwGbOVx8y7BQLJOIBi4txNJhUNkb5Z/
	9HvgP40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWx-00000002w0s-1Go3;
	Tue, 10 Nov 2026 07:44:35 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWt-00000002vqR-08lL
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:32 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4f699fe49b3so1177347b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296670; x=1794901470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saxuqUeRTOnaPiqijlB/dtpIqfvbLNndGAKNn31lHT8=;
        b=RKqSVyZLVaQ2Nu9RCH+kumJ6iY0gdAd3i+t8RbT7SCG8WvITeekABFlZOS2wyhC5W/
         Fcvx/v15tjAM92xDnXvVI5IjhtTZbcOvB3Typ8UORRvDpfgwnXK5QblCQBrtPVaLceBA
         58CariQ7L47X3Ook+ofq3uTl2GnXNIsRxfm7FE1fxu9sbd9Hfb9qSIPdr4vtv+KVnDNi
         V0bkaOb6sq85Vh+kvJwaqgd07Wvky2DSXriHCp8sh+wisHb9TYUL9hMBKE6MzuHCUYZa
         Rd8jw74ffdwjvtGehqEOFzO+UlyhwIXKdhx95mARwmw2q43LhOwl8eoS6mMchzJSRqLP
         pkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296670; x=1794901470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saxuqUeRTOnaPiqijlB/dtpIqfvbLNndGAKNn31lHT8=;
        b=PLbdLCreYvrtfPO24//ImK9KC8hImFSmt+QDvbUMWcWpgM5igqsoa0aOB+W0ajyYSo
         zClpN+rtC02Vk0/hAH7tkOfh2eSIDvkM+VaidHKlF3MP+YApwaPrWf2HdEKlS+wlPULe
         a6wKNs9JLCmNes9w6/XP44LG6YbO3Sbh8kle1BxUgmfNCWpkk22NjR8TlOsJCcvVwWmy
         KszuBuVgz4RWGCFcN26fxnGhZg+kjchxq0YAVMrmqDoOFlcSHmc6k7t37aaJCgNx+EtZ
         k/oVjKa56VRKCwd6C+0gvM1VYRmYZ6dvZemHM11/23saLO0zEDDPIOrAwo1fhiKsGDDk
         8c+g==
X-Gm-Message-State: APuU4Z8UDjlJP//ezIunRMTpZld7OOD10pB4dyx5h4WXfX8eK49JREPX
	wOwQfNMKTP2Q4q72k0tkQMbp5b/ChPCfJ9HsLRna/H/FS43pKi1QtiKY
X-Gm-Gg: AYBFou3sDxiWTDtm6c6syiiOurCntLRIEbF3TpAqLWWXwD9qB0DMlsXFocId/Dg9Lx/
	QdDBKkwKljU7NjqR+Hbjj2dl4VAtGWhKiLg04L0Nj32v9wY8Sp620RyotWUdyKm/vGOwHvJVQWB
	qrHzn4zgK7DqB0OcWe3mO2QseMD0+OHubj51xcAIo0jEW2x5/5Zrp0CbdgBTgcNs5zcrAhLwOW3
	a4MEeRlK4T1LBYoOdL0398w7S+PDSKNu5WIf+PHikL7mjk3+FT61N+DT2fE60gpH5i1F9ff0Zvv
	H3xe5MQCkqF1AbD61S9Dr/q/YRH9oOCWglGjoJr/b788nu7TH9pmd9kV+cu78T0ymN1t7qQB/+Q
	3yXGIy2Z3tYljI+pf/0JDbPntp5UUpBP1mWKrSX4o5ELOe+3N6npqRDBeMW0bkQanvzJ8dhQyg8
	SbrTVwOk8w/KiYwUbT1sznnLN6/wTGMatSEkozc8AiT5g/Nz59X5Xsqcc3EWP6Doo1Sp9alLq2A
	rMunTIJ3WSV0WRCVFheyohvzFArljc5Z2H4b0OpVO34JMrUhg8UW9/wwWr+tdJod6qz2mc0WyOm
	QUwhz5L2lxmEVCb0LU5nXzDAvKk16mtJZt1I6sFT5JHnFpZtdfYraPeIbZBeibJHRRhn8NUaZ7F
	bap70z0rR+eMrN/Gu51thvtWXKe+jZLp3BvfA5J8EIj/2oTw0+40N3dQ0XINmcQImtm1oEVKYyY
	qzqEBuCmWGB7XhFNc6saFaLcztm4SaSmheyV6ljwHayhge5q3SX38=
X-Received: by 2002:a05:6808:2388:b0:4c4:28a5:1885 with SMTP id 5614622812f47-5683c9e2eb0mr1431354b6e.9.1794296670257;
        Mon, 09 Nov 2026 23:44:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:12 -0700
Subject: [PATCH v2 09/58] mtd: rawnand: gpio: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-9-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234431_154980_483C8AED 
X-CRM114-Status: GOOD (  16.58  )
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
