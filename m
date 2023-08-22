Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC934EE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV4vSkV5/k0xXl2Z4oMqx5Iusa1CYRsRVf6hwX06dUk=; b=A9C0jLQIhBWhXe
	pIWEoWBkgljrwrqmAamUUvS550wBsC032LucqewCvrN1lVe6Si59Xq6wHMLu8wey5zXyLETBkBAfg
	CELOAtrnhUXBLFxD6Pji7hfVp/zH0ds6O7j6szVd/b2arAtVFIGVD3bCziLaxiKWdJsPI8v94kXdS
	vIMYS2ghYgw850w0/wXSjnhmXpA0vXgObrNOBTHNVuY0C3+radPlHa48GmL0hb45p4lPjHwBgUqfw
	FXSSQkeo5ihycpPZUyTHDckjkYur5A9tIj5abkFMb5/8xHEpqfeEqqdQ+JE6hWLzsVoPRscDzdBar
	u5RnNj+2T3016XxEi+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXS-00FIqR-2Z;
	Tue, 22 Aug 2023 07:10:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXN-00FIkX-0F
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lzFMLq5C8DLKsmAUmSbgrtFTdLVMVS5UYOPX/vppCYg=; b=PfTH9rMf65c/9sehl8++PxIl4a
	+ba75Na9y+jG/5cFeh+48NIfna9q73nNHh/GhZmunVCMoZ48YffAtjmvtJ366hSXykGhvWVetyLcv
	hxdVxPjnwmAl25i0/cPGPkmtUPv9VUxUqxsRo5QyMyyPLLYwFuslwV8uAufegjFlBkTZbEQW8LSHU
	1PCsVCzyVIkD2URa1LFNZl9oB1jAA60R6nRJkdpFgIgDWVd5+ifYqKNGA1p3ELStrqK5pSZg17HWZ
	Om1cysglN0JwD6KnHCuqcY+xYEx1TPGp98pfhiVRMshYTQ3ZYVPkproUwLvb5qOOYUx3zgz4tFvz6
	X3fuRXxA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXA-002YZv-26
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1021663094;
	Tue, 22 Aug 2023 07:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6466C433CB;
	Tue, 22 Aug 2023 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688234;
	bh=EyuDNaE5JOFL0ZQ/K44CuNRKS87m9hVeJq1QWqZcq6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sp7b3u+PWApSoU/k5kQtDAbpB3iK5by3FUYfWHuflSPkPDiJHvzuE8107LItsmPX9
	 os1bPIEs6+lQguKVm+Dvf/Na9v7xZsUAJumSxTfjYvOIayeLejIFXWzeiLcIBxPcJG
	 YIafoDOTy/PV8SuNu9H8WHJtdwwpGt6Xo0ppp5yme0Chpcu2JENtM0Zp0dO5ooqtfU
	 uyVQbThIvukFSCfosNt4UgBy+5myyWJus8LRMwyfLHMIBdoTLpnoiyUp4HJijLpLrz
	 6yPJz0hF2zTKnmHJfW3K7dZQ80xg9+Bd6YYAKauwwb8045/v3JUrRKsJGpH7WVZAXG
	 XZitwFwwH2CsA==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:45 +0200
Subject: [PATCH v2 29/41] mtd: spi-nor: xilinx: use new macros in
 S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-29-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_081036_986732_73BD9E23 
X-CRM114-Status: GOOD (  11.94  )
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
