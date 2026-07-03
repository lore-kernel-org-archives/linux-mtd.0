Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABF0C43602
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zz9FRCT6JiSjv+/ZAtArK2LOUMcqnNNnjM3qnr+gE4=; b=joXZtXzMtcZbVd
	nKfbZyo5dd7rFHWf6uPd04OexP6ajHAOdTrvZi3F8iOYcbWyQXiRIDBbfp6EWCWxUaOTyvuDCZBZu
	BmvBWQ2M9x/0PTlCDmMkMz8uB6muDCgJcNkwr8ErPspL27P23csv39ofUzibccyqaxgEzlXXRq7uC
	n3KVzA3BA3VFsu6wYl5Jth7nVGI8XA2mDaV+2yXGp9GgfcTPAlYOwcde7ZjitXB6KFZlrNxCOoItl
	UkoNQBoa1RDSPV/4YRMsccIS3mR3A68XOmT+EZ1mVNSCkhFwGGody3kfL2mlcDwcdqPa7ajylGNRo
	ualbFrGou6/O1aZCASkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuc-00000007Gds-0iss;
	Fri, 03 Jul 2026 14:30:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeub-00000007Gd4-0EHi
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 14:30:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F69340C34;
	Fri,  3 Jul 2026 14:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F4F1F00A3A;
	Fri,  3 Jul 2026 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089036;
	bh=FUDrDX+vauYe7ZCfTupQJOSbnqnSmI8w//EmjyuQkfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WaFLu5o5TxDzifPhaS+j0+gB/TjN4YJ7Rnh5pqxwfvPd0ZneiT779EVDtL7iyPg2H
	 i6e6hg+tGxHgJvPpzBhyk98KQlwS0TzfoQUy6FtTuMlxZ2sid5AnUzSq5ue1yl01jr
	 TLa6dAFJvgdJO711iQdjLr1JddvzYEGLaDMqyPExrV6E9L97zaxLX4Y0QXpLjFSZNR
	 biG13c9TRhFIYxke6NGN/vdc2LDsYLn42JDUTNTy9rWZDnoMIyXSLgRr2BjbHDclwo
	 2jLJ2/8qQMigaaEOKhfZkbYEz/uWN2mfquldW9s8rjdqvFp/iIgKxIzhRaU3kVs+5a
	 OnWg6SCFqI1fg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
Date: Fri,  3 Jul 2026 16:29:16 +0200
Message-ID: <20260703143003.1809579-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143003.1809579-1-mwalle@kernel.org>
References: <20260703143003.1809579-1-mwalle@kernel.org>
MIME-Version: 1.0
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

Move spi_nor_post_bfpt_fixups() into the sfdp module because it's
really only needed there. While at it, add some documentation.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 20 --------------------
 drivers/mtd/spi-nor/core.h |  4 ----
 drivers/mtd/spi-nor/sfdp.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d5f37b6cd76b..8cbe44e12385 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2581,26 +2581,6 @@ void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 	map->n_regions = 1;
 }
 
-int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
-			     const struct sfdp_parameter_header *bfpt_header,
-			     const struct sfdp_bfpt *bfpt)
-{
-	int ret;
-
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_bfpt) {
-		ret = nor->manufacturer->fixups->post_bfpt(nor, bfpt_header,
-							   bfpt);
-		if (ret)
-			return ret;
-	}
-
-	if (nor->info->fixups && nor->info->fixups->post_bfpt)
-		return nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt);
-
-	return 0;
-}
-
 static int spi_nor_select_read(struct spi_nor *nor,
 			       u32 shared_hwcaps)
 {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 99aa6753149f..3d0bdb320721 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -687,10 +687,6 @@ void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase);
 void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 				    u8 erase_mask, u64 flash_size);
 
-int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
-			     const struct sfdp_parameter_header *bfpt_header,
-			     const struct sfdp_bfpt *bfpt);
-
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 bool spi_nor_has_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 56aa12423603..5ffd695d1e8b 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -401,6 +401,37 @@ static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
 	}
 }
 
+/**
+ * spi_nor_post_bfpt_fixups() - Updates the flash's parameters and settings
+ * after BFPT has been parsed. Called only for flashes that define JESD216 SFDP
+ * tables.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @bfpt_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the Basic Flash Parameter Table length and version
+ *
+ * Used to tweak various flash parameters when information provided by the SFDP
+ * tables are wrong.
+ */
+static int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
+				    const struct sfdp_parameter_header *bfpt_header,
+				    const struct sfdp_bfpt *bfpt)
+{
+	int ret;
+
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_bfpt) {
+		ret = nor->manufacturer->fixups->post_bfpt(nor, bfpt_header,
+							   bfpt);
+		if (ret)
+			return ret;
+	}
+
+	if (nor->info->fixups && nor->info->fixups->post_bfpt)
+		return nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt);
+
+	return 0;
+}
+
 /**
  * spi_nor_parse_bfpt() - read and parse the Basic Flash Parameter Table.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
