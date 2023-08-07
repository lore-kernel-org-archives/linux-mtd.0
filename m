Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B58C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0UMfFXZnbK5DwxCfInby8U10jTt9BlvK9/e2BU1Bno=; b=k+X2afy5e06cXe
	99LZWvIgj09uTGYRxYCvgBvy6Wrr5syPGZZBtwSgVjVVKi/4vSsJ9mRQ1rqLQVZvBRYjkyuNA1y16
	ygVzZT/vzbWIbN9C6mhAljBXhNvv8DGlGjlLURARyItbD6oPS95BCWlj/tuSuaKHROxDqQvZG2mwe
	BTbPBwW/QDLRO0U557r/LdZ5CleESvtXe7SxZDEq21kMVEEHrKOClcYGvKnKud+uvl0AIEW2BU79U
	3i2duQJmblLX4ERqXbOK3qKTIGpSXNbjZ1IAF8qSEqEhueYm05cOpxRAxALdA9pQJZJFlLmCOQqSZ
	wu8Es7vfjNkn3f8W4Uvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Dh-00HN1B-0f;
	Mon, 07 Aug 2023 13:24:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Ck-00HM3A-1Q
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LDeh5sa+VOsz8BmQgAYSpO/yeo/GfnaQ0K1T82NL7Kk=; b=oBq8iPCDHcHD1mAsahvW+IVAeg
	rihcuhlf3VOsMp3jmCTLdWo/O27joYT475GCkSWuqTwS1nspUmGl74seo+ujG8G3js/OZYl/A30FK
	sTMp/ykvM4QtJcG42WBPxQrOofWg8JD5a8+fE2r09djGHymCwFjcnQxHPqmQ8iuCxL7h1cdaqkyjK
	x9B3ZDJbT1mICmuX+F4pbZXHNRECn3jq25Gb27hPDVAvPRvghNF57vD9VxLUs5pQ5v3wrkI6MwYDI
	6gCdNfCJBJB5ytd+OyBAu6teGJcxKIcsnjfv9cT3ebUanWnSEPDAxilpe1YkXgTy54bIcfOQCDrQ6
	36tdH0Lg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Cf-003qlj-2d
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:23:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB9B561AF0;
	Mon,  7 Aug 2023 13:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE26DC433CB;
	Mon,  7 Aug 2023 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414599;
	bh=Jqo8XbuMCxp/lU8H372pqnV5J9no6ZO9LFvX2EEpUkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dcKJzNz0Ci5OzkoSUNLW4LbMqNTrbb9mKTewnxvJziSjfXjDS0VJ+DcMwhU/YtRwe
	 sz5kZ24FOOX/ol1OZaSKbM9GjH1WpisQbuocqY3ZDPoM1tVPRQmzPqbvhIF+3AP0+i
	 ekDVxLqV8wO8EgJviTg5f64MoO9B2SapJMIovNW0bJL4IviW5qZMuWz6NKofaUf6YW
	 CLHKQtZn34RN3vBqK8eikB2d0h0ecYGNfEwNq8CQnqviAm3MUjzRAX1MUsI5wppYP8
	 dQLb+J5Y7TRRbhg5KGwUOKZMsrtEt3VSf9D8Q1NdL7aZhBeo8q9ACaywr/4r3ML+tJ
	 mfVqcFZF3zR8A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:35 +0200
Subject: [PATCH 41/41] mtd: spi-nor: core: get rid of the INFOx() macros
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-41-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142323_058609_6C20873B 
X-CRM114-Status: UNSURE (   9.22  )
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
index d0e83bfb847c..8f0f3c64488c 100644
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
