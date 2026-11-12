Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73638606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZP2tgm3v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lGYFhkQ0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4jEdYEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tSerrRfYgw5NEO0RF+dGyWWBMXRu2a7+uNyyizkoimE=; b=ZP2tgm3vOOCO2KfsHXZXg75J7T
	buL/MNSic6ZEkV4gkXQ89UjB0+0833XY4SbVylKxt+hSqwwJ9KPBZ+Zpf2S23+kdlomPfGjhcWfOV
	xwPc8xCc81mzzkDZoikOIT4x5OwQZhLHA+d53zj/ySy0R/zXo11g++wV8L64lrPLe9F4Pr+lg5NB6
	DuMmb310zKQUEpPbZwYp/AVHb0IoGcP0sPzbla3/A4nQ8A1BRvrvj1C14GCC6h9UVmkaaEBwJEPOt
	p3rxi5v4Lgfxb+YcAK8mt5dnTcCwaHxkWGh1XVpB3qzFvbF7Bm9WVd59eIpuFzuU2h7nBMtHF+820
	4IdZe/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdX-00000008Nbx-3o0H;
	Thu, 12 Nov 2026 01:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJct-00000008MRw-2Ok5
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=lGYFhkQ0KiY/kT3m+UCqc90vtY
	TYXFcLNrypg1mAtP7JAdBUuzwlYNPPTOZW8gvGzOP3BG+TJhRLh25mDabKdfAqSjpGYe5JeeCH4V4
	we8CSb2BmjiUUN0v2OgeOfo+KMz++SFJvkfTcAUrhNmwVYrZOM3QXMy72fi5/JeKtGVRW04QQLf0Q
	E5nqvXKlomS3MCS3WaISLyrwn5YwQYWnVdo8LZvuQ2vJ90C8BWAq7XNFoM8ipJ69UVn7grIRt3Cr+
	YcxjZCHs2t6liReqpWI3q/LC88qGvKOmPlfjjxYBvtIzmN8N+JC19EmxWXMB5xkVOU/bJ7WtPpRjd
	iS+gYxLg==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000009mti-2ZQb
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:18 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-843b6f8e2c7so3946011a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446954; x=1795051754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=W4jEdYEYy9PVc4i4v8X/dPR6KxMXYsc1yaeBwJzyiAQ+w5sJjVavM17psqZPpS+SVt
         QQPFgHRPCvrtAnLpQ+NcMf3xPdw7uFTDBrMlORnTv8V/Y2viwhdBDEPE71hI2WzM3rfG
         Q6ZOOLE2GYquy/l3dVuudiCstrcW281UmqO5n1KuDC+VwjkGsIBbVYWeb1TEJuOV3Sfo
         J+wneKUy/OZQ8H4hi+VnA4XmDwVD1EvQw4Iy30RmFsKbIRgLG4IOHdHj6HuLCdwP5604
         iSH+ZIxZYoPPNcRCh+PUmjQB5YexxuGAdfJkdPAUrZUhIQ2DqbVbF7dFeDBAfaN/84UZ
         /YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446954; x=1795051754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=eQ/yVMjZXeRyCyzj9FxBIxS7Wgi5pfAY06hnOC9vWMHCK1oQzm5Ejvo+3Lyml+Eq5f
         xxL5smgURZmfT5qp5k/7vVqS1Sp6HUBXgbSPMOtGlrc7LpaRVoihHSUF9NzBM6URwZkM
         S0WSxjUY5mMjHIvCLCQCkYjIXGR/tMtd8FcNwH3OM1kbcJ7sQZ1YBNH4b4vtYM/l/Kkp
         MBy7xtz8ijQFrrfATv5ooTkFpOozInbLnvo2nToNXWQDN+xGkfucoIl42th+N3CTxTIv
         JkpjTpB3A12Ru5u31ASZUHIYr2K205WW+3x5yrkSgHdYaEM7fn1NotsW4MKA7QvYjaDv
         epMA==
X-Gm-Message-State: APuU4Z8cUYI5US2xxZkuZG2yjQXQJLjaFUvFpII+WN1cjOkHRcmD/eQ/
	RsIqZzAkeqd5cHugyHoki3skFQlPIMTrvxEiEbhlvuIfEmsirah6XHfp
X-Gm-Gg: AYBFou1F2vFc2RTf9gu5LETrA+6yIElqXXvOcXiRxHlzbr7LyUepiDaEIl5i25MSYId
	gtpta0ueQJFB17/j74ccgx6U2s8F8un4sPDji78Qxeiwz7Trk5qfP8i2j2/kaNCLzs/+57WV6XP
	S0k5E0qwOkZmy6VpkFFcYv/sbWeFgikHC6ReF9tiWx3NRcHuo1CzK4DVcJF5bBK3JNEIFVpr/Ip
	yxtH1EtRLHEC775jaMMFLrnpnYXtDLUOD7ImUXnHJr5xtFAI0GwqXKMSw1iSShuIRZ5oESXaJkR
	Rv+8aLg54qsdse7zvugzZOCzESOdERJMRt5D6v5AyTeARV7qPs5ArNdRkT1LPfXw1ev6ofAGXix
	bHHC4oNWrQGyadrdXhYphmbaV3qf+HcYdnGJiO22GiaiqHrCFl3+xrRFXy2yfEJA+SGhGTAvnGQ
	EwZHfan2A5KVapdw5YbYlxqGJx9nerTDzG40RPw9/t45Qru0EQ+0/xgSTADUljTRFouzCZ0WdcS
	Iir/S00aIB9DVSvA4++IxJo6yo+5p+VdgzOpaYDCCRE5adL6IN5RN6XeDb61AiP9rRfexZOSYod
	dTbCZqOlAhnoIteRNQt3dTqLKyigrp2fF7pEQk/hDnqzNF4jM+0S+jB7NDztJoyAtUiVRkQo+jO
	PcQnbXeNWTVFsxT8arvmRDrBjMnr7hwmS38wz7CguFC2cUUeb+rGBZpTsmg9ViGJNWQYCU55sSQ
	ra3SG3BAwBrwHRyV7Il75jCSmMjYOrKbCcLRqffEHSyvsPri1P7fVV
X-Received: by 2002:a05:6808:c215:b0:4d6:9222:99f7 with SMTP id 5614622812f47-56b98327045mr3914540b6e.55.1794446949668;
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:16 -0700
Subject: [PATCH v3 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-37-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012916_715720_76FF5752 
X-CRM114-Status: GOOD (  15.78  )
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
