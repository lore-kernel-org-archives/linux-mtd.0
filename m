Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EACC04A6A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9y2WVfUMvOSPNIXIFimmeXFZhtJKeebOoEtZJLw1o8=; b=FhIX5YgWhNf1aU
	ayKXSRnA6Yhx8zc0oCSJPj/4+7hJIm/rsjqKGB+J8SJMIZ+10RHQJdxjpV85tz0GQVmj/BFgjtvIZ
	PFHXtV0khryIG1H8QPVTg8jUOy2XK/hMcsZIMR5zMJGrwGdjYyvNpt6+Nw10fGknW4SMLemG0ZwDP
	yzACAmvpcPev+T6dROKIifdQNkN8tzg0ou5591OSgOpFGrfQSqiRX5nfcyRFlApFx3JEtVj4jIWnS
	2OPGuolUSGESanLdfpoWPBLmC/P4CwkM+jjwmETZBVQsqBz9yaXTjDhtzt0P2RP2xNaOvjpyzj/AN
	oZrwdRMIJFhST1a9kN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Bm-00HL6K-1f;
	Mon, 07 Aug 2023 13:22:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Bf-00HKyH-1A
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A74C96192E;
	Mon,  7 Aug 2023 13:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B9EC433BC;
	Mon,  7 Aug 2023 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414538;
	bh=oe7aMV5rIYZGzkefnYjB3oJt+ZI8q8he9pIR1JwkW+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zbd+HJ1L+eHI30TFQRB8B6NnhcBAKMJHoaYjc4FGlC9ozLo3u7ofyypq1IpUMdGXb
	 dZmH35mgts3sOgWrJMcuTkbTG5ZIOkBDNfl3YcPMRRJhwmn5GLUL1TF+lRTPbWX7TS
	 LG3bX/SXZQbAnCkNQDJO6ecJDaKQca1EjFVWnhCgTrjn3K0JUHGb54Nx4t5+GUoGzj
	 HvpinalJ32epIs8E3qNGO4DbUYcbrcZoYvIjiVbck/gEmO5i6in8GJ0kXlriYd1K/J
	 2hf/Io2lVGbe47LzllkK3pZ4xY936Wgq7XUgCgaVu96t2okbRG3XqKEdYnjx8WzEF9
	 bFPO4EqmZDJ2A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:06 +0200
Subject: [PATCH 12/41] mtd: spi-nor: introduce (temporary) INFO0()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-12-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_062219_533998_DB6F2CB6 
X-CRM114-Status: GOOD (  13.45  )
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

The id will be converted to an own structure. To differentiate between
flashes with and without IDs, introduce a temporary macro INFO0() and
convert all flashes with no ID to use it. After the flash_info
conversion, that macro will be removed along with all the other INFOx()
macros.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.h      |  3 +++
 drivers/mtd/spi-nor/issi.c      |  4 ++--
 drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d9bf7a24ae1f..eec14733c233 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -571,6 +571,9 @@ struct flash_info {
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
 
+#define INFO0(_sector_size, _n_sectors)					\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
+
 #define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 9d22b799ce94..b936a28a85df 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -77,11 +77,11 @@ static const struct flash_info issi_nor_parts[] = {
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
-	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
+	{ "pm25lv512",   INFO0(32 * 1024,    2)
 		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
 	},
-	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4)
+	{ "pm25lv010",   INFO0(32 * 1024,    4)
 		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
 	},
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 6ad080c52ab5..5406a3af2ce0 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -272,15 +272,15 @@ static const struct flash_info st_nor_parts[] = {
 	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128) },
 	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64) },
 
-	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2) },
-	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4) },
-	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4) },
-	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8) },
-	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16) },
-	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32) },
-	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64) },
-	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128) },
-	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64) },
+	{ "m25p05-nonjedec",  INFO0( 32 * 1024,   2) },
+	{ "m25p10-nonjedec",  INFO0( 32 * 1024,   4) },
+	{ "m25p20-nonjedec",  INFO0( 64 * 1024,   4) },
+	{ "m25p40-nonjedec",  INFO0( 64 * 1024,   8) },
+	{ "m25p80-nonjedec",  INFO0( 64 * 1024,  16) },
+	{ "m25p16-nonjedec",  INFO0( 64 * 1024,  32) },
+	{ "m25p32-nonjedec",  INFO0( 64 * 1024,  64) },
+	{ "m25p64-nonjedec",  INFO0( 64 * 1024, 128) },
+	{ "m25p128-nonjedec", INFO0(256 * 1024,  64) },
 
 	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2) },
 	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16) },

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
