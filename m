Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21BDC388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492E9206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rEcvr9Fq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooFGARyL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492E9206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BKjX9nDZ7angBmjuBCOly57WrtoT9qKEAnrd/m7nGAw=; b=rEcvr9FqyZ7H1WUcNRhhCqZjT
	uSqCCH4XrPjWtYW0fsXCQ2CaLF9hCAe9lIS+Q0z/2zLZIVneP//aum+92lgR58ajoi1+L6tdlF0Z1
	Oe7uG4kzXzS6OcEQ47ayKVmcNiTjtbX513DqxhbbT94KOa2Nl+M/S7Ra2buAWCt9QGFEWqxtCWhED
	D/jrn2w8Sgka8M3X0RusFawZoS9/xNU1IxL4fODbTMoHd+kCGOiLqVfCu+bUrxm3x9ukx8GxO9bqA
	w7tIeEiltbj0z8aBm8eFGiEvJvX0GdIrpVsgdLHafb28NnilOAgMo7Za1oogMT9vNmE5s8Lt8HVVm
	vGFPPYDQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBpQ-0001OR-E7; Mon, 09 Nov 2020 18:23:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoG-0000rv-Rt
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id t67so367827wmt.5
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmRHhQEVdc7j5b8GRJ+bwBPDfCwyz1df7aW7vS1l850=;
 b=ooFGARyLJowx89bv4c+IWUlkxGlUcbdgBeYj9e3XDQ4tCbbK29cBwDi/2apoE7Ezen
 aA4ZXA9omb1aR9rI7SUOtGlFYdS/pk/N36+XDCt+tV9I0JroBpZHWrSayKdbuWE9kVjW
 VU61NyViDdUZ0VJQrkaUGClVY7E5PnoS+BEztEliNmV77vSeoAClw1knzcI37pw/FNDL
 g2S8pSaJHPjwmTkB9M7CPrQ+y/1ALLDt0+xYjrjaoDuBZSIps7MbG3cRRL0/mPwhpGb/
 bdATGXrtQ2CwCcMzRVH2Lp9U5RI2lDhOCMuKnDQH0XRLHfKPyzKW7/5JwpKDcj29yVIi
 Fq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmRHhQEVdc7j5b8GRJ+bwBPDfCwyz1df7aW7vS1l850=;
 b=C0Sv7UI7cVkIfiDgWyDy8eNJFSLekkUcQNC6wTK4YiRNEtCmiGNfqY722mLwdPHuS3
 gGwi6aYiyexl6ObwaMY7bD60odZm5O8eDjm3quDS8axOPiVz7rUa46c48ji1dj/0kt9q
 pmhukaw48xT3V8SVMwcuupKFRkHnvZ3InsfZViTyiVeuo73ZX839Cusg2P8jh/rMeTI8
 Kw4JWUPk2rIktoXOg7ugZwDCVJAy3YJBvqUSAo+I3mNPtEyopIgNaeVqkaXOU1mR12AJ
 HxezUlxEB3k0hGAekSsuopsNleWo/6k4fzGNIF6oEwdZlAjzLTupg1GWvHGovh+x3wbO
 DG3Q==
X-Gm-Message-State: AOAM532DoQZeEgM/QCVZO/9gYN8ZW+C2AJ6ErlYVvA9BrrNHuz6KJ4lj
 gk3nAIbrJwofNPyIXvxmtoqr6w==
X-Google-Smtp-Source: ABdhPJyvQ6sbfXil1attHlSR9OI+jyrXy9dt1ZTBNHy8j8ojMjNnLhHazzRckJ2Ea46k0MGWOIBXFg==
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr433818wmg.165.1604946151927; 
 Mon, 09 Nov 2020 10:22:31 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 08/23] mtd: ubi: build: Document 'ubi_num' in struct
 mtd_dev_param
Date: Mon,  9 Nov 2020 18:21:51 +0000
Message-Id: <20201109182206.3037326-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132232_992552_BF7135EB 
X-CRM114-Status: GOOD (  13.35  )
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

 drivers/mtd/ubi/build.c:61: warning: Function parameter or member 'ubi_num' not described in 'mtd_dev_param'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index e85b04e9716b2..40fa994ad6a8f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -50,6 +50,7 @@
  * struct mtd_dev_param - MTD device parameter description data structure.
  * @name: MTD character device node path, MTD device name, or MTD device number
  *        string
+ * @ubi_num: UBI number
  * @vid_hdr_offs: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEBs per 1024 PEBs
  */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
