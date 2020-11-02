Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2DAC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:56:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCEDF223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tv5I0fzz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XL81MlRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCEDF223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eb3elnW6iaLY9ApQu0LMmBiqk61z3H4klUU391tAUK8=; b=Tv5I0fzzAkas43y+cCfomgkU/
	URTJzn7No5OwS7CrStLonvHJ252v+8nF3okKbb/C8Ye4+AiC8sWYoOHQMzdW8r6mhbhCFfK+V5lhN
	wOM9R6s/ZDbbnM0oEcsr2YKVcyRV+NMbczW5XArMmuYUtLfJ5nwogRt3jPypI/I5qM3AaqCzYbBMD
	AlYsVDW/NaSCwW7eQOHQxGJL3zWIlxWKM13aojrFr3dcYTTtV8EsBXxn7X0CmpnMzJ6bOiKe05TuP
	sXEsVfer26mGduwFJ/+mexVHeuAWewTM6DksyAc/2iWbx8QtAh6dpe4RCfSodbYmkuImJxZ/6czIF
	euHStrPQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYQ8-00023N-4D; Mon, 02 Nov 2020 11:54:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPk-0001sw-Pg
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id 23so877694wmg.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dAVB42jTKgsR2DuIhHd9CknEAkwHuiO/0Jzqc0AJHek=;
 b=XL81MlRMs1unRPABpCgpJr+JaAeomz/oNcxN1ej0qS8kYI2ziweEwYNSlZgCYjZA7L
 2Ar0q/Wp5pBteG945RKcHjC4IklW/xM5zP+1HX47n7maSnyNQzmmEI5ocHlXk/seQvA1
 CMBDmqX3HralPUOQDPD0PNWxqCyNFlDccPSStC4/nKT60p5aaNcHFHCurSbhDuou7d+H
 wxlU2nz5d27NDB3sQQ3kRWoeLOLE+GXtBKkWuzV0QXnL4Y8RL+4GcTGbpYgTjMu7qCvD
 Pzs3ZzggoPXNyQFJ/Jgz3fzmHi8R6EDyKQGrf5fhJnH6qKK3zz6dnCwUsHhUBfNsq1n6
 7UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dAVB42jTKgsR2DuIhHd9CknEAkwHuiO/0Jzqc0AJHek=;
 b=Tt5SNdjjnXsoDV8KJS+/W0x30XnWrBlsI7LtMnkq2Qr/NiaX6DCdSD0dmItZbBECIQ
 Z7AtPLIgT+hGPCxWVDIUKHu63l6pUOsnRHxO0a9GZn2TLLPqppCDER86HlZCJdbKNQfj
 /Ql0a/+1AJVA/YbJl7PpU7zbxygYA560e1aGi8KUS0m9dsGjhRgYXb8tDQ+6Exhk8YLd
 BrlML+Re9GYDMg6cFw0BZW6LyJ0AET2WjrK9ib1IdfpeRhPvsqvLvUH+VnmSaz1ZzI7f
 BfBR3qXEiShjvDr5h55Zvvs8KQX3EPPGWuiNhL90lRAVHsk13jKL1Kcypz+44UWoB9Jh
 Pd4w==
X-Gm-Message-State: AOAM53026HiRRMKCNE6uETH7g4vtz8kVlC7fEFxgYfbKF3oNNHXTZzvq
 7zaRHFyVMozQ5oqDdJlNr8AMfS92/eARKg==
X-Google-Smtp-Source: ABdhPJzoSGbk1vNircq8X/CQtBjTD3GlaLI+8BFhFhjLt7IOpKDwQH0kmAv8dlQ+o0zWDWxRSu9bFQ==
X-Received: by 2002:a1c:4d4:: with SMTP id 203mr7507931wme.153.1604318059932; 
 Mon, 02 Nov 2020 03:54:19 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 05/23] mtd: mtdcore: Fix misspelled function parameter
 'section'
Date: Mon,  2 Nov 2020 11:53:48 +0000
Message-Id: <20201102115406.1074327-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065421_270191_D546FA3E 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/mtdcore.c:1592: warning: Function parameter or member 'section' not described in 'mtd_ooblayout_find_eccregion'
 drivers/mtd/mtdcore.c:1592: warning: Excess function parameter 'sectionp' description in 'mtd_ooblayout_find_eccregion'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e9e163ae9d863..31d1be4b22617 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1578,7 +1578,7 @@ static int mtd_ooblayout_find_region(struct mtd_info *mtd, int byte,
  *				  ECC byte
  * @mtd: mtd info structure
  * @eccbyte: the byte we are searching for
- * @sectionp: pointer where the section id will be stored
+ * @section: pointer where the section id will be stored
  * @oobregion: OOB region information
  *
  * Works like mtd_ooblayout_find_region() except it searches for a specific ECC
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
