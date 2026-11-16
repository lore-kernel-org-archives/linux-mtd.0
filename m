Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1D606C236
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4F3fat6+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqJlZRZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tS/uFgh6SBWmBH2PzNdJ8P8BnvVqdNeCNe/xS7gcooM=; b=4F3fat6+z1+43ya7DroHcyo6r/
	YgtUs+SLmCGATKv9UHq9AXXr9p63F+aOHBRjjYxdfT2ZcHvPHLJ4OqJhCWawSoMyQxLgAJz1MzEVV
	12XCWWXQArcJW/ADvMcsxsYzDW/iBRBzGXd5scKdQzr2nAvDIdfxi3wE17YkmXrN6HBmgkxs6oK6p
	oE4e+DNa42H5T2ZHLnCL1pPVwltCaK6yb651LvIzAWMW36ycmAChv+Tv0Bkhu8QMghvbR9SbRdEY8
	o56DqAun1ADpj/aGFT0I5OuckBi8iV64/tzHHoyWnI+XRJjv3sU2gHeO0N2TETZ1kJ7yRknpxppss
	HUcevRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEj-00000001G6R-26kX;
	Mon, 16 Nov 2026 06:30:41 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEV-00000001Fgt-2WHq
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:30 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-71ad047710aso1094783eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810626; x=1795415426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=EqJlZRZETtnSJ5sN6r2yQJk1otWT0jk+8drrn6CyF6ph7NP04hfMN3dzxfCOwTrQH9
         uofPgCo5ulAiFE0E7pBalDv5ww1H+MSBDmQOSbON9Uv9qcmKVOpfBC5pZocPo+X1FeKV
         9k0iH4UzlDYPE9saXgmOhWOTLvMHXiJAFhkAjE9JmjzZa9Pck7LyJqgowe7eiagEEU+3
         7GNUavVBi+tW4/YxOMRZL3JJTRzEcJPCI5nSJRgA+hESBqjRHJPdLJKfMLJToF620DrA
         FH9guVva6BPhMgUEGKkYu/jgOvFesenVUu8zx12DnpcYuWNwlSxIbESZOkkcdkC5Woxh
         1BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810626; x=1795415426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=l568MfISnGNVGhfOo8zYV6JADtg1Jet8hfwpXNOV3rwyINH5wZuiGQ2t251hBwNH6S
         km6AnNk7P+tBEtrjeoJBy66BP9L6t0YwsVpaOLR4rgsFNqJ+bCd6sH11GJR4ziwW0Jry
         qRPU66NU6MZZIoog6TLrW0nPsJNjDhv7cJf4PWAqszE2EN81NqG2xDd30bL//EN2JKXp
         71fSMyCTbf7+PZt9OHm5yWH0NOY31oTefSKB5BdPFErG51Pi5OHzEJL+4Q3a2UDFVvYE
         bz38Kd+7JUKxhgdfX8IW1A//gaOZxdgKeI394O+PTqpVYSxWD+oNYPJwrFMQv+AlcYxs
         McMg==
X-Gm-Message-State: APuU4Z/YndHNboCTZ0lvdnDIcByrUtKTnVYmWOs7vNOxF6/TCgIAL6wN
	653LUSSsh2XoiU5E5mb/IUamHHwgT4M0QEZ691hrGbv8YisGgkAtA5cB
X-Gm-Gg: AYBFou1jfCpWXLBAakFwNoJ8a5X5EyIY2o76pIadglPFx4IriP+hLWHcfSLUwsYr6r7
	ULq1t6Pq6d2nNKJPGOoUgms5HrlbD4BlMUtM4fY6fYH14xHjbcDUa/8bSlaKJx5cjDOVcIFX7nQ
	oEz4CvDxLHQB+2jvlr7VAoFbHLllNzRvyoOVS5bK4rqQ8xDxJS1zOgXz4O7fI6L1fi7OBeT6+Gn
	nbVhlX72PiruVbz8WwANHjwyQXjcEY9QV+X6R07iYsdvWfA5rvTNeIuHc0HJiYWE+4diYTez2y4
	8WCURccV/5mwyvLKdXRZBdDDTfs7YrxiuNnVmr38hmAWm2hLARgwFGXCKclIHOJ7KoKk8ibAP/f
	D5V47gv54cpzVUWYu4GqX3RuZoxbVk6s3jymohyo23KhTU7wU6dWPuKfsxvrmGzeyPoWSZ5r3Cv
	24rLyrg0rVfsG/nydgkhkrhgh/j0IsHTLZGpPE8fzC5aHpMU6L8MeLuli+gm9ae7SsOXgBxFflA
	jiUPoBaJjIKqAoJlKIbCBJTTP5qhjkyTyXBQqPlU16OTiOZ0mIqbmG6a7/sXH/KMRRgJz4L2Enl
	hq7VCVHcqcxSLr1JzAdk+HEAe2X2Unh0dqiwoHlMqAHjNIy5ppAO5E5655Moo3lKkmFfIO35vqN
	MYHOUhvT5P8KIFdFL7wXizEzB0hnEsG7Sq6E9weTF2fTJLSkjvkbdmSJw5rq8xjfD7La4I+NmlU
	5DOhunVipEPcwdwtzCBwVvJXR6aD8cFEGBXKTyq48FC3ojnJvayhM=
X-Received: by 2002:a05:6820:1517:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-71ab4cd94a9mr6597662eaf.2.1794810626312;
        Sun, 15 Nov 2026 22:30:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:48 -0700
Subject: [PATCH v5 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-33-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223027_713269_B12EFF00 
X-CRM114-Status: GOOD (  13.68  )
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

Keep geometry available after removal while releasing DMA and clocks.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4822485bd512..8fc78e679f0f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2787,9 +2792,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, this);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2846,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2854,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
