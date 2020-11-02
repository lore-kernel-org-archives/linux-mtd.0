Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2B7C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:00:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28442223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Igba6BUj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxEoYhno"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28442223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/yoUgR3Mj1LU7MFNvezDlP9oaQHyS8yiRUPU5faGu54=; b=Igba6BUj8wYOjP7x0RfcVYWRK
	1FOe9FQuo1v4zNJykgxOmiZ1n0DKDin2haUBigqmQqmW7w4LirnRufXPtathQsaFOP7I6/rSeiKVc
	q+d3LRz00+AwYl9Y5Uw25dpXKy8uxBCIqEfAxlAeXqEuvet0Aw8gpHk6XgxxTDxjx6XwzTpFvNX69
	iaqmWA+DdarAojV/P7WZfxrxhNeuUh49mPYKh7afqzZooRabsFmuyCxv2ANu+CqYnztMMqoaMVcB2
	I4cUIcGWPwa5CBpREyqFsbzHnEKEnGEHvEHFMhKhfqbmdAq8P9qpQnYamU6arJggvLqha4x6ycoZ9
	JYryAwSZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYUO-0000JR-Hx; Mon, 02 Nov 2020 11:59:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ1-000219-3j
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id p19so1098547wmg.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc+oP6vugsB/NFox5ee2E+FED0ZhjBIzS6GFVD2ExkM=;
 b=bxEoYhnoXdbhVx3LfdVJMLEWx3cLOp3NjMInQHLPIjLoF47lqXOvfj+QiE6wvRY5G+
 asWwji1UeXYUvhs0Pgir9GeNfo+oV/PsOAjY0NHhgJ7KOIAuMGVBmOtIHLKWpfHXlW8c
 fNWs054/fbJxwFxwI7hTsMD5m3Rbv4tYbcVk2BFe7iOWJM0GWO4YFteB3SOfPU8yP4jX
 PKLpMA+hShVRMY6kK2MyKcxOLUp1k0cHvCZzCvY9A0LcH4bgJkXqNmHa8T3lMdhZv1R0
 qDrdKumdDE5NsPYxl5OrRj+wuqJCL+lIk9csVfX3TlMnMDh4t5B4qP+Qa4ZSM2Q5qW8W
 1W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc+oP6vugsB/NFox5ee2E+FED0ZhjBIzS6GFVD2ExkM=;
 b=TtrB+sNHo5Xld2zlzMzopXko2pwJARmvOXYzgx1+cEnJKRqSmiBVpOD/Glw6FO5D9I
 HYEBSNpGzpMD19SuopzK6j31yqZEUv8Xc69erP4ZTMDIIsTMt3nOeV7nJURfH23enCnd
 bDu9fCahiCF0MiZdoQa7RmK/MndyrsW0MJbwOey9iiMMydK1ASFAXqqCkXsqj7ELzzzn
 9n8ntk1Ktv1KtD/TT5VIukBq1kK2IdWBGYgJfqkONnMOIO5n+iXa6rS5cqqfw1Lfo1hn
 54jmaBjsADFm+AcjaLLWCV/KP1+4JsumE2jvTnoXTO1NpSHvCtDSo3NWYNF/7SizSnU2
 Z8GA==
X-Gm-Message-State: AOAM530SWLIu2cOLnE7y/1IjfXGivXwPuusnPBfRSNy2vj6FgGnzyzPc
 ojImt6Zp+CqsA/oniPyV50t8OA==
X-Google-Smtp-Source: ABdhPJxatNBxfZS7tSdF9u2DkhAP+wkqDutYNve8P7+3Eb/BXQMSvYjDydq8lRDjjsEbAWqF4/ioBQ==
X-Received: by 2002:a1c:205:: with SMTP id 5mr11364455wmc.7.1604318076024;
 Mon, 02 Nov 2020 03:54:36 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 18/23] mtd: nand: raw: omap_elm: Finish half populated
 function header, demote empty ones
Date: Mon,  2 Nov 2020 11:54:01 +0000
Message-Id: <20201102115406.1074327-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065437_979427_D18BC5F7 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
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
