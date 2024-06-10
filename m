Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E2C27C5E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jun 2024 07:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EcDXaLipfQXRf3O60E/GiJt+wAX+GbqQvqOuDLZ/evo=; b=jpEDZ0WX4FyJ+5
	boXGM4ZTFzzSxdjaa/+UBa4C1Toor5k0zjo86xdocs+jGeIxLzBVXmJjrRSiNuQgRUlGVjYPOurfM
	2G6UHgDjMSBCF4iCffrIRcVAfnxGaTn+nEhDX2rXnrQh0eCrVR8HZC0PlarLNl+WVOGFrrDPawQ6I
	EsWgi2iAVhxRVfbczS8zzM4QaAF9mJMEWRx1/EsJ6mD5otacT0dOzdgsww43MPgBp8liLK4FxPlO7
	9UUG14tBp4KnFE2m7Ahgiih4M2f8aXVaaJSBcDV1q3I5KvChyfcItKN+UTqo7nL/b410eCkwkaOEf
	AE2RU5GACqRQ4d5mQiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZlW-000000047iJ-0lcK;
	Mon, 10 Jun 2024 07:48:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZlS-000000047ge-1Rft
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jun 2024 07:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68E95CE10C9;
	Mon, 10 Jun 2024 07:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D1C2BBFC;
	Mon, 10 Jun 2024 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718005702;
	bh=2qRE8JlGLZ2v3Gb/BpOQHXVYxdux+LqVifqY0jGju70=;
	h=From:To:Cc:Subject:Date:From;
	b=mj89g7jA6W9wPM/LUrs7z1lITBOBj9JdkJyn5HmVzF7a0YuXsYtYjSF3WsiyerHUw
	 R7hkyoVeRAjW9EDb9x22cAXRab275h2U8ZXVgTzu5Mid8+ZOauy6NnHQedcCcMroiW
	 uG+TofcmkVzClfUkFZorMnVk5Apig6fT4ZUxrYCUimC5dhQJYPomMgc3TJvZZDNFpN
	 QV/hQpBDdSS2P4xRlfb6ydgRwi1NYOuFEc2wmhIbCp1EQRV3fggutfYAWA0JONyBpZ
	 WNqg+jpckVETcv9IGdBlIbM73kWAqMG7DVXxuf8bc4pExIkfn53w7hjHTGV7R/TbU+
	 7Ee8JLVxzvhQw==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	e9hack <e9hack@gmail.com>
Subject: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
Date: Mon, 10 Jun 2024 09:48:09 +0200
Message-Id: <20240610074809.2180535-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_004826_605248_E7E00548 
X-CRM114-Status: GOOD (  12.66  )
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

Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
removed the flags for non-SFDP devices. It was assumed that it wasn't in
use anymore. This turned out to be wrong. Add the no_sfdp_flags as
well as the size again.

Reported-by: e9hack <e9hack@gmail.com>
Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Hartmut, Linus, could you please test it on your boards? Also, do
you have a real name we should put in the Reported-by tag?

This will also need a manual backport to the stable kernels due to
the new syntax. But that should be straight forward.
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ca67bf2c46c3..6b6dec6f8faf 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x18),
 		.name = "w25q128",
+		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
