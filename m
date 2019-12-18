Return-Path: <SRS0=i5Q8=2I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A82C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 01:06:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335C421775
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 01:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EcFyC0nx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKqQzMNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335C421775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zUq2dz7OlwF7i4GPfCysS/KBsivUazJvDcJmf2yGJZo=; b=EcF
	yC0nx2ukCebbI29kI8/yWEMQfdhL74bnTI3R0QOQrSs63zbKMlh4AX9lmz8B2mqW14WKfXBlkbLql
	tGDApQs6MefuZyVHlyRNwtLTgTpdJa4S4WESuWDHdhEFCBWJCY4sjPLZScVCFiIff5nBaT1ME1Ooy
	Z9J0EMqiAVKQE7R2VDumxCxr4pyEriDV6ZRUMzfMmEbMcwcK8j+80aYpXt1ib++/s5tXNLt9x0bzS
	Fmv7eR8duEe8wH5+xujjPX/RZKMixqaIsq7Ipx6vO1z4fS7aM8B7iurHyVci+puXQ0OD1bN2Uev5z
	VK0DXxpyyt9YzzkXNb0kNhkv1fLjvCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihNnA-0006vy-AC; Wed, 18 Dec 2019 01:06:20 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihNn7-0006vH-Pz
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2019 01:06:19 +0000
Received: by mail-wm1-x344.google.com with SMTP id u2so93754wmc.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2019 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CIZH5Iz8Q+UcB5hqDpoZoMcl1+hdqO5hVl6PqRkR26c=;
 b=HKqQzMNVF3crjW88H263YTfhX7QmsQrjBxpoyIV5+9h921uzDgiR25TNJL/tQgwCMS
 H0c/rKXUMN6B4ieH9uDuSTngC5Q+wOXXk9dOtKbBV6Otye/DGFmAjFgwA2llcITQvHyW
 tcJ8d2EyXJr+6CMtLUfuLSpy5Jj0NfsxruKLZk17uhHHmPZJDLEvGGeyBJIl/lE2/g3d
 9UeM418rafRFktzw51VrL1siu8D+U6EI3jVgtWngtXYKzjYiXsB55tCWZ+W6/eP3fuSq
 UpS7FJ/AhTKFCVQGIw9Syf+Scm4wTd+NojwfReD8b0tqCgk9MBa85tyeybOMcD2tuqH4
 Mabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CIZH5Iz8Q+UcB5hqDpoZoMcl1+hdqO5hVl6PqRkR26c=;
 b=PAHE7oX1h5chQmSK53TT/sMmpEOXkoHQO4e5I/kXc2IGOTRzB6vkgSJb1CiytqoqhJ
 Jzfgh+MBLPqaDJBc4VZuhyIFubaOv5oYOk+cWAoJhqSg4Fky6iKuMMZHfND/V5+XQI46
 gD0hQZUNQFU0eb1qjX3ePr0QsIYm51GMxypP5kIAoQOpYBq+VcqHVwhBzr+JjCUYSNAz
 PE/jPPNgTt9KLGazapTaW2OKRUnTOlvpZK+Ov1bExTonqJMbowFV7PdyFg47xt1Oiu49
 LABkprCjjPPJ24HHGapE7cCIekDmyEZ2gGG9MgxqiT47i2V2fgUrvm/q8EYLad+wp220
 SSgg==
X-Gm-Message-State: APjAAAVkQK+XbFYstcHipFNX9N7HQXk15wHGdo0i97lxSizQ4EapkMY7
 Mxsw9mTvXJC22ZN7+SnPIEBXj/f0
X-Google-Smtp-Source: APXvYqyMl9k8MKXlxMm7wNyv/DWdhtcTNOXrTcixs3yJtvQhzXGKregw5hmJy2az5JqhZ9wteU3glA==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr235510wme.73.1576631175947;
 Tue, 17 Dec 2019 17:06:15 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id v14sm647455wrm.28.2019.12.17.17.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 17:06:15 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: brcmnand: Set appropriate DMA mask
Date: Tue, 17 Dec 2019 16:56:35 -0800
Message-Id: <20191218005635.31636-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_170617_846052_F04F68DC 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

NAND controllers >= 7.0 with FLASH_DMA support physical addresses up to
40-bit, set an appropriate DMA mask for that purpose.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1a66b1cd51c0..44518dada75b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2635,6 +2635,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		/* initialize the dma version */
 		brcmnand_flash_dma_revision_init(ctrl);
 
+		ret = -EIO;
+		if (ctrl->nand_version >= 0x0700)
+			ret = dma_set_mask_and_coherent(&pdev->dev,
+							DMA_BIT_MASK(40));
+		if (ret)
+			ret = dma_set_mask_and_coherent(&pdev->dev,
+							DMA_BIT_MASK(32));
+		if (ret)
+			goto err;
+
 		/* linked-list and stop on error */
 		flash_dma_writel(ctrl, FLASH_DMA_MODE, FLASH_DMA_MODE_MASK);
 		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
