Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B2FC4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Nov 2022 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjKtaqGPMJIlgglP11jFTfo33cyEU2xyNMMdc4h40/Y=; b=raw3RTWW8pMbQO
	LgD1IAZ2POTs68MrN2x3EnPO1IEoIaWWohtuqI/Qd23PMvdSIkwSmmYYnS4NGFmh3ShJMmmTqnRB+
	qQD4CX8XC4TTEui0U94z3L7o6Xif5hqZcSwgiLSJrxonuJ0uSV7Src+EJb6h9kitwpc+8zmDBpMFP
	i0G6sU1sXuonsCvukZR2SYHWWldKH6WJ1sCBJy4iAkZcIgp/lgjkRYLMGvWpTJH9BNfbJFhRbMCRM
	XVbDHmEOtqqSM36kEFnV2QodppydWGhmlNDkcengyidfcAgOAKJoQVvSy8tXPgOXrr+huec2EcnBJ
	kRBOopyszqKnBAjmhp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj6k-008xNW-Ou; Sun, 06 Nov 2022 17:06:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj6i-008xLm-1H
	for linux-mtd@lists.infradead.org; Sun, 06 Nov 2022 17:06:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8710460CF7;
	Sun,  6 Nov 2022 17:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5944C4347C;
	Sun,  6 Nov 2022 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754410;
	bh=clI9eVa6PdM3h28MFZfFoDG3wDAikj5pFNBDoPZuliY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BBqMPZY3oz2i8r6FS/1/dOl01BZjdVbmzU4HUAapHEbqOF7IW20dbS/INRqmFL/3w
	 yRPgxgZg0z/24FkKua8km2/2HvoILgtQPmW0nwaaLzGZTahbtQntb/TStmZ0R6+Nx3
	 MFlopGcmlr/IsjCZFJgxxadxks0nWIYU9rFXCcn8xogOt8EX1oRCHa4oPo1KloOZ9c
	 NlUVKv5ubE9zKXFhtaAFxiB9+RIYdVRDUflSJtkUId577vasmCW1W6AowHUKn6S7uC
	 WJSRsnmNLnHpYK+3/Qer8ywqs6y6ZFjPBdX0ABKdXkOOE5GwUL1usf+TM7clL4it1n
	 qq3BVoKzbM1Zg==
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
	linux-mtd@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 05/12] spi: intel: Fix the offset to get the 64K erase opcode
Date: Sun,  6 Nov 2022 12:06:29 -0500
Message-Id: <20221106170637.1580802-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170637.1580802-1-sashal@kernel.org>
References: <20221106170637.1580802-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_090652_147385_FF8C8D03 
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
 drivers/mtd/spi-nor/intel-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 43e55a2e9b27..21b98c82e196 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -113,7 +113,7 @@
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
