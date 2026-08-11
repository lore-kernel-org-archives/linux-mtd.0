Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1711DC5B569
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ed2tswtUDJ6YfxEKEPVdtKU7lJXkBeAE+1SLx90hyb0=; b=TraG9JgK9ChjiU
	EPAkY6F2qFh9GX/r8t277Xiuv4anrUBlpccse+OvXJj+o3leYSmZiJNDewDQ6bPMUhJy9jwYaMMxx
	0uXhUEcewsIBb8gblsvoj6fZvM/UhhLFlqL/K2Fp9VgY5QXoBxbsIbHJEG2PyJZzlHocgjMtAM+gX
	fXp/uXfXFmMWpjMBbVnfuhLFXh7tm8LiYNI0ez3cDCF+2FnjSa9zSfMcphC2y9fYmQor6V81OPnW4
	1OF5SClvW/1fLQDK1U63CdPzuvQtYH++yNNuh63JSi6pk3nNNBuu1DMtU4loiEavtDXWjOwH2CTEj
	vzISPCsVmZeNXYxszOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgEy-0000000DRhf-31iY;
	Tue, 11 Aug 2026 06:45:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgEx-0000000DRhH-21YM
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:45:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08BD2407C4;
	Tue, 11 Aug 2026 06:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA011F000E9;
	Tue, 11 Aug 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786430734;
	bh=iJ93OWoVRYPlHdFjXq6yf4vEWXYkQQRtLZPLtU7T5Z0=;
	h=From:To:Cc:Subject:Date;
	b=SK47+HkQ+0lo37By7zAIZFKIV4xjYJUkCdEx6+dVR9/JFF88SDXYcUKmp1uFl2mcp
	 Cdrblinuo+t9VpYC6mCZarAmHnULt27RUMbyjUIbCdA7+Tina5GyY+tnhjutPrTB4/
	 1FYzISJoSzu/HfG4DcEjiSipQQ7Nx7+IcMLGrg5AXjOeb4m+ovuKu9lO/vrVcURJwr
	 ytG9gavVEbcDHEaNuBzdx7ZXJhgnh1p+8WOUYMt/tg1xZbplfzkHCx0CIqbrREiHBv
	 DOzXWdngWc9EcL2yzE3k9RqndORE/riH0SpnraXBpiyBnSJMQfeCVJMu1aWrUSaZDG
	 38WxJDJs4fpMg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takino <stayer.opt1f@icloud.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: xmc: add locking to XM25QH128A
Date: Tue, 11 Aug 2026 08:44:44 +0200
Message-ID: <20260811064512.42520-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Add support for locking to the XM25QH128A part.

Reported-by: Takino <stayer.opt1f@icloud.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221825
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Hi Takino,

please test it and reply with a "Tested-by" tag. With your full name if
you like. I didn't get that from the bug report.
---
 drivers/mtd/spi-nor/xmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..d3b52eb93e2c 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,6 +19,7 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB,
 	},
 };
 
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
