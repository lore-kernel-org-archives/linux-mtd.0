Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF901606A6C4
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=niV3Gl2U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XoT7caek;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GMKdBxRy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yFjLeSNeRJPBvWr3oCK2Vzfwnj+wIQh2S1UuqGl9c7g=; b=niV3Gl2UYj49rbm/ay9rZmZEal
	RMXv+kRQXYwPKLzqflEKbnG1L5KSFSFglRT7V4VlLvsy/VUYyK2VbDBmVPgTgLPxkaUzcNFqAj06d
	XCv91z2REUTdmrTCJJWq8rN3RUQ8hZewVbLRSzAAd7MXVQxx5Z8N+2qT15ETifSlSFkg4976RxbUW
	Jg6zr4aCu6dVfpiZDI2iRNX9G5ZbZ9Y3Hp+p3h86Tw6Js26t5hNl8zuI8n07TF0dmYCI7hNpVGDLQ
	Te5jsr6zN+8VQojrI83qWHqMFT86yy11fCpsS6nbQLcBkTC0T747xy2nOISPvHDyFhJIPkd4JAxkh
	Jexd+/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvow-0000000Ds2z-05g8;
	Fri, 13 Nov 2026 18:16:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoX-0000000DrKn-0bHW
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=; b=XoT7caek6qc39R4X0hs/Z27stn
	9i9WzM7KpOh7DK0G3AqpyQ65uaEUytEOosCtoCpfXlGAGYm1blJ7G5pBq9TpzL9NyVaYK+DfSjRd8
	3OwVUcW4pznnAZ+ghxXq64TWfJ7Le74Wis5JreFqDhZ58kFBIdLVsKB0Yta6T+0micaBkaE+sKqR+
	1rgFSHq7cGNPQ2/W2UAG2WGa7fxlGyw1Ra6EbehCKOmdrZ1KgST4l6xEF9UAL2y/iKYz6R7Rx4sU7
	2inTxVfYt0XnaBAlo39PrOQ0CUPm1jVzuTyDC+2jxOYqEn7L6LqKLXJ/ILz/xmfoM8Cq4FOtq/B/Z
	hFzZLmOA==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoS-0000000Bdkq-2e2j
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:51 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6f74f6b46abso1433247eaf.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593746; x=1795198546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=GMKdBxRykE9Eg3HpAnDM6gH7FN30tD/KaARy/Oa39+cHp7ETS7R+V+c5EteZnTP9D7
         MfurQliKwndkLp2lO8loADbEPEXYRv7ptM9pwgTA2JxXliJMHJOplq8icuBrrmPq5Awo
         TzspStvJKo8mNMrdkstmhJslGsmNMyvccK0J/BxA5pTzWN+3Ay0v47gKLd1v0nd5aC8z
         IW+YP9/ETVAuX6LSRj3AMg0FkdLOsqHNrmEkacKdgPMxr3EKy8fmEwwBtZTQoky96mGZ
         E6kkvUMpAbhkQiyvc2HOfQobLTvqzFrNoiTzqZNBLJH39LmV4E7K/hDdWf5NAdYtLkIl
         3fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593746; x=1795198546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=G4KLJDL4lRfbl3y7sRLEptWstx2rnVr6+khj8k8Yl+Yz+L7H1L4JT1ZI/whcOjzBTL
         +tXt2qeU6GGeWEba8kwyutH+UdjV9k7IZWtsZFlVH/ZKXt/xxYNTLD3jbR2KsX82TlF0
         E79+TVDPGrg9dHPjdm/n8/wQnek3FR20vlpdytOAPxwluk6WA2s0WxccrExB3oNcTfE6
         slEt4z4z2/5tAfX56khwVqZFI+HjvHrVsxcFUuhvNuDDmTgRUhA+TsuzXuFIwN0faf5T
         B5IcnO96dM/SzAv5euMC2ypYs+4n1bQPD1tL59RnpzZxkht1BalX89bCOfrjRCC4mqaG
         FmKA==
X-Gm-Message-State: APuU4Z+upBinm4QYX4UBITsldJWNInDBztdzRsUKioJU3Lj0rDZb0uYV
	AATr5l5XYVB5fKM3Qr/HbF13lGZWULpXRB87COcNBTf/JuxFlAClGgkt
X-Gm-Gg: AYBFou3uSbnoH/fw7uVlQA/7wPcxJensGL7gDYD8ayeVbzDdWKmSOFlDlvi3M09VNcQ
	Jl9kYvClQXVvxj8fBOS696msGcrKBi3RiQ3fTGqbpbaEa77U8H2tM8XYKxupyQyjqXGACO+5Dd8
	DQo7pxPgxA2a60I009v0FRByQVxXvYjLg7F7gZivCMnWbOiMsEHbji+Y/UvbSz2lBgJKQgdpx5M
	doTWor0l5tcnJ+/BbBHHJM4ZehF9epu8avx7pf7qE2RfC25p3BMWoHUdlludkGVaaIcI0K14pTG
	TnJR1isfYh8+7HYUrhSTohq2Vy7gX9trR/XREN3ZZtUyy8kCB/9DIe40JWw0DZJo+QaSvnyId3D
	wn+TZXcj2mkvK6wl3ZvNrhzHb6p48wCoyiN15Rj8PXCHSvgahr0D3MYztn7j+zL0iRiGiU1NEeY
	El/FMRPy1Jh+CLQHEQUqeJMf/xTjdZofUlV0qh8Z6wH3IKE0DRzu7/4BmDxnEEh+OCQ2T5d58dn
	wMsXbVXgHkhySPB4PxCYcI8KsxIhVzIdzPlEtOhAb2Eo2gMHn26FzV9XZM0Dt+DzaF/u3Exy+or
	Z1pAKRbQHOIzSpW0FeCbkxPjmYQfppLVjrcNo2cr20uZsDWFsiruO/RbWnD7p0dnb0G47YBEzI9
	pdqnnyK22IIgHY+S90oGnX/B+IsDNpjPok+lOrkjQtcceCF2BK7WuYYdpXBfAqvDsQ+ioZJANsi
	3ZwDXs2M7FaTrAOkD2KMbfkRjX9JlwT/Ue4bmltcYnqgR/rfnZOUIKXsCqXyYXGMErmd+C/KBL
X-Received: by 2002:a05:6820:1c84:b0:715:2424:b6cf with SMTP id 006d021491bc7-71ab4f8495bmr2009629eaf.45.1794593746398;
        Fri, 13 Nov 2026 10:15:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:43 -0700
Subject: [PATCH v4 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-27-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181548_512553_B05239B7 
X-CRM114-Status: GOOD (  15.40  )
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

Transfer flash-node ownership to the retained-chip helper.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a4de53f954e5..98cf91136d0b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -139,11 +139,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +177,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_lifetime(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +200,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
