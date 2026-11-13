Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E274606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kSqMB5Yv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIJujj2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CIFnDtJjU1m97Pi/30miMiacin5hRTW3/Ck9g863tkg=; b=kSqMB5YvEeXU/FgcHoxZCwxY7A
	47tty0Jho0+SODWaJYVHaQ5zZv5wxouHa5mTPtZ0Wba//GQ+4uJA6YhWfcP/P7FpFP2ytxDweR4WN
	dMSSfepG1HjyhvoLh0te+rnu1XG929DSVW9te+fbZvLc4rYtg8BxVmOFxnB6yZ7u7P88U6EC7Dpuk
	CL1wCs13AqN9wS8Og5zsdYW+tuZbAokHmHy/1q7Y1boyt8c7XsfAu/gJsdgYVlc2hPNGjAUSJKkTA
	3Q5vqVr0q4XRkFtdsh/Yp4LyPJnmQGwDkvfmozmlUiccxqDsfb2gcGhd54WPQYZ9JPl0A1EUZ9wC5
	6aIE00bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpN-0000000DsoC-2vjW;
	Fri, 13 Nov 2026 18:16:45 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvor-0000000Drrq-3DvH
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:15 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7f84a55cc06so1486705a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593773; x=1795198573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=iIJujj2y49sBBGnOtt3vXMjWBYQEAVHP6VE5jejXtQcr7A3h+9CvLF4USfRiP+IYcP
         N6eJTGvSpgtFH3TygqBc18Z7nrJw7jPq+Q2M6btKHvDNx2rdR3sAC+daVYdFcT3Ymr+K
         TTwB/kZwc05PxZ24jfNQAM+5BXKRRiPnjKaM/5P7G70mUBZbzKxDK6VWL6sej1mS4Z8E
         9yHWHLb1WTjoRsXRX3wmAlbsszSiqbElykBWryr87gTOajuRakyljtlPUv+iGt5l7oSJ
         fGrczr6LEPAJvYCDCHkEz7dqDyi81gshJs5XCIYltp6Npe9hJLbwNGxvDFKaK5rTiPCH
         vlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593773; x=1795198573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=OspeJCAI4z8bxfKgPwCw3EQaLm3I1imHNA3ZQhPvibOADyazalbJbaifE1VOpaX3uz
         kW1qEQevSR4uTSUbX+oQSCBZFaQ/mty7M/+7OZMsL/q6nvf2j8jl1NhPW2vkhA7JYbu5
         TemB1Rt457XUmmj/CKCW6/Dhku9ctUNxmWBaBhRxdWAhfjQXFSwRq4uymVtEjUKnBWnN
         mDhmE0wI/DD3nH8v7+09bCcGYhqK4/oxAz/pTqVzpLVpNu8JW9U06Ka+4gGQOZCK4vZm
         hiY6F9S4Ai++0kE5bI2fcAT5Dz4ij+M50+9JrQvREZNoT/hhLLOVtcwk5N6pPkHrBIMm
         xmfw==
X-Gm-Message-State: APuU4Z+AG/K+/JgWaC8w2Wn5IK28bcwvrn4xWwKFn9QJuQkQlUShKSVA
	lraaYSl1aIAxzmdaP2S4fiufEDDhk6e4fA6DjAwYZw5vRXaKVj87p7oC
X-Gm-Gg: AYBFou1BHfP+MV3ihsJEZOO6bCKcuAKQ4XWElLghnJwQV/28/pwLFMfxs9vjW8tsGgz
	3UW1JhKZc796ebJ32r8+N7baLwOMBtGwlsjF4n8a9V6WueTYUbCIa+hsg0t7CRqRcudX2gTSIOD
	bL87c3p9F+2QOYyDIinVpIhHqB7FW98mxDclcNRqP9MotzLWLmhJuRz1wRaZ2cMnh/1yAtcn9zf
	CUgRgu0qnOrv/l6K0CZpHSlvEW0G0JrcOg0cQ2ALIXevQmCAMe/a/XexfwmTx2W+VJWYUMTbZtr
	9eJVaDuB5HSg1fnGn/uSx91kunpe20x+hKt7IWTvD11DUqb7XvUsP6W86Rrf8QplQJV2afgd6J+
	yr6iHGqvpz46fk7r6AMvxxl5TQ1XTjUzG9FbgnISX68yZxZI2vCwXOnuyL01f4EbB1DDxx99+XQ
	dMfQb8aXdqcZTix88YygZrs+J7CP06qVvg1t/bAAhgUYlyVm2VhRZD7r0UZbJEU4KjLXurxLqqZ
	npzT+HSW3g28XE/Yl60TYW5aU3fSYnCDljpRXOCXCDWSMdlWnMFZE/ngKcF6q+QevxQRia1KfIi
	M3OSnLowlFYCVcQ5DkSEhhEVKCqnstzXGUCa3fhe7PLPVbBwRcY8kA/MHaK7fhUx6Gz+QazoS1a
	Hc1Mp8ksN8RuxCyDhyAiqoX0tL1dIwhpIEDzykf09ELtXSDh0ZknhuJDz48NVPMmrOB6iVvPIW0
	OvyoIXv93br96u09xUn/cOrnZjX4wY1P50L3fuACZ8VJoUNn0tYB8=
X-Received: by 2002:a05:6830:310d:b0:7f6:5536:8b7f with SMTP id 46e09a7af769-8628982a042mr4014286a34.7.1794593772589;
        Fri, 13 Nov 2026 10:16:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:52 -0700
Subject: [PATCH v4 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101613_951116_A48A6A5D 
X-CRM114-Status: GOOD (  14.65  )
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

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
