Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35CC001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuW4hL58RDwzfkhLY13LcCeob4gkITmwv/NaaOqj+8Q=; b=yVKUm/TOwO7NOL
	L2VtD2unD9bShFQW+evrTgep++nRFywxdy2oA9WM117MZQchA6INY/xGwyiaCEhzBLPDnXzBsgqAP
	2ZXijJF/TjUaDuLNqSUMdMOLEFLAwR4Awko8iqo/G4gCTGNGVCx76J3/045gcQNmaqJwxsFXW8hoL
	kw+1U3f5JTOz+7F2qj1BqfWVZjsMTHzEfyk75Ug7PSRiquMITU6bladJQ56YF3dn0085NPocAmOd3
	pY2w2AU+e52vp07aHWgF/SJjxH2Gpr9gODvAY0r2/YWA23q+ysqXn4dA4Ry0cDGNOJGYxsFn2z4PB
	aC9KtUV9CCptmNz1eEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CM-00HLeO-1j;
	Mon, 07 Aug 2023 13:23:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CF-00HLYP-34
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p8hdANQA1b9rCbgjJAoWiL5tuHGhYruY3rqCZdifakg=; b=YLHvMIEfDDG+bHMeoaZ4Qxbtz7
	m6WCB1m+0ylXLyZi9EfUSGYCbqoiBHpNk98dR/Ekyzq+AykSE9MSAjUIbGVUZiicDzN3MruzLIGez
	ovNxDbgyheBYx2QziGbLaIV9JByEtCJMf4LgVYAYnBPlo+EyJrs+PNrkpUq1pW67Nfrq8zqi90GnS
	nHm/1E/3npevAcNQwunZbfOZlUQKlMc2SAMkt35L3CW99aAukQBsLwJUSM9AGhBxuuhWoYZQmcin9
	efSe3JR34cv87YflSe3/RkKmMde3EQiAH3pXa39s6RbFx9NuwUuAcqbNjQazyNuFG8kiYXDN9btji
	DP0cCH4Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0C5-003qdP-1l
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C13461B2A;
	Mon,  7 Aug 2023 13:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854F2C433CB;
	Mon,  7 Aug 2023 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414559;
	bh=pG2FdGd2bZ50xpBr1ZIaO+fF4bmW9tYC4LsRjQC4xQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oU+DQXxD2tL6/hASsZsagEicjZ1QH7W4ZB4wwT6CfjqRpOixKepcpv3d/lB2A3RcJ
	 gTEeIqfd9IZqK1y1v2EgvQ1/qNY6ZBKZlGXsX5+bpNvvhzgR+p9Uc2El/lYApVrBbX
	 5yQ2bTvbvfK4Q4M24WDIuQ3a3VSpchsNvctQGaKlYDjZleYllxbO0a3mY98QlPz54y
	 LbcbKZstMh9wHaPDcjRbEyFBLf8krEvdPVnDmH+E82OV/inrtHMXQ6T+zeExMZdhAa
	 hxHFlVGez5BQfE88dIFquSGFjmSi/IXs9aVji76gO9JkNmQyG3ITNkdTUB2a6Nmmzz
	 DmuhBbN6ZArfw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:16 +0200
Subject: [PATCH 22/41] mtd: spi-nor: intel: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-22-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142246_107116_F485A035 
X-CRM114-Status: GOOD (  11.55  )
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/intel.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index aba62759a02e..f647359fee7a 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -9,12 +9,22 @@
 #include "core.h"
 
 static const struct flash_info intel_nor_parts[] = {
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+	{
+		.id = SNOR_ID(0x89, 0x89, 0x11),
+		.name = "160s33b",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}, {
+		.id = SNOR_ID(0x89, 0x89, 0x12),
+		.name = "320s33b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}, {
+		.id = SNOR_ID(0x89, 0x89, 0x13),
+		.name = "640s33b",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}
 };
 
 const struct spi_nor_manufacturer spi_nor_intel = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
