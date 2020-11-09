Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0242C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD81206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqWXLdDk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tEK5zw7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD81206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WghfdeDhC4j8A9jqfoXtbDE88+u3P645dCUawF+NjuM=; b=lqWXLdDkl2AAyYf+uQNT6udo5
	wLsLohv6B0DgxO9S+OH0SrlfHyEhX14f54st5NNbqmgV+8Tm3QOCoYaWT/s+mMtZxQJtPQ500tb65
	e4qcwKl2grGXVPCKnNmKHo58yVR6ImsjFknquVusilna6cFqXsidltRtCQ/MfbYKcV1eidDFqQVyx
	l5bC60lp3QIPVMAa70vBzql+MWFXNxwDC885I1ZNByEHceH5KIonOiEcpKONBUQBzHXZmy4C7kgfw
	l/JRGrbIjAH7Z2ZqSNJ6gmeYlLMRjNEKuP0BPocHkJRlTMA3rJIqCoQiiBvjXLXtw15aID+/kndX1
	J7yyGInyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBr4-0002Qd-9K; Mon, 09 Nov 2020 18:25:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoS-0000xa-4s
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id k2so6424830wrx.2
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=;
 b=tEK5zw7BKPfGyu8anHIQT7g5BzYN9V+7Ibfk9LUdpgcdPW8HrXOmNWrFhkwoCayZpS
 U0HmR6dxuP5rQ98USaAzLkneRscuHkc4cndi1Qw/HRkiatfylGA3B1We/FJdPyJ5B0BH
 cGvf91kHyzC6Zf/DCQb5H2zA460LvFgbHsVtbcYGP0qbPhEYbEaxPyGG5UdDy3WBBr8J
 AGDJvM2PkMFLnUOb2kTq7HU5P0Up0heVthk6tDgt5plEQfH1ntCSBb/V6o5UKu6Cb98P
 EDJTo6L8Py8CXuU0heeSDKnr3FtSPQ749jMwf0F+8bSOZ8fFZMPaDxQbF3ZCm8TiCQCy
 ql+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=;
 b=HUqdF/6UHhX/fNy+L9mEx/YfSyCu4QS8skq/r7WyBFgDJ0HeikVLQ8jEeomftGdIbQ
 bv8lawmktI5ygYWOjADVtZiFIns5wctVTS/wvngi2/NLjZHo83nrk2C/S/O3VuhrthBO
 xaieqRRkc0GqReEDbNpHLckO3NNjQ0w9wxrZ/Pg5m36L8UN/pwfeyQQ4J3v8nIyDeGRr
 egSNP9xQdXTAIt0nzmPwo3FRDQ7kpZHxuH6XixeErGd8ShQHwMdXZHsWwfIcLDYJNk48
 qLz4QfnukythTHvkwnLPVlZYhSlSwzwqNTu1twc1R6AwLZavtZr6zLRCCbXrHBWOd10+
 nkCg==
X-Gm-Message-State: AOAM531DioDa7tZU0gJT85Cz5gJdHxIBRikVYi8MyNP3gWj3opP+ClEk
 aUEV3GSvPDurIJWcw87Hhz0xeCbxGPFbGShE
X-Google-Smtp-Source: ABdhPJxx5vbIKT+B2Vdg99H/wUCSxi32bcw/2t1h08rRTDbqIu5u1i68o66DhK3MkL44ciR3Za7SEw==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr1576130wrs.170.1604946163113; 
 Mon, 09 Nov 2020 10:22:43 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 16/23] mtd: rawnand: cafe_nand: Remove superfluous param
 doc and add another
Date: Mon,  9 Nov 2020 18:21:59 +0000
Message-Id: <20201109182206.3037326-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132244_371111_D6C5BD4B 
X-CRM114-Status: GOOD (  17.07  )
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
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/cafe_nand.c:372: warning: Function parameter or member 'page' not described in 'cafe_nand_read_page'
 drivers/mtd/nand/raw/cafe_nand.c:372: warning: Excess function parameter 'mtd' description in 'cafe_nand_read_page'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/cafe_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 2b94f385a1a88..d0e8ffd55c224 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -359,10 +359,10 @@ static int cafe_nand_read_oob(struct nand_chip *chip, int page)
 }
 /**
  * cafe_nand_read_page_syndrome - [REPLACEABLE] hardware ecc syndrome based page read
- * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
  * @oob_required:	caller expects OOB data read to chip->oob_poi
+ * @page:	page number to read
  *
  * The hw generator calculates the error syndrome automatically. Therefore
  * we need a special oob layout and handling.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
