Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFE2C433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Nov 2022 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAoW5p1hmbR0Zs41YI1Tb/9+wpbxH9aHy9Mnuw2QAgI=; b=Mf6xKbC56JBnh/
	2VkoDuBP0Rh3APt9LtiJ/2AEkf727mufKg8MENJyQsdui+Sp0BaqPy0JX/B4F7FiCMvT8oAOUQCxe
	KcB3sibasK1IQzbafvlbQRBw2x6XIqzguo6QghfysiWBQIEXJ6H9+Afx/YMeTT5k6tmDsMyZL8NHB
	UY9Uc4YqsG2VcQJkKFNTF+WU2u/DwXYVpWeZjMEbfEI7iBZajF29Tu/porL2v/4bTF9paIewm9jc8
	NHLK2FuES6OEuMwaMLsppEFT33/KaNcPKarS5qo8amT7HSSDLbBXWkdTwtwWCk5J5rNgVhRyhjeN3
	6OYfo0ZmbDWgNjqWZ6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj6G-008x3C-V0; Sun, 06 Nov 2022 17:06:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj68-008wxf-97
	for linux-mtd@lists.infradead.org; Sun, 06 Nov 2022 17:06:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1160B80BED;
	Sun,  6 Nov 2022 17:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3FBC433C1;
	Sun,  6 Nov 2022 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754373;
	bh=8s1SAEAUQi9Iu/CB0Z3srSJkqdB0oJJaPfhfxwFNUpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MiBVkZhJzacEvad7pL+DlplueGva46afQtQZr0ifF8B4c25eBp2Zc29o8SLXwbA9O
	 CPER7IlQ8qMWEQf+tLdMK/aGjhCBm1Sm4v9K+lhXCaV8B8Cq/0Z0gnlj2iVD1WlgiQ
	 Kv7IwBuCV47hGJlQnWXUFPPZM9shhWQh0ADFCTEcD/fz0Dx+Rvd2htFpBuSfIfNC7d
	 yp6wfnKMX0Jz1Kbmu9L4YTz1/x42ig8VJv0+GS4kXF5WF/IO4Qpm1hMKBAT85q8RRB
	 VBcIlUewVkqG7LjgFAB9IPdcyI433/evxNEyRg+5OsvIcmba53A47r8vUJH1UIEPnp
	 yA0Hb5IvKjn4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Lima <mauro.lima@eclypsium.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	andriy.shevchenko@linux.intel.com,
	lee.jones@linaro.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 06/16] spi: intel: Fix the offset to get the 64K erase opcode
Date: Sun,  6 Nov 2022 12:05:43 -0500
Message-Id: <20221106170555.1580584-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170555.1580584-1-sashal@kernel.org>
References: <20221106170555.1580584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_090616_500601_92233D25 
X-CRM114-Status: GOOD (  12.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Mauro Lima <mauro.lima@eclypsium.com>

[ Upstream commit 6a43cd02ddbc597dc9a1f82c1e433f871a2f6f06 ]

According to documentation, the 64K erase opcode is located in VSCC
range [16:23] instead of [8:15].
Use the proper value to shift the mask over the correct range.

Signed-off-by: Mauro Lima <mauro.lima@eclypsium.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://lore.kernel.org/r/20221012152135.28353-1-mauro.lima@eclypsium.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index b54a56a68100..b4b0affd16c8 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -117,7 +117,7 @@
 #define ERASE_OPCODE_SHIFT		8
 #define ERASE_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
 #define ERASE_64K_OPCODE_SHIFT		16
-#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
+#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_64K_OPCODE_SHIFT)
 
 #define INTEL_SPI_TIMEOUT		5000 /* ms */
 #define INTEL_SPI_FIFO_SZ		64
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
