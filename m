Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F80606C0FE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E1z18Uh5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F2kFrfR1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMCawrgF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mfjFxv5lKQkCaIENRoxZrmGb4T2NoquVJtM7d2bssVU=; b=E1z18Uh5tnUbQSZDmOVrZMMg1R
	0i4h9sr2ZpdbTlU7wX9aSaN8giqpVtWZqZn8k97fp6REVt+qHpZLye220ySzX9lWLt9Adp2w20ZjN
	pL6xexuX4m/LRGrBtIOYuMywb717Ft+PjHkM9tp2NDbGR4j5o5L+VHe43+K1SF201vCaD4f0RBsgN
	gqm50GLTXsf4YZCC3RymbOiU04FhcbcTvhwu1uChwIFORfQnXnVidpJ5VmdXR3v1OmjXMtzhpQ8Dx
	WlbcDHsyq2mSL+rRXDwihHrgvgYcnWc6CDg7y7BIznrBLfE7J4yu07oVgeCiteUXIIoPFgx/IWnP7
	G0iwEkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoR-0000000DrB2-2rp2;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoK-0000000Dqw9-3kwS
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=F2kFrfR14i57X3+BCDIcO9wihn
	XpViTjXPhO2bYgxU22fF/iD8vteli8/62M74MrcTZIWcQZLmd1lECqQo44OQ5v3qcdJAx/2WMr4Ui
	vPO1MEFC3Fb4WxKJX6/sKm04OAdcgf9k764SeNlMKdAEQIujOJ85gD/S0z1uahKlPglzd+HLXphnS
	l1B5ydERKbTY6GQwjfhj8VJ2KIk+lrKXV0cOK2h3hdimPeF+FJBC3O5cEh2jQTBmueveTCMrvZouR
	SUiBe+pAfnnJ+ErhzE0FQa2tIJ0nIA5BxZt2Q0RR8vh8G6JNhx/p+6RMpXQ5Z744pa3vvLY4oY+aO
	Pfh9AOyg==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoH-0000000Bder-2PCn
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-8628b63dd60so389974a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593735; x=1795198535; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=oMCawrgFDRyEna7pQS5AI7kFTcO2TbPRm+ANE2eTlD6M4odEntZpVtAmo/GSD+qs+C
         eknjZ6PhUn80LGnRev945DY4QHZN7099iUEex9mSJoeITad1IhoQTEc+peFkWcpXsHbo
         e7SVySpZKe/aHX4/qXniDOV3D4pXqE8OUTKO+WBbFkDLkNDKQbAmrQwXOqYfybu8tR74
         DSDmcmG/zg0ej4g99CtzLeywWTCbb766WkK0K5JPbkEM4ZPgc9515EolWp5V5S3T0yH0
         vPelG8JoqXFdK4BxIZ19jkV5+pdP0wyDwpEPUG2DrsUYyzQvbmoE4d/aFbcaCXvaYN4K
         gdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593735; x=1795198535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=OlK0vv3HCSV0b6rLpM1KskVsxnfAFk4b+h5VnZinR34MdKdAwXViFIE31LAn8l+B9p
         0WrykQZbWmZgILtTw6MJ7sGotXBxQDoK+XafKYfPYDdSjL8v+E0k7wrUGnF7Js7qIaMr
         KlCscisycYIQZ28/h+F6YujWP4s95rg8IRVp7W0+JTabfrlLWzZ7kpgBsLcZ5i/Uh7sg
         p+GWkOtpPEruRYBt599tGpn3X5SVAOZC/lcZhFzNqxulsMJ7X/Neb3GROjjlJyUtEs40
         vhTA5opXSfBdYmtF2nYz5lThsYk1RO/QEF1TTJv/c1RLQYl4N3vO4ccu/tYIhNFwHlX6
         xO5Q==
X-Gm-Message-State: APuU4Z9D2nHXtyRCtFv+HlzKF16pq/aPVDiiO+kX0RnmSCVJsUPQLANi
	an3jU2Wh3kAtX/YRKIN4WYr2rtIrIWqx0Fn0fxBS3lHyWRssEvnyxbIF
X-Gm-Gg: AYBFou2a3eodFgtRivq2b7FrQF/Kz12jBi8Mnr6vfzSV81Q3Q2LqEIfLBQ0ULu7/rwN
	/YesGRDEsrURJjfmVvISampkFwVLgXxPNLgrkIgSKUSInHgr7mJ5GQiuxo1U+I8HzcjNmEX4Gv/
	ph+oZOqfYuuxn2G3Vux9c8qAFWD+RhqjvKVWUgXU2YfneJBIdYroJjJc1zMuLhj7QaiTLjaudJ7
	/PbKMP6i4dxXRjwCtFZUbQaoLHGzaXXwuOErtcMx6uYFh8gh00ajkBLzRKdh3yvqPnBA9wMAfCX
	CJ2Dvhrc/LISO/ElG8/Zk8vUXpx2K2lgRgOXDuwPE5QuFDVE54uRRVdWxbalRlR/Rt906E7kQTQ
	e6XbyF5AfZ7SnYrcOT8AuxOgSWBCIwWc00ZEWkA7WcALaeGjKe0nc0r2W25Ms9ATbLn4flQvOTP
	vnGokS2IyHSb1If/WC+erCXI81Zh9VgKvqy/05oZWCMwwnfeF9tXl7ie95iVwVyfS/OPk5H5Se2
	c7XXGNKEz89XePJC6P1cPd0ZRNhxdRovAtEeBhmF1t8V9LXu4z17nnL/Oy3CmL8m4hHvV7Vwpoj
	hXSKvm3yIlkmonCUmz9zFhAP8j4Ua3eIgyJppGRO3Zm5LlolpUhsUnXy4hco4D7inUd4thUnMZg
	0kok8yCcRIk2ePfXBr3EFbdClSR4L64Sfw9xQG4R83dtYJ4njBtewbVVVxC9bL8GI60DziBtpt3
	CbEykkjThFYGsqwxbO8J+ejGL1eZfE3EPksOU1GL+mB5cPgwo3w9k=
X-Received: by 2002:a05:6830:7192:b0:814:8259:781e with SMTP id 46e09a7af769-8628979ea24mr2976379a34.1.1794593735257;
        Fri, 13 Nov 2026 10:15:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:32 -0700
Subject: [PATCH v4 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-16-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181537_451695_36618962 
X-CRM114-Status: GOOD (  15.29  )
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

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index a36a82d10aa7..010f614a2da3 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1356,8 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1365,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1406,7 +1407,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->ecc.read_oob = mtk_nfc_read_oob_std;
 
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
@@ -1415,18 +1416,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(nand, chip);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1452,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1511,11 +1523,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
