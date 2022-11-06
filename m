Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA454C4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Nov 2022 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vG3IpG1eERUu0qZ0VroFXzA/PvHKaxAgu/TBIHf9YCQ=; b=DgZHz1AufTx8l0
	ZFkLFpX3wYDZDRaOd0jzmAI84C/mL3G+124tUM8wAbchHV3dcoEJOM6TG5GSYSW5xLbBcHCahz0rG
	9uFB8dNVHd3ubYLBwrJBqeBApwu0rWJGo2F4XxtYReojhxL7PWGOAJ9pBEv4qSQLieehWQet0+oDW
	H0GTPhaoKOtoaR39GCHBiEXaBerewzROydFSLXBkZM/wcbxFAxhP7Ld/av6Jj8j62Hr2E4ZWC91ms
	MXboHTOnh8HXZFhbUb7FQxms+Nvnm/SjVX4ib30Y16NMPiPukU+em3QCCqdMMR50II3t/3jYkAe5P
	fPV12IuBVKKF/CXiyveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj7B-008xd0-I2; Sun, 06 Nov 2022 17:07:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj79-008xaR-1s
	for linux-mtd@lists.infradead.org; Sun, 06 Nov 2022 17:07:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B828B8013C;
	Sun,  6 Nov 2022 17:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9149C433B5;
	Sun,  6 Nov 2022 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754436;
	bh=17nVzYZDlxOShlzcokmJyNZashaE+MB7kmghc896PYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IqQsuXTLkA4pHHdBZIiXvtRh4FXqyYePFhAcXpY1A71Du1THDOpl83/lX2wgvUKc0
	 hjVh+CJrfnIoDKIRd+D0ttmBQlDTCHeh9zxsxWmR+YcdfsKTsgkd5dRuR0CnJ0ALar
	 X6dx4DztzPigMnKrQ0z1tn+Ge/2KLM9RCLN9qBrKhwagBNIAthJ+gHj9dQqLDbAGmL
	 lI392D8mZIpV1aWRW1U1pVrpBUkfbGA3aShy9B7qG6+fGUCwg/DrEX/36VqXnDiepg
	 zVaBY/4Pi7UPAR0NiJuM3dU5nMjXP0hlAkARGoDKEcbmT16uJaQ8hZGOLGmsKYGoy2
	 aqfcwgyY4CQqQ==
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
Subject: [PATCH AUTOSEL 4.19 4/7] spi: intel: Fix the offset to get the 64K erase opcode
Date: Sun,  6 Nov 2022 12:07:01 -0500
Message-Id: <20221106170705.1580963-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170705.1580963-1-sashal@kernel.org>
References: <20221106170705.1580963-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_090719_282987_21D15D3F 
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
index d60cbf23d9aa..642a6f9071f2 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -116,7 +116,7 @@
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
