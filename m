Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC52C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09842087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IGY7IuJj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4KGRdPE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09842087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/yoUgR3Mj1LU7MFNvezDlP9oaQHyS8yiRUPU5faGu54=; b=IGY7IuJjtNn49VB1w4w/l0cPk
	KOeyUhxSE2qLSV2KuH5vfSoXdLcnfOsmEE/MGIhN68uk0d/sytI9mdoT+QQSSoaDJ9nnQBFQ7z4W8
	XohoQELY2fJSXGIQFIQWyc4wj0wDYWAUJ/f9pJ/VQkbSdCAOaGjk9aSasUmRxLznnltkJ8WqYwqY3
	SOEhSJoja4Um6+sNfHNNbQM+SMHXCt0yFtFQ9B+djCwneBGa/2VBNsfwzNJECo4McjaKeg0aYFoDq
	1ENPoi5ueFABQGccNdgLjYgBaSVQVdVx/U0YeFWJpPfhc1s67gOuFirwXc/K7NHbyM0jK00V5YulY
	CUaP8NAkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9SI-0003qo-Ju; Fri, 06 Nov 2020 21:39:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9QB-0002gA-VQ
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id w24so138678wmi.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc+oP6vugsB/NFox5ee2E+FED0ZhjBIzS6GFVD2ExkM=;
 b=j4KGRdPEohicZL6AoYC4Hdrh+N2e2xqMn+HVwrhX4+LirOMr4k8k4c3gBDb4TBe/Ej
 CCNbwys4IwnHNxIlOHzM44fECTrBZyrnvu6wGNldLEOX5C0IV51hvmGa3DZ64QTdSztT
 JMzNSCxsfs0jj9G5p/P9vly6Pl7fBkTElXddglJPv+rP98dwOOJ+IKCbT6CLyPFC5vEd
 +DidaTOsKuw1WVQmAHdmZUkK9FguedLqNF8z6FX/NFi4lSNfjfxlyuEJXGUWmR59gTh7
 krSCjn5tLcgzi7iQT8YV/v3z5ktHaKNGMpbPN0tWJSjZZwC9CHdE650upzC28RW1L9jJ
 y1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc+oP6vugsB/NFox5ee2E+FED0ZhjBIzS6GFVD2ExkM=;
 b=J3iT2unL9GTXkdAH5qEhUxcQ+KTTVBjP4a/DbDwGRL+Fs6zx9CmqXtaE+iRf5KygCN
 vQTPkYX14m9ZodytpBFArfohDBTHmqhcwVkngL1i2/2GEMsvt+yzfNC7q17qJ3kYT92Z
 n2/for/1i/gd9He0pT4/LD5T10daCs7f72iNG60hx72Rk0GwwMusBCifjRQlK34W+ED2
 iHK+ToLxV5CzV/9vzMzMq1tV0FqDJeiXQN2Wowhg+FjwZP9PsRmuCFtrd8er/n0oAkum
 MhQvYUqF2hsB46hjuWBS5mc1MiKv3OkAywEyfGaX2IuXkOCj0iePCiIyLNyW/X/Synvs
 P2fA==
X-Gm-Message-State: AOAM5331wxad1l6ZSo98FFp6eC5UXP3TV5iau+DQbjg/gxPt/k9XURYG
 VG5zAJeC6IeM34sjWxoaPbkJ4CcxtLfvpyW7
X-Google-Smtp-Source: ABdhPJx+Gg7TbjUnEsKHvVRaccOTl2/Z21JqzqTfeRd2E5eRubD7f2fqYKN+VHTN1B56U5EWIUyz0w==
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr1571554wmg.62.1604698642984; 
 Fri, 06 Nov 2020 13:37:22 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 18/23] mtd: nand: raw: omap_elm: Finish half populated
 function header, demote empty ones
Date: Fri,  6 Nov 2020 21:36:50 +0000
Message-Id: <20201106213655.1838861-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163724_098838_80517995 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/omap_elm.c:102: warning: Function parameter or member 'ecc_steps' not described in 'elm_config'
 drivers/mtd/nand/raw/omap_elm.c:102: warning: Function parameter or member 'ecc_step_size' not described in 'elm_config'
 drivers/mtd/nand/raw/omap_elm.c:102: warning: Function parameter or member 'ecc_syndrome_size' not described in 'elm_config'
 drivers/mtd/nand/raw/omap_elm.c:440: warning: Function parameter or member 'info' not described in 'elm_context_save'
 drivers/mtd/nand/raw/omap_elm.c:488: warning: Function parameter or member 'info' not described in 'elm_context_restore'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/omap_elm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 4b799521a427a..550695a4c1ab0 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -96,6 +96,9 @@ static u32 elm_read_reg(struct elm_info *info, int offset)
  * elm_config - Configure ELM module
  * @dev:	ELM device
  * @bch_type:	Type of BCH ecc
+ * @ecc_steps:	ECC steps to assign to config
+ * @ecc_step_size:	ECC step size to assign to config
+ * @ecc_syndrome_size:	ECC syndrome size to assign to config
  */
 int elm_config(struct device *dev, enum bch_ecc bch_type,
 	int ecc_steps, int ecc_step_size, int ecc_syndrome_size)
@@ -432,7 +435,7 @@ static int elm_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
-/**
+/*
  * elm_context_save
  * saves ELM configurations to preserve them across Hardware powered-down
  */
@@ -480,7 +483,7 @@ static int elm_context_save(struct elm_info *info)
 	return 0;
 }
 
-/**
+/*
  * elm_context_restore
  * writes configurations saved duing power-down back into ELM registers
  */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
