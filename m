Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68F060A2617
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oY4XlT+N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2KL8PBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=coQ3K/7jKZQCx7mJXGqYqVDiDwhmUL9Cepjh3Mos2dI=; b=oY4XlT+NaBAGUI9ehm/Foin9Oh
	SE9t8ifx28vom9MMaW/uTbhTUNZ8v/HFpNNYRN3OgXAXZoFI/wijEnCMu1h8+P3CcJMHF7uwPYJ/y
	p6GdOxypxdtqA5H9LCbw+hMlC+uk+HphtcCXuICYsuOYiN/wrOLK+u2if6yL2OqXHdD5olKdZfsvQ
	ugjeQXELVs6r+BuV6ywTUvrANZ5/bW5klNh9cFR0EIgn7m20fDqtAyUAWMB3vh49SSfIRjgHR2fxV
	MFS7F9TsogXc4aEJ2AmrTAnYsgK+PiL7dtVOHZZnUO2ej38FJ6P6u0Oqa2hoOHz0FuCHx1VNgRW5P
	fY3mVZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYB-00000002y7i-0vd2;
	Tue, 10 Nov 2026 07:45:51 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXL-00000002wq7-3828
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:07 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad881b6517so1111815fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296698; x=1794901498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=B2KL8PBaxzoMkjayUmMDs5QsO0zQmTLFyX8beiP91G22+vvtQzd5W4hOekV3yUUX+/
         Gg7pxZVpwneu4SWjRBrmkqQ+WCc0f86dbHnax/Gukv207hkEFaE9j4OuWoSUzhnoGyBG
         F/a3qV8dhOQrumgTCr1voENteUHGJ5ktzjQMntxm1p1cu/Lbwr30G6zPVrt8sioCWJ4F
         Nn9xcIdOw5/2atyC589BilmyOXBMMqOy65h8uX9XxgGHA+9bOY8FrgO6rfiQ4WH+KvG5
         LHRij3wh7gc4cLaMcMXegd8IYW7HuelsPZ8/fuLjPjmrofvwx15pfZ7iCLSQJDJRZaYz
         7boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296698; x=1794901498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=BM4vs4zCC/ZC09HdVo5NxijDsUsUfuJq0vORRDF+W0HeFKweOWrCNct80i63a5D74U
         RloO2vOZmg3HxGKRww5zi57jYEoHtfDOzvolq3uifEG/oOiO55KDSOjRsdUSciYOY0rg
         dAU35YDtxVZFEDYOdeZGyZlrB0F6U5wkagckO1aC0lXEUa50hLywP2Loq7vEPuqv6e7R
         eZ2SWFQ3pxYLnRTiy3Tsby+bCnlIwFowvmrlqFIMby5lPRNk1H+AKYYsKasic+RehiaV
         59t+4F+bUmg3dID/i4dk2hSLQLV2iSoB4uSJUzHBhc5VBS8sB//HifXtSkHHqgQ15RDG
         a91w==
X-Gm-Message-State: APuU4Z/3wRuNusRxR2OYoiJUzQn7ieeNJ8xQ2eO6p+OjJrr0lvFhesqW
	yp6UFr+51FE9OJbkBSKSgtMpBhO4evLhkZ+fOES59eQAqWSMVdWgL1HI
X-Gm-Gg: AYBFou2Ay+dt269FJbMPEW7SpmnH4l08/1KQGy5lvQR1cPsv/qihtC+ruQeAd3fbaMQ
	ZK0IXI4xdLDFdS36aAQR3JScQupMH3jxyuCPxRB8I1yK3/OEA4aQvq8PhAJmv9u4DZlWQf8tK1A
	bYocmrJOhqOiPYlJYsgI2V0IfCr7tqVK1YTM14APEtE7Avb4yS/ccQxMXdTdi/JszOaogWFvzZT
	r1ZUHy4JQo8st5pWbuDp4iVn/tcQ0JGCGb4E+RrnELltkwD8WHFQjQSBEU/mC6b/YDMgoUwHB7q
	FXSA1E+6Fb2MsHB81J4HAwB9b1SxSi4I7bna4BIa4A5pXX6NuLQ8L8iNXfA9onSRozTQaiAzKLA
	XLKEvuwlI5IIGxkJ7+zNUjXyG7AkFw0Z+SnA1QK9nWKVv8F/B8ZnWta3UG8doJraytBwp6/jQGb
	cVbh3eNjcljOUQt+RuGMajxboiclGkPgpWYN8hBd0EIBmV6miYWRewndAAtmW0QkFZeynwx0yna
	3vOuNFqIj/HBOiYoVXs2E3qkGiZhgFPp6RiUP7oMXIK0aFU8eTr291CvQKHqVzMvtmR4ozpoQK3
	pTler+nsOg3u3nmV9glRV6bLIUeDUqSkSuI0oBH37DwzebYhAj+SNIBE9YNVs+9McZ8m17yyOMh
	gq08HJ+I82DqZA+/YZYT7c95e6U9UXlM+xKY2wQ38YsBxH8kGNg7qvpBwQQ2/hJJfsve6F7dxpX
	9OpUSlxOXbyDNqHulhJTpETKkGKfEo/b25bqXsMkUH5tqwPcnBiRM=
X-Received: by 2002:a05:6808:1992:b0:4f8:4a95:9969 with SMTP id 5614622812f47-5683cbf7943mr1568086b6e.15.1794296697944;
        Mon, 09 Nov 2026 23:44:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:37 -0700
Subject: [PATCH v2 34/58] mtd: rawnand: omap2: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-34-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234459_966795_411C6B07 
X-CRM114-Status: GOOD (  17.11  )
X-Spam-Score: -1.8 (-)
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

Preserve the shared GPMC lock and separately retain each device's state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 45 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..9949d4d53299 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct kref			refcnt;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2208,6 +2209,24 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static void omap_nand_info_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct omap_nand_info, refcnt));
+}
+
+static void omap_nand_info_put(void *data)
+{
+	struct omap_nand_info *info = data;
+
+	kref_put(&info->refcnt, omap_nand_info_release);
+}
+
+static void omap_nand_release(struct nand_chip *chip)
+{
+	rawnand_sw_bch_cleanup(chip);
+	omap_nand_info_put(mtd_to_omap(nand_to_mtd(chip)));
+}
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
 	struct omap_nand_info		*info;
@@ -2218,10 +2237,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	kref_init(&info->refcnt);
+	err = devm_add_action_or_reset(dev, omap_nand_info_put, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2304,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(nand_chip, omap_nand_release);
 	if (err)
 		goto cleanup_nand;
+	kref_get(&info->refcnt);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2323,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2337,12 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
-	rawnand_sw_bch_cleanup(nand_chip);
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
