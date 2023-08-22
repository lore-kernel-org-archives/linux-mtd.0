Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6726EE49A5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fEuzSPoS8myUt+Ud3UATv0BnRlMhAmDVuCMJSOayVM=; b=g+a0pAXXmaO829
	yZfka9JH3/8dIHQLxNx5WCyl24BCGWWzLvvKJXVesSqIBCfSpnwoglLOfXQ42M39/qoI3msSKXm4M
	0xZhcYEgsAskUllDzs7bfKzi7iRaToUOZjXHdAWPzTSxQggLeWSKGtfye9X+V6lwLo7np/3IdJn9l
	hWxJ4FdBqhFdHhlVvsK0JdNORvAQuIOr9p+f3bytgbnoCn9+PB7ISi9JSV+ZyYAYJHzwebziyZwoa
	DPzCNj0IhxdlkDzrgoSu2sMae+3ITke8A+GzKZ4JoQ7ypzvlptmWVlFDJTNKR0psNVo1ngAeXfy8l
	tVO3e7/jMnOmTu01gk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLYS-00FJrF-0q;
	Tue, 22 Aug 2023 07:11:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXU-00FINA-2D
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C01164D98;
	Tue, 22 Aug 2023 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3631AC43395;
	Tue, 22 Aug 2023 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688255;
	bh=fjBFDwKo3KO8ngc80qTC0rIJuf+fwM3TGfE20y77Uv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YE1Mib6Ug8Ta3uwzoFl9oucsyTd3ubHd4ane/x3GVAUQFLgbwbfGI6TiqJQvKOZor
	 t0NsdwnM/kuXLGwbyp8ZZaI1mW1Al6QVqhK5uuZ6YJ8cZFdC3J2PSHFSselo3xGzDf
	 ocnDua792rRtXfkNuAlXZlPVWcWNl+rJJ1TgtDsJnPMsBKPL7fClWXhzHBZauQML6X
	 BE8Zb0pCv+hNUrFIEaSCviO3hDkSTe6Q0ZXNMysQLroC2mx5b9RxtFgwpvHJhT1DvS
	 fr6r32BnzLS5X2tJckXiokL45nDK/6PETGjJNftVvZM5x4slXAQwaf3aKSSUyrbV+Z
	 M0/J62162vJmA==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:56 +0200
Subject: [PATCH v2 40/41] mtd: spi-nor: atmel: drop duplicate entry
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-40-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_001056_792905_F378AB61 
X-CRM114-Status: GOOD (  10.86  )
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
