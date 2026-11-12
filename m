Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE64606C185
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uhh7ZPxb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRqGzDsu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mfjFxv5lKQkCaIENRoxZrmGb4T2NoquVJtM7d2bssVU=; b=uhh7ZPxba5DiTUaIsbqpX6lP3D
	J+d3QxCRNhJ2KWpWdGKTnd//HJHh0QiGsv31QUYqAtI6UoM43ZdxrVl3i/l5bdlx4WuQAqO5PjVwB
	8aku9tJKUxaHGRSj2w3KOKv4jSDFFr2vMicEbYCCxp/JrkiwyyzXCHhSEEicXRz40UVixJ5Q6Mlg3
	xQi+FDDhEW4blhfi6TSEV+JH79QgmRHutEzyM7WK7fkgvEgY2ZgBNwgQOLjvxkMGjs0w1L8ZPFR5X
	HbojibhU727cKY4+Z1hpyiURwaD7Nl064zw8fUJmFbjbFpn8QzYTZDxJCL2gvMHV515/9whtaFraF
	OXCKLXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcZ-00000008Ls8-2xEO;
	Thu, 12 Nov 2026 01:28:59 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcN-00000008LSF-2ikX
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:53 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so2384522fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446926; x=1795051726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=XRqGzDsuDDmeCbaLgtrVQrgMEF72GupNDz/4zek4jepH/dJiWeW09cygeX7Jbuv3dy
         gnwHt/TwdUjMmMF3CyYr8+OqGd3odIlphRDyO6wZCRExk048ist1yj0r/NzMdQOl4s3V
         YqZ9jmJtF3izMh7X2rDcKSG8xRBJ5dKaDecrFyA5YWF3LBUNSdgyiMCn2peXOfpmfw8n
         mJwwzgtcJZ42+X7qHJnGl/iiLQ3eEjeX3BZajO/uV+PD+3XTPIzSpnJdVBMFYwrFsAtC
         YHqRc8aR4yksPTy2XkpY5uBl4c4oge0IPRK71DA7wakvxGZZfPY8rXiPLFQsGbB2+Whu
         SoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446926; x=1795051726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=cvWYwxre+n5TBQXLf/6PTbk23jlMaHc5bg79Kv88dvqmZt5qG2L5NKbmffHi2gkCeT
         f18lwOGIAtq4xHX+rHVcihQ5wVMSBH1PNCXtF87nU00AAdF8QrM283KX0Wxoox+1VpqU
         kLwBzSZnk6v8RvNeMyVQ8I69IK6rTBWdYi7eLkVxPSspAy9d8nfo9djTqBoWoHjQxOyP
         fp8sDNAFgGSxnsRDRlXajdA7r3u6pl1NgW3c1YcksLuCfIXIE8QpaLF5C5wWAWlri8XW
         +T2xw/15akgZ+fx90+MOTi2S66qlJoq1sTeURlU9eXNeZrD4RD8zpRZpKcM+wiQta7NT
         Z7Lg==
X-Gm-Message-State: APuU4Z8QwAZKSWskeimU3wW/woj9zgtPcdM+jYqw3Qw/u6T1q/WbIQxs
	K/6XGmPfRAcx8g/tAAtvzlbQxu7Q0P5ZZXJtv9onp0OFynI/5dK3PTSy
X-Gm-Gg: AYBFou3pYnKKdOv9utuCOHlEki01ObmhTO89bivrkZ0Ugk/YkTBfNgYK7q13wbBDu5c
	WNTB+RydLAoGaSSC29ExvBCQoCFp/ZJzBKN5NnfHSh+GZGF07WyQx7GUum+Mm9/aUyXKGNngrDe
	Pwpddzmcf7Q2MqM8qyTTyp1dD2eso89qtX4QU4/IHZd0iEA+dmUTxKxjsaHp92w0dfvpSNRemHK
	hJfO6p1gwgDrjrnLxjlSKxj8WKeZGj2ZCmWCZzc2d9QXaK6u9OsccvlHDGczk1NpFt9tJNYJVH9
	6VZuQ6TUssQWZ9DSSoQni/l2VWzFwHa1SuBJD2twVzzm3tyzIFGAR+3qTx4jV/9TD0ATtoJysa0
	JAan0nneg3c3TKpa9aTLjDNAD1a/JsmpE1UTb3h7tyjU7EuD/tkf2bG59o/5JpYUBQywbxVMzKo
	D/QjXaRrjjjaHooUZCEhUPnlV5IjIHshIDfyJqm6z7TZfPGZwgEOANfY2IpIn1L0BzWoLN7VZlR
	+LLfqJjsUS/HZ+1Va11j9nDnyLHa/ma88tFb3GLfGO2QBtWaGdaqPkOYP3CjgM03NtbEcmceGPd
	Aew7+EArcXeXMspuPSMnKjJQgyXUlwMRGMw6BOrZFdJRy4nm2Sk5IZbCQuoJPAx5D2ZuvcGUgov
	6l8WW3BEqeWkD/U/rN92i9AS7FK74m8b1UxBmnbKAeJxqpTsNVmAt4quohT9ggf5a0F0ePvniUH
	6HlS+g6+nvACR7yZVFMpD8s1Vljr7nJzUdRVIFqwy9cmJsoRRY+NkI
X-Received: by 2002:a05:6808:13c1:b0:52b:7641:33a6 with SMTP id 5614622812f47-56b95164a88mr4069642b6e.14.1794446926299;
        Wed, 11 Nov 2026 17:28:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:55 -0700
Subject: [PATCH v3 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-16-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_172849_310015_9ECCE6E2 
X-CRM114-Status: GOOD (  14.85  )
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
