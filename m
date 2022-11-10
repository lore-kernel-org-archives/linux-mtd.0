Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE0EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+KDaSGMc05T91OahQO9YC2FzVWsv5r3hwCYNWKNIIg=; b=h4sJQT8z/I1QO7
	YRQsxSEGRhWIvpjfjzL/ae6ifgb9AfuQ1xk2P4ozXHBQcuy1cX1OJjnMNhiKR8u8Mww6ScncMeLzK
	WjuyDc8+gRCiahXdVhMbQh8RTB4z7TWZU6Db0ehoRl6QzeZjLQ8gprDlq6x4M7J4AcK2nWGjuQ/na
	WT0gDozmrbrDkxeS7QFQdKBaDYMJO2TW9gKAJWii9iCrJ7TBg27TjkriU1tKd7vHMXtIzmf7KKPe0
	ETUJnd/rkA9tz6jE9BqOtq0RsBknA0jfBCSRSWNFmtRaQYIhLXKfuhuXS2JiE2S3oAxcPjkuUC93X
	EPseyVObbQKpc+yGcKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9to-006wuE-BQ; Thu, 10 Nov 2022 15:55:28 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tj-006wqI-9p
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9B8AB20016;
	Thu, 10 Nov 2022 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lt4/klj4OnWVd3+ZMzycoH+23wgFr+8orSxwuKkBYPY=;
	b=HqtfM5dTRRuV6i2ADtjEzXhMeTPilWCHLEaLalNO70iZHNQ6xDu616rwlhi4PteMw/46g3
	hqjUAZ83+khaU0TDPx/KuhxszSRa4V41GgQnyDUaeEX+hIkW4XJE5/K+kkgI9WawqqKFa0
	FnbXW6764fLzr3/SzhYG1CliNbk2YnPJa/7FqRR9qsUjE16ggDPsAhNuDHpSu+Uafimcwf
	AJ29sPws1HCdINBlS0spV+9PSTtv4I01swq4CZyJIRwfNURSnshaD5d/N0jwjHFKFyYL4O
	1oUIfBSlUwDJtRYZHzh6FSRk9SzC+1dZVWXsYSXkm2CkFCQWp8Oz49C1dNeNfw==
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
Subject: [PATCH v2 1/9] mtd: spi-nor: Create macros to define chip IDs and geometries
Date: Thu, 10 Nov 2022 16:55:05 +0100
Message-Id: <20221110155513.819798-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075523_828956_000DD27C 
X-CRM114-Status: GOOD (  10.08  )
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
index 85b0cf254e97..dc74c7be3e28 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -527,33 +527,30 @@ struct flash_info {
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
 
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
 		.sector_size = (_sector_size),				\
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
