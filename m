Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AB606A890
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atqk0yoC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PG2AUsL7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=shBaluDS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hkVS84VALebSsWrcwy0Y+teSboEUtYtBUavhRqqq2AM=; b=atqk0yoCkCsdVQZkhCdC7axjJQ
	ZPz87IPaadqhj2HpmSOLMEbaHpe9REtahIESf2SaZ0/y24yX9k1+l1IAvFsEF5nq2qXnxPkoyhzN2
	7hMuXL0DLT2zJTFddvIVQhoWFrjj7dPirEbQ0pLZs+gYIbO5006Rvm0I5K/hkF7qZAsIqB4WRtKvW
	tY2M2zKx47PadPzS0/i/C4TBSZHfful5uK9WpxJ0TkViguZl5KjTkVJ+IHk0zRwijFTSjmniR0StW
	+qXoQcLNjN8TJx3oh0b2bpCILsHZR70Mkxba7LYMmg+PA23CcfjX2z/I6yOdBo22r8Je8vmtA1Egj
	3YuLNNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdI-00000008N5d-2SIR;
	Thu, 12 Nov 2026 01:29:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJco-00000008MHT-2pWd
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=; b=PG2AUsL7fsLKZEoKMrUM5jFaJZ
	pdWgjwc0Y773Rc6BETIsOXekfLu/DnuA84PopTHaIfQ0zFI5mLcoQLiBRpoelvyoN7Nf8uh2XrS/p
	ikQJIwd9A6jn6eCVA/faj4WaXRYFQ/eoDnQuJddkrPfD1cPRBMRQEo5hGrNW2ZV3Nyyyu3c77nw/f
	zUrYNQo5IA+Ts/KOgvBo0tGEkVUWkXOfsq3agNmRqutgRaDnu8wBxml3CqqR21XclEO5TPk0Tpcm3
	pywMNng/ZIhcSx5sJxCcxo8P889W+JuNvKbQZch24YjfZjcZcD07k372eAUoK4Fb+PeNXqnEjrEE2
	3tr0NDOA==;
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcl-00000009mq0-0ktj
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:13 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4ad881b6517so2386524fac.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446949; x=1795051749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=shBaluDS6fvnYjPXUrt59LqLx2BsOv/32iInrhGUwd11xJTgw0b+UJU9PocuhCx7PX
         uABtefhPghUrlBkgfki5NP0LFCzqbrNTqPK9Wtub7Rs6dFZweqa9P+zzjoJWkYH1kxim
         QUc1yzlJypOMaLJiDHUITX84QlqJnEwO+pE4ujFgA7bjILtBJqB6uAFxFzLZhwctJe59
         nwVLHtvaP6glCYYXyRYNVTZABqBr4tzKCARMgId2VzVvuEtpdogukJN0CqiPHCwLOkEq
         Usse8bS4qj3HNB4mOAS9ypdZsq0Xw5yemXdsO+X9Ix4LESGEcU+x4xTeAz5/nf02vP0U
         qmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446949; x=1795051749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=ZxEVtufUx9CLoxAl3EOk7BfWut/HhDyG47BjbSjP5nto8hRqph97vC+vRv5O5RbJA/
         VO/BydN6iS90vydsKwKrF3mZTZ9qmWtpsI50IW6FVHAbV0oEkT1Uz2WU44VgjqbBtnwF
         SGocj7EvyQpf3kCc+lowQLkcZ/wUl6mfQ3mNT1TDzsu8NDarI1TEorwe7Z4zm0KpVvZo
         CYxd56KBJGh50Pqu2/cgZ8NN++OLe7l9kmc3wfR0apn5Cf40vf7Q2ms749tRhXiiiMTs
         KSOsXF01eULE/b0640wPVo0O+vzz9B9C3LoK3EsL/jYKTviwPn29Q4h7Kze6sYn7h9iF
         jp7w==
X-Gm-Message-State: APuU4Z++/oLzI9aoVLachgYKTF/xZbFbGsRkbsoHZy4yWaYSdGxEtAGy
	Vi5GdkXj117hm/GABvSKfatBRFO7eFemECjaEQE1hB3kUIRmkktEw/uJ
X-Gm-Gg: AYBFou2pm0tO2BNZJq1lGINJf4hCp76lCwL2xOBS4WW0k2FaS+XJ38AU+okmDl8tTYt
	Qrrc20r6t3qKKAZZ7I++V3uVe3NN2fx+pkFwgYG/QN/f4WC7G/hjILgetB94+sTmovw188kxoDq
	ZqkJCz/hqFv/zmfMdNxS3k10/U1R/MSnPxGQPhgFcnFZ7gP/XCFPF+Z92JWL80iJ2x28UnzlKdY
	PWxgBNe5eOZH6jh0um4cvPbIG9kj0nFTooErJtjcWA0wDyvn+VXlmAX0Emrswzgs+PoD9rypEs0
	JNTrPGEjtjsEtC/qNcrdEs81qOw16JpstpZ8RWzAex8BY/Pv7M8/QaCGnS+Yf+K06rkPMiCyiBr
	8padUfecpT9Kscu6hV1cXfhni/sMpcQn7Wr4a7hS4fArO3Q4JU5EviMctTYPhOa3KKHFRIiJ4oz
	ImHWv7aX0MhOCvAwkOkeVjkeb/KbjN3GzOUQh0PoHNgF4oXYyxVsU1izxvOyaF3qmvg+5v+G/Em
	fJgnR+Z74r6hoDGk5I6X3bwioVESBQgpgRuHfQkCHVSoe2VnGTLYjE5hqmYr4Jm5AKQbHpilbCk
	x4t2FcccTcy33kQKmy56ORkoSnttp5gkUVebCh8I1tpB67hTV8tDPhMf2EDqdy92UQ7CKD8RVDP
	UMdoWerMt4CaQbFbJaQmKw+zVd/jF19xLBiqVlLcpW5uSmLsvrTX/aysByrwiTHy7YHXqZYvP1p
	8UtD6a8k/7HyjhaoPiiM5Crm+TbX/9CGdOcU+MhVhbacgItAuyX14B
X-Received: by 2002:a05:6808:1825:b0:567:bfc4:c94f with SMTP id 5614622812f47-56d4f031276mr174230b6e.67.1794446944265;
        Wed, 11 Nov 2026 17:29:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:11 -0700
Subject: [PATCH v3 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-32-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012911_265128_93632527 
X-CRM114-Status: GOOD (  15.59  )
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
