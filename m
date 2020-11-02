Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C476C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:57:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6760206F1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkfuNHbC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4+biPUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6760206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BKjX9nDZ7angBmjuBCOly57WrtoT9qKEAnrd/m7nGAw=; b=dkfuNHbCVMaeNrHZVXNKgZkNs
	2t5z13bfviRNwwxNvhtd+rETF2MN9LoWJWLU4SxWp+Nwy/krXKEA2VNRtY94wl2L+G6Yt1LfdIkGi
	VYi9bT6AEdfG2vK5loN6QJKSom8xQ1A47NhlijqEgILEOi1Rvj12LKssqr4luvME3w4cUZ/DHdh1O
	ITyQKjuOWowgmnZjHLorLzTE9KahOkDCMqHX/pJH4ribzt7jvAkyBRPes3k2huUNRGTrpGC2rBEn4
	vYeclvsB8v/zCDa7WC1ITfenYUimIDzdoVXLMpDLbucT+79T6wTAcCoHOeS1W5uyROTMDzvRZCtYN
	1SgrsKmDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYR9-0002SO-KV; Mon, 02 Nov 2020 11:55:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPo-0001vp-OM
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id b3so8338494wrx.11
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmRHhQEVdc7j5b8GRJ+bwBPDfCwyz1df7aW7vS1l850=;
 b=w4+biPUE2uMMqM1NCNVRw/lhr1t2nDaFpT8nyyjQsKMPQSxZh9JlQm19v4OWojmS9M
 LRH4zJVB3i3J9Vl9CTf89o78Tvv8KSyYixWNURyMWKqfCiJ9VUR8pWhs7PDZ8ATkyKg/
 0k/geNcihJaIVBPlDvNci4aNTroRuJV8VR8CNUM4Px7f+ZxHlUV96B/d5p8gRPftyyzO
 y5dnNHGT48kE5ka9kn3j7mMVPhZenI8Kv7/Y5/fnCSFObccpgGkMU4TF0iGGCLyeTK2F
 Qo88KXtk/m0M8OZCFCqFGzSDBI7xXaMPF5dho5lBPiFxC9kACwTTx9JfGQBVyHOw1YA0
 LSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmRHhQEVdc7j5b8GRJ+bwBPDfCwyz1df7aW7vS1l850=;
 b=pvPkehBxFNFm5S3Xvx+YODTThOKJRbPBOI8bxvs2SatIAdTOWQpKkswAt29S+EMTAz
 vCueqXjeQ7BnCOxV+Fs1BBbNFBmzLAnnTP2hPmLHNG+SRRdbcp8H4RcKElyYUnbhW7q1
 fmLKwqogn7HkKG6NMyrI6aa7PJBt6vjRvZSswMouk40tOQ2K/P/bf9Q0E6bYM2tiD71E
 5Tu/8wTVFRuXVtDckd0rskhAtwYQ1LzCRZ7Dx2rm0oXm4z7f3Grg0sbA8ZkFOO/WFyuZ
 OyX9jY2XnJiuSnOrbwNeuHU/H6PiY/R6Y+SEFGNqFCJDOHxa1hUjIQwY0BCcXFzkTg4Y
 NeAQ==
X-Gm-Message-State: AOAM532ZSqGuP12k2JUiWZKKfuu5ZDFHxQCcz//dDbQzD8sOmJ3rYrQU
 4GI3IyAii8MWTqKt8rg07mJmaQ==
X-Google-Smtp-Source: ABdhPJyJf4YYacMOMRGDnSM6ll4hRK/WVoFumKmKugMzoiLcuyHlURGIkMffq81yrt4xhF/tTH+JCA==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr18846233wrw.138.1604318063774; 
 Mon, 02 Nov 2020 03:54:23 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 08/23] mtd: ubi: build: Document 'ubi_num' in struct
 mtd_dev_param
Date: Mon,  2 Nov 2020 11:53:51 +0000
Message-Id: <20201102115406.1074327-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065425_318939_0E2B278F 
X-CRM114-Status: GOOD (  13.16  )
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
