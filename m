Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C2FC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA0D223B0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="03QIR8aW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d1WSeb3r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWH+ZQQA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA0D223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oh68xdhfmD9d85NgBOS5e4PaISVaoCQvLD5YMoR3NII=; b=03QIR8aWM829Nux2JtkaPsKJo
	6yHjYXqTGJQsTx7XaUsmf4MHYmKJ6eQytVzjz2Q1Jvp4i+9ZqZIKtqdu80DhLJkbx8GveJZo64mS5
	KUwovu1v2sNhNv23+iFO9chDg9d9Zy3bv2DKZ4Z6SN6Yjdw3zQksR88VxFXXuDh0ehBViul7NWMS4
	q0g8SlU99VRe5UlgxvgKilT3RLWn9ZnAaRVVFjjOhH9AKj2MWqU89sbwSydxe+Epyh0Goy1lBt5Bq
	108wqNytSvoJRybCwN+h/pJ7wgBWJAAE1/WRr9LkfSlvUsNbeffQBj4uDAut6bq8T0IV7maexlBf0
	wBqp/lmlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYh7-00042Q-KU; Mon, 02 Nov 2020 12:12:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgs-0003p2-Ua
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=f8gLjdITMnVrqmugPHujVfTcLhAJYypSuHoOUIZ3ZBo=; b=d1WSeb3rvHde1CIMqwUL94Kw1D
 hUPBM0kLPjdDbzeTHrkJ5j5/pKdWWL35Ibl5uFlO/wDt49WCBT6AFg3lRGGV3RMrcS0yG1ImgceTs
 8iLsONEva1F4OzBEbnxU4ygtw/SHNycObtBScxIPvz3aTAUeKczK2Tks43zBWw25VixCaagADZygu
 0+JN8YZQYjyVeeHi/p6YfLhchwlAlIYaP0uyk35pDTsqW+R+Jx5DS49smIuBzCOrFU6tmagKiuqF9
 mcJZZpdfjeFBunW69xvu15Gkz0Ex1/yN8oHXKfhB58si6P7nxCYKt6PnR9zXkqb3QKcgAPkTENwvU
 gKlAvhMA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPv-0004sE-M1
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b3so8338876wrx.11
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8gLjdITMnVrqmugPHujVfTcLhAJYypSuHoOUIZ3ZBo=;
 b=mWH+ZQQAgp14+cj/4aWcz5wyp1y5NMCANvsq3s8s9N3Sq8eVsQU3M8Ps1MPkf8tRrF
 xHhYTWPJrEN0SQHqbii0X8vSGK7nm0ogfkrVvbgV1BszDKgOfMxPIJ4Es/iD0IBoxETZ
 g45CLKAquuwCebqciBSJBy1y1QKpZ+bLH3E/CZQshiOcg9ZeAqjt5Wa+lTEjQT0Vsc68
 LYGigy22aQifKtnFsgHyaWkj5drOQHXvkCYSS0F1xMre8ETMGdKznro0FtZFLKKYMRiD
 DSr7lJAomoISqF27930TRkEFteXoTwbm2+kqssGUgq4oPxoXQLw9AuSuI3eoaG0xBJ7O
 57Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8gLjdITMnVrqmugPHujVfTcLhAJYypSuHoOUIZ3ZBo=;
 b=Bz+eRJVQcGRPajuMCFaeKst1pc5/m1DichJCI2JtIaAbUVRNt3Xk3BW4oIkCqiLiwd
 MZSMNI07/VqBOM8N8bwxMLNKs2IqY7PJEKhrfotWQQHzBhHOoNC8VAgV+lkbCxyUtXaS
 ZaxauSrCR0CLE0GXAVR8ELsHu1BT6i/FkLbg2nRW5Omz5eAtnMXM+bUx7uNCufh945Qq
 5FpaclGLjpAnNszUMM/S4yJ9+qTS7YxbqeVvQfbJkUdLU8edwCAMMpSgV6kNsH95/p6A
 Pd8UOdgrqjdpbXlYtGFnvAie40ixOK3mxWqh8N9Nqq9JJdtRsi6aRT3d6coVoU4+mI0n
 ALbQ==
X-Gm-Message-State: AOAM530m/7/ARqiapoWsggVqiszjNKh1Lcafu1X7cxVUGcVW50+Zt8N+
 p8PMD+y8Of6WqsTcPme3hIVXMJbT9p3MRg==
X-Google-Smtp-Source: ABdhPJxYm1vBMc1aI9uxDeBprh/0v05ue74raBt0z9kuRgY4KkUn71bNqBpLQ7uWKiLP9Ns3g7g/og==
X-Received: by 2002:a05:6000:142:: with SMTP id
 r2mr13623709wrx.155.1604318069806; 
 Mon, 02 Nov 2020 03:54:29 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 13/23] mtd: nand: raw: brcmnand: brcmnand: Demote
 non-conformant kernel-doc headers
Date: Mon,  2 Nov 2020 11:53:56 +0000
Message-Id: <20201102115406.1074327-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115432_760102_50C69401 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
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
