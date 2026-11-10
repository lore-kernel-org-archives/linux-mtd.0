Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2159606A337
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KJsnQ9Bz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VK6yl/In;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjZKJECH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1n+qwULgDEaxrK4XNHnc2UFGHYjrgK6Y3vAw9tKY8jA=; b=KJsnQ9Bz+kAqLwu+XKNrI5pzuv
	QWxpS7xr2s0ircnN40Z+a9jwZ5I3IpCpOEVDWrUBaIh1MTd6ownD/a3XBQ92MQm/0qA5jqfi3bwVH
	OkBnlVNdf/eDN/MIV8dFtNLr5lJlQm6hTzMbSVuTzgt7oYTxQVK6y5/wvmWJJJcvATOpiji4a3khJ
	+wJVNpFmxbAmFndlaqxWa8VmYBFt62apUbti7SKbkbi0NiETuIKHpKXuhFsk+EtWR35WU7gTj/9eC
	YE8tN+zKu7ehDqSN6yMytpM4+IOaA8Mzr2eB/kX/Uq+3F65fe6d7zU40qCwDym0S7DyNPsxoFWQZ7
	FpKq3/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYc-00000002yqP-15bO;
	Tue, 10 Nov 2026 07:46:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXg-00000002xYA-07w0
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=; b=VK6yl/InJPyJ3NdTu0eNPdiqLF
	5tr8f/LoORudT10w71dmHNC6dldkoUUMjju+ngwoQNOcPBBVynQOev0HQrKS4e4W0JVoMJ0UJ8TtB
	DbLOVLp3AT+0SJV29Tf0oEFGEZWvuLm9ct6yGXjvxNk9SpCGnZv6XeESS3DzJi2jJv6VA8VP12LPO
	W9QGbkPzLB0WLe82XfsqrkFrN+QckSwkgzb9r0wgfHFvnw4ea5I4Ib9QbTy93oAQCMf/AtpC4iTls
	QVVeakNciDQRcVxqpwBfJA1xJv2uG0WCUjYjcH9LKaW3LJJxA5UNmU6PpgfmUIw5x23KyVLIlp3L2
	rd7i762g==;
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXc-00000009Ghu-1LyR
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:18 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-563a0462094so863475b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296714; x=1794901514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=wjZKJECHnDFfYTSEjW/cff4ZDLPq1yPel6UmWVWn5q6aonyG0lfDdYRFkipaA2t5SZ
         5kdwwnS5vxMkky7RVr89p83LkKQvSaMqyKl5dT4aGcPKFSDw6ud654sevEbdVnVfFXuc
         nYuRtA9vBF9PD0HGmt3gy15rrGK4bZtFWrmCxwTzcuB4HMgHyqhCCudqtO/pSV+2usk4
         XrYm3H4ZOpwMxcUycZeErRsChlOlRWMLsiPCx3+PKAoN4DDCToynV/7G1m2ba03kNF1T
         qlc2z6OuekdLba1TKk00CTYpzWVKoNuJEPbQcAICYk6CZl7ldOHT2m1yhXBwpzSLFvm9
         ofMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296714; x=1794901514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=exG3lxxjTX4bsmakrdwTCL4kaN2sdQcwF9Mos5mcLPRcsIYTCCroOOtzjq7d3fGa6T
         wC/fOFE7JV5bfGmSqsdGiCtiqyLFCUnZgDPEFHQe1LuHZ4l0dtbmj+xQue9pwRCX4Lyo
         igRXEZZPVdd+Hpn3MhBiNdtau1nWgLgzzzPEyMLU7/J5GIE6WCPBuW53qstakx1dEuqH
         xj8nPqykv+hnyhVvGXQc+81mW8U04rjtTv0EDnafEwp3yMJRgnFfX5NLWjTnlQswc0gK
         A3iIh0qpji1lrh8T8ZUHEGpBjRCUs44z6rcHiu81iegFacw9OrKnBXDVpE4Eh7UZvTqe
         cReQ==
X-Gm-Message-State: APuU4Z8R/a5bcy9wHwB+L9HjmZre3Ldfi++GdACDFr2UTFT3fJSowGLC
	tBf2fYzYl75me/bTqowm+HTAVELuda+8EAT9YcqD9soZ/VQ+TjIbYePX
X-Gm-Gg: AYBFou0Rbwy01vyX3zkI1EIyY24+p0a8Pn4WC9HjQUsVthQ2bzBxUC5XH713EOiXCs2
	8GGUKUXjlPt8kO8TvIcWAQLxlONnLaIPzNgori5rXUJuCyOI2YO7QogHAws/5loEkIkQvLVbUhI
	kxwB9Z67fn0Yx5A2J63QvAmxIVxg2LHJh72T40p6UPly7w8p8ESn0wYdomsP9KYw3ihqgvR663L
	y3XikR9Ml2wlX8POLaH6izmSY6NL11Cn+OgMvFnhzXBofJLC+iTsmhWbRznlf68lJlfbIqhZqoo
	OpERd/3kpY01ulTB4Z5HtByPR9EUVL4QScyfhjZTXO4kKIxLQusiIFb/rTZ1dTsCfwwLarn/LXR
	Ykl3rWDtaszxNxQlzSGMnlhsvJ3nLg+p72E4IkavqXu6WKdvam0i4+5AE2LeDg+GlH5wWt7gCTt
	o8uebvccPLhKpu+Ill91i6jxOV4ZAx1CdzCW0UkvcP2K4duaBIrWc/pg1UogBc7jYLdTou/HLqc
	M9WEFiLn6XUyXgYDC7GEwiVrRrhOl6rWZ+Ihq5lqRXOE4Ctw9ihH2ncl2GiIVswJlTgKzUlp7/D
	qDU7trGQEqHmKnu0y5brsnK603UN3J1qXev9fO0yYW0slJTXq4H/+7Rj7wAAnCsOOBwjrqan5sx
	rnZ0Y8N/pDH7C2BVHn4Iu3mrFLyJHpsgRzopml6QWB0xHLsVspKOY8CaxsvS11wtc05VVjFABv/
	8x22/szFLolKRu9VgnXOKeKzo7OSB/MluPODW2Rdd69Gxr7vJY2qg=
X-Received: by 2002:a05:6808:6c85:b0:561:fa43:1b17 with SMTP id 5614622812f47-5683ce07f20mr1587672b6e.42.1794296714274;
        Mon, 09 Nov 2026 23:45:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:51 -0700
Subject: [PATCH v2 48/58] mtd: rawnand: ndfc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-48-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074516_419940_04084D5B 
X-CRM114-Status: GOOD (  14.72  )
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..50506ad87fd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,13 +171,27 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
 	return ret;
 }
 
+static void ndfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ndfc_controller, ndfc_control));
+}
+
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
@@ -187,11 +199,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +214,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc_release);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +259,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
