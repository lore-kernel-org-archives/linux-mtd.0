Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25924CCA482
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LYj7puzIwM7kMfLd4OE+C9Vkq9ObWviWUt5iEbD7dE=; b=2pTpeNzkJn/uLj
	DVF2ZPUF/dwyW2VimxBtRyD23f41fLltivfgC1IFAuJwLd6Lozv/gf6VXQeB29VcTzcE6nJnZnfAi
	8BdDBUCl0VDE4jHNjfMrGLsdsEnUaueD04tqR1tOSrlregU3AighJV+QukibXYkbx7sqOTbOjgqRl
	jWB0X1y9ApoO8St5ROM+59jIAh/qUnieAPnKqptWW1+8qKmuSiaX71A90+22tyJGHJ3GJjZEciNvV
	xCIdTiSbKAVicMwkSGLEwwrmezmOn5HEU8d5gX0JaMxDnt+W2goVv8AEccjHwqwbg3eKILT6BlcqJ
	dQXZvFJjdxUnT/hdWi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIK-00C984-1U; Sat, 02 Jul 2022 23:12:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIA-00C90H-Vb
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:48 +0000
Received: by mail-ed1-x536.google.com with SMTP id y8so1399173eda.3
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GtoWH3Twv71XknYtu8BYL5GG9PgQIu+29g9mDNFEswk=;
        b=i2P13B5htVIAXOVn3aOtys9xFRhh9MhWIKQhDBsF3OJp5Bk6Tk3p+wEq5Q6XG4d+Q3
         9qOQS/7iMbs9xuGAUzX3Zjx7kCrCo6AP+ujhWDe1vD+uCoKOtHSAz+64zFvWjvDil71i
         WPHod0c0Et7CBl51X44fINlID1VhPU2FC9DyjvYohqc0cZEF9q/DGtnCan4rlvg1r1oN
         uRYzVjqWSWHWQW+8qKpJAbUzwMSVYOIUNiagrijfmqWH2mOU3vKbFIKdxRWYiQFXg5tH
         WLCzXPenfIjxkPuEvrbL2gM8Eg/EoI3WfQJu9RDfA60fIAdhfJ6XCRGoFP5Sq4EN2yQG
         WGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GtoWH3Twv71XknYtu8BYL5GG9PgQIu+29g9mDNFEswk=;
        b=HBCB/0EZYhkakBIocz9zJdnbsbPE06qV7gkL/5tSVcxNuxblKXpCvYmoQ/2Khy9yba
         VOgQeZmFFzpA0RQAD754VSd5fUSmvKIqmpij81/zXJdafIq1ZK2uwUeOViA+XVNo2EJ1
         9Knj1wRGYkoP1GHH/ycGeQUnYgb0jvtvKQAD9nEw1wve6Y0tEehxVWDxvllXNKyfVHEm
         uD2XEosABTmJq0u81DU6SLAyqLkt88NiG2P8lJ86OOdAza8RKzz04r1wE0vgWogJy1De
         l5+umG4pa6gxslUgz5oRKck6zvSuXtaq04maBhP+mPmNDdJLD1W8SDHySUr14W9RJ7jy
         uRQA==
X-Gm-Message-State: AJIora+3njCMX3xcbrq5eVMdIVFjBBANhv19nGtJMozD8tAqogoUuuv7
	Ee5iGOvSe7KVAhgiO01CGLZthKv9Xqc=
X-Google-Smtp-Source: AGRyM1u5k9aKO+kjClRFeCmf055a08Jc0GwYvjMkLIuQgHTnWlnBVgpFInI7O5yAAkYBIZg06v854Q==
X-Received: by 2002:a05:6402:26d6:b0:435:ba41:dbb0 with SMTP id x22-20020a05640226d600b00435ba41dbb0mr28127029edd.242.1656803566388;
        Sat, 02 Jul 2022 16:12:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:46 -0700 (PDT)
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
Subject: [PATCH v3 7/8] mtd: rawnand: intel: Remove unused clk_rate member from struct ebu_nand
Date: Sun,  3 Jul 2022 01:12:26 +0200
Message-Id: <20220702231227.1579176-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161247_062250_22E0DF2B 
X-CRM114-Status: GOOD (  11.63  )
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
