Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3B7C4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3342083B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0U9piYm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZOFyvlCL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3342083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8oJDckCL2AL5XNuR48ILktJViawHYYu3upEfFJHQcw=; b=W0U9piYmXL1hmlZBX/iyxXBLVI
	EfBwLMIz/yw3AtbysY3lUzpHS1PDDW9zs5NvImrtMVHNtH+QVmRBwnwEAmHPhrXP9cb5bkFIUss6x
	KkNi93LjI0NB41JPLvyRjkFMrTBLaDOZCpgRzaWDsTc9jNyKXT+hpJnjCtRnQnGPX+h/ubHaASbP3
	1hXobDHBK2BwyNdGWdIpQWRnRPV5/Z38LmZbL33/oteUZoxATNcJ6Uw7e2/JjLRHr5JqhKyjX/ZhE
	CORJpkUX7qJtFrVw2ID+vVAF2uFkNXgHz97PrwH8dDwGn4dC5B+4RmnO0ggT6gQHgPIvMyfXJ/p2f
	EE0Ijk1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNADK-0002Yb-0J; Tue, 29 Sep 2020 07:38:18 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNADA-0002WQ-KU
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 07:38:10 +0000
Received: by mail-pf1-x443.google.com with SMTP id q123so3703670pfb.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=io1cz9TQOCr2lsgpG0jFMP3QgjGEulFGbq1UdpXz5V4=;
 b=ZOFyvlCLR8T8JpIU79KN9MsP6sRAHSvMzIjIZONONWF7W/+U3LsaU1wt67X0ZP3Wn2
 mGZIaHbxB+vQzJGNYTotCQJhBH+z54Ff0okyevumh7NAhymfIacbmmYBsbRkFuQiK1bn
 QslXqt5AOL4KyTGwdLRHnoAhiSyL7klugyFjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=io1cz9TQOCr2lsgpG0jFMP3QgjGEulFGbq1UdpXz5V4=;
 b=hOJwh5n/BHX/Emcg1CBDcUhK59nOiGSU3Pc428VYE8eoYqi8qJLGKvDZP9DBuTZjQA
 Jx3wZvqPLwgJoUNZhBZovdJktCaa04LoSS0hyYTH7YTjtMyf1/hAt1HCfWcxBZwzCqvN
 vVEydqMVNHF9J1+7sIep+1jBNKDmRq5YI0gUqdboL8GE2oaGDHlCy0rIagtcR19hcaLn
 cyuxhrDPMjI4nv9Jq1BFKwpcxd8k872OOboxc5+YeAhhsrfk4t/aA49H0ub3tY6Z/EIN
 BVmdtgmJQ1q2bd39SbnzvXU+Yxqs3c1hRpoifxt7NG4M2xBvyc1Je7/dJOIUopYSmV1V
 wfFg==
X-Gm-Message-State: AOAM530el7SnUIl+gPW4t++kxDDYXU4kgYWtJrM9oMFiO8VNtDFp1ni4
 7gbZox6yWTA92tT6Eok6Czepiw==
X-Google-Smtp-Source: ABdhPJwXYEUsBsCIdgNi3hgFN2mrzey+Q3KLI0dKFDQsChyUPfOEB+KJ/+oKD8iGZQr8LY3JxgnjqQ==
X-Received: by 2002:a65:6883:: with SMTP id e3mr2228137pgt.250.1601365084796; 
 Tue, 29 Sep 2020 00:38:04 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id e13sm3737317pjy.38.2020.09.29.00.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:38:00 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 0/4] spi: spi-mtk-nor: Add mt8192 support.
Date: Tue, 29 Sep 2020 15:37:51 +0800
Message-Id: <20200929073755.3741416-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_033808_722239_895E04BD 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This patchset adds 36bit dma address and power management
supports for mt8192-nor. Additionally, use dma_alloc_coherent()
instead of kmalloc() for internal bounce buffer for platforms
of only supporting 32bit addresses.

Changes in v4:
- Drop two patches from a list which already addressed by
  an another series and not directly related with mt8192 support
- Fix 0-day ci 'shift-count-overflow' warning
- Fix missing 'high_dma' initialization for 36bit address

Changes in v3:
- Fix a bugfix of v2 in checking spi memory operation.
- split read_dma function into two (normal/bounce)
- Support 7bytes generic spi xfer

Changes in v2:
- Add power management support
- Fix bugs in checking spi memory operation.
- use dma_alloc_coherent for allocating bounce buffer
- code cleanups

Ikjoon Jang (4):
  dt-bindings: spi: add mt8192-nor compatible string
  spi: spi-mtk-nor: use dma_alloc_coherent() for bounce buffer
  spi: spi-mtk-nor: support 36bit dma addressing
  spi: spi-mtk-nor: Add power management support

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |   1 +
 drivers/spi/spi-mtk-nor.c                     | 210 ++++++++++++------
 2 files changed, 147 insertions(+), 64 deletions(-)

-- 
2.28.0.709.gb0816b6eb0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
