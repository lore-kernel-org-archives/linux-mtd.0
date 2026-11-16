Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4A606A883
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyeBBhmy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vaCmFbrx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0UC46j2nZ8qH9blAdanFnB2/MIHyizk8Wq8bGV7LEd4=; b=FyeBBhmy/s5y7TMJp2fsdS5vqR
	u/Z+gYzVyF8d+Kl1bv0uoW9EIVhD9NmldCNWTA8nbJyn9CPQeuiAxZGou6ax+CtFLIN+nnyLLodNE
	omByJVDPbtMzvQelWaHiP4yKWVBVlVZlCQwbJcKFJ5ZK/qHt1c386SXp6LBVEslLQa2n5x317L5sA
	tNomnEOC3ZAO3FlEa14K1PgS6IBlSRU5n1RlaVF9TKi1qD7t9VWPDVXR0xzdQP3bSuFF9W2F/1un0
	zGXjY5X6mlwmAO6zabDAwPbf945n5nzESyXRlEGzak2lCZ3HaxMMNe5UyaxJSp1LIYSJE9i2CcOOT
	ZhtLo0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFJ-00000001HAR-08di;
	Mon, 16 Nov 2026 06:31:17 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEj-00000001G5P-2hYA
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:43 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-71ad1db7e31so819545eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810640; x=1795415440; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=vaCmFbrxu41m0LBY2ZWDm1AHfE3BUGasLA8oDFNWrhoFV6m+dMb1/+wPpvMrTcm2ly
         EKkvp+dxkkhaoPebCIIvRSttHP3BhyguMCWj8OyujD2tiiAUDFcBw28wadwgYj/j6Hr5
         GWCotOcrlKfQaPUGZH5hX+d2JTjOeQH4HXijhKxz0QNJ/+iWxuv82mXnJBDvHBrRPLBA
         ErrJDAlVpH1NyfCdUku+VhmGruiUktwdrum4JJiaaPdb3goMAd+Rs/PQwPcD8xzz7LHm
         jXBgV76BbCWbXroc3cpZJnMyupoeb96rrykKplp5Fdn6FSovG4pNAWAG8uhoyip7BBBJ
         EFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810640; x=1795415440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=ykOoOcTnAnziokGv8YHpQlEiRMnra3kEmzBdFMd1FIDr1p4HS0srm6MyrNMGMk/+HC
         UPh/GzyuV4wchkVKxQJoa8gWqCGU7YlGYVoPqc+WJXWj91eT170P8W6G5rbEdTbZzcpZ
         hrKcLs1nfcSSxCLq72XeMsOb+BTLcYhb8Bo1OrGEq/J8sgpc+98L+71rm3mJhjZGKJlP
         rrHIi5QxQXx2tmxnzUv/4QCPIDxLsf6x3r1KpmHOTBhWWqK95gUDc31+XjRF1aPjSGh0
         ZDOWYaUJpkqAWSLvF1ApKv4yNLa30+iKG01PmuwookAt2O3YtqSmSqhewMuAaOCUn+6q
         A1vw==
X-Gm-Message-State: APuU4Z+aHx74psQF2WPuVFJSi9Cm2TCdz23Ix6wvbL6Xd0P+6WPeRARF
	fC4p4z0X3214O3/wDpBlCeV7/RDaYVTH+Chc+mMn91sLN/yV6pdgGkVfkyEVQ41t
X-Gm-Gg: AYBFou1+HULc2obASfCVPn33XT0mbfwUACYowqyqGelFMrtML7h7OESNNBADIlCauf7
	NnL+TD/35GW3kAn1hob7BWCVBKJgpiZJky90b84BhFleAfWP3UH3qkqaE6DzXdYfYvUY+/encRv
	TX/N8TveX61VjvWSoD10tvWkKO4yYVSoPbAbr/OLMPdvo/t1HoOyQwAc7fI028NDHXpJPweZoVD
	tNWj9Wb8akxIhK7qU5FFmJeLB33/cTjcHouRR5BqFSTw1A638hrvFu3jE/bT63dJhVgUvyQhCNE
	ckslhSqd7zDuttqmZusuBFzXMxklYB7OGsZi1BXmycDJl+frnLOb0eUxmdfrDVCOyxFpNWOe1Oz
	4q6znSSySCBYrlCQWtbZwzJwhm6njkCwTmYElYAJgPrP0JXlYb1T/s76OdJ6V/J/Zplb43BvRzx
	U44V37k/vCwpnMiuh/m5OwjutEoHYCPW0AKeLUhCSaXxCwXaJOcRj37fYIpL3jbH1sThbew35E/
	pr+0YfML5xGkWO8oos++WOqwJ9HNusI2EosjobC+n4V41+EZmUS45CxcuLmw7lyxJl+OaKo2Il3
	KmH/4fPkD2XSERdhBTu6Wyyryqk270U/Hb4V7/qv7D40RGH2tyRKyvooAGxFEN/tOYLsV65r54M
	RtjE1sTuNvY/aifAxFkGI/DsT0rkLLDxIwUwxnnVCqy283dEdJofeu0GJXaiwsoryBPs6J7XjVn
	Cxa5iHvoQ0F1bDjxEj9xoS8vxBds+nsLXr1jp+lKyWY9oZR1FvjdAhIpEGtl8vaKhaGiHjyYW4
X-Received: by 2002:a05:6820:1385:b0:71a:e932:868e with SMTP id 006d021491bc7-71ae93289f4mr1578310eaf.5.1794810640534;
        Sun, 15 Nov 2026 22:30:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:00 -0700
Subject: [PATCH v5 45/58] mtd: rawnand: sh_flctl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-45-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223041_830336_0FA8E093 
X-CRM114-Status: GOOD (  14.31  )
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 36ba5b3da3a0..b230f5ef448b 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1119,9 +1119,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1192,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1218,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
