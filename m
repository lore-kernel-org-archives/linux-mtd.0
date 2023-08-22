Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB54EE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm/CxVJm0jry1XGTSl0LXXhSl6kmq5drotZbLyBHO/A=; b=dFqEiUFVkcr4y7
	Y6N5oQ7rIMYkxcBWhfLssJEdc1lJgpaY2zO0ujxxhhCVAykzcYXdcTuwR/8tDaviBlyJRcJtv3/OK
	gzex7JfghHhS6+Q5mhkB6apR7Se9bQaWz76EhlQzPZ6cVFVatbHPQnwZdTx9YMSSG3/TOf3CgF1qY
	SKynS7URnG7CyEnPSGlp7j21nVOLqKoh/5XwY/QJBO0nvZaUuIOLVO6gpDuv6XzMPfo94UR86AePM
	DUM+EsEsqWl2paNBVvu4Uv27GbR+fd26spIyzi8ZGXVkqJh/BibRwr67wo1SHL5EuN1uR/n8KUr9H
	0D1J9U9ApZ7ffIu3ob2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWw-00FIJz-0b;
	Tue, 22 Aug 2023 07:10:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWr-00FIDi-1J
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D99E364D7D;
	Tue, 22 Aug 2023 07:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BF8C433CC;
	Tue, 22 Aug 2023 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688216;
	bh=1nkVQlo/pntUPcuI8tZ3St9xyXgZLdanptrUEPEewkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LFoG8gSTkoJhFzHczhh0BgG1vvx1AhRxcZ6OoMDfYKnXyyyhpwNUEYjCA9ve1azqj
	 8LtnjVqRwEjf9GLtLDdXOGd94DJBgRxvEW7BAkFDsknGu5IX9US1erettBCjRCTXcz
	 mU7krvqFmZcLSG24J6SH3LTW0ii5F1divg0Rrq9lQA/wUTd6K8TIcmcsjb3gWoui9O
	 HghvIeUnwzAKnyQZCvXXHDYSi8CondZsc3Doh5fl8EIRYW9tMHVLtjv6ayeYZMvyyP
	 UqPPXMBk6stxJB8TlbWd7k/IrnHK6MmxZejXcxL0aw2/Y12K2xvwKLqgyHgSK/cs/K
	 YAByhxOkqJbSA==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:36 +0200
Subject: [PATCH v2 20/41] mtd: spi-nor: everspin: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-20-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_001017_524409_F701EC9C 
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
