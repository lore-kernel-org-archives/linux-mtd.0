Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01289EE49AB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDtPcNmpSxhR9dzW6I/sCWDUY6I1YqCrtZ5F3PsakjQ=; b=TtS8laXKs5lFtZ
	oUJ6GAwiqfg9HJjxjRND/SI0+qoDrVli1dJyO5d/MSFEAjdT5VdRj1iQbNvGt6Sufpu2QhWhKwRuY
	h/gU5zEwu5quWLOAEabli4wT65X3jqLUiQ8pbQ3nXpM/nwZn2W4UYHjavjR0UQSJ8oSh1VH28nfoL
	8mTTW173gY4Nc5HXZ3Y6JttEyLUvJ4QKjSWc52mCqU+kgnGMm6VAm/a5RETpmyTBtSgxv5ckrAm5w
	x/XZf6wojmKL3HCgOhZcUg2nQJ6PuPQsJWVCmqZMtyQjXi2t4iL44sWOMHzhZHn90Pd18BXaimFOh
	tRdaBNoAxvRqa9woN01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMXs-00FRCJ-33;
	Tue, 22 Aug 2023 08:15:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXX-00FIu6-0k
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9YslaNHLVbYAF5RZ98e28rXqAbBYAvtOwgXkEZm32dY=; b=TguhTF5S32rFJH2RL9q7C86CmL
	Wc5eUWCQB+J74kBM83MVg4R+BDGJbzAKkAHFb5wBxLxpAAc0q1YVM2f5IJAf97/rNQfm+3Gk5rdx6
	ZtO+KdzyMNppogdMUDoD5gpWGILNDyb8dvQcKB0xOZ0KnlrhwmIos7dBBNegHCDIiTIqNesMR9ArK
	AFZeUg+tbKbRiNeDYlNML74Nk9mmk4SWMFtJkPxJTD7BOD7j2MoSKkmEvToyHBa6meaILPZ5Z4o/5
	KiMXvI9dOQTxjexqSb5J7QRcVWYkZ3MhiXoYGKTbYN+/2UAHO0oV5kNcbDLGlpyK004twrA9MuAVp
	FUgirb9Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXM-002YZv-0w
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C54EE649D9;
	Tue, 22 Aug 2023 07:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868DCC433C7;
	Tue, 22 Aug 2023 07:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688244;
	bh=v3ofMUp8UBxPgYd5XD7XRHJNeXUWfMpXY/dIXqoAhK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SaBpjt6h6+n3fiJPsFNOmARNmuwiDNGGpy+cJJvo7J+13rOYYAm+eJOrmtHlHuKM2
	 HfGxZX7lPtX3ihxgp6aIjTsfJY2IQ83/g19mHBZ+wCSAwKVf8OxdW/ORMDeDllaS5g
	 3AVhGkwKiMN/ok0pXBDBqWOylpVfb0/jZNZMOVFOTlv929UWO8/3EPznG76rdLLvhh
	 ieqqTye7pAQnkRawCbbYt2GCiDE09mzJiZbwl0k4IPJW5ZhkIw648WsYWkZ+p61re/
	 qhW+15lCqr1FBZiO29Md1Nqb5ie7yjA+ZSGdzhO882QKqtzQmLJ+8E8huscNv7bex6
	 t1vwmfVu5l3EQ==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:50 +0200
Subject: [PATCH v2 34/41] mtd: spi-nor: issi: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-34-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_081048_794870_85B9BE52 
X-CRM114-Status: GOOD (  11.51  )
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
 drivers/mtd/spi-nor/issi.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 9478f1e61626..18d9a00aa22e 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -48,26 +48,43 @@ static const struct spi_nor_fixups pm25lv_nor_fixups = {
 
 static const struct flash_info issi_nor_parts[] = {
 	{
+		.name = "pm25lv512",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &pm25lv_nor_fixups
+	}, {
+		.name = "pm25lv010",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &pm25lv_nor_fixups
+	}, {
 		.id = SNOR_ID(0x7f, 0x9d, 0x20),
 		.name = "is25cd512",
 		.sector_size = SZ_32K,
 		.size = SZ_64K,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x7f, 0x9d, 0x46),
+		.name = "pm25lq032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x9d, 0x40, 0x13),
 		.name = "is25lq040b",
 		.size = SZ_512K,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x9d, 0x60, 0x15),
-		.name = "is25lp016d",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x14),
 		.name = "is25lp080d",
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x15),
+		.name = "is25lp016d",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x16),
 		.name = "is25lp032",
@@ -109,23 +126,6 @@ static const struct flash_info issi_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-	}, {
-		.name = "pm25lv512",
-		.sector_size = SZ_32K,
-		.size = SZ_64K,
-		.no_sfdp_flags = SECT_4K,
-		.fixups = &pm25lv_nor_fixups
-	}, {
-		.name = "pm25lv010",
-		.sector_size = SZ_32K,
-		.size = SZ_128K,
-		.no_sfdp_flags = SECT_4K,
-		.fixups = &pm25lv_nor_fixups
-	}, {
-		.id = SNOR_ID(0x7f, 0x9d, 0x46),
-		.name = "pm25lq032",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	}
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
