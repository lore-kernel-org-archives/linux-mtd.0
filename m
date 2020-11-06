Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9BCC55179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86FF2087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZKODL4EY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xft/B9fu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86FF2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eb3elnW6iaLY9ApQu0LMmBiqk61z3H4klUU391tAUK8=; b=ZKODL4EYAfngmNas5v7/DNwGs
	hBz2pydY3LWW9l36I4GuHKrOVdUL1mmLeTAAAULJijnl2oVy+ZFEDbwk6N3TUqXfS3YF1lzqMQ1C5
	N1FFu6qU0CJGySr8tIPw9h9dQjM3Hkj2uMpB0+hFawiVCK+Vcuhh2dbt+QjfgnCODsXJ57u3vQpj2
	nIIgWNLFy4XsoEvNcvZs4rAzDi2l+jD9DMKWh+R3z5n2ip3xheVuQFhhPjYSkATcjxDt92b1orWjV
	mTz3zqtNDa68AVKHRTMJf5dtEcJ5G6kmt6wbJ7jlGZXExDWM2ow0vdJns1lkFzm5hYL/ePseK4tlq
	c3lqzoafw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9QJ-0002ih-Hm; Fri, 06 Nov 2020 21:37:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Pv-0002Xf-8l
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id k18so2620747wmj.5
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dAVB42jTKgsR2DuIhHd9CknEAkwHuiO/0Jzqc0AJHek=;
 b=Xft/B9fu4Im1k0dKVSkx2E+3tIW45CfD9m5SnndRedpuZNtDA9jwuOMSmDMyXAUDA2
 8DqgZypZm1qWREX42zMnN5d8EcV9h29ypuD9mQz/9tRWZOMPQ58wDF1GDAbVdyute8vq
 iUV1qeg6LZmU0YzUnF26w0NT4/1GdDv5Vfmuh6kST+e7nbuA5bR0swIoxFEWAuY4Nsmn
 EZUfjc678ToDf0LrZvRb+139/Nfe8YJrBEP1xfSBHQzLrfdjT0v8vl09I/2VTSGC1Xfm
 RcMt+Cic07a2x4IqgNKiUKEunFOKCW8X45dUQn/FoxWtB4J5XTTn8saME6H5WLpGlPSp
 cQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dAVB42jTKgsR2DuIhHd9CknEAkwHuiO/0Jzqc0AJHek=;
 b=R6q9M16BRWjYK1ck8ynFBShRa8/TPtrfg6SUyKzvZ8txaYgGDHAiajuOdmxlmGG7p/
 WCRwG/5xQVqRldumldNwjplo4pHv+Be8e78vWh59zCAzgvrobA0dr8WphOEndpwbvhUw
 vephWahz7ZR/Ttz4Hk7elt5tpDv8KK2SZRopcekvPWcMm8Q5Fgp7blswMtXYBuR+rOjK
 eHSMSEGdG9SRPyEIKu2GfXsDCTTEIg9iqSsNCmMjE1ptF7vK9eICrytXKLT4OZ8f3yqc
 hy/77dC7yUuAIgYvK/Qw1rOa7kU8aBSUBkx+KMG4V4mjeIdagZHDBEQW6kXksnFpsesu
 Fjig==
X-Gm-Message-State: AOAM531MPMshyh0tiEqNw6Wk3qbmlxRlnLXKYQBQ5Mv5rGn4nnSG5sGG
 1Ir5b2Y09hB/x0/0mdwvFy+CqA==
X-Google-Smtp-Source: ABdhPJxCwYYOw1/mIqOC16L7H4ZWLXb6dETRi6SHPSZ1OVNMglLTHfytwUmatx0cFLKe6/NUUEy7Bw==
X-Received: by 2002:a1c:8194:: with SMTP id c142mr1564965wmd.94.1604698626446; 
 Fri, 06 Nov 2020 13:37:06 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 05/23] mtd: mtdcore: Fix misspelled function parameter
 'section'
Date: Fri,  6 Nov 2020 21:36:37 +0000
Message-Id: <20201106213655.1838861-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163707_400268_BD8F41F3 
X-CRM114-Status: GOOD (  16.78  )
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
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
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
