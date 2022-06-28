Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFA1C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cviy81dTZ7tc+jOn1q/NwyCE105tJQ2QLjrr3x36Fiw=; b=xO2ybhnbAgEXyw
	1ZFd0Y7rgi48SpW178IR5lSa9c/xY3/Y+JbseCoYGLWnITGLUj5H4tcUBmOELEpUHvUlE0wQGvmZ8
	MWCwj0K8+uMmv8XgkiqBtwBgaKdsq1GoJ0pq40Y0UKaQao6xYRDmONaLmtpZE9vXywwygXLyUUH/t
	FtJuLM6FxkigiI3JJPZowzmzVYOXeuUOV23BP9PrSfC8nv/VTuyF0UOrZpD2unEurq/Qq/w73ShR2
	FXax+An7zlOzQA22U7GLkxF8P5Y2yDlEQrv9YkMNyPRZeBFLUUqc52HtM7MIlwvjlZUYuPWBSSikh
	i97hbkhKNN9opgXRt2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OU-005vKO-E5; Tue, 28 Jun 2022 11:28:34 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OH-005v6o-8x
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id u15so25075622ejc.10
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wqgc6jUPRcLl2k1wjcuUn82u931h34UR3GkTMv8F/kk=;
        b=T95YBreZPHTSDKz9UPS5xFBpfWAVG8hi6XrIHo7W9zdKnDZlexZmx9ONBDVkhTa9ws
         L8QQ8OLu6Ver0m5jCahivuQrSXNQ90kJzWweUUYjzjcbYB9cdf3HBGtPB4qpxD3TFS6a
         UDP5sxqwtjdY+69yYYwkcvZECJW/fRPUHt7XoUuVoS7Kt2QUgZxyLXiRsHr2h2tuR9cP
         hrjCQcJFDxdwN/LWyB7bLCY8pY5e3Ks3rpeKYwce+THJ8BJNc+4CoZRa6rXnk/MXIFVD
         L22apaVIqSmKSwWsGsMGrVHhIE0KALKi/afSsBzevtO0jD2IEyA7tTqu3Em2Pw+YYZWa
         Iq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wqgc6jUPRcLl2k1wjcuUn82u931h34UR3GkTMv8F/kk=;
        b=VlrNbBi0+O4u7fXwoE/Nnz9Z0ToaV3bS29PMod3ou4jS0JL48rNS6JnrD4W8XqnG+E
         lmTrDYascrkxdNmpHl5T8yEMXt2dzRK9LnnNsGTgfQMHaXRLn5vuUKtkoa2bud7hz8Xz
         ENH6+Q3NSAM5MS3bfCqnnDwDxkGx0iIm78GXHVIiBR5IohzJpNGgxVMya2uajeMv1IIM
         YkUueBAW0u/nchGHcUTSPZ3botKq5nHRaBcnmTRc9Kop0jBIPVGLi/K/OIlXpJWr4X8Q
         /7pdLIq/TPKxbLX4FDC7MlexNXYCIScNX6AFzykJy+lkYshM6hgUv07MChR/7zsyZbG9
         qWwA==
X-Gm-Message-State: AJIora9hKK5U+Tgm7dJwR0dyaQtlQepqLPjX3dRSptcCkd8BS9wdJGWB
	jehUAm/M8kx6Ixkw21677K8inRWkSDU=
X-Google-Smtp-Source: AGRyM1uI8tzxdpgnoE1YZHUjY+YKpwDRC1XmWEmYBE3VDOktzn/VoqQrNVoFIeXHaES1lKfRHOvuCQ==
X-Received: by 2002:a17:906:58d5:b0:722:fc0b:305a with SMTP id e21-20020a17090658d500b00722fc0b305amr16784769ejs.251.1656415697498;
        Tue, 28 Jun 2022 04:28:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:17 -0700 (PDT)
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
Subject: [PATCH RFC v1 7/8] mtd: rawnand: intel: Remove unused clk_rate member from struct ebu_nand
Date: Tue, 28 Jun 2022 13:27:30 +0200
Message-Id: <20220628112731.2041976-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042821_331758_D154E32F 
X-CRM114-Status: GOOD (  11.68  )
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
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
