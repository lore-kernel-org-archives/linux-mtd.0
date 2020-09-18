Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E9C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:32:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E672920789
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8nE7vmn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J3Jq/M3K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E672920789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1sMfDPDGbT1V80PRpxAv4UDmoa6lEWsj05YNseoteM=; b=f8nE7vmnAqOj/xiuirf31mbsfG
	gYfGN16uy/w04trB2dfgcywCuHHll6m84/EeRBdFjifdmwbEhggze/Vdb60T1IzVCet5L6UCXqzeM
	tm+VU5s7ttoXVGhK0zKPV5ZxaO1jKBZzGDfC9RvILnJgcL1oxS/jKGf3OnJ9UzQTDsF4uxi5heoae
	WchKaO9m9cyPrZf87opkMOku3ArDswYNxtWTzIinzT7YYlytZ+UATMi9ugVJW1c8Yzslq/cYVpe7l
	mjNf1mxSca70VDy4flBcNed0H5fBXGxlEOVZXNjQBUeV4XXurS09I51czBTMJxKpMxwF+McgrsYDY
	+pngyjtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBny-0008DD-Cb; Fri, 18 Sep 2020 08:31:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBno-00089x-3e
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 08:31:33 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d6so2979202pfn.9
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2020 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7g3/3HRNTSbPMO+XtztpkLjskFShJd05xhi/n73t2b4=;
 b=J3Jq/M3KnJTcWXxQ/OmDCmtw9TKMVom83ObJCwfMadXSAPRuA4l/Jm2QB0eR4ojdNs
 fPQo5XjYTFreg2ms90MvHm4DvWmPFmn67LMERc9pHP3vJ0cCl4LLTglj56jPBMAbtfpq
 rB5yxrY/2z7aI/sV6h7qHpU7ZHO+WQxXuMtTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7g3/3HRNTSbPMO+XtztpkLjskFShJd05xhi/n73t2b4=;
 b=mK/vwa+eyRNHPIlFACfSLx0laVzrK7wiOxAAqZ8OoxUSaaOPVOo76axAhj60GitomZ
 YCWi0hU535uuK39KkZUCCvyZ6EGzT1rbo/Y69GPbfdQiWO1Z/cod8RWJU8W3Z3QekqnW
 28ye/OO7R6fFjWw+RWCG3IM7Z0DxQm7BKqNr9U/OE+07OteBuZGPmIhQSnhzOSSCEI53
 /O6EnEf2684hBs27xR+dE9JS3izq3yvEjLf9RxXeijrSLJUAb5quAfxJ0PvdMI5K03+L
 8CL6ARoa1sDkLp1cITmR9/xgCehmHPP+sv8pOrqszR8CHZBGD03vBWvoqAPeGE+S+jaB
 AejQ==
X-Gm-Message-State: AOAM532XnlIuyrNqFfh7sf0ww3GTVxV4HW3C4Q9Mbn2nH2no0MHzz9LQ
 BmIeg6+0OC0tZGKLJ4/nQg/iWw==
X-Google-Smtp-Source: ABdhPJyo5ajOR3Sys6kLV1edGsPyxX+u0k7ZFoM2H/iELQtDmH1lb8MEP86ne6oEPQdxsCBI364jDQ==
X-Received: by 2002:a62:3585:0:b029:142:2501:3985 with SMTP id
 c127-20020a6235850000b029014225013985mr15239835pfa.74.1600417889074; 
 Fri, 18 Sep 2020 01:31:29 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:28 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/5] spi: spi-mtk-nor: Add mt8192 support.
Date: Fri, 18 Sep 2020 16:31:18 +0800
Message-Id: <20200918083124.3921207-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043132_240480_A702F253 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset adds 36bit dma address and power management
supports for mt8192-nor.

Changes in v2:
- Add power management support
- Fix bugs in checking spi memory operation.
- use dma_alloc_coherent for allocating bounce buffer
- code cleanups

Ikjoon Jang (5):
  dt-bindings: spi: add mt8192-nor compatible string
  spi: spi-mtk-nor: fix mishandled logics in checking SPI memory
    operation
  spi: spi-mtk-nor: use dma_alloc_coherent() for bounce buffer
  spi: spi-mtk-nor: support 36bit dma addressing to mediatek
  spi: spi-mtk-nor: Add power management support

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |   1 +
 drivers/spi/spi-mtk-nor.c                     | 242 ++++++++++++------
 2 files changed, 170 insertions(+), 73 deletions(-)

-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
