Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098E1606A883
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ANo2O0eF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CMhvXjyv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDsCzf+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tSerrRfYgw5NEO0RF+dGyWWBMXRu2a7+uNyyizkoimE=; b=ANo2O0eFgEVud90oo3JQlmRxdd
	Ey7MF789EWYSZYr+ZogiiAdbYhn/iUJK6Drst8W7vJEjwV+JtcTLupu22cxyFOgkjau8SfY8b7Onq
	k6sZ3ACENVGDdxfIyQVUj5Ocr+3eMHoaepf6tYigaNS4x/qm6xuk9PErDc0VffAd3h+wORLMv0xg/
	iIiy4x+Hd1SrOYoFC7jgV1Myai+CS+f98+Ytw/McX4p0x5xdoVX3TDr+1uihzxjsN/xU7oZYnIRIP
	fL/Q0JdhM2k44A+wJzS2JfFtQl3aU5WPWnR3aJrqYcc0fssmkSZqOciBxtO1FnPBijlbnX4rQvKQT
	0328WLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFF-00000001H2x-2HxK;
	Mon, 16 Nov 2026 06:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEh-00000001G01-2ywn
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=CMhvXjyvkf2/lxadBuuKzZqDyC
	HWbMcYuObv5NCibXHgk5fIgFh69rT6K6IMIGmevrhGF51P8Oz1HfpaV7Qz17mdLeLEqKbIjbrqxoF
	Pq9ONYmyPCj15FBsMOGfv0+kCKXE49K/UtmM3mJXkOjXVTqSQUEpzVqQVcQlLvlRztEwq7jd2ulfu
	YoHZ/5OkvAc+ZxQGiU7Mv8E9VraR/9bHbX5oQL5g2NglPa7ZuyL1/348tVGsHpTHN0OSWSTOOSWV/
	vypmRdYXnYJPD9YvUWNiZtvn3raCzrvsUi2sGyJ7MGi1uzGTni5ENfLSOVJo+lqLMyFcXXxl3CtIb
	VGr5WRXA==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEc-0000000DPHI-0VIQ
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:37 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-716c0217635so4204337eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810631; x=1795415431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=PDsCzf+tbx8hiiI1BiE/NGSkEYdbf+GqEC29ZI9oFzNKu2ocTKxSEmRWvZvGH3erj9
         SoLFen5+u78SDjYwYrarB335r+0aPD+9j0GguV4FFuTv3mBrJ9Hz4j5jlU9aLVtCSJ4k
         IlUwqC8RC9oQX+0viX2QR1o8F5yh4PJZlXV8V9TnbhsgjOIa5OPpeKlOGR4a0zzhOYom
         epyWOD9gEK826aYwI32yHgfCKNY0aXD3zdiYN59uc7SFDDg6+gFFBXfyAc4oOZQfkU0I
         XNt7mX27EaNGUpAvi6lqs11wVfjxIcfNnWCtpub3p6jXDyKfikAOTZXLroE8fsZ+zK9d
         VXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810631; x=1795415431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=MV8K4k9Nv51H1kw3euoucJB91KSKoNSVV+BB78NuK5FGoGQhbsJAiJAiQ+r4XINEHy
         pop0ce0avU6ytghn3o6l1T1rTZosBRuXtcSKTVkQ9FqPwPhKH1SuxnVOm4EKQC5UpGcP
         szixXMLc9c77LM5adtyArVENWj273zVEYsWkmShI11Qb5E+NLeQuumm1zKYKCHfr4Cx/
         OGZu0qBdiSCLymBC1l99+HKnc3IkFjklllMM0d99wJZKT1nrr6+veHz6LyG6O2qKy+6+
         JXi0Td7j0aUwZ68b6pBc107jM21pp52NQhjsDNYnE1aniqIQSEwTl+BzYm3fnm2U7orU
         ReUQ==
X-Gm-Message-State: APuU4Z8BkY+uaOYTNnvY1mgcyxQviYjoxBlU4wkzo3xvEOS7yixWutks
	WjeUme7RddfdMQGpo7XnFCGoqaL/9wXtkWRNwOFhKien5/o08q3Bset8
X-Gm-Gg: AYBFou0D044NVVO8Z/c9bGEvqrJI3kMcE57iR8dH41wKm+tpoGoxTD2KN5NV4X+gtII
	52HsUqXrVKWfEpjTheWljAsIF7e7hgi7Yd8cvbGfXMIXBfCG/WMZVnX0EcwDNKHEUmUwBDmlUCK
	64viWVbKLz7apCDFUk9MHWA4C6X6v7oYketFRVmVIEkxA6xjGH4L1+Vqz0q3cEpDOPZ5LS0jSO2
	PhWhUcp/dRe2IRi1SpdaDPbTCP0IAxeD1IQkGt7onm0TeCIecVW4Cj65Jiz+pco2jJwlOetUYY/
	huN8mkPMYMJKucUkJ3hMQtqlWd5e2w4stcJTaaCeekejHQ1inV9y/7qtBqWJWvwMfnBjz0TS4s0
	rElhOaiYzIH6cVRQTCLowMuSv3DXofukMfmI6mu3S8fJYFzTF52fR7URtyOpxJpIgToD5BarX2e
	jJNxyXf7NDeMAToztctka2WjOrXs3fFy71oXIuzYH3gBFXlSZQszAmB/fJSne4Zy0+c8QbJ3zPJ
	MoDJDXjw+dLVA2TRoX0NXFpdmcnHDbm/0Wo6FjKfOUFsb33K8d3E/LRewS3lDauONJ64sbM/Vlv
	3HJy5GqjgUci9NMb6HF7YXboATDEv91DNF4z1BZspgZQr9TdvNYzWW5usudVrLCOozIs6KkgCbC
	HWTW6zTQYI67HttwFli6gSi7dHqTdN/tAdOZlnqHYbjzibAuOGFXxHvzSVsyoOZVUwCKcUxIkMv
	rCjaO4egart6QnzF1/DFq4pWB8yNo8XodtHPeT2nDIhVHJDRlEuHpg
X-Received: by 2002:a05:6820:1c8b:b0:716:b936:7cf6 with SMTP id 006d021491bc7-71ab4d8584bmr5458319eaf.4.1794810631234;
        Sun, 15 Nov 2026 22:30:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:52 -0700
Subject: [PATCH v5 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-37-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063035_771158_A20C9683 
X-CRM114-Status: GOOD (  15.41  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Free transfer buffers in the synchronous NAND detach callback.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 47 +++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 2a554f62a25e..871dc5e22759 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1398,8 +1398,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1409,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1427,21 +1427,23 @@ meson_nfc_nand_chip_init(struct device *dev,
 
 	nand->options |= NAND_USES_DMA;
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	ret = of_property_read_u32(np, "nand-rb", &nand_rb_val);
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1451,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1459,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_lifetime(nand, to_meson_nand(nand));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1496,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1550,15 +1561,17 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
