Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6ADC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FnkRQ+h/WrRMEhF/hEZFVsdlL8ATU09BYTglKeoRbk=; b=u9RFil7nCzWG1h
	6pAVx+gTcRa4Hf08OgbeEnSxFYB4KkLwRiqmV5NzGe82OeNyZi5Sudk/oVpQlcY+buZ/wbFzHFX5c
	Zot1TYazykPGUH2jSr2WPHr82237vGuPxT5sGAHSJAPwDZ/wp7iFcaGTByfn2Z+B9EVOJrGUc3TDg
	hQp2aNNeffxsHwq0OF/4vy4Vg6STe+jwQaL2r6nKG4f1qnKezUZtEKvIch/yYV8hliiXLCYEPZ6ou
	lknKiRIX86EQBApMUrx2swssZoskjUNAXFgdkPoSdwkGX7r5vALtHCmlx5dS+ys5RwWGiqCZLVwmx
	bBwM7yLS+qq1aZSaPtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BQ-00HKkP-0p;
	Mon, 07 Aug 2023 13:22:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BO-00HKih-0i
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBDBB61AAC;
	Mon,  7 Aug 2023 13:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A71C433CC;
	Mon,  7 Aug 2023 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414521;
	bh=i6brw9U/L+6pC4Q/XEJT9zKna/1DXXdaKKQQ6GTutFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WjCgyrlmel6WUBY2FHUMxCT30g3rE5bHGHYOZIhu9qfsOfDkqvhbgAqjzAMVc05Ly
	 EC7Hk0Bkf8axBddEhvOVx1dTzOYXy6zEtOsCoDqsxk394afqPEL65qHlelTUIgEp07
	 xwcIWB5S3+PmM4Tn3ihwhIwwv6Rk50EA24SZprCrn0GPXb1AzIutoQvuiwTGB8JIpI
	 oKampRSE5QxjNM+DrHyI9lllb5NmEZ65syLJ8jbnznTS/eT1bGisV3M9SVhVQfnpjC
	 j7jlro32sGTVitcMdDFRGtqmpxf2ujEnEtsSBXK5VNDcwdfaXlRRK9CSUeKiUGEuL6
	 /nzJuoQzn3S+A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:20:58 +0200
Subject: [PATCH 04/41] mtd: spi-nor: xilinx: remove addr_nbytes from
 S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-4-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_062202_302623_1871B478 
X-CRM114-Status: UNSURE (   9.07  )
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

The default value of addr_nbytes is already 3. Drop it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/xilinx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index de5189c38432..34267591282c 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -27,7 +27,6 @@
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
 		.n_banks = 1,						\
-		.addr_nbytes = 3,					\
 		.flags = SPI_NOR_NO_FR
 
 /* Xilinx S3AN share MFR with Atmel SPI NOR */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
