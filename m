Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D3CC44506
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e61AM6esAArJN8KB/zX8bLjj2KGje+k8HLuNESeMbM=; b=YwC/0GZ3CTYtFm
	BIPVPhLX7y56H5wH8MGQ5j5hTB93H6K0jpDdEGrVrdl7xHejmt/uC9IAa6FjlDsMUOXA5L6eGFn62
	PHUA6QnPD04ydua7xwHgTuUTN72z7w6xGdUGchU2KuEpr6fjojbkA17kuoZ4/xhKyyBg4xFAuvvKx
	bn6JzTK7u6kCTAr6bq7qkFpYVkZtzqiPv8SUN/rpzC+DjfCwjN06THtBuvn84psmXWJUqspLrcPJs
	7YUkFbAbZ+GfOEZwYUhxN02V9Du+ty+LBTTBoyVN/7UAkFt6SlXmR5kPK7iDw/+/gdn2eju5Y5XBa
	mSYhUzMyAgDjVMHtnSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiF-00000008gPk-3Lht;
	Mon, 13 Jul 2026 09:12:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiE-00000008gOX-3laY
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 556E2600FC;
	Mon, 13 Jul 2026 09:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E791F1F00A3D;
	Mon, 13 Jul 2026 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933950;
	bh=b4aUs0135XPQoffkxi78qVo1oX/P/PmIXERj/42JFow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ddEdOnlTIkHgW+CgbMmJr4xCHKBblDPK7Oaxtl78zEODVI00KvisVQFADV+sRrUcQ
	 ZqQwzhzcGvwloLDYAm8jsbxOAYhThu7YSVNH1/ihSbJmj3LKjUxC8hFd4xEJ8Jv92N
	 wRPc2KW45k6pZeVR8M85DCu4xevPz5vnf1Ll44lLOcryuADwu3n8jEG34VqP8VA6Lp
	 RXE9tR5uWnErGihY4+/Z5URepKHX16/3iiQfAGYX3UkygUy0p+SNUiJSapWIDIWS77
	 ZeKad3jUlAaD0IQXSAfPND5Qzz5XWLoYBGuHMWEqNJi5khYAr8mrxBjh1i4+CFoN/R
	 lszTm6kclt2oQ==
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
Subject: [PATCH v2 5/8] mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
Date: Mon, 13 Jul 2026 11:11:43 +0200
Message-ID: <20260713091206.2414400-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
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
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
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
