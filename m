Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC7EEE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm/CxVJm0jry1XGTSl0LXXhSl6kmq5drotZbLyBHO/A=; b=OCvzJl0oMr1ccL
	x76Sqtm2gI8falU0Gap/KZhhrxr/AyzQSpGGXKfuSaCx4yAFZqrUqiiOJaxTNw4LNuW1piRcFCVRb
	2Ao+m2flJhJlBBZWy3MZIKyWv6pv7kjRyv7vLOD4z2+BeOxIL36JQ22YXFGuOTLHf0/F6Z/+FyeHG
	6P2gE7zj7kGI+1NnqzNG9TnybI+48g0KnRdgelxh0KY3qG0VfYTN2XQ+sMK7RZIzPNJRBGaRoSdOF
	mm9+Pbr4o0So6kqMU9lGOCCrHaM65+CzlonBWNVOlN+FvUZpzaohXWJ72F8Z2lkthyF/1XSkhhTbE
	sNBDKY4xPH+aRdF+QSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYN-00DTZq-1W;
	Fri, 08 Sep 2023 10:17:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYY6-00DTIg-1S
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4B84B82034;
	Fri,  8 Sep 2023 10:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB932C433C8;
	Fri,  8 Sep 2023 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168231;
	bh=1nkVQlo/pntUPcuI8tZ3St9xyXgZLdanptrUEPEewkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JCO3juMKBKUHreqa3eAsFhZSIp8EJtJQpDyoZHrs8QtrcMXaZPJ09k8HrNIhKTYII
	 1a9jbmadN0qCrcBsA9t4rH3NXE/1oVUlMAVqgKkIN0j/VxGvFc0XE8OLcXjGuvx1D/
	 4k0fVQ1sRKYYbMFRzs4/VSsBqugKutx1rGtMoD/zZ4eP4JXvupTTCp9+9PiKd5MWAr
	 Iw6rawcMGddXHenu046HpSSWsczv2sV5Jz+P9sO1xTh3kp4e2VkPuGNcMlfA4kXWEi
	 kblFuL34U33tWIpxLbWq9zUq7IGFHrU+V2M806d9FT5kpzJlH6ohNE5d0fVr320cjP
	 vxJ9Vx2emWHRA==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:38 +0200
Subject: [PATCH v3 20/41] mtd: spi-nor: everspin: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-20-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031714_659266_87DF0C7B 
X-CRM114-Status: GOOD (  11.22  )
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/everspin.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index d02c32f2f7ad..46776bc10b27 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -9,10 +9,35 @@
 #include "core.h"
 
 static const struct flash_info everspin_nor_parts[] = {
-	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2) },
-	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2) },
-	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3) },
-	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3) },
+	{
+		.name = "mr25h128",
+		.size = SZ_16K,
+		.sector_size = SZ_16K,
+		.page_size = 256,
+		.addr_nbytes = 2,
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+	}, {
+		.name = "mr25h256",
+		.size = SZ_32K,
+		.sector_size = SZ_32K,
+		.page_size = 256,
+		.addr_nbytes = 2,
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+	}, {
+		.name = "mr25h10",
+		.size = SZ_128K,
+		.sector_size = SZ_128K,
+		.page_size = 256,
+		.addr_nbytes = 3,
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+	}, {
+		.name = "mr25h40",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.page_size = 256,
+		.addr_nbytes = 3,
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+	}
 };
 
 const struct spi_nor_manufacturer spi_nor_everspin = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
