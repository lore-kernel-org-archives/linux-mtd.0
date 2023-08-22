Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A275DEE49AB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzjZzBb2/S6sBIjKdXflErxeV+YV/GgImanwi0zVMOg=; b=qyc3tJetn2hPqQ
	zdWSUzYAkHXqQyJkxpkyaoxxfMW/Xq0reCHu6wncml82jt9VneTiXyhjfbc1ipe2gab9jmFT/whT9
	M7tgQtg2aic49k0HzfPOqnQ0ePFjkbl2Xf2RUzxujk4nTkbDVUXTcBvwGE0cz7QTvISH1/V6KYP4e
	J/bNpoTbUGknh/oTMjzOb6o7k2VTeHWKVdiXyuiXst//WOUDJYKThKHbCmf1TKUcFdVRbZVA1kEJ4
	0i99I11D59pQGclF4pkSpUcMJxizgfA/ON8LTUc8wme03emzuw5MPtOIP72n7w2tCR9nw0M2l7hCU
	MhEwD8XFb9W6+17uJGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLYA-00FJZB-3B;
	Tue, 22 Aug 2023 07:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXd-00FIzo-1S
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ETsx/pSVgscKja8L3nLx8PkGq34Qk5mef6qRPgV8VaU=; b=RYQy186XHv8YmkhceGkDwY1djp
	jWhlAG2RdzY39iw9lCC8tpldaJKRBbRi/u/QdUT7yRbUCXE5BuOatR47IBVBE5lL90VgiBYspvaS4
	g3QWT0KyBC17oCvEVJseQ73KT1chejY23Cb+WzzJNf5FToCU3cohV7TN9PN0hHDeKPgA2c261Cxf7
	hqsRVgBej7tDh2Z6ANIrI8t3tTWM7mZEI0/5zHKijleqTN6NwgJ8HYDf21IJq+LcZSXGR/N8vqv3j
	kNHYUHI8gOrIb6ss1/ra+CPkwY04FM+UISJD+wdT48LvFaIxZa8iBspXDfq1YKM0drmb+jKb7cZtJ
	D9XxUHqQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXW-002YZv-2P
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 621A963B9E;
	Tue, 22 Aug 2023 07:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD0AC433C7;
	Tue, 22 Aug 2023 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688257;
	bh=EvjRtRToKltCM0ftw1A20Yl2JRY0BCZyEmk1F0c80Pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xx5aL6u9pJIOguYJ8YSi5Lt2xYJaDiKJ3V7rMtNtMo7/wqgN3F9U8HtwieeVmoz67
	 O3N+4wGX3gh7YtdYeya/CrVs5wr7302fgHGZykHIWXaL01G15VSQl1QN/t4PP2p1Pv
	 BAd43SOB9ndpRrmzkg7oHPjsUla9bfhBfNJwilNLwuv+PZT4EDt5ZPbPA0Teq4EVf+
	 bLUI8PPMBSjqrhVcByg4gUjqyxBPWTfEi8YDq0wX3ORk5BYjQPMQYIfrJUdcgQ+pSX
	 uNGI2PP1uyKtoSOJnd23eaXd6232DAKd3tu2I+bxdPNr/aS9GUCn5XYd8xIzWSYkzc
	 OmEtFhSlwgH3w==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:57 +0200
Subject: [PATCH v2 41/41] mtd: spi-nor: core: get rid of the INFOx() macros
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-41-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_081059_156020_5024C50A 
X-CRM114-Status: UNSURE (   9.67  )
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

Now that all flash_info tables are converted to the new format, remove
the old INFOx() macros.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.h | 65 ----------------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 420e5ca2cfe1..1febb4a3c59b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -573,71 +573,6 @@ struct flash_info {
 		.n_regions = (_n_regions),				\
 	})
 
-#define SPI_NOR_ID_2ITEMS(_id) ((_id) >> 8) & 0xff, (_id) & 0xff
-#define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, SPI_NOR_ID_2ITEMS(_id)
-
-#define SPI_NOR_ID(_jedec_id, _ext_id)					\
-	.id = &(const struct spi_nor_id){				\
-		.bytes = (const u8[]){ SPI_NOR_ID_3ITEMS(_jedec_id),	\
-				       SPI_NOR_ID_2ITEMS(_ext_id) },	\
-		.len = !(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0)),	\
-	}
-
-#define SPI_NOR_ID6(_jedec_id, _ext_id)					\
-	.id = &(const struct spi_nor_id){				\
-		.bytes = (const u8[]){ SPI_NOR_ID_3ITEMS(_jedec_id),	\
-				       SPI_NOR_ID_3ITEMS(_ext_id) },	\
-		.len = 6,						\
-	}
-
-#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
-	.size = (_sector_size) * (_n_sectors),				\
-	.sector_size = (_sector_size == SZ_64K) ? 0 : (_sector_size),	\
-	.n_banks = (_n_banks)
-
-/* Used when the "_ext_id" is two bytes at most */
-#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
-	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
-
-#define INFO0(_sector_size, _n_sectors)					\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
-
-#define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
-	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
-
-#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
-	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
-	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
-
-#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
-		.size = (_sector_size) * (_n_sectors),			\
-		.sector_size = (_sector_size),				\
-		.page_size = (_page_size),				\
-		.addr_nbytes = (_addr_nbytes),				\
-		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
-
-#define OTP_INFO(_len, _n_regions, _base, _offset)			\
-		.otp = &(const struct spi_nor_otp_organization){	\
-			.len = (_len),					\
-			.base = (_base),				\
-			.offset = (_offset),				\
-			.n_regions = (_n_regions),			\
-		},
-
-#define FLAGS(_flags)							\
-		.flags = (_flags),					\
-
-#define NO_SFDP_FLAGS(_no_sfdp_flags)					\
-		.no_sfdp_flags = (_no_sfdp_flags),			\
-
-#define FIXUP_FLAGS(_fixup_flags)					\
-		.fixup_flags = (_fixup_flags),				\
-
-#define MFR_FLAGS(_mfr_flags)						\
-		.mfr_flags = (_mfr_flags),				\
-
 /**
  * struct spi_nor_manufacturer - SPI NOR manufacturer object
  * @name: manufacturer name

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
