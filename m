Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5E606A8B9
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xkxTBgUZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiGYFHKp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zy6PQOgpM4P7T63rRvLiQT3Onp8743+RJYmaL0CNF5Q=; b=xkxTBgUZi1Tckh22hx3Xn6TDjg
	n3GnaFjcpouUAFdj7xTVqK8lFkJBBa/rqSaIG641ZGHWP2U4hQLVuSduwC19Zeqgg/USTB3XBdOK+
	fX2EI/edq8HCFkzYrZhXQ2d69DCZkhxZf6O8DFimKKhESN/FCIheJkApHMGpE1bIBghpF4Pt0r0Ad
	q1W9we/zu+NuUQa/c8rm6MobvPdxipmKdSkplxAM1zvUmgCbJtSzWBgJVW6ax6sl8Hx+i7J8IA7bU
	fz3FwTJ9LrtyuE9tPkwf3/2yoec4Q1cXtnnTgm2PVsZ1jAhV4aGv9deUqedv5208wXXM1aLdw2EVS
	5GDCNjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcY-00000008LpR-23iP;
	Thu, 12 Nov 2026 01:28:58 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcK-00000008LLJ-2UL9
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:49 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-55651e7de9bso1910612b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446923; x=1795051723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=UiGYFHKpzIBKOb+K243p1ZFHBeu8oEMc86QRUwqmQgGpCX0hYMeXprb0okirjGQsj1
         fxwbUCj/veNdFE1ptuuFAZplNboCutJSu8sPIXCYnjIzyPb6/yBJ3O4HIZfzW++tr8ut
         SuH/7G4xOlMfNDpTlv/itPiakJEFD4Il/HutONXktB0NW7k/Al5vS55js+sNNpYRfHwA
         hOVYXMhkchsTnrMFu705hVUcDxM3K5xnXisSZPxJOuzMl2L+wgrUxd0Uca+ewd0/XPj+
         tftqbh+wpnFaUqZrA04hdzQgaNpVV6edgpuPSUVPrz3qad7WDd5unbS8/TXV1CQ3wbRd
         rUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446923; x=1795051723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=KqmzjLqbqciw7OAe+mtKFP0tZChbs5+6OeIQwGgUAIIpN2gzRtydOvc3x2Xp8cVPcW
         JHqSOd2HnYPl1XOVxv2BjEd13LxaoXsNu/PLQ2V2bPpew1a6H4YhT6l/fV8MzaZqXpZD
         cAylBthLJHI5PkAjhUGCSI+RKbyTRCHHqgxfqbXK57Kkl5EHi0JNdr/THaFmX7KsT9zD
         1trXNY+jIg0txGw6E3Sxxjw9nCHA0Hoe7jVB+YREwIsEd8KUHjx6MS8iBpM6D8/0pK11
         /Jgn4JK8npgH6elCP8JDIRrZN8WFJ/2ItO8hOieHtqnJePQM33INTr8u9jyncFLu5rVL
         iu5g==
X-Gm-Message-State: APuU4Z9T577EPOwU3PR7qMxbJCN9BvqcDRufWtz9xkqeGKlpmKX9v1Da
	RH7KaPSpJR2o14fAvGef0bpadBQtsWFrcV4tfEQs2GlM5yLxP84ueTCQ
X-Gm-Gg: AYBFou3X2bKgMMm//JXsZpwqRj3JpPbIqKifFM45tbiOBkKF2LoQfQkwxhZK1R5yR3U
	UceZkvf8fOjgF6OBD1Aknsz0ok2A4WIuIJtTzps0PeOU2+gOw/qebDW1td8Kfi2LiBMhvojj10/
	72gP84DORpMKilWmwVCaM0oHDso1Rj+ayIHNeXYB68KqWaaVRw88bWTwEyzDUAVsdfWf/uKJRF1
	SHU76XpLGbwvLD0h4xw2hC9Aw3WD/+RxH3+gPNZ/gUSDnw6nvb9WSm7QgxrtPp8isRIaVkiNKSf
	pJ4F7GN75BqMt0W/u84RA1r4hD/nUGeK8cWSM2vgMGk/x+bAgPVs6SbmIuvX5QWAMLDweepo2jS
	Q8jRsYo1EHI0M4gr+WRyv1aXVEnpFKRSYrHLDOYA8UYckZMt2CJaWtGqqYtyl5nvovCxgcQbXrZ
	WdLcT1fA4SYC36hVcJSiaFCY6XLEsptOfTCLVUBdqZnzfxqISj4cKmOjX0zs+LcneSZkQGm/mtw
	M/6z6ppAnjsFm/6Y8vgkQJWZ47DgCd1o04h/0NVF4aYWtJQXUGU4ZhK6ouCCIwllj03G5NG8Xyf
	MSLMxbRlRoZJYgQLdT6iq5H1iADMcXVdAAr9ElgFgOxjwEelaSzJNYWCp3Yg1umKki2DKIVkOwY
	sVbMjf66Mem7bHcM3rQaZF/7nqwpKTb1Ed6TWMuXfSRJU+Ugq7q+H1fKDWFcTUIVQboeUBFLNKx
	ZeEHF7SLgzoQdd3YowhgKfWZC2mqv/TWa1SBC0CFnZUDraB9Mxixje
X-Received: by 2002:a05:6808:c1a6:b0:4f2:4d2f:7ba with SMTP id 5614622812f47-56b9293c5fbmr3827971b6e.8.1794446921570;
        Wed, 11 Nov 2026 17:28:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:51 -0700
Subject: [PATCH v3 12/58] mtd: rawnand: arasan: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-12-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172844_682498_7C18015D 
X-CRM114-Status: GOOD (  16.14  )
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

Keep chip metadata and controller storage until the last MTD reference
is released. Release BCH state during disconnection. Unregister and
disconnect the chips before releasing chip-select GPIOs, so notifier I/O
and active NAND operations finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 47 ++++++++++++++++++---------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 839aef6c460b..a28daae30330 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1276,7 +1276,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1284,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1327,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, to_anand(chip));
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1368,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1436,12 +1452,14 @@ static int anfc_probe(struct platform_device *pdev)
 	struct arasan_nfc *nfc;
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
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1499,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
