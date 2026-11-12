Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3846073FF4
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GNNHzwtg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=G0FVdavz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCGNNyN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I40VdOmHs1pTREmgH9CdKFPnSQtQF/kmnDtZAoesoMY=; b=GNNHzwtg+umfUEoPmUwbefyUav
	rrIRtoU2OWYeK6brGVN6EdSNWPxToXVGABFiRJ8ytKSocVA6sOvRhu1ObUBErD0Ef6SmdD88KiRQI
	TsfIpz3StpKmdYtYQicL4ArNN8FnjA6DzKp2qkjev05dR6HdsI6A/h8DCAeSdCWfzpPjV3tuPTGcb
	cX5p6xMdsJ5hT5wye+nKwX7kSy+iII9fcr3/rdqyZ06l13al+6ehopWRUmMW8DvQ7eciPovxFZWVN
	U6kx/nkaKnzzWz89Dyt9+P/QYv8JIfJtxIP8pyK0cNQOB8ZTtqlcJeKK2Az1wYz6WUPHxVu9JkeLy
	NzI/aZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdA-00000008Mpu-0PPo;
	Thu, 12 Nov 2026 01:29:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJci-00000008M9u-3cjL
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=; b=G0FVdavz2CcsxDOaCnM5diu+MG
	VHOdcn0LgbuSldPOz+QYBHV+EV4FpdES9t5NWpm6ldGFncQiEAVKsg68h4OaXKJZmsO6Al6hqRvQQ
	0nqoig+8M8WUCRiY9RCGAfsSpohu+nKNqBefTuveAESOajihZ8q2zYoi3hhwrmZCDml1f5SsMTvxu
	Rtu5HIoL4QTCH/Vnd++CmPYaAzi86H0VEjeCZ7w60epg4pqC2xJkeAzrgAChLrl6W8SmVWEVYrher
	xf1ykJS4vQIAOIkGdgd7Ytys1bfczQm4Cpjz45S+MP1rZS/tRJz6CBkD7Ql/L8+ddO1YNwWI9DacD
	EKrxUAzg==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcZ-00000009mn2-2gdN
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:05 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-5642e0910a3so1563138b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446938; x=1795051738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=tCGNNyN74PaMC+cKp7xpJOfLi6hYIykeVkJ3pZkb6LEjsVxTLSaVUmcEOxVtEYvqkX
         BwdoEeZ0HpghrbDMExcWOTXeZLvqaFQ2XmCufSldaI64bMkPvgg7Qdb2EvXSEpxFcxY2
         cwMYnAIijr/lSSMRZjQqf0NTyf/HgwfTfbB104CxxHY2eBb2Hw1iXMD5fq45jXjX+iTi
         vu3iEAp98rafMSgLm9HghsYmjMBAuzxqmR+xg2Ccma3wdy8pTmz0nHV3zRL6TTpNDiG9
         hXypFg+NfHuAGdNLCO90/816DnBP8w+RKWOIBR4B5finEhlGmKMBz1u5pA9/rSXJR/wN
         fQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446938; x=1795051738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=tti6jPTTlJdtA0AC9IJS7kr/TIv6AOhWj3jd6Zr4yWSvdJ0Tbpl8bVw/XWiL4uUsIC
         +H5w5dyMv2AANSapLsNjLaSK9jBiXqWzZQwp5REnD8xlah46No9IwMVkCfZ0ajt5tSh/
         iOw/zqJkIYQtxvv5+aXwqmK6sO/kXN0q49ejgbNxiLA6LFz+dbgRPUS0g4I9el7v3AKs
         frK4y4XG4n4WIGPE80ELmIlXKlQi6SsVFVzawQIhGo+V0TYD9QoDoEJDa9X0rSMvA2yD
         WrmRNAJM8H1GSI779vkvbzTG/aEBpZOsOx7CB7mAw0a42arOmZxC4JQl6WTkIA0GMv/X
         QfSA==
X-Gm-Message-State: APuU4Z8V7TNJDQ+bTOyjnatgFzdsKPBPitPKfJgHYmDEl9/2PYGfGH9W
	7S9Zv1QYUFaFnUcMzOCDkbgihY4fhHWEjLfBd554u4VVJN/87VcApL/D
X-Gm-Gg: AYBFou0c7Hn9wnucsa/qn02y9Fe9PZ93JJc1C3WMjq3W470ueoF8OXvXd0rY7xi7lrf
	/V6AZ7CADnbFKph/IiOkLpX1ZQjTIxZaAxNCCjeEUrZaXwZInHBWamG+P8tzI0wTAXf/JdJa1DF
	5rmiDz3OLkst5aDUV3dTcjZT00ghjDeiOtq21fHZkphkn1+TEYa/Nb3h0At2xrRUtJ8YGyQqDXz
	hvWueVjmKJ3ZUvnHTmmlWqBC0XXeIMq4weya0l6XvtkV2aAys5aAG3u5TtUh2Vv4cJKun6gL2Kq
	StzgK/NBA/ZGV8HaQ9MZYK42CvLzzLwXUa3t12oEhOWrA6WC638w8W6peTVZyxQOc58IY/cXCy1
	kuMK39yItju0fA7PYsA7ZVbBAktUg3J+OP3EDvmlyYtUmrrDT9U23xXrUzgPr4EBdKckMhGGujx
	P/KHD5U3w8mGaOk4IhnfSDOw1ICRw0h9/FKt2VKudyNlA+MTniVispgRevAJLr1rvDCeUgunq0S
	/v/Fn/9PF73PyyWNAA1pIVqXtIxDoVXRxlra8oKwo+EnoL+Qsb//eUoJwa0FW4Av6s3Uz3atgni
	QBUPxoDu0yL+4TaMYlAo8uJ7bUoO4aG4S32yV2UWNPAUL5elneXIMw4tPhTqNOgRrIDWdzm00j9
	hrUEl7OaqTrXVezaeGcyt/rUVoJ9lWrq9gbzd/EhC1Sjac+N04aKXUtLZ1ILnjUUBr5EPa/Z3zb
	FYLuzPPnF4niy7v2dGY9MVj/CTyKTbA9mT2wse6l3okxgsvp33Bh6QbgbYgQGpjhIfOdY8v7DSE
	A==
X-Received: by 2002:a05:6808:538a:b0:55b:f8cc:aef1 with SMTP id 5614622812f47-56b968c25c3mr4273774b6e.15.1794446937779;
        Wed, 11 Nov 2026 17:28:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:05 -0700
Subject: [PATCH v3 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-26-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012901_920841_5FEE4198 
X-CRM114-Status: GOOD (  14.59  )
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 57da9eab940e..16e84ade92db 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,15 +813,17 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, nfc);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
 	mtd = nand_to_mtd(chip);
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
@@ -873,7 +875,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +886,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_lifetime(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +910,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
