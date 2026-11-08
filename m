Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAF8606D82D
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ai56by/6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BswAKc0V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PRCqqQGbLOfC4cEf/+MQ6RgDV9hlc1G170vO40XC6RE=; b=ai56by/6LBqSuR76UtnAJy4OZP
	KNArmAP0qdGerLZNhDOkJsICZDeR9krEdeYJg3AQf2X4HQQB5moqtTLzmo5A8IZraZvNCEsVTMie7
	Y66h9FjTeMMlQEWd/JXs0ffIYs/6p3/PCI0ucxg/aJz/aA9qnRMBEc3YUmbxb4FyADnIbiYM5B+We
	iYH6p+sZzprIb7RNBIlVw2D9zqpj7rkt3ws6Ng0TtbFmALnAY1RhXtlIRgz2GGS4uFoAUX9xg0w/B
	cRpOCLWXisbouqa3EnJ7CUiaG+oBQKTrME8Ki+hT2nxCPaF3VQOO+QXcpxQc1se2aK7peAOivPveh
	5HAEEO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBam-0000000Gr09-3bfx;
	Sun, 08 Nov 2026 22:42:28 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBak-0000000GqxI-2F99
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:42:27 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-85ac281604dso187583a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177745; x=1794782545; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=BswAKc0V6swRR50zfc8HegblIsw5zCI1LdjV10FrlD7ClLOBfROw0FZ/8rSUL8hRg/
         39xy5FiIdhY3Q4zAAIBLW6YTFLOUr/r9XVtTCHo7ppIFaelF9VsEeGbZA3FGCi5lZgH4
         K+PMRYYkUfRBmPu7/6iipraXMhgYQ+jxkukIapKJDe1UnbiDkZk+wP41JWSI0VG1fnK2
         MCHpgy79Xd/UZSPOOXOJFuXWS7tCw2GTd94zsw/452ok6PRtpDg0i8sO8xrUr/VFMGSV
         hO6U7suZr9t/Ehq1WuiMaDFvOHIXPdPZToFeJYsu9ggJV5TqeVxVnBZa2H3rWRgQi5/i
         R0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177745; x=1794782545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=p8rfnSKOe0N1/oFPTgqrkS63AORPihJUjvB7bhlo8Mbkpm7zHvssfPIPBfHu4aviTO
         IooKFGtVUPRWRus0I9pnGj2lW/j/TowUAka3iZuzDyvrNLtui21wLUn64yiAS0SWSPGh
         OmzZekpY3tZiI2D0KElkR2Zuoai+AvNdBpb49FQZ4QpMQhCgq+m1JePvGjCaMbN9Apxn
         dJhtt+We+ndSPd6zby5Ytq3iLVvsvH01efdXnZaFYAAyYNsgumw3I2fjmL3ndA3mXnI7
         02vrJz0GWsi+0PWkmn8RwC+8vdZIcqaHn1pnixqPaEFFPcgryFP16zy/uGj3d11UeSik
         R8NQ==
X-Gm-Message-State: APuU4Z9CeeFuOLhY/WNZAqx9fum/M/txQkTs5dmWw0UUJ+EJivuFib8Z
	oBG/nPBJR8Psl1sIWB9s4nNSkfC+GTeKgTdqGyL+hufojYeIICsN32Pv
X-Gm-Gg: AYBFou0wnjbqzqnJ94y7VGb045RQjFe/YC4QO9hz3qoZJ5+1KHmu5G60zDRXAU5cByy
	7AW+CHlPFtuv4mgicSXBlqjJxCWHO8M3LlDsjjZRQV7Z28I5IcIGou2xpbAKtjdizFHiF5qY71b
	5m4dzHzyVB14G+2s69Hc/2fzRlVDNZPreWFpA05kx/yNlOfkQ3/KHzKhZXcwSZpJwRiriBR+Lbd
	C3LSdIpM4RCzUMhHxJWoJZqL/5OgAC91hGs7giJJg/2t6kbkET2TVfbcu3Fi+rAG81/dHsB8a5T
	xqwNnI/fcPBIiZMW9oYWgqxlRkL4MXPADDAT3nbwVruyb3BUDLxzcU3QbEu0Sb8FDPEyo/ET+Xz
	1uFPR0N67AfgG/DRDZtzcf70nEVuYf3qIqUup6d89z4L6E+fhzb+w6BtGQ6t/lUlcUABjpUIHNy
	+LoaWMtEIPBythAlJGEoOYepeKbKBkDIRFVu8uYu5ARugcJ6jII2ILLTYCBREGF/jSX6fvqfoIY
	bprGIScacysBxSVcTHvNEY5KiCAVaUzMl5Cb6rD+HDbLfZyk8nlKvVfMf/voetKQhY6zEpVPSMR
	c8oh1cuqlS6PtOaU2o+OdQsoC2NpcYsTsCNxjkZpbF2XFbGOuM42KBX9VmCwoyzwNpD8FD67lp1
	g4blAccHzK/Drz2vyiQfHKlu0CUsOKw/Wt4Fc/NhvKV7yu0zzIk4ogNGf5I0HTR682fq/4+gC5P
	c6IgxFfsfG/+ns5g+9mbHYdv43TSQp7Ge4C5wd/8IsYQ9m5H2cNy2d
X-Received: by 2002:a05:6808:191c:b0:4f6:3401:1c79 with SMTP id 5614622812f47-568143dc9bemr1634647b6e.49.1794177745010;
        Sun, 08 Nov 2026 14:42:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:10 -0700
Subject: [PATCH v2 3/4] mtd: rawnand: qcom: unwind registered chips on
 child probe failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-3-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144226_580764_A7A852D2 
X-CRM114-Status: GOOD (  13.94  )
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

qcom_probe_nand_devices() continues after a child initialization error,
allowing a later successful child to hide failures such as -ENOMEM or
-EPROBE_DEFER. If the last child fails, or allocating a subsequent host
fails, probe releases controller resources without unregistering chips
that were already published.

Fail probe on the first error from an enabled NAND child and propagate
that error. Share chip cleanup with removal and run it before releasing
DMA resources or disabling the controller clocks.

Fixes: 89f5127c4b0d ("mtd: nand: qcom: reorganize nand devices probing")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 062fba9eaecc..14bb7f3d6c36 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2085,7 +2085,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
-			continue;
+			return ret;
 		}
 
 		list_add_tail(&host->node, &nandc->host_list);
@@ -2094,6 +2094,19 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	return ret;
 }
 
+static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+		WARN_ON(ret);
+		nand_cleanup(&host->chip);
+		list_del(&host->node);
+	}
+}
+
 /* parse custom DT properties here */
 static int qcom_nandc_parse_dt(struct platform_device *pdev)
 {
@@ -2184,10 +2197,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 	ret = qcom_probe_nand_devices(nandc);
 	if (ret)
-		goto err_setup;
+		goto err_cleanup_chips;
 
 	return 0;
 
+err_cleanup_chips:
+	qcom_nandc_cleanup_chips(nandc);
 err_setup:
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
@@ -2204,16 +2219,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_cleanup_chips(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
