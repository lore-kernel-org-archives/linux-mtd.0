Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67435606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yIslXnDc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f9QDSr8t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZmuzU00
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wbfC38cx5xZfVrAvJI8IOR7OyImKc+Mf1TPvHLc0vak=; b=yIslXnDcWK/qy2HwaW3OmR04a4
	xiR/m989fVdgToKQ2iLt40Oesg0Rg2wfdrQ4FktyHGECeKF2OR5n199gZnMhiDVUYH73CVTRtEFsw
	HKXynlj5xv8Wvbs9QLcSlR2O/AKRKoD4iwiIG+Iu7jrsWOj4AWVuoxFGEcSid6I7l4HVG+uTNixno
	P+OyZD49KvAlgwE8jy+r3ZfkcGRi0AWe/35p/KyxUaXOYp52daDyH2E46L/jKSlG3pN8uQ7lqLBE2
	Ba+KZRSek1579ADyBWqjmAGETjP+VvNEnkGCmA1JzGieifKyIMxmrat9wM11TwBlu2YwHx22obQZc
	qddwgG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpn-0000000DtdT-2lh9;
	Fri, 13 Nov 2026 18:17:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpC-0000000DsTx-1iah
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=; b=f9QDSr8t8tkh3bzGJfFXLWs23L
	Ivz6xZvHufom2fGT4I8+eDgX2mId3A/ormYtI8Qv56SarmLBPJ2h6Isvl/dhFJ+yqYrydDXMdPXIl
	J2FOcdM/s/PlAfp/n8l2SB2IFdui4/+mtkmVQa8wXQbXtglV29XdMkNa61QsoN9DfrT5b/askAput
	NUO6T6aBVr0TZ4SLi0Mgg7dzBhamcPbI8UIr/po+9+3OsQdWTK8P8xI31QpbJ1lug/jhjrmeF9bhP
	DHI4sQwWy0WM5tAudGKxJ9opYkn0ntxXmmA69U2hHVd6zLPNeseB3mu6DQoPwNYzjAH4jCmW2EE50
	1KQWqwmg==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp9-0000000BduP-2MgC
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:33 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-84e513877a3so1984128a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593789; x=1795198589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=gZmuzU00WppyUUIr3GKOxvcGNXsUrSHZ5AqYmiLsVrpcJf9HrXX8hBd2B0oejjVbEM
         zpWfhSW/exRnduGfT2QPD7xEtg4baXFAGSGaZ+L0lc+uLFAXkZ4HgdQlwNjT8RFIYrjz
         ePZqtb6feQtyvKylmU7wpAR9Y/SynKMZfgiqIYfd/Ru6lTOn/Wl9sSjhnBfdUAmF69Tv
         rahKZ9jkTRKelHsWUa9HUH1MqTYibRJx0BG1IASR6bKKupgi+Xqk6A9/x6cNyCl1rnvZ
         0yjQAeuJSi8XCq1yP/4dpWVWlp9kU2qL6X6+y0oxy94VaKKMmgH6PSm3aEHm7GFOOtsT
         bgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593789; x=1795198589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=L1m2huuAYWT/kF/kKx7nsOdlXipTrfVD+rvu4tWafXo3ZDepP0cj3jI7JIutrMEPZl
         8tpz1xBQkn5Thuq7/GJowVVP/5qK43cOTZYNIQ6wunRN3iwHA2IgADXQYuTtlLJDlIWp
         81jm5ZvikYoVkZoQ2OuB9VCcDXGWsuWD8pfXtdIxykfw4mUWQq4tPxjXU0//VnHpY95U
         /a8PxYDTF7ei5jMHu0Z9EszJ7bJjUXD6LKYkTbtBUe4fcrP2gawrGWyHeSMnSqq7cCZG
         eper6sgOlqX725Tu4h3uu3V6HijD+uzn8SjsjdBI80mrASrck35WUHTqTordbK/WWvq3
         OSFw==
X-Gm-Message-State: APuU4Z8R2+MvlZQ9NGOiWp0iGrfznErDOXPmz4vlI7dmT20oqqGUMhmB
	iiVUf60lsIkRfiALkESUzOaWX1JsYcrPDh1YDhAr3K5miuHYuUN2SgdP
X-Gm-Gg: AYBFou0ZwF0Qv2EylXC3D7paZwV7yYXHF5w+zgeNP+27hy/M2zb/p0EIm12jfIpXdUX
	8yZYC+noybK8pn30URigsb65idGwR2U0qiWjmsN8NBr1TZcgjtMNqFWrIMDSpAk4DXzpNAp0EQy
	4NfuXiG4kU2ZLWTGc4982MJ7Yfi16anPv1FFA3SONejkcB5nN3vBbHA2i77zLUjxSA4/ChcHcZq
	WVoRqJ2eVxgun07w+yVocVRl9mqo1TF7r+ojCibZq1JDKw3KNtnMImIh8VT9ubS6/XzI6j3skWt
	Vuj2n5nwYQmj3gUzB4+5ID99Vmvsd0Pe66jCJE4D0tvnK10wOfBC9POpSnaVrNz+T2kpuBvgpLd
	82+zzykZunv3YUlsvtAe8a2cd4Rv4D194l4lUhGo8AFDJcerXl6jfntyjKovUaoNwEz9+dhSI+p
	c1lpDlNx+fBSz/PH0p1vdbhih6pu3Q+hKz+jsbNjtvlGL3YAUeaRxIXsyiam9Hp7fccEC+73/79
	GjjSDQOH9/OwXtEt74utUi4FPmaXYSaACi2wOTAaxSRejlf/iGIUdiV8dDYjcwzwKnhmKOqJ15e
	uYGMlDcg9M+sXeNxtt3jfdwLUViG4MzbQ8oUs9O1UAs71HwpW6fyCk3ZFgDu6R26K3zgghMRkRv
	RkSlyrWuStZbojIKefgaXXfv4fOIylHE59WiDZsMpjX5NB5lhGh7YrtZlGtUTiugD+K8VA96zUt
	jnmnsc/pjSn/FU0x8GCU8QknXOpmI7ExQa/K/MXdfZHVWa57xEnQ4=
X-Received: by 2002:a05:6830:2692:b0:862:87a3:b32 with SMTP id 46e09a7af769-862898c0477mr1690072a34.17.1794593789300;
        Fri, 13 Nov 2026 10:16:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:02 -0700
Subject: [PATCH v4 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-46-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181631_593706_971346F3 
X-CRM114-Status: GOOD (  15.74  )
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index f75ae484ce86..85472c3d4a40 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -829,9 +829,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -862,7 +867,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(chip);
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = &pdev->dev;
 
 	/* Get NAND clock */
@@ -915,10 +920,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +955,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +964,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
