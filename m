Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3BDEE57F2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvXHXdumf/PP/yWvXJO6ZMomgcoesEjLaOZgub3i8Ck=; b=W1Py6BR9z7IN9P
	YUSYbB2cQm5QzCDI+am8cG8T7Xgp+jvI67/qv196jYKdoUVKO7wQuSniaNNNZY/kCEktdoqA2eYUj
	ldFfRnr8Z7OGBh3/wDPZ1nj8Px3QDTYzf1Lu7DU6kH9VbJOSUO2rdokqQFMf0DwdTtG1GoWMa/FVF
	dl85nb0YEZyILoc552uDuFqfC6XzS4GgTXbwm8ZhThWZ7cRBGE96HY7WDTtzUW7MtZ8HNjxhMG2Oo
	GC/snoKW4N0GNEPjLAZVIfzyNO84LbHEoXUpsQRYYWcRKozZ6ODA8fyG2/DNIn0BZ9kJuzVt5HptF
	MFY+664Gx8SdPmObzzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYaf-00DVVd-0J;
	Fri, 08 Sep 2023 10:19:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYq-00DU2r-0I
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:18:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D56DB80861;
	Fri,  8 Sep 2023 10:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91533C433BC;
	Fri,  8 Sep 2023 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168276;
	bh=kj7txFDeJ9tQUukL/6r4EPSor7IpRSkzP9xAZaIzGSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gmz7kJaQaG65Nu6TVzNsQigFCAr+XToCFvGJ4PAHYOpq5FmmR/+1rdVKI6u8ttRN5
	 b7rw/DW+fB7eQqgREacABggQwzklzMtehumbmdVkt2myB3eRG7MKH7jChSZUSEWsVh
	 BReV3Xt6kz5kDmLlwmkKsJ3eXp7G+HslhPKKW4aoJ5MVQJoqdCpx01QiLZeP5YdMwb
	 SrrKGMwCT9TdW7Cc031f+kp78B77zMJD0xtQQN+DI8dt0RFZBWjlZaMZxlwDVY2246
	 gJ28mmdtQnUR+LGyfjBktNAv7mENTwKxUZvaBV+wySsDL0sEfTir47Dt7XhYrMXJPE
	 Hdh1T0wtS3dGg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:59 +0200
Subject: [PATCH v3 41/41] mtd: spi-nor: core: get rid of the INFOx() macros
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-41-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031801_187336_8B5A9168 
X-CRM114-Status: UNSURE (   9.56  )
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.h | 65 ----------------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 14c1aa63bc51..93cd2fc3606d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -575,71 +575,6 @@ struct flash_info {
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
