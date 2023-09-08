Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75636EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0gMoGfPxaFvfSO9ZT8vVw2A74atkgxZ0V3RP4TDj7Q=; b=s/GbfiBXGRM4/o
	UMVjXsWxfOJRh38xM0sJsFqSg3084iUSu72CLCjg6v4MM88veWnB0XYKazOh7uZ0DsfIxmQ2MP/KP
	miurqIdGkUPw38e0yAzoiRfK1HE3CjHUAtIOS5ijQnEg+JcVcnOGpWVGcBBUKyhF3jCqLo2FJDsCz
	itx6MMLtUvyBJUlvCGysVFKlzB2JsrFVr99AAUCpnIHZg9uvJslFx3BBu02x9MvXaj/ArNeRfkBMT
	8SQnddjol45sfziMmk/O8QCehz91N0AYqZ8Gk/xLVy3XU4w3ExtDljFgINqMeYQ3Mzu+4VSFjCFR8
	oGK2BnB29fnnHq5OgZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYZp-00DUkK-29;
	Fri, 08 Sep 2023 10:19:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYl-00DTz9-1r
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/tF8Fty4DXUTP3hrtL50pzuh7nHGopCh7k3bPWD0dlk=; b=GyqviUvXyTb/QmRMV7T5magMM8
	C1rS2vhW6iPY/W7pgD++rr2NcHlkVYeyNY5BV8QqAEKGTy/28aJ1B1U4Fftat3kFYSRFSm6PfYTtt
	dC7xw+tXDST8vT33eVJ10wvUNshKqfMfrCZnyJfOaDD1rJOgsgRHDMGycXmqibhQGyDU5T7tAFMK4
	QfkWq39/5Ky9Sc+YMKqV6G56VWcNx91gvhO9ApX3qHVgpUorYLO0+4I68Fzsz3PSaM6saxLxLquKE
	2RQfc2NWdvy4lFQTUzjv5nfRlRRDAoQSoJotfG7GElxYfqw+aITeeiJzgiVyHSST/U+O2AvCuM9fw
	kkuGuB6Q==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYY-002R2W-09
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07834B8202A;
	Fri,  8 Sep 2023 10:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769C7C433B6;
	Fri,  8 Sep 2023 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168259;
	bh=yWhME5tjoVL5WamO6J63OUfuy5+Vof54SIVht26T9gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mz1KZxbK2/ew0W+qBWQLn8SeOvuuUBsBwLQcTU58PoboZOOtj1QnVjoqhtJ/67cMA
	 p8b97PwokoqOMAUzEyRdC+ufedhNHc6DHfwWUdma2PHc1LSd0L+zQgcVh/v2+6oFpE
	 DBNeSLjQ3ulHBi4Jang+tDbKQ47ehSRvDag711rJRxruWdtptAGG4Jti4aVo137iUq
	 EVC2kDFNW2fGIU973bEUU4oymU3fX3Z8SABZzho0YKCdm+oWQDvENK/17vOE6vMOxH
	 GozmAN5CB/xbzZLwRxoW7Dm08v7UkB2DVnUFLrKJP2aNiDu7NyTS6U87YTEPQHxFvr
	 O2iyJscdV6I/A==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:51 +0200
Subject: [PATCH v3 33/41] mtd: spi-nor: gigadevice: sort flash_info
 database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-33-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111748_140685_16C50822 
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

The flash ID is the new primary key into our database. Sort the entry by
it. Keep the most specific ones first, because there might be ID
collisions between shorter and longer ones.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/gigadevice.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 0d22cd99715b..ef1edd0add70 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -46,30 +46,12 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc8, 0x60, 0x16),
-		.name = "gd25lq32",
-		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x17),
 		.name = "gd25q64",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc8, 0x60, 0x17),
-		.name = "gd25lq64c",
-		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc8, 0x60, 0x18),
-		.name = "gd25lq128d",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x18),
 		.name = "gd25q128",
@@ -82,6 +64,24 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
 		.fixups = &gd25q256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x16),
+		.name = "gd25lq32",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x17),
+		.name = "gd25lq64c",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x18),
+		.name = "gd25lq128d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
