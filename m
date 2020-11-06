Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4ADC5517A
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288E72087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AeBBgLP5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MS1eNve1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288E72087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BKjX9nDZ7angBmjuBCOly57WrtoT9qKEAnrd/m7nGAw=; b=AeBBgLP5N92VcY5Hqxq4LJJQI
	YJYnz10JPUNuzvKhkwNNGGkeA4mUx+6RsDZH5zFkj5oRNmp948aIUpo8RSYdyA462kezNq4wQz05O
	OY0f3UREeI5Wyg7p1vgtOWwNdImvQJxcMO1GXwj3P/ZqWKzKEeA8EkCKg4i70LCMX7RtIL5RlB/u9
	iwgtVwj67yiOhWR8DV2Yxxs9ajcscvaZEYMA1rmypiZlB26vJ9iLPhrOXilKUZKnN+yRsxIxZ9m8S
	VJFRjikonnk5NSMEzc+y3xVigRM/9W+0Yl4x08ULceLycBw67yAfmUkPKRpUPd2nevmkENOLb7XWj
	uRd2Fgg9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9QV-0002ny-MM; Fri, 06 Nov 2020 21:37:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Pz-0002a8-QA
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id 23so1755447wmg.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmRHhQEVdc7j5b8GRJ+bwBPDfCwyz1df7aW7vS1l850=;
 b=MS1eNve1E8TYJUMppy9nxHHsrdiRDKvguLFeY6/UbTGermAOC/Vb1I96lhQjgRO6/W
 6Rn2wf7AObcPo6z0RmdLi4dAuoiTqAP5C488affSmxOrbY1DDvHPl/nQkMwhY7IrEaFJ
 GboA6G3Hdyn3tk6z/PkCmsIJ52vOiwFdu6cfIyYwbY4no/dhxjrUEmOm09OQdn3RVH/8
 EUyztItAe6k/z0PPyI83DtGj2UUoCMjRq9uTZqUK+e4per+Agb1TpY1vzOtaArMiC9xx
 U13oSXvN8bXdgB03T+XJY6PWQRLyKXHDitXSKbUXhD8ubvH/2CMR4+vujko9tu3HL1JZ
 8wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmRHhQEVdc7j5b8GRJ+bwBPDfCwyz1df7aW7vS1l850=;
 b=e17qAh5pmU1jtxG409Of0SnTgVh3WaJ37PcaaRcibtR/sfAw68AdMbnPyTWKNMNMe2
 TTC+rFHjxr8A4vjBPn9+TlEjOj1fvj7XoW88tPbAoFrCxUMFcGMJZCENSb+GrZ96IlPr
 cV9wdXEaXXRKL0KBTb9aQHBBDTXg65qADDIfl9LMLvxsQBc4JX3c2px64pEaH+5c5oRh
 m78m/n4H9XhL9zhnvWYUcs+qAfnRZ1ffm5w3LbvU1tj+YAhpxVdSYKiZrJx2iyi1Nutq
 5XhJnFNKvinvLL6NRS4fZR6TtVABqlnULx8jcEkEwilZHr9op1BBhwa7r2tk/1lkeuqq
 CUgA==
X-Gm-Message-State: AOAM533YxINOR/FfoiMBZxshaUUNwsYSu2lXF4rr/It+E3Gs6uW3320K
 XEQjtSJgSKO+xgQLxXX83KlDlQL2oB9ohEhk
X-Google-Smtp-Source: ABdhPJxpRnHCX/e1gikCJ98PGt1o+NVbAQVxQRNqGnZf43f7ZRErvaYGHfp62meMhtyoLuGEUnqyHg==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr1567266wmb.39.1604698630851;
 Fri, 06 Nov 2020 13:37:10 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 08/23] mtd: ubi: build: Document 'ubi_num' in struct
 mtd_dev_param
Date: Fri,  6 Nov 2020 21:36:40 +0000
Message-Id: <20201106213655.1838861-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163711_979732_8656AD74 
X-CRM114-Status: GOOD (  13.05  )
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
