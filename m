Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DCFC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2143206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtjlZKxV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vImUAQgr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2143206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3+yCaZTZdk3xMg/nFPBHQebYkG25HJUnclYqj5Mvsdw=; b=YtjlZKxVODt3ZtnwoWnVltrVI
	bg/TGhRaq3K3wt3SsZfg7dMoK4EhgwWNXtF+jcMfO9gXbTTMo4N/rbHHAYA/aGhWp3ZvKSeEbw4Fu
	lgx7O0dMwxfGnPjChBDqIBAvQqAktwvaXZWBi7E2t44Fj/Qm7YqdC5ceR8tcIfobt/3GBRz2WwetY
	D91xS301cj97DCQYJVzwtxnDr3/k6cXVNqyjJqM7q0hduD8Qu9vktDJk9Us4UwxWVgY3cNKliVfJT
	FrMV26cvkO/dhIovmT0H6cvDv3vxO65/BNGAXq6eIojDL//1iYBothp6RjXdyZJs0WJdsiNiQq6Nb
	gfAePfs/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBqr-00026V-Kl; Mon, 09 Nov 2020 18:25:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoQ-0000vK-3U
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id o15so1970765wru.6
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ADB+AAqc36iIolfkYxxVJScxpF6foqJc0x2xHW3DbKM=;
 b=vImUAQgru/P1DyZmBgAln/TyoEMcDySk7hxkXNzXfIPa+mv5PhGgEQZsAA25vJfOc/
 jaErWIcHgnjxf/YaUETrcNKHUEAUW0SfwslvXmOf6Pn+eDGzpccebenmrULsxPBDQ9LE
 6ecSrXNhd1US1iUnpPZAYFPZiaZUFIHYQHPYMdhIqy1qywCmb7VLJnFFewBL+XlcIT2r
 fl+xPCo/nDNwQZm6RUhO9y0bkcR12jGYkVwxzoRAyh8nR4BmnhVMaSFIOCfucNJhkRjq
 PUCxPvDlr+kEhvHOpdSgUce/jRskV3yeqKdYRU89lB4NVy53+m03mt3kqS6CrltaYOT1
 D2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ADB+AAqc36iIolfkYxxVJScxpF6foqJc0x2xHW3DbKM=;
 b=ukv3LiOcSxPZ2sVbYQ7WGisgnDWsM9A9I2MlasXfKw+hvFX9vGez6vCbRSSibZl9SF
 CushiBvlnqggyQD2Atyg89dO9U4g7Px1CiWHlkRcJRh+J17xzgt6SzO4LvtmPVbp9puP
 TzXdZW/iB/DbGcIbN6w2Ba8gsam6AuiPRJQyDzqnvCTrIQ8vKfEOI6ObEb9fbZ1i8iMT
 CVt89jxuNJVeXXHGP+RB0NQvWWaBNt6Fff9wLQdk/4BPN1rfrQx82aoqnV9Osqyu1gjH
 82+q/E2LmQADcXueRdEp5Zi7SyZ91tZxpWP3FY2xyaSjnXo78O+ZE7ZyyFumfxUABg4S
 CSRQ==
X-Gm-Message-State: AOAM532iQOGwNxKLx/4aQjyBNsxKT+DS+4ubZUCTvRevP55ZT+0XB5gl
 iS5sc5pMlNgXuJ63t5GqrijmYg==
X-Google-Smtp-Source: ABdhPJweKjVihFPDGUyG8QTWMX/jceAlHX92Eopvs5Ax2RtHmD14lk1ab7w58X0SKxD3UhLKCbjr5Q==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr20536782wrr.117.1604946158570; 
 Mon, 09 Nov 2020 10:22:38 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 13/23] mtd: rawnand: brcmnand: Demote non-conformant
 kernel-doc headers
Date: Mon,  9 Nov 2020 18:21:56 +0000
Message-Id: <20201109182206.3037326-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132242_201878_78C71217 
X-CRM114-Status: GOOD (  13.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'host' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'addr' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'buf' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'len' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'cmd' not described in 'brcmnand_edu_trans'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'host' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'desc' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'addr' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'buf' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'len' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'dma_cmd' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'begin' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'end' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'next_desc' not described in 'brcmnand_fill_dma_desc'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'host' not described in 'brcmnand_dma_run'
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'desc' not described in 'brcmnand_dma_run'

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 2da39ab892869..659eaa6f0980c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1846,7 +1846,7 @@ static void brcmnand_write_buf(struct nand_chip *chip, const uint8_t *buf,
 	}
 }
 
-/**
+/*
  *  Kick EDU engine
  */
 static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
@@ -1937,7 +1937,7 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	return ret;
 }
 
-/**
+/*
  * Construct a FLASH_DMA descriptor as part of a linked list. You must know the
  * following ahead of time:
  *  - Is this descriptor the beginning or end of a linked list?
@@ -1970,7 +1970,7 @@ static int brcmnand_fill_dma_desc(struct brcmnand_host *host,
 	return 0;
 }
 
-/**
+/*
  * Kick the FLASH_DMA engine, with a given DMA descriptor
  */
 static void brcmnand_dma_run(struct brcmnand_host *host, dma_addr_t desc)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
