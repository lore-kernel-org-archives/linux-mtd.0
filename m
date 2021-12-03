Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFAAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teNOnif+TXUSKzGUiLRAKY3sDWQMgvpj2o6sjp6LeXM=; b=iMqH5mx6lqjiGZ
	09jZP7b3AWs3BeIUqM/VeiZhnEFF5XMQwExzFQzKsXGWMfwHYw1w2makc2jP2TjT6HxaChQjUUTxa
	pieB1M91I6h8CqvA85GqliO+5OcHIQOBSMImNyJi4+15BWdZYOGjy46AcvfWBaDEXjm/NxOj8IlqR
	sGEjtC+C9NXDoOonBGbiE5paexGb+1ZB6aH9XakcVJei0TMQAXQz45Q/jBaXOadA7L6Yvcoc9z+Zx
	Wp8w/wxkwyjMiyVuN9scLE/mXkenLyUZHZjvoeiimpAOgWE5CglKnh1GzbHlehHOW8nV5PZRtAq5h
	XrVA47LlerjDd3DizbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9Tq-00G8BI-Ic; Fri, 03 Dec 2021 14:24:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Sy-00G7va-IW; Fri, 03 Dec 2021 14:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541392; x=1670077392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B1F0QlkDSyvx7sR1o85IgR6ssn2dp2PdpkDFP3+THtA=;
 b=wZF7HtSofd3XVlzD7WVzHJmf3Bu9zTAuGtUeIUNssFLNkT21UGAyU0Cg
 8rxBN8Jmvp3Mklkc/OM32DeNlADkz8A3V32nDe4yjfsZ1m6TxrdnxA+oj
 quTC87Kec2Hf1HdFmrbTN7zrkUEbZXmmWMjcU8KEgaq2DZ4GV037O9RV9
 5BgZWOfzbL6OvvyXVKZ5/kFiSobY/epnwpJaeGC6eyKfwqKq099nQTdho
 9/FE6lvZogP3GgtejXA7UBTCtWNKMeL9OYHLoI1jID3ArnRQ9pgWFmeVR
 TfKM2nLB2oNUTzSrW6hjvIwo6eJ3EmSwvbpChc0VXtXPSnqiPnrfA+4Mp w==;
IronPort-SDR: 0Sv0W58e5VLDT0IYkV+xC29imGtuLDnbg47h+A1CY3X3VkPXDTgVvqpPZaQo1cf4rwxiYzmI/E
 TDgE/BeovqGLj8vlrlqh/VU/9Q1kH51lfbzqRNGhk1DCjHGsc83EBBZ5xinXQ4JfzJ/Ii2ZxTm
 WkLuKkRUeLtFMovR+6p0yKvmavyeHFldTgXv3S7l6NOVU6nBXOevL/qvlvugKPrMEp7jFXm88a
 LutKczm5O8kRhsM8P41CtcS0SdIw7xi2X+YZA3N1WJI4OQjFhdOmBJlV9C8BN4rNF7XegNy/Ak
 VcLMDZDzLXuvpqrnzexawE2o
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141189173"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:11 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 02/14] mtd: spi-nor: core: Don't use mtd_info in the NOR's
 probe sequence of calls
Date: Fri, 3 Dec 2021 16:22:44 +0200
Message-ID: <20211203142256.47370-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062312_725512_CAD23900 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use NOR parameters in the probe's sequence of calls, thus
nor->params->size instead of nor->mtd.size and let the mtd_info
fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
mtd_info fields should not be used during probe because we haven't
registered mtd yet. It's safe to drop xilinx's setting of nor->mtd.size,
now that we use nor->params->size in spi_nor_set_addr_width().

Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c   | 8 ++++----
 drivers/mtd/spi-nor/xilinx.c | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 88dd0908d172..5b9c827d411c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2115,7 +2115,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 	 */
 	op->addr.nbytes = 4;
 	if (!spi_mem_supports_op(nor->spimem, op)) {
-		if (nor->mtd.size > SZ_16M)
+		if (nor->params->size > SZ_16M)
 			return -EOPNOTSUPP;
 
 		/* If flash size <= 16MB, 3 address bytes are sufficient */
@@ -3011,7 +3011,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
 		nor->addr_width = 3;
 	}
 
-	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
+	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
 	}
@@ -3245,7 +3245,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->mtd.size,
+		.length = nor->params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
@@ -3276,7 +3276,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 				      SPI_MEM_OP_NO_DUMMY,
 				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->mtd.size,
+		.length = nor->params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 03d3b006a039..580562bc1e45 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -70,7 +70,6 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 		nor->params->page_size = page_size;
 		nor->mtd.writebufsize = page_size;
 		nor->params->size = 8 * page_size * nor->info->n_sectors;
-		nor->mtd.size = nor->params->size;
 		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
