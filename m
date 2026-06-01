Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543BECD6E5D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNGAoltEkwILd8CfJ6pig6PIR8M4vO037DK3siBG+8E=; b=daIg0VYBTRPSfe
	eyddzGl7WSDSfmAah5lZ3292KqNe9xrlGYRP/pjzUbl3cdfzO05ZLFa8hCJkbjMnt9gmxVcZVgG5F
	UEwdw1XqlBPjzsam1BzaaU8aVUqwEvUQWYg1FUMmX2forTFWbptIf+WQh2G7qkwt+OtOwGk6d2YWh
	y/+fZni77HsjCk/Yksy3GLyyXEO3oXvcDshgG1ajoA8bPZhWtulHFXLW/CNNx9AD8txa6YBRb+oHQ
	Ns9KcgqgfQf1gHlZFkE4PTMbZ+gduwRo3LgTwowThRPxNmdeWvHSRj2NdmZCa0FY3mQrNA+9vgfTl
	5EzntHXP2BgrjKhcQOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AN-0000000BAnl-0MWu;
	Mon, 01 Jun 2026 12:54:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AK-0000000BAmj-0Xxu
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 12:54:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE77041B52;
	Mon,  1 Jun 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123E51F00898;
	Mon,  1 Jun 2026 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318486;
	bh=SRwPhi2462A+RURXo48O3KUzEVVenRBwhloL8me1CYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kinCCRdwkuknrJyH1gQ3HPoWWlihyL/GQgIWMuJWAW6dF5H6ZKEKF4omB6l8rp2Vm
	 9dsIWZzwiifaK+mfEw7WOZWxjhXJNRLTYOZvDdvEn/UP1XFPj4vkCwyRHT+VdV2z8D
	 weoN9T/7UI+F8sR/knXBc3QRTDYYKky2TKZeaJ0HEYSVJXH1FKfLmlgQO6VKzc8sZa
	 wt/SVr1QAmQm2fnKCA94sqpRiFfDlxk/t74DS/2uGu6PPwolkc8M0+DJAYStLeptva
	 VsdumYZPxrCro2lBHC3OjqWhFCS/4jwKITm6zvSXFA/RgiQduXJyAOe/uj9zEtkYGQ
	 Ag27bHFzfYbYg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
Date: Mon,  1 Jun 2026 14:52:43 +0200
Message-ID: <20260601125438.3481722-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org>
References: <20260601125438.3481722-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_055448_211759_9AAA426B 
X-CRM114-Status: GOOD (  12.86  )
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

That flag was added in [1] to not "issue any non supported commands".
But since we now have the generic SFDP driver, we'll issue the RDSFDP
command on most flashes anyway and there was no single complaint. Remove
the only user of this flag so we can rework the parameter initialization
in the core.

[1] https://lore.kernel.org/linux-mtd/20211207140254.87681-13-tudor.ambarus@microchip.com/

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/spansion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 65227d989de1..092450375d4e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -868,7 +868,7 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s25fl256s0",
 		.size = SZ_32M,
 		.sector_size = SZ_256K,
-		.no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
