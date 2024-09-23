Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A92CF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uXmgyPTB/fEOVmqwwK35TShLEoz8zPc8Nsb3A/SBl9M=; b=GK0Ld3GkBtlcYw
	azKyj4jVOmmI0Zzw8uV2P3eBPGRBKp8Aq6OyOBVHjVjs+EiulUup1L/7Poy9kq2K8vQrMbQHoZfUE
	yC4WFfxunav2kjhads3wveNiYNGsZj/VE1o8jhrB4lvQOXC8BXxvXAsQXbCci7+AXPfbLqAjvcmJT
	zSpTCzvs77DbL6pm1B4FgUxYvyEabhcMTqweawcMaADd1TNojq/M1bP+52s8U6OVH+mn9hemwKQZi
	uUzbaJWn0vHcmhtZiLcJHbOhzAOUv0sR/ze6gthYsfz6G6Me1zTKj2SopbypR+4z4tRCS77vj+T63
	6FGvziikvomLVAN1rpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmJd-000000004um-0Ote;
	Mon, 23 Sep 2024 16:53:37 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmJZ-000000004tx-3vyQ
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 16:53:35 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202409231653266a6a237c425cf614c5
        for <linux-mtd@lists.infradead.org>;
        Mon, 23 Sep 2024 18:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=GyvpGYvhwuu7+MVYWpDrsLa/DueQF338QbwwwrxrCrM=;
 b=iYHNi7tB6dBr2Z32rsdUCtGPbu/fZK0N8EzgPWfl89HAA32sn+HnonHTozL+jJ7ic9DCx1
 aeEPhDAS1Axh5umfmWI8euvvAx7gzlB/lK47dnPAN253gUbW6S2BJXni22x/Qr0x5frmCNe3
 1h8pQlUyJPSn4jsz2z1AuFwGXWp4wC9jb5PjYwTWxSeF6f48g6Q9fN3bLUU4mdtK6ZYbCvCf
 CiUlfSGfn/KUO8U4925rRwd8NhwRGL48t0l1xZfFz62qFwCWzwt6XFBmYdBi/OXej1Tm6IJe
 j6QjTAad5GwxN8Fi2aKMoOh6YtsUuf8Sk+m3y+T7M3LxwNXpxCW47txQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM)
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102QN F-RAM support
Date: Mon, 23 Sep 2024 18:53:20 +0200
Message-ID: <20240923165324.845639-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_095334_539874_F54164BC 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Similar sad story as with "cy15x104q" where JEDEC ID comes last-byte-first.

Link: https://www.infineon.com/dgdl/Infineon-CY15B102QN_CY15V102QN_EXCELON_-AUTO_2-MBIT_(256K_X_8)_AUTOMOTIVE-E_SERIAL_(SPI)_F-RAM-DataSheet-v15_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee5bc3f6d8a
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/mtd/spi-nor/spansion.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d6c92595f6bc9..3515ede0c3b80 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -915,6 +915,12 @@ static const struct flash_info spansion_nor_parts[] = {
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x60, 0x2a, 0xc2, 0x7f, 0x7f, 0x7f),
+		.name = "cy15b102qn",
+		.size = SZ_256K,
+		.sector_size = SZ_256K,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0x04, 0x2c, 0xc2, 0x7f, 0x7f, 0x7f),
 		.name = "cy15x104q",
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
