Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3CC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LYj7puzIwM7kMfLd4OE+C9Vkq9ObWviWUt5iEbD7dE=; b=pD2ean63ZGTEeX
	/Vy/LsAEU4sUxTqx6LJ1aDiOBPxtgTTdV48dDMr9Rv2yGEeDPsfPe9blgPrknlkBqHboTvvPP14uo
	n5fPR4kMybC2IwzKCKJCe9Pup2iz/qRv4sKlTxLhSeoI6ctwJQfqkUp9Hvttf8cc6KKAe/90SLEaf
	k2Ww2l/Ght4G6cQSer24Nva94aeTJ/+02PbOykwiWwi/VODRylFO8LL1DjWYjx/1/PuOb28Lr+edr
	3kl1xChHV83aBfx0DpcNOAgTTF4+R7TWo0DNqa/ZTkWync6AgxqlPc3EYiXtiKC9jMwcoI3b2v5A9
	NvIm/yYzHW3wSXPynFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLs-00E8hs-GW; Wed, 29 Jun 2022 21:36:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLn-00E8fN-W2
	for linux-mtd@bombadil.infradead.org; Wed, 29 Jun 2022 21:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GtoWH3Twv71XknYtu8BYL5GG9PgQIu+29g9mDNFEswk=; b=Mr3qXniDvrmyz8XQ/8vxeo9ZuC
	+PkjE7GYl5te1RkpGWfUgGH7s8ukqSBi+chDh30dAcuterwEWnuJEoo3RwxefBuW8bIM/jnFp8oet
	N1eCTU61DLpaOr/CC6DtnlqTSmrysdbIPW5BF995kOYtr6PP1NnSqMqoagNZzxZNJF93dXGhwrs5u
	1GCuzjh02iuNdCGL6dX1xtBaPPHUp2xvc4mayfxndu7oShEgGQ4GgRtQZmO3/adjDHFYVapwNoicb
	U4PvbExtl7qknwV0HXQ3ZKnfyA2nizVEzkQJyj+xBu5PXSuHGrom/6wLcYhSQa7AgQykIdlnPeHly
	q02oqTJA==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLL-00EsQr-CZ
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id q6so35077449eji.13
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GtoWH3Twv71XknYtu8BYL5GG9PgQIu+29g9mDNFEswk=;
        b=qy/Ujs6iCq2aqMwtZJGfA0A64dA2U63n8Zciy8Dr4CBpy6bSY9OI81Las6pQTv7OBb
         XwAyqF6Iwnz8SW9OGhyYKWgqCyd+BPf+MwFzJ6BJJypZrYk6MYQdsyrlm5CB6j8TYHiX
         UoBi1VUVWEav0k+edCZBgbH0Lrqs6+olUQwQvFCi7ZpUJlYsWWgHxymxCL5sryFiJI0J
         S0Rp7s0iaihV5mwwqc0LMKhkdUprlqRvSLAATH/ZhSOa/PwYpjLw1XQHvLp3E9I5QRQF
         RsOEb/ot2m5dtEOivXQe6xc0PNv/HWo5G+470UtmXmtUTYd72DtaGg9li5My96R69/Ox
         pHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GtoWH3Twv71XknYtu8BYL5GG9PgQIu+29g9mDNFEswk=;
        b=oaTRVv7uILYRuJvMeWSfkeRicmiEC84iVr7ZqUUfD5xynEfPZQ+8VY0gBFPVI2eHXe
         7wuPkY5CRJFAZsEc8tebt7cYPWH8e4IXevjlr4MYgn9uVHnyBEvU0KfJjDEX/SPNqbjB
         0/kNSQAGN3N5m7BGw4jo2b0TzhS6tQ+xJ8v7WzxrLJyKJk3Js0ZKJ7UfPxSKZNjL3Tjc
         jrTf1Sx0RwVkisbIcpzAHeD3uVFVCV+mZUGiw2HDcnJ2ExZyTfiGhYSiCCHbRmXcAr1F
         OR2Cz+1L2uB1f+s45q6qI9QggEt2KQgINxjOP5Ua2k5/Cddv5MBTN5sfptH5KUvNBYuN
         rwmA==
X-Gm-Message-State: AJIora93I0XetanHHia/NXRmlv7HLXSM1dAQGi3XphFrl8r/t1kRaLEk
	s3GHBAR4G7k1481SGxewCylrmw3gbcA=
X-Google-Smtp-Source: AGRyM1uZslft79Zvkhn1i0YctuGmD0m1jD8CSzhgeqC2ueG5/IEVdWc3eTKV4AviJNRwhelZcA7xKA==
X-Received: by 2002:a17:906:ce:b0:715:705e:52fb with SMTP id 14-20020a17090600ce00b00715705e52fbmr5297494eji.303.1656538525688;
        Wed, 29 Jun 2022 14:35:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 7/8] mtd: rawnand: intel: Remove unused clk_rate member from struct ebu_nand
Date: Wed, 29 Jun 2022 23:35:07 +0200
Message-Id: <20220629213508.1989600-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_223528_014534_7A6960D4 
X-CRM114-Status: GOOD (  11.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The clk_rate member from struct ebu_nand is only written but never read.
Remove this unused and unneeded member.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index de4f85368988..e486db11ecc3 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -118,7 +118,6 @@ struct ebu_nand_controller {
 	struct dma_chan *dma_tx;
 	struct dma_chan *dma_rx;
 	struct completion dma_access_complete;
-	unsigned long clk_rate;
 	struct clk *clk;
 	u32 nd_para0;
 	u8 cs_num;
@@ -636,7 +635,6 @@ static int ebu_nand_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to enable clock: %d\n", ret);
 		return ret;
 	}
-	ebu_host->clk_rate = clk_get_rate(ebu_host->clk);
 
 	ebu_host->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(ebu_host->dma_tx)) {
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
