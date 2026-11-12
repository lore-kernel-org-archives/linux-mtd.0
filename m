Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0227D606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eVFO9H8Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpcOPMsz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2AkW6rACMoQTsCVmeQ7ghJSVMiqBlr19DR60woiDW5o=; b=eVFO9H8QwRYCsIcswtx73m3JjN
	hgSxn81Vv84lGCVLrEgLveuExW3lUZ3i8hGmwkaCY30rpz8ybQ1A8YTTxSTLXbLg/8C9u+K3KZz/k
	pheKEZH/x6FIG1WkMSV6WGANpObwTXsZA5vD5qodcVagoic+zSd3Qz/1x7W5uDE/4YtytSChiDG3+
	VsIvaaT5yLTyk/7ALpsA4jNpeZzlQpeOXxmK4xO3W8uD00LNabNC1j/R9I7CH2iNqPJXgbav697Lj
	HGTg1GlXSQUukqqvVIsrZ3oeQtBulqO2cGTlXCIAsG63bMTdwPGJCdLS2rXFBtHTIgp8Y635Ls90A
	r/YaevGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJde-00000008NoW-07Gy;
	Thu, 12 Nov 2026 01:30:06 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJco-00000008MGd-0tlG
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:26 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-48eee44b908so2069494fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446953; x=1795051753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=WpcOPMszMDCEiqNTHK6VImoMipjPglLs1vtCl7gUCID/TjA0SM5PZHZj3i3hPBrkMB
         nJ3ClsdU79E7OP7zCfG3fvo+e8YfOUZrIb4YVKsPtCj7334ywBzDyE67l/CgsRtQSpHA
         sYarLbT1TVMbsdRuXq5CsTRTb9pD2AehrUHHUQkf4Vfje5f+Uvza2TWZvYB/Af7yAsjf
         Gz2JEjCSzJfl7Ap3tZqb4TqJnpWYFO/CmwDofv7skbfmtLaKTPoPavJAJKnVC7J4ha2R
         C5Zbu7r+jEG+QP+LaBiwSU5xrd0A74HAIBDNPO5V75hOc4oeCi/Q0LM3G46+wC2TTVYa
         5bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446953; x=1795051753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=UkCHeq92CBjuCwzX+i5ZWD7QCOr1UZfk8eT28vam56tDl6YrLs/7bbLuMrDilnFYJv
         5VwVlPWNa6FPiv/24RNumEnWyiR/KzHHw/ZKv6LFbSTfGupw3FmeF84gn0vF+BEs5zQ5
         Cvy1ICH3/SfyfW2xGOZBEkXbIxHPaupWqAsnUpYGikL4hFDdTEKsa6UpKIQAb5OpbfmJ
         cj85dEjLMdM8D73cm8pVZbQA6wKoHccUw0zj+GcL5CEvEXsXX6dseiUgIMoaFu8UEkcz
         ZD/bT94AiUUwea3HQGP1WJFzLDQi4WN1DdoKFGh01727WJms61MYpDSZGw5biOItPefJ
         Vx/A==
X-Gm-Message-State: APuU4Z9RjINndziobc/XzKLd/vTSu8OaKli+hJqtLOTE3mriDEFfv8Ok
	GHj792uC8j+SeuUADrGZXmsQiEVIkq7dftE/UE1+jLpqLNXOJR5rjFlo
X-Gm-Gg: AYBFou1sFKvZBFTs5KUBLp5+jNku+EFZDwIAgBknQZ2op/RfPHc9hvvn3/fPnNYmZT6
	Un+B2thmHBT9En0xrX156Wpo0w+uZSIovSxVHDAa9V8sVGZRKvV4DzbBDNv8xjLy6Y5EdsBtdC3
	E8d1gzzs/W0vwZ3jktqfN/Yv8Lfkc7VM7FxHvl3RqLkz7gaqwoT7HqTed4Kp1jJHSCt7KHf4ams
	Lah36Y6/kWd7dnrk8rXbaz20JzwZlKwv6RNzf7UJzj7BzfjD/TiNY4Z2CTIZJqLD00GTsLxZinm
	1y9sviSBr5CMl3BZkaM2dwgD8ti0gFstdMyoysC30TQs21Oq+/1AwTxbbbKQy8RWpTSFeUs7wej
	Tg4YMg6dyyvjgIpE7hxEHFHX7vk86STKoBcuAad5R71rt6IHav/3sZo3EUO2GdF7uPV0nmOBvBD
	XEfYxwpSgAQqXT5bX3QjO8amX7bmm2F8Av7vzcU0gshhj/LKsqdzs96pHfSjuGYuo3SgAWGl+Li
	sbG1gjHovqz3x62eqy7QdRtpAA9WbTSknZYmEnjZm8j1cW4wV68rII2lqTXQr5b+5HrvtJsNxb9
	VywBdnQiWDGHxW390eye41D98EebbLqDSa2bBZ26nfWquqnvfpafvkg8HPN8mGVHh8IrDX1jjsj
	KNnBjTGAaWd/tt67GX94YtEagyHolGv9jQ81Oa3Dsk2OYFQfgHuZqR4jzbF53hK5fKnDzrSC5Ht
	bw7PAX8F+ub/p9Umhtlo+7OTionrxxCzzuQx3sZsaflyDDzb6AzqPq
X-Received: by 2002:a05:6808:6f88:b0:568:e5e:8058 with SMTP id 5614622812f47-56b968d73c9mr3832839b6e.19.1794446952920;
        Wed, 11 Nov 2026 17:29:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:19 -0700
Subject: [PATCH v3 40/58] mtd: rawnand: cafe: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-40-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172915_315521_694AF0CF 
X-CRM114-Status: GOOD (  13.67  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Free DMA memory in the synchronous NAND detach callback while the PCI
resources are available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index e936c9807bf8..be29e78d6408 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -683,6 +683,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->parent_dev = &pdev->dev;
@@ -693,7 +697,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +789,15 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +811,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +824,16 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
