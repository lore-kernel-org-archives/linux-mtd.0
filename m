Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E69606FE64
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wsZq7w1a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbLQO/x/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c1hoWXB/BNwnsvJ0GG35B0a8+AA9XWDyD6imbmjQPRk=; b=wsZq7w1adaEBy1XZFSa9jUujEE
	e5L/DLlefUcjzdYZOOLxAUhLYVD+u5pDT6i+DNgVv9gKMn1+6RKn58Z3x1UZzn2ibxreRl/0HONCp
	6OpHe0qk7lSVN1I/2KhGBfE7NLDBubazvnpFeo05SfTFWsL1sanDyG8XeQ36d9KgKigLpT+mI2dmm
	SPZqJ/dvwlfCroHGYO53LHKscK5bDYrQ1xE7rp5UIEHzHLKnO7NyKZtZOXFXsWl80GeBNON4tFbtG
	UT2+qPPscpWSKXh8Q/Z2lgi0ZU61ZIIxqQbbW5/sK9IWUDGHL2bBGfrSnBp5amAwIihvYOIv9eYEG
	bIyaufAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpB-0000000DsUE-3Dw6;
	Fri, 13 Nov 2026 18:16:33 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvop-0000000Drl2-0IHP
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:12 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-845788309b4so1163682a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593770; x=1795198570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=PbLQO/x/QnYPapJUvbtktUDxaWobmXVNuY0X8QHy8LQEw6Ujzs/IB+ALbfJmOIoU72
         JfE1Yn3dVb5QCpwtzn7bkzFjR4TpwCbHm8+UBfUdAU+gi8J29EB52WfkrpLeyrts4XaL
         upSnOb7+FzT3J7R7Pesw90vMvghQHcCXxSB/b5+KdjHtp6Hfw14WHZNUZsB+dqaOSK/g
         WtVLRAAgaRVm3GTGrZ/CRIkbplBeoOQQzhuyvv/gDTj8WgCGNg+KW1go3ZN2OZRyGhfD
         AS07WcotpsREc75aEPMVA0cN3JPoXerjthcDGpX5VrLfcZF4x8rEk+1ISeXsnTXh1PGF
         rSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593770; x=1795198570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=HuaguuUOP29T40J/ZNIRljf4woMs38NDfJvMpPVNF3TWAj/UURi5ufPOTk4S9p5Vr5
         3tw/hO7Q8/EHPGOpCmdNzD4k+bMF2V/I6LhGAF4Sev+v4cP8we0NvZrBLvqlzydAW143
         JxgfF8SYxyKyNk0Sp5Eaz4Y/FFxHKIYZBybC99U7BWZ+qxn4XAL7mR3TcsLBLw9ZAe0p
         k79P9Zq4kf5y0p3FNBhdV3IXmf2VuWmXzbLRXYaBlVdl1cZMMFxZoqDyLE0yvT6R9CG3
         h8hUYuZc02wZ4eksgZDC8+qLtQH9YR/7RgFYo7E2z/uuHuGmlCzky9plaiIL3rr3nEol
         uuNg==
X-Gm-Message-State: APuU4Z9T8erHLoxaluUVY9l2rd+Me1om8MvyPGIm+jEO5+CSXjxUXtzi
	UDSP2eOi1iPbLgQODC3L6S2oRuvVCOvxYO9dEcAJwZmz/RmlIeXQuBgV
X-Gm-Gg: AYBFou1szAq5XibpyG9xlT2rt2riLpyCEWSsBxhEVRElb4/GdT/AS4jTzy69iD4a72k
	zR5mU3KCcYOAx1R/vtgcSXYFppWwKdy7DYM+hVvTrtytJFmPxAyMkOiKG82sGMzdfvM6AFXkDL4
	vSbMHadX8nNEfR2cOUCO7Yfle2LRxPJioJ+j609vukKh6PPzl7/GBY1hRuChCUCxSjWV8lGiKuz
	2sssrt8JfZQ7SWW2966i7A+oaW0vX8WSDX1+k6FPh1ru/KTbwOGWKAvPItUZLrUs+3BKyGt0UR3
	aJiuLbNWl0BtATD9H5pRV1QNEtPhdRvYsFIrM4Sk1tu8/Oh6jFE4vlJaCT2f1zPgvMEI50A5KVZ
	5wuS89cTASJZpQYD0f5/WpzuoTiq2fyJMOxD6DVxUT5po2ophajNj87sKRwX6CufCZTGDbtZ88j
	wJqrhk4hLZbcQmT16jPIC7YdrOFxFifxt5yicltFER9TtcrIiavVphPnAKAzXO5jARei3R3DzDa
	KxVweyOxq/EVUSjrBTRDIh1lTvp1sNl7nvIwRcJfcN4aemecT7oKf4yEilD0YHhW1FDjyLNfl5l
	NM/PrUXP2vmne7WZKXbMhSdwGZyjIwZ0YoJMA+UoId0ZciVnrOfovs9wueEhCHz5VyxLJypOohK
	PkpAHdxg0wd7m427E5muPDg+HZjA/HGtJoTRWLtlJ14nGojhLD3BaoliR7Tcd190oP96eQFL/g7
	lIiQwyluad2eYAhafB1NpiCKm101og4CPkiLtvX/gOswHXsSYMj+JhDMz24w4OpCOiO9UkelrN
X-Received: by 2002:a05:6830:909:b0:822:978:f7bd with SMTP id 46e09a7af769-862898b70dbmr3734047a34.28.1794593770122;
        Fri, 13 Nov 2026 10:16:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:50 -0700
Subject: [PATCH v4 34/58] mtd: rawnand: omap2: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-34-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101611_281388_456C172F 
X-CRM114-Status: GOOD (  15.09  )
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

Keep the shared GPMC lock for bound devices and separately retain each
device's allocation. Disconnected handles return before touching that
lock. Finish software BCH cleanup before releasing DMA and driver code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index aee7df4d768f..12a978f5f724 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct nand_storage		storage;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2218,10 +2219,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	err = devm_nand_storage_init(dev, &info->storage, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2285,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_shared_lifetime(nand_chip, &info->storage);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		rawnand_sw_bch_cleanup(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2304,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2318,13 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 	rawnand_sw_bch_cleanup(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
