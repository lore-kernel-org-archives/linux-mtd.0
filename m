Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183E8C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F7920B80
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTnMK007";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ee6qc24y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F7920B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XXLzIcYnIocXXUDU3Os3Vt08t3M2frGdDIDcbT63o6A=; b=iTnMK007aLHlupFLh+aKi1DWc
	0qx1/YPUfYH7lEdZ51W+2+YPsUNYVep8mjbiQhB28oO3dhdvyX3VKECeoLWQaKiL6VcknJQWJjc9j
	UzsSWqLCuOr74T94XNp3KTqsm1+tc1udJQi2ITlvKf1saOlUk8Oz92oSK3AKEkKgKFeW0ezTbmsCa
	wifqrnEX20Slbg7neQsez7hf/mA3rRRXobUEHAv9Q8z9qtZi4/+9NZd9IclMv9cRyCI7kZAMHhI36
	DL9NvVWyS1XPeQ9LKAv1GxPfQWD4kxU4rZJzmQmqHhG1y9sBnTPjWQTKpre5WsrrDPMB+kTmQ0ol2
	c/yOlBTjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9SM-0003td-OH; Fri, 06 Nov 2020 21:39:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9QE-0002hG-Uz
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id g12so2747444wrp.10
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4FI0nTKy9xJSbbEI5xWFSlWi+PCjFwRWpkkSRoALdw=;
 b=ee6qc24y2pZj9YDGDyPb8gjcUxoCDS7QqwPqzOGliCMPjVE4hgUQnxfc/cQbX6pLMi
 jG7ZqRhHvXFutGqqB7qlZ1utF3tXCnfzjnNmXVGS7K5rmrZnunhCXCeVP4EJb3tkXBT5
 IMcjiFXPx6FVS4GwzziYMnIm5VAX5PGlS4vKGgeCfExaU8VkhpNVy48HXGeWq+R2l7Ip
 UTJGoQppPVyfPXOwpWOXXkzIwWofB9xZkAKvglS22VfyKaviEajKSzjHlQFD8fvxUDSC
 Io3a2xSTn5Oz/BPqRo++gn/Vn95v7JiToXxq2feqYe8fVU7IseAJ35+s/dZm4yY/bDL7
 wjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4FI0nTKy9xJSbbEI5xWFSlWi+PCjFwRWpkkSRoALdw=;
 b=H7itf8WOKbYNXn+QlH6z4IvPL4miXcPvFXSkGyu5x9E16zltajmS7vd1GbnhDkRDK/
 WWjNKAZMynj2BVvmrk7tDak9S+smsjH/D1wzE/D67aR5zVFb87xwxY81aHyX48xvRaNm
 ZXPIGfAZVDbQDhWfr4gPQJ73/f+auO0U58b6nd3sZ5nCil68WosO9fYjvoPpttaRYCzt
 hI8l/MtITWPGjUtYRwv/M6e7g7OQoSgR5RdJFJWmREkqFm/o87TJ+cf1BDQxjUuedzjy
 lZPH2DZxclNk8wQgPTAZ19L1I6J6YbDGgodqB3Q1QQEmcdaTmReCgI0xIAALcnurnU0X
 8Tpg==
X-Gm-Message-State: AOAM530fZv9FGWTFi1g1eAKVWW4nq9HHN3yPzNtQdeiN0x/IlOm2mj4W
 6otcG8xi3mJYWcl30PbkgNSW6Q==
X-Google-Smtp-Source: ABdhPJyVxA3gZ7tVm2WMN26zWZSqXfJm4SZWp1+Daeu4mASzQFbu+ZGYKkEI0v5B8IJEINqyH8FT7A==
X-Received: by 2002:adf:fb12:: with SMTP id c18mr4481368wrr.99.1604698645863; 
 Fri, 06 Nov 2020 13:37:25 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 20/23] mtd: nand: raw: sunxi_nand: Document 'sunxi_nfc's
 'caps' member
Date: Fri,  6 Nov 2020 21:36:52 +0000
Message-Id: <20201106213655.1838861-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163727_057148_E845C5DB 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Sergey Lapin <slapin@ossfans.org>, Dmitriy B <rzk333@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/sunxi_nand.c:250: warning: Function parameter or member 'caps' not described in 'sunxi_nfc'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Dmitriy B <rzk333@gmail.com>
Cc: Sergey Lapin <slapin@ossfans.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1ec672bbd459d..923a9e236fcf6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -236,6 +236,7 @@ struct sunxi_nfc_caps {
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
  * @dmac: the DMA channel attached to the NAND controller
+ * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
 	struct nand_controller controller;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
