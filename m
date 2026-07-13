Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8D7C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjSQ7aZYCmjcOkAUW5QMV7qw2/fllw5F7/AOOm1sNX8=; b=PlRyeaEtTzvbiZ
	AzQWA2uItlU7X9zG3gtJMi3U5U4ckrLQzr8AO14pDpQPyl2CbyIajFvF4aknsNUzYdQ/dLOIBDtnU
	8PLoBh+0h8tZu1HYxaWT+1NslhxDeW4+zAUiBIa9uL3FIHTa2oTrjHQ/N8RdbXdXIM/hJdqL+vIwh
	fNG+sZSe94fHNfAiAd5bzj9ceASjsXWtmaPIOTk6uFO6PCChvOFGTxXsErLNjCv6GJeB9Ye6LJ1VU
	itQgTLT208Sb+z3uXAfx9gKsjTRYvMMv34hi3C+qdZqDrzl7DunDVBWZcj+gG7/FkO33oYQQ26iqX
	f82HrsIpKTvehw0N8jtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi6-00000008gFW-08Sq;
	Mon, 13 Jul 2026 09:12:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi4-00000008gEp-0YPw
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 83CA343B55;
	Mon, 13 Jul 2026 09:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3201F00A3A;
	Mon, 13 Jul 2026 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933939;
	bh=gt2L7zu4tMNB+aKCwMoewhAlVK6O3ww4YG5Mxb/tDnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hozDTLkCas4rnDc+nLWgs2dYWwjYIaNJdwt9nTO3+I1SLuPSy6Q+9OnMEF2/7srcB
	 5zJnCTae1Hk9oFBLJeYaMs1p4oxfgK/7KKxOZqYaCPEJQ4sY/AEzb/8hXRqJTGE8E3
	 xTJ1zvqyNP54oscOy6SxuPVAdvMCG5eRjwAYVxsa0gEtQK/zInDlCJ+Z+0pjeZ+vJ6
	 EIHdLhRPMV9wbmJTLAUiPf/ynZZF3gbwFknimZoqlBYPi7Ikyu2PQZk9IU9A9PzgWb
	 681vv6MQUIl+6AYJKUw/2Y4LxQa7nzI573nYUw6FwZFuokRSq/0rl26Ijguyrfh3UV
	 nitVMdMQxnggg==
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
Subject: [PATCH v2 1/8] mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
Date: Mon, 13 Jul 2026 11:11:39 +0200
Message-ID: <20260713091206.2414400-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
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
