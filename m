Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D27EE49A5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuW4hL58RDwzfkhLY13LcCeob4gkITmwv/NaaOqj+8Q=; b=c8W6bqUyypATMZ
	7L4obSiEFz+q7ZMJ+Mrx52or6ufOP0AK6of3b266rS7NWFORRaDCYoLePFjYYaCZxVft6jdhngwi6
	5JieSFwnwmXKVGEIGWNaVb0HqYGduuS/iy7eWup/DHjAAJ3jLGyqeTs6hgrMKE+pF/YILKgViEGAg
	JOXpg6/tqWVIB1U49DZ8hj81etTFmHMBjr4LpOcurUak5kBhdQAv5/hIiD897ODCsd71bx0FxTpT6
	TowhuC8OLVXUPx0yKiE4FRNG13t0v86+hgBPz9Ad6z397nMWjt0gBr6U79bTFlA3TOovakBOxsY7i
	WVIUQHL+0Gtub72urzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXO-00FIlQ-1t;
	Tue, 22 Aug 2023 07:10:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXL-00FIiN-1J
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p8hdANQA1b9rCbgjJAoWiL5tuHGhYruY3rqCZdifakg=; b=XG9Y0aWbzZ14EO8thurd0TZHlx
	oJjKEd4abr8jSS2gKqQZT052CmTCxEP+NmCw6hz+CtxL5J6NGqM1x2GMIbqhe5XL5BpMi6E1lEN9K
	aEaGrAiq8+AvYKeS7XsBs2M9L51uiIMUKWyMT+Unw3V4nsEk4C2KMsuhHRMQ20FqTmbJtF9C2JowZ
	HiMw/xp8/ptk8D3nGD+vPo1zq1y7QMGixvEPC02L5O1fM/WkXNh2YyYONcUUZV4G3kXCnytXnHHML
	9nZgcQ/xFui7Du5I1vJAjiT+vnWQ8Rh6yiQ2iUsWVy9P59X8OStoEq1V+zfdvUasHPUOWECGKjSsq
	CSvPU4fA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLX8-002YYo-06
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF31364D87;
	Tue, 22 Aug 2023 07:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB66C433BC;
	Tue, 22 Aug 2023 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688220;
	bh=pG2FdGd2bZ50xpBr1ZIaO+fF4bmW9tYC4LsRjQC4xQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AoMaX57tssEMHT7Lw/b1VgFDu/uH21dVi3RRPacPIp9oLcnrUliyNANPdFyDYBMzl
	 sL5XNZYaKUpmo4JKg2GgaM8/Gc3Jch/Bkgxz4Jlyn1ORuH+xVnpJ9fH+HAefGIZb6g
	 RIW6d+rNRgPiVsJJWqfwljf65Cd7v2HXvUcwf6vzL9gVnLrWX42/hzIzIEG2dfho9Z
	 KnPXlT8NYWhl2Aqpp1helhHCoGW871VfnmEcCghEefgGUtKD/Ewknthprj5RSWkadv
	 t+GE9EpgHyVkINzZNKcJojlEA3ZuxYFc3bLD9jkFDFB+Ri5b7jtY6nTZjy13x5nehJ
	 Kmup4dPWR3zvw==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:38 +0200
Subject: [PATCH v2 22/41] mtd: spi-nor: intel: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-22-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_081034_327291_C64DA630 
X-CRM114-Status: GOOD (  12.11  )
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
 drivers/mtd/spi-nor/intel.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index aba62759a02e..f647359fee7a 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -9,12 +9,22 @@
 #include "core.h"
 
 static const struct flash_info intel_nor_parts[] = {
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+	{
+		.id = SNOR_ID(0x89, 0x89, 0x11),
+		.name = "160s33b",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}, {
+		.id = SNOR_ID(0x89, 0x89, 0x12),
+		.name = "320s33b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}, {
+		.id = SNOR_ID(0x89, 0x89, 0x13),
+		.name = "640s33b",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}
 };
 
 const struct spi_nor_manufacturer spi_nor_intel = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
