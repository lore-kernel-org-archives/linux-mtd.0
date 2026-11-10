Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6276077D0A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L3zmgLuA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qm8819j8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+M8mV7RGq+KawLArfwmywNcwMvpxyUP9J2bI+zPVtwQ=; b=L3zmgLuATsI0xIBaYOsPEwhX7F
	8W0HhhHI0kWe1EQ+G3prfx90cop5sYUvM1Cl5ndK7tlfVmYoMVhHZSdZ4cAjY1P6E+XdscmBr/fsN
	6mPZKjxrLr3gNuBXJSg7uMrFQ1bobtj3Qg9GQ+1ReEHEdu9nyw+4kmRu5DeXAsPZzMSPRqbBxTOeP
	OMqJQpQV60xCZQ10jqlVHBU8IVmzfBwSbJA8Fr8yEBxd9lUbDFid02/vJSU692L/VGp8tqN7E9cxT
	rApS5AwhQQpwRIeOWIHy4G0y9wo6FgydoRo8LuhcoZBROTcF841prTEilGSBuz/hWeKI3Q4o+mvZj
	3ewCNR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYF-00000002yDs-1T6H;
	Tue, 10 Nov 2026 07:45:55 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXN-00000002wuW-2rL3
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:09 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1048644b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296700; x=1794901500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
        b=qm8819j8oSCW6S8tNcWf/oivJi8qWG+QXJZqihYPTGDcY2oNzxdNJnIYSo5bLqdCKD
         ETcjqX/Z2lc9zLI40YNP3MD3EcUfe4eLu+UQJhWA+53tGkaISWXWR2vYgzzUvjzeLI5i
         k5ez8G3+W9CxH6bTJ2cqMMaRKzIKLqdHUoH1U3niDi0dw720RwN44pwj8I0QYpu1ijn6
         qosory1tzqvnVojj91lRMmdetv4ChFWwNMcLZbo+reY+YRUzilWDL/vYUfn85B9gX3Hg
         eLVmTFwOTQd+ohCNP05fSKA3DuWa3q3n8GByGIuPDwfSz3uYKhpBL4bru5D9Js8vma31
         /ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296700; x=1794901500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
        b=t6TJOw8je+017Bcb4dPo+RIsUdT/kECMe2g2tHRzw+sFBfSrVOzqpL9A7mI9uLrr5z
         hqg324mENc0/7+PSFIejgRKO3XaDLWQqQl1kcXl7a9ZT8b9OFUu8mDk6wqtHKqK6sURF
         aYz0/U9j6N9MlDX0/bzRvHW2XS01mWljq4RaXSjZlBPpAtlg60PJZnOAQ0j4JPizSkrx
         rBVy0iIZ0j5cH1KCdEe0fIOVdMP+QrZnP3rLAjurwEqYa8N+fr5UlV/JQw6KbM68DNQK
         Bj88fr8/yN0JCh8z8b6nSusIxhxMig3Lz547fYpFx8Qw91xBu7MrTuo/so+M1eEdU7Lf
         m9gQ==
X-Gm-Message-State: APuU4Z8gYI2oJp4cfL1CemnnVfT3ZIbX9H+ZatV/dfTBY6WrNLUbpL7Q
	+JmYoBnJooTyUu7h0NGrbSFNNej2ICvb7PgjpPrD9ALUSdMatN+CTGTd
X-Gm-Gg: AYBFou3myZkTSFNfPGXWNXYGDwfpMN0lhMlZ7+9J8kdTGApDrxwYB0RuEzkxW6Y9GmM
	sRvyL+EKQ9ir66ReYcU4ov4vqVxHVa2JUi2VjULffybBP7hYWR9u6snuwmisqwKawQML9bqwMAw
	wGT1Eeb3AqULQIbC9+Cl1rhn5AQHsjtHVn9EITO1DyFFm6zxiZQiQhzhohOBBbCD+iek50IMNZY
	IHLtxdl/1QhKx11cfNuA40zuczPG5k0R+ZLmnKHXgQ1yi2uGFTqL7pzTr5L27r32m3nqKMm9riz
	e1cgLlbWESDP8kDE16ZvFJzrcpAiwZe2ce+60z3+YVM8ep6wqFellGZjGboFO9ilybxaWs0AbmZ
	x9M7YGNbwA/GpVZFNnz4N/fyWBfJqwSvvORZI8PIgS1XLAeNssJrEhdDV/d4DcplP4spQM8N9Yu
	aNETIF0JOZi5wks8bLvlUmLlo1A8QH54lap1YPTXqFyRjmkj+6SVaihYI67vR1RNu8MHWcJAKJy
	WUeBSfF6bxPtAhU3bSIQV4L5FLmCKNH2iXMa3tNvUdA1v8Mpt4M+UL28DWI2jHVoT3Vp+Qs7y9l
	XMXUkHM9jG1GhOwZqlFAYV368EAXmVrL9MHAKvTkUtfHdoKkpym7O7BQPEpRKCrH9kBSdgWtQ4p
	i7nBLvJvq0JUgROOQF5tffGH9DMwtvlET9IiJsyKWSjL7MP9rJzMnusFXaNJ3e00WzQytFDFp0T
	F+G8ZNYvI5kcaJ65tHOlqwDqVIaiM9mNCrGAkK+M7SqURmHLA/qrA=
X-Received: by 2002:a05:6808:670b:b0:4d6:9283:1df2 with SMTP id 5614622812f47-5683cdd6dd5mr1430636b6e.61.1794296699815;
        Mon, 09 Nov 2026 23:44:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:39 -0700
Subject: [PATCH v2 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-36-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234501_947948_9A2AFBEB 
X-CRM114-Status: GOOD (  15.70  )
X-Spam-Score: -1.8 (-)
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

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
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
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
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
 
+	ret = nand_set_release(chip, rnandc_chip_release);
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
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
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
