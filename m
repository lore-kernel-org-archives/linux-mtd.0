Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20812C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDevnHAX5bt3zOlP2BDXie01BB/L8A64lDhXF2zdoEU=; b=t8dP39Ib6cdtXv
	9/JfXsXfZDLSPQrzcTWTtQg8B8A4aqGWZCkzDg/ZnPJOWK9iUPuZVDKlJrO3hZli6a/iAPF1NToY1
	eBkAsEEBhNdwhT5t8DOBrDr25RaGaWF/87H8H59rTSLg+0zKZEj95NGUsIIcITAt2cFAqOaOdvFIh
	KWitjQDwHcy/ejs83XnajmC/8iKXGhD4Y0nigjVRs3PDcAdXWkSLanXgzDNEaop++HC9ARlaECJIc
	+20iWcW8vzlhwkAXoR7o5I64NSJrMwYhb3fMf5vKggPFCtUC2lcuLtGQNclKtW06Gk4byrpJz/z05
	N2cEOjgMu6hcjmiAIzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLY-00E8Ss-8I; Wed, 29 Jun 2022 21:35:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLR-00E8NB-5L
	for linux-mtd@bombadil.infradead.org; Wed, 29 Jun 2022 21:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jieKz72cmVh5R8qYrLL4foPrJEJnRnBgZYhz6Rx/tnM=; b=WH6w6Ag//8HTDMeJzWbbHffSGz
	d9ywEOTUGvmWrv/CSdjA0gl+SiXiGtqUzlg/DN8nuVauz0ra3D1KMMF/UvaMpmlLQM1UsFfHPBZJl
	/n1qhPAh3KA9bwrO+zT5kyFyGBBGgYsTXi175g/BS2zUOGhZb4TevYNfb4oWN61UjxsGwzSlXLAuD
	Tig2U4vmXFdBMMeEjAtlcYa++ZLLs1q9w1nfcaALdtV1mupKt31VK6RI5V2bTviMQDP+JlGKtvlx5
	fmvwai7wfRLQuUBqRejzbCgWXHiVwqTsOeWFkJHtjyfhaLIN1KplK3+LGTQcf7ab5XLCC3yMagOMs
	wKhTWjhQ==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLJ-00EsQn-N1
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id sb34so35083378ejc.11
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jieKz72cmVh5R8qYrLL4foPrJEJnRnBgZYhz6Rx/tnM=;
        b=USohIEv4cdQnvKvjNk2QG6gItTrIF4WJwnLMBHVJoQF+ep92m5U5Pkr20bpxb3rN+Q
         JeNDj1Eeu5MoVgtkYlYIuHSI51ICUUwhfwU4uQI5J17/pHIdqZmfKWzfR8ro6bADenAc
         7s+s2//bZ4ZD3/SzId7SglMInyhYO+XMhSE2qYh8xtRviU1htOhOF/StFMg9YTAWajlt
         0dYbxHpVWY72tjtM6i1NPl08uRsqXt5bO995nsrQieEGgOivEG9JN/ZQg6yyomXgFr6C
         mVwASBjr57eRFlA9BOc9l+Ml8qhgJVBfWV/DrHMMoZoF5tvHv0+KuPLBcs1SkIFmkAJY
         IrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jieKz72cmVh5R8qYrLL4foPrJEJnRnBgZYhz6Rx/tnM=;
        b=QahT7L7cfBmYued29c7Cp3K1U7c6nNb1uWiaeT8NFQEctV7aMQxAN9clV8GBe1pOXy
         8skiiorDJwsDeUqta6euxO6dNu3r+a/euSS5gu0zjIwsWAPGWlumZN/Dedxl3EtwchRK
         L15ct4i+8eH8qMDmVqcGsI3BEpqxg1HO7glOckv+RLa88GWVQzLXMvJoF6h75/aNWJPp
         OniCVHVBE86JBZm8ViNlF/TL4sWxFg3cWG3pckRHjy5Kjcj+QFnOAEWkxyyr3SAmszfV
         ALXZDtWfA0vvRkO6p94TbXJY+y4+SloEZR+mYjiqOsogOT09NYPa9RelYn7g6F9qLhbR
         gz1g==
X-Gm-Message-State: AJIora86mtyWUjFhDsngI3/9iIyCSkGzI9uXxTu3W+7QmKXWSWSFEog5
	2//vlQdwU+VLn6LjD734KjVUl5HH6wE=
X-Google-Smtp-Source: AGRyM1ueTSOk+Pfg906r5kHgVoScaEjxh1Q/2L62UL9nG4lFbq1Cn8zwXFzJ9ra1BHOOMiGnMihKQA==
X-Received: by 2002:a17:907:6eac:b0:726:94ef:5ff3 with SMTP id sh44-20020a1709076eac00b0072694ef5ff3mr5359906ejc.545.1656538523971;
        Wed, 29 Jun 2022 14:35:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:23 -0700 (PDT)
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
Subject: [PATCH v2 5/8] mtd: rawnand: intel: Don't re-define NAND_DATA_IFACE_CHECK_ONLY
Date: Wed, 29 Jun 2022 23:35:05 +0200
Message-Id: <20220629213508.1989600-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_223527_006168_D1266736 
X-CRM114-Status: GOOD (  10.70  )
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

NAND_DATA_IFACE_CHECK_ONLY is already defined in
include/linux/mtd/rawnand.h which is also included by the driver. Drop
the re-definition from the intel-nand-controller driver.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 056835fd4562..3df16d5ecae8 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -100,8 +100,6 @@
 
 #define HSNAND_ECC_OFFSET	0x008
 
-#define NAND_DATA_IFACE_CHECK_ONLY	-1
-
 #define MAX_CS	2
 
 #define USEC_PER_SEC	1000000L
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
