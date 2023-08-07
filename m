Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB95C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV4vSkV5/k0xXl2Z4oMqx5Iusa1CYRsRVf6hwX06dUk=; b=h59/D+OzZrPUz+
	fmUubByBJMsCukUwmri9PM2moLNJ9Lh5baQYvFuataSVkL1w2UnzFdZzmopJ2HEiCZwvbv0Yq2srA
	Ma4UL0kevGUw+V8nBFByiPeJFDVoBE4kwSBsp55b4zPZmthexnfZkShCp+JJfq2yQmdjqOr40rr6K
	uV8JVbcCoGs0FnorBJs+DbNv17SSyQMrWyyxbY0gx88F5VxapaWLaWxcMUwKMtfqI9hfbCC/1Dv3M
	iK/fpntz3H6Xcoxj0K+TJWsmtNbI3Fr0Lga9Fy5XMjJ1wOwNwPxvh1gxLbQPrz6+q2Ck9XzOJHfpm
	xVvkJcG6L5A7GpD3TIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0D5-00HMNl-01;
	Mon, 07 Aug 2023 13:23:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CL-00HLdb-10
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lzFMLq5C8DLKsmAUmSbgrtFTdLVMVS5UYOPX/vppCYg=; b=kvokkpp/+i0OBuw06YOi4+2Z9T
	FEQfTyBlireH9MA0UZF8S+PMY8+sWIXn6vePUHvlabyfnG0zxQgeQoBrOMsSEa9UQanLt+R+ii3ly
	bz1vdTrRQP4m77Du1APUo3MNNS1FMmlmZKToLyF1NgdMRB0eNELdjTuYr2JoL6wbXe1iVbIJ8ZRC7
	ZSN7RKi2+HCIO96r3MLG17DnFXvfPNDLY0OQ/EUYdw6Wt1/sV9Ve70FWXIn+B3nlWXN01D8UDbKWR
	WqtRBrxNLlEqEVPO/RksxoIHJ44uxatIPODMq2z8uVsxbp50uLtJtvrJkBfcwiMiYFW7rbGHpMmu+
	wrNsKfsQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CG-003qgE-15
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 977776192E;
	Mon,  7 Aug 2023 13:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535C3C433CD;
	Mon,  7 Aug 2023 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414574;
	bh=EyuDNaE5JOFL0ZQ/K44CuNRKS87m9hVeJq1QWqZcq6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iSKsVsqfX/2z9UasmUll/MuIlbesMuNKfOKMo+3MG6KgzrrToj8aMB31r+/uIxcNp
	 T53LbfUO4pUuBTy2W0QBrwA7b3xChhZigbfOivgKBBtjgGll6V0oZZsQ2OzVQRhtiV
	 UhfDDCdUoInzJS/Gbtmt5qCwvoeroVAtHV9bnuGtU2kK6NK5haUuINgfTNZLuuCuUP
	 slu6CcgcOjvPBSi2QhrSPgOgk/zT8b1DJEgYdk6SnHTs4ti0m3fajd5nlZyi3CpLTp
	 DRhKa4vmWqvftJ+lP7tqeucTJHBQIcfn+gBC0pK8BCW8/iUCaN6Dc4Kd279COitgIn
	 uV+Ifj8wl7yUw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:23 +0200
Subject: [PATCH 29/41] mtd: spi-nor: xilinx: use new macros in S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-29-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142256_989557_1D50EECD 
X-CRM114-Status: GOOD (  11.38  )
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

There won't be any new entries, nor are the entries that much different
and the very odd page and sector sizes make the new format hard to read.
Therefore, convert the old S3AN_INFO() macro.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
This collides with the atmel flashes and there seems to be a typo in the
IDs. All this makes me wonder wether we shouldn't deprecate the support
for this (FPGA configuration) flash.
---
 drivers/mtd/spi-nor/xilinx.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 8d4539e32dfe..f99118c691b0 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -21,21 +21,22 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
-#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
-		SPI_NOR_ID(_jedec_id, 0),				\
-		.size = 8 * (_page_size) * (_n_sectors),		\
-		.sector_size = (8 * (_page_size)),			\
-		.page_size = (_page_size),				\
-		.flags = SPI_NOR_NO_FR
+#define S3AN_FLASH(_id, _name, _n_sectors, _page_size)		\
+	.id = _id,						\
+	.name = _name,						\
+	.size = 8 * (_page_size) * (_n_sectors),		\
+	.sector_size = (8 * (_page_size)),			\
+	.page_size = (_page_size),				\
+	.flags = SPI_NOR_NO_FR
 
 /* Xilinx S3AN share MFR with Atmel SPI NOR */
 static const struct flash_info xilinx_nor_parts[] = {
 	/* Xilinx S3AN Internal Flash */
-	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
-	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
-	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
-	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
-	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
+	{ S3AN_FLASH(SNOR_ID(0x1f, 0x22, 0x00), "3S50AN", 64, 264) },
+	{ S3AN_FLASH(SNOR_ID(0x1f, 0x24, 0x00), "3S200AN", 256, 264) },
+	{ S3AN_FLASH(SNOR_ID(0x1f, 0x24, 0x00), "3S400AN", 256, 264) },
+	{ S3AN_FLASH(SNOR_ID(0x1f, 0x25, 0x00), "3S700AN", 512, 264) },
+	{ S3AN_FLASH(SNOR_ID(0x1f, 0x26, 0x00), "3S1400AN", 512, 528) },
 };
 
 /*

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
