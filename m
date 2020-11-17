Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05C7C63697
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:41:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36BEB20678
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="19NBC1gg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCPiliRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36BEB20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cQieim96hZ2A3XAIPA71tEPDBRTapnaOWUiGDWc9uZQ=; b=19NBC1ggQnnOhNpFBZ67B8qgt0
	mkghn5rPipURFk7g5VZr7QFyfFRkTDAWrHh/bB/LxCXSFRwwCmA17hlfczAU2p7QLFlhVP+pfUkGT
	usR2v3Q90D2IfqAYqpAE5uzTMA1mtEfw6g6AblOV43FQSoChtw3Qp4iCHJRBLkpz+vUZCmQwups/4
	PS/1KppY6vJlY/BRZx0IY/YKgAV3vk4f9OXDFfLjdYdTNprKK1tEu8ZdybWbtoqRDYYi0pYC1sZUt
	8w7SM/WlkqV7Mj6dEIEFozylKtpwftYkoRGNQX23AY7nxHbEP315nzVkFznkpRV7zcS5u5dtLWtJq
	+LVR+0Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf4x7-0004vU-C2; Tue, 17 Nov 2020 17:39:37 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4x4-0004u2-VB
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:39:35 +0000
Received: by mail-pj1-x1043.google.com with SMTP id oc3so895497pjb.4
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=a081+5sEtLZdxVjnEsgO/mWDD8NzqZQtkeB5cfYLH30=;
 b=kCPiliRHIVUfr3L65ip40e8uAZiZ43JMLQyUgVBVtUA29OXaMwbzaSiamP11wt0nLi
 YVa3Qf38eA5gN/+rNsQ2yM+7QDY/yuP/UdK8t7jLdm57RGM4czTgeq4kP1cVpogmijvV
 wVjnFT8FXE1vJP4YXScEOzp/B9Pef8KcRULWWV4OzUD2rdL3nK/eh3z2bTvZw7qs9an7
 5QQE5YXAMymBZT4ZOuhJAS7VyRoE8JXOX2V/jyfYemcIdNu/N3KtrbCHfJ/sb+LCu0/B
 4xh1S+Bz4jEDDhMyHZgJGwX6DIIZ2Gr9XIAgLvexRPm71kwn/sfBOs90yUGokUHCxsoU
 E3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=a081+5sEtLZdxVjnEsgO/mWDD8NzqZQtkeB5cfYLH30=;
 b=NA5rLjkXkIOFXwXK72OZ/1rj/07Bw6LZbkaInQWSfpy/dCwsIhqifkfUuXhTAz1/Xy
 96Ym4QLEgpXv1/YCOi8rngH8kIvpJLHiLsf/fy5ayc+N2uTok7n08MV8dLaSWviWWbLi
 MgMFwflx5epfSlh/XS4cO4vkCy4mm1Y2px/PmyCDyHN/q4xmuhi05RC/6WstTTeb7oW0
 uK23QtodwklA/rFB6tD3hYB0xbTqI3R2vpclKhInff0CgtwSUDOpPebybbUr0rPKKlRx
 pSuhCAJPhp6DjnTr3klUHgodeudSkT+eQiYP4Aj1xzpRKo6sZ9BOoo30rpaCm9mMZV0K
 3PWA==
X-Gm-Message-State: AOAM532wVeQbuYA6e+OI+V+24dIcK+fyNHjQA7IuArgfYNQ5SMzP8pjZ
 mszSbkFYbYBdsATmE/SFsnha
X-Google-Smtp-Source: ABdhPJzen4z1mH9hBVGR9pVV33DpCmvTAdG0rBun1a5GKDaehYXQ3z704Mh6UStGa5Zhwit7VNd1Xw==
X-Received: by 2002:a17:90b:a02:: with SMTP id
 gg2mr149355pjb.225.1605634770702; 
 Tue, 17 Nov 2020 09:39:30 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id a21sm1751330pjq.37.2020.11.17.09.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:39:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 0/4] Add support for Qcom SMEM based NAND parser
Date: Tue, 17 Nov 2020 23:09:05 +0530
Message-Id: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_123935_033465_A543584E 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series adds support for parsing the partitions defined in Shared
Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
Current parser only supports V3 and V4 of the partition tables.

This series has been tested on SDX55 MTP board which has an onboard NAND
device.

Thanks,
Mani

Manivannan Sadhasivam (4):
  dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
  mtd: parsers: Add Qcom SMEM parser
  mtd: rawnand: qcom: Add support for Qcom SMEM parser
  mtd: parsers: afs: Fix freeing the part name memory in failure

 .../mtd/partitions/qcom,smem-part.yaml        |  31 ++++
 drivers/mtd/nand/raw/qcom_nandc.c             |   4 +-
 drivers/mtd/parsers/Kconfig                   |   8 +
 drivers/mtd/parsers/Makefile                  |   1 +
 drivers/mtd/parsers/afs.c                     |   4 +-
 drivers/mtd/parsers/qcomsmempart.c            | 169 ++++++++++++++++++
 6 files changed, 213 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
 create mode 100644 drivers/mtd/parsers/qcomsmempart.c

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
