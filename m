Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC6606FE4D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1gQjWhv6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/qvn2no
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hkVS84VALebSsWrcwy0Y+teSboEUtYtBUavhRqqq2AM=; b=1gQjWhv6CfjXtWiC04LjqYzm2x
	KhD25HP8n8s2Dx3oL5Nfpr4EQWKaEVDLX4JiML5HoP9VikgrKWZf75qCDqUSDMp28rtQdOD7gXHM0
	CXAOjp+PXWdsWFiB7M4xg9B8GT5q4ahlUjHFZVItADTv0WjL7eDdrfpSt2wDovOCAL1tDrFFk5pFM
	QLq4gV7igoFOCPFdd0QVpH25pkZmnpBbi05LfLRRXb3BrhF4YuiLGHmJ15BMrUrEy+z29VJ8JlSX0
	AihwluArZvDYrxhJjkLtHc7sG498LWMBUMBUAIIx5v6L+tloRDoaMRJK6KI/gcHPJbF72SdioesOj
	DmHuu1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp9-0000000DsO6-3PTP;
	Fri, 13 Nov 2026 18:16:31 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvom-0000000DrgK-0P0u
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:09 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-8446af403b5so1363410a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593767; x=1795198567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=x/qvn2no70S+qEJ65m5Y5GhCCLzVn5W7teKknZ7+kRQdUo7TCVP3W53z9YXzUViS3x
         KlOkw7WD/bHr/FQ2LM4gxh34sn2mxbxPlsGBwsl4CvPtfxHFsCY2iFc34as7AV2FtD+B
         6/grYV/g2pIulzkpe3Vn44vh6tsJyBkQTleo6TB9arrVQppiMA/rQjPuIJpI5cnxHwPA
         NveaAQeTADgwqhBhGtFOKkiZZneHCF94wVsZR+x3TRXTRsIcx9nc7+LcDb/DNAy22l1D
         ooooLOrFXkuooTiZAxJajpHkJODCZlO03SjJT2EVCx8h15KDq8btgM/yH4LwpR6PJQnd
         xcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593767; x=1795198567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=mP50i57pGJw7Z8oAJu6QkySZ+KozoTHtcjERGsq6sxlf7b3ucPAAU8G3EpCJirulta
         z+t3ICA3FHpLmBqBYbX2Nar5cwl+nNmy2nLTUeF9VGBlQQjzgKiFCY668U3OKmeLkyX8
         wNF2LcRiveUePcpOevHaI8gV/tMOV7tz5acLjx+XyEYW5cVwSUvSNFV8ysRxfKqGxN2Q
         7HYjc0c7DaDZPZxTeYgcEmDadXvHINg4aQskACnIDRce3LKnpuZrrqpjIelKiSsqRfAc
         uzC8dzJxzWtervjfY9wSVrQHrpTKIeUM8+MmM0lcJNO09FVS/BvnwXFqhvo56YMM06QB
         7rTg==
X-Gm-Message-State: APuU4Z9EpGWyg0g/a7gSVMms0QhntRG01E9HsCXPMpH9Q+Uec+gQCifw
	oQWgOFeSlchYOJlQ7MMHJzPHZTwGoHvMYqrl1lRLLqg5QnCmGUg3FxWu
X-Gm-Gg: AYBFou0lW7e8v3i4faiKHiIras5xTkplzsJ9z3L0rJdTBWWTRjCxg0hjChPIt+qKrBe
	tWRtyy4hXuwtODCFIiGhoV02ZqmYXq8QJdSrJXaYuSn09qglfRqquGEKh91iLz9IcXYb2gH2+vR
	cklw/TiDGBdgX2V2Chr8o/JAPH2fOE5+5SRd/DQFxYYde4bwzF4EUKQnoJcQ0Fbv32eybncuze+
	Ap1b+WqJVdj2T5C2Y/SHNY30ouSoeuxuiPBu3XWzMje+/AKpxRhwZ5BULiCH9paT/6YX56oPUD+
	WRbOJRS4dnmMSofjJvSGu+hDbtRx10yhEhRR6pPfw87hnrvqVvP4QuozKaprRMHxUtr0YZ0OE2c
	pgzlJfO17oo7w7vhD6xf4kv0d2DNRJDfBO3qQhZOyb2/kv0FjUbhpgvH3iwBOGH4iT8rhma/e0q
	rEIdDAhjlq8M01sZ72a5MjoUC+pd2oNDdhEXqxpT39KCB2TJvZxRWKbAiZNC3dXXH2Krg5xJUkI
	sv9ZzawfCrLHgEXvzgdWROHNmGSMCNHT95lV8Qj2A8PENRC0+tTPrBVeLYHYZvrlYg9uFN5NuLW
	jHgQEGps8l2Re1LCpQ5KlsGFZ8nOYCPPBCCRE2chyHC06/qJBOtxQ/wf+I3nSa4ucdd3o6PYWr9
	E1LFHX5wl503XVm0XBH+fzyAe2760zWZITgOTii9byoN4Fd0NDvJ5s7kilKNo6/m46QyPb0VCOF
	xuGoEhs+RJCVrNGuD/OI7mujCxZgnkZtV/Bri2RxGfaZO9CfwDFpA=
X-Received: by 2002:a05:6830:4423:b0:828:f59b:35d with SMTP id 46e09a7af769-862898a4646mr2918798a34.22.1794593767210;
        Fri, 13 Nov 2026 10:16:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:48 -0700
Subject: [PATCH v4 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-32-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101608_244638_038050C1 
X-CRM114-Status: GOOD (  14.26  )
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

Disconnect before controller disable and DMA channel release.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3cd25395d791..264a2570f40c 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1037,9 +1037,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, host);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1131,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1142,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1184,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
