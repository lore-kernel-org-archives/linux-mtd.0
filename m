Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FC60A3827
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eqHLG+oY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgunE7ah
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nnpnViYmeE9LbvwbrFZzHXkPJ6b5EaNphdbtuBXRqLs=; b=eqHLG+oYSZ8DiWdR6JRsSs7fH4
	DbPlyvK3rBgfGvfyTKdU+gA+L44NzWhOW3jKiuERvS0hfh5rz0MFg1TBD3dOi691GqjWbT5FIAJ7N
	6WIYKcqeW+srw5/JjR7bfPL6kS1ZQciPIKqyN/KP7COG0UwBRe2gtwE6+mK9g4kpMrmHH0Wb4oWJh
	J+RKDKM+cesU4KEyFjbdzxGENaelIWDHM8fHLootFb2q5VQVP7VapgMI44pl0xr9E0sOBCbPTcByi
	wxNF5yeFsX8LJ63SshU7N1/ah0pz+nfO+IG268GHMzbXTUNrkokYRfld+trhlq/kXk8jUY2/fLMRV
	b+/wz2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoz-0000000DsAc-0FYN;
	Fri, 13 Nov 2026 18:16:21 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvof-0000000DrWF-1FWb
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:05 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8253bc5a613so1454461a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593760; x=1795198560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=RgunE7ahL8O0T3teHeUPpM6yq6b7v6HWJrD+sLkp5/lDT6bD6N9tuKYnyn6Cr+y6/3
         FxCZbl1s2XqjNG0knYQmSdoH+7/I7SFT2iEPJmxpIrYzGxd9X+o68tT4ZvEbFFanY+g/
         28o2bh+i1dIglQw2tj+y05x065EGUEbC6+43VqaYOP7p8AqMCOI/9yCa6aXJ5OxieRa3
         5k3+V53Ek4rs34r74w38I4IDJPlmq1j7vDNTc0McC18AMLJxBd75sSlUSZX6sV2Ea9CO
         0iSPoUWMKX6OYn1gTSaAr73hVOtonjkuMpzW1GRe4m2IEmVPmYMxkuucDdJtCv+g431d
         2SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593760; x=1795198560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=eYrm2YNkyJrcl6jpxcQ8HmAQM11EtjwkBMWi63y/8bNo5mOs6kNJE56akMqDVanfqF
         8cqKl511OS4By1g5HBr67HdQgUvoYkgGzSU3qJuCq/m2AxgA6k+Ffryhf3SuG1S03D12
         WDpw+KOFswoInn07Vk2Ceqva7/+rAy6svxyurtVW02qwqXmBlOtjcqmsZF+NHsI5Py2V
         564c2RgTiEFtAsrghS2EJIdTyYXPPEmCf8Qa8sKwfgvVJi1FQj2V8GAid28aFxwE5k0G
         duXyQuMlceH3GiUF6esHu1mP6mwku2xW+SsLQp7aVJaEWktXR2XS8BYvAnJrNbrs/pXM
         EIdA==
X-Gm-Message-State: APuU4Z+2zAkRFV27xbEonGUbdgwoQovHMvmTz2A1e5aqKZszpD/MiCF8
	1mT8ApkIXSxfMogImfQNo1CVvsuwrN524yMvkQ/txVycjG8vkv9LLDQQ
X-Gm-Gg: AYBFou2D99b4I7fiALCgKUsYtQqXwDYS7ht4ngrTvp/HVhFA2q0RnOSwBMIyBKqCNDd
	zk62rrIs+ZxWjGUMyiXZrKKTOkThh1GboJxebsz/CKJmy2+856eus+Gp9S6ZESQhVXbr1XKUefT
	/xNRP7MADFtRn/ILV6W9B0SpzCw0VBZ0px2cJcXoJ1zQz4O6DH6CgvEMiY92NYJs11IbUsSk4T5
	gae1trg4SNPo0EP01DHskPXwP+Yann3GZ39PEsoW9SxoB/+kIEW4yQCwuSKwTUxKsrfXb+hQ/JC
	ldD0BcwrUDFQQCvOfmOWD/3Pz7G8YfIlzfNzB/f6kexy/NvpAd2H84dfVN4Yi42ajVTgl5wTPP4
	U01iqZ5pVGlaausyyqOaTjnYtQAybfeDHUlN+YmXVvO34vvbPB6xHyeS6Mkyx2+M/wzKR6XnEkn
	PoBBCSh324o7Ehna98LAV7Q+iro7REP7SCFZysL0/FPWWVRjjTU5MGTZiSLChoHJPeBaBoSK+Sh
	L7psjwe29ql8rfaQdiyheJOpzU6e4kdY2Hkci8YeKMUJiLZmeZShUdDUPkJ14Ibp08/fapy4q2T
	7J3rQLVE4KSDckx6e2xe2ZovHZUSwedbTcKjgZTTuZ2DmYmB5kSg9R0Vu7FHCA+I6OsSvi4RXnh
	Y/LdErnVvMi3QuRP34v4RMcM3q3jiIQyOBEwwZLeT8YTRj5meFRWZXuU1zjcj9mWbzBX2/nK1it
	cBu06DnhB8SJJ7rtD4rDvKJzscc5EX6PUNf2K9eiYil8mVuItDH17b
X-Received: by 2002:a05:6830:7183:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-8628981220cmr2349087a34.8.1794593760312;
        Fri, 13 Nov 2026 10:16:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:46 -0700
Subject: [PATCH v4 30/58] mtd: rawnand: pl35x: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-30-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101604_170910_3942645F 
X-CRM114-Status: GOOD (  13.72  )
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

Unwind chip ownership on registration failures as well as removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 36 ++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 537387014e2a..e5d86d72faf3 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1057,22 +1057,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1091,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, plnand);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1131,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1153,12 +1167,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
