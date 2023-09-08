Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EE9EE57F1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDtPcNmpSxhR9dzW6I/sCWDUY6I1YqCrtZ5F3PsakjQ=; b=IpClLWllY8wt8S
	nJCEimfxRlvvZBVOy0VRK8wMcyV7aSKrnHpIBvX36DVq80/YhV/YKkfI0fPgWvfDHUDcyk3l81kkY
	RyWe6WZW+5xUkAzeixg1xeAggxmoh907ZO4x81GFNw8YOrmn77GseG9DHWIz10CgPS71abqXb47W/
	hIBMsEi/hIvBRfZUI5yE6QDD9LpI91TL1t0E/8wqcRHi5qfuDOc4MoXSqtBxXMC6n4XUMAC22VXIE
	sd1xqTpUrGuZIGl9BmNIl9V90+K53j9SVqHbGrVeYEJ/qoIfvseainD/wekyxSxVj+csHK7er5+Yw
	0T4MW7hUFcY6iYsKY7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYZx-00DUrW-1p;
	Fri, 08 Sep 2023 10:19:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYl-00DTzP-36
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9YslaNHLVbYAF5RZ98e28rXqAbBYAvtOwgXkEZm32dY=; b=ToBlbVT7K4h3x4J6Pi8kxs3/Wq
	Vm+hmdRZ2YqGEK6M3+OMArhXWIVm5VHZUtBJ41pl3mhqCO4fbyO3cWLELAu3QZ0IIl67NI1avLqEW
	Vum9IYVMRShyukeRg6ie5P+3k+0rbQ7wwC6+31z5XggH4Z81ZDrfsDg1nrQsS+c5jgsT/ghn0xRiN
	kWWDPEixhEHihWVIDGkv6FXFgID4/kAlJTKPLhNxd4uL6KglCBmOavIOGs3QTklowTs3XS+WQWIDD
	TDLMa5ljv9r2r/REdDWAfCLg4lJWio+j+3WUZN7vkDX74MbIttwLPjjWGlz8MpOxKDlF0iTPqu4j7
	7/Z8meAw==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYZ-002R2Z-02
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAB48B8203F;
	Fri,  8 Sep 2023 10:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF6C116A5;
	Fri,  8 Sep 2023 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168261;
	bh=v3ofMUp8UBxPgYd5XD7XRHJNeXUWfMpXY/dIXqoAhK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KYs9Tqa2pQAeynSVO5MaBwrKZXZnwlPteFsvgPIoYFGng2+Fhw5by9XzHeYOYDaWG
	 TJKJKvS4EFsnRtr7vQSf+78bh30Tm/ms+1+f1SzW+P0qmrslxSFllN0kTVMs0B80JH
	 vuufCfAQZaS3t7/hQPz2X6CN25VfaU6+MTVuEquhYO3UdVsbiRC+lH30Zrzy6C9AZq
	 wnffu1Okh1+SWAsbNDgBFOjELfYhQiIlZxO7LgyM/dgQ6i/ka5yo4Nlkvj6YIvewV+
	 5Kej6qCHyiy+/pvXKg6Z4nWTG0e/mV7U/nkZmjCKUu7LjQppf7UtT/pDrduV6ZSRoH
	 nyixOmHDrKhRg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:52 +0200
Subject: [PATCH v3 34/41] mtd: spi-nor: issi: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-34-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_111748_630991_669C0CDB 
X-CRM114-Status: GOOD (  11.27  )
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
