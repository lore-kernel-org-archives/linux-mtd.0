Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91405C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fEuzSPoS8myUt+Ud3UATv0BnRlMhAmDVuCMJSOayVM=; b=VRd+S6LQ171Xq1
	Pma+S/fc1YynFauqkpXH4CL7OOHRZ9p3fyiWhF9POyfDjIKxe7F38ZAWkk2LWZ79kP6Z/T9M4uc6y
	IKg8plyvlA/JiA3KdJs71WYquxgjcbPagupf0AaUlBVtUW59GfztkO/k6cvAK9eH9oF2l9Ss762i6
	NrB/sraVIwLKiEVHhKru4SAJuAwcepDC0aYpcb2ZsbC+P5c9WdNaTTRK0sjRaxZGybJfoV+I9FNeN
	6CTM6uDZbhqhBq1YV/jBl399lUqv4LaQfasxjTxs1eEr6+O6AfQojPXpFMsvMG6GL2gCsmhfmtqIf
	xZ4hroVPePuGXCSYkhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Dp-00HN7w-0C;
	Mon, 07 Aug 2023 13:24:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Cc-00HLvG-1r
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:23:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D368C61AD8;
	Mon,  7 Aug 2023 13:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7A2C433C9;
	Mon,  7 Aug 2023 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414597;
	bh=fjBFDwKo3KO8ngc80qTC0rIJuf+fwM3TGfE20y77Uv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oQzpSyKsYxPLi3to0W9DQqS/mGEukCCI/szQR+jA1oFg90bGzwUET1D2xnpvSISrb
	 65+OfiYiFnfosvUF7aZ5pZxngVXC7cDXj7QXj7NaC6FOkzIzxOdz6zS+ohB3inqycY
	 tS8t4A4nUnLLC6OcGhniQ6NFbzc1uAyEPb6KZi1uHCAuZqt2DZA0kp9n1C80pYP5J2
	 7hhi71nEeIWCyXC5C1YDf687VsB2eaQB3VUO14kr8D0XinuJquVJ+d7wOhYr/NUOJ0
	 XS5A/wV2HktIWke5TID75p6az2Nki8BnrgUOOzGjbveliZVlQxanAfY+KDXI3F4yQQ
	 dq3O1oRqh+p8Q==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:34 +0200
Subject: [PATCH 40/41] mtd: spi-nor: atmel: drop duplicate entry
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-40-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_062318_678749_D5231F34 
X-CRM114-Status: GOOD (  10.30  )
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

The Atmel AT26DF321 and AT25DF321 have the same ID. Both were just
discovered by reading their IDs, that is, there is no probing by name.
Thus only the first one in the list was ever probed. The AT25DF is the
newer series. Drop the older one.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/atmel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 18e904962d0e..95f0e139284e 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -206,13 +206,6 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
-	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x00),
-		.name = "at26df321",
-		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x47, 0x01),
 		.name = "at25df321a",

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
