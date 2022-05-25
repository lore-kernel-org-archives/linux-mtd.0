Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315B2C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoS+WbOuYqRI2RodoP134wa9L5obPlPNpjsZPbdfv4A=; b=Wf2vVivs2wgzjF
	LxaRPbG8l6CxipLIC+UxqpEa54Yx27ypD2JIWyk1dvCKpsqdSxk4n0vle8HDaXrGNX1684MzMgdp9
	iXhBuu9QpOxCAXk763FOwk2WWG6CnQC7D7WabJtAWo4Orx4eFrmWOZhtCSGHW7DsmzLKYTywJB9OU
	1wY0uDBGVRN99ARPbonZ/RnyZUUE3fa8g4YopWR5mhFVlWLmvKoyuYjrVW+4yJoex9EGDgJyLtE8o
	6w7eTg9gEWxHG9y0BqIkZ87w3K6iwJHxMD7JWCjyN5MDf+rhxTDe/VhXOBsVG5qJres4A80wNy3L4
	2fiJUmqmEbjDtOxA/Q/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttup-00BpgA-Pp; Wed, 25 May 2022 16:31:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttum-00Bpdt-Mt
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 436BFE0009;
	Wed, 25 May 2022 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPhUE4OduPLxrYX3ANCWHpHOzPF8dn11VLAAieYATIY=;
	b=DlZMnNks4R2xxusuKEoQfSzfzZZupFI8BBDyYYb1xLryuP/lX2xxhnb0LrQppK6LiBgPFS
	bMdWGb9ENf3Bu6dhxr0HvkgbA5MZC35G61BZ0Um7OHozNjpPcmCzqGhRdtpwFqWI4AxPaU
	XocV82HI74fnsrcKp5k0qs9FkKxc5aTIO6WzghHEBrOyXAOCtSIqdBu6y5vy+zDxoDCY5K
	bEJaK9CSA8t6iMRafCy9rQfnlu2jTBDwz01p5ZEmVFusrKsBJv0eqQTne8CrjIzUTb/xEC
	rM2S5og3FivgC62y5lX76kCdDYc34N8V+F8yZetGFmIwQ/2j2aD2NbuogUkydw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 1/8] mtd: spi-nor: Create macros to define chip IDs and geometries
Date: Wed, 25 May 2022 18:31:01 +0200
Message-Id: <20220525163108.266705-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093117_264792_C8F7E52E 
X-CRM114-Status: GOOD (  10.64  )
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

The INFO() macro defines an ID array and a couple of geometry
properties. Right now all its lines are duplicated twice because of the
INFO6() macro (for extended IDs) and soon as well we will need to add a
geometry parameter to include the number of banks.

In order to limit the code duplication, let's create a number of
intermediate macros which will facilitate defining high-level INFOX()
macros.

There is not functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.h | 43 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b7fd760e3b47..85a1d464471f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -417,33 +417,30 @@ struct flash_info {
 	const struct spi_nor_fixups *fixups;
 };
 
+#define SPI_NOR_ID_2ITEMS(_id) ((_id) >> 8) & 0xff, (_id) & 0xff
+#define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, SPI_NOR_ID_2ITEMS(_id)
+
+#define SPI_NOR_ID(_jedec_id, _ext_id)					\
+	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_2ITEMS(_ext_id) }, \
+	.id_len = !(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))
+
+#define SPI_NOR_ID6(_jedec_id, _ext_id)					\
+	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, \
+	.id_len = 6
+
+#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors)			\
+	.sector_size = (_sector_size),					\
+	.n_sectors = (_n_sectors),					\
+	.page_size = 256
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff,				\
-			((_ext_id) >> 8) & 0xff,			\
-			(_ext_id) & 0xff,				\
-			},						\
-		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
+	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
 
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff,				\
-			((_ext_id) >> 16) & 0xff,			\
-			((_ext_id) >> 8) & 0xff,			\
-			(_ext_id) & 0xff,				\
-			},						\
-		.id_len = 6,						\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
+	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
 
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
 		.sector_size = (_sector_size),				\
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
