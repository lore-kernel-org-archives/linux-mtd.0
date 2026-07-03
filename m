Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B603C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjSQ7aZYCmjcOkAUW5QMV7qw2/fllw5F7/AOOm1sNX8=; b=ZHPrczgb7wLyla
	gwJdU0lsnbwlMZjGDDocKEimeRz8Sd7XhuuInqKaiKgL5LvWojx2O/1gFgG9jnKbVuPP66OLTGwA9
	345xwtYBrK8rkSevmRCgA3bE10kEeWAJDiUY7x5y2Ht9YyQ9O5nChZ95pE2LoleMBLL996Rrh5rsS
	9eDpK6k8ssqlqW7gmLLv6yGAfG3dJ3nJfdDrnpNkw6vH53g0ez3xh16hlxZyhr0/kiBGtwqJ+b6PL
	bb+m9CJliW7s27M9unfAKlsxtnIDgFTjyf2iUaqZwD7nVDgtyKVqVk5qdFYH10zQFXJdynxoRD6eg
	PjfUng5FBwKt3AO/gd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuR-00000007GYH-2iBY;
	Fri, 03 Jul 2026 14:30:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuQ-00000007GY8-1mYc
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 14:30:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B059600E1;
	Fri,  3 Jul 2026 14:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351DE1F00A3A;
	Fri,  3 Jul 2026 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089025;
	bh=gt2L7zu4tMNB+aKCwMoewhAlVK6O3ww4YG5Mxb/tDnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dPf92kdOPx+VfXFe3cZB7cEBOBGd+4/NqZucrr20Ov3/iQdxcpnWw+s8HDQKG9MWL
	 RsKOlS3IISFXIopylAIvc7F+27EF/PH3M4z0mOppqTz1CJbPwCQlhN4jAR5xq5vJBb
	 5i+iJS2fNoWT2QXEtaXrBP0959eA7eui4Qzk63pqDmRlRdGD3gRJlxLqr1XqaFO471
	 hGFqZwGAt+KqmcIZ5dvMTNZO6lq/zc9eQvYNJJvHdEeAmbzP3WiR5WW7tseE/Kb9y0
	 SATG1bB6RjtkraeAViCcfJRWH3SFWWNNOkxLaveehdRhj+PJheDs1vcQKUEbOQ/jDJ
	 USF1HoOGKmDqQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
Date: Fri,  3 Jul 2026 16:29:12 +0200
Message-ID: <20260703143003.1809579-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143003.1809579-1-mwalle@kernel.org>
References: <20260703143003.1809579-1-mwalle@kernel.org>
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

That flag was added in [1] to not "issue any non supported commands".
But since we now have the generic SFDP driver, we'll issue the RDSFDP
command on most flashes anyway and there was no single complaint. Remove
the only user of this flag so we can rework the parameter initialization
in the core.

[1] https://lore.kernel.org/linux-mtd/20211207140254.87681-13-tudor.ambarus@microchip.com/

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
