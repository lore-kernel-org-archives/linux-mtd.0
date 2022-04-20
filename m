Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60734C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=em/OfPnNgcAZkm1oQfhAF9qBda/A47wI6UpDoH+RFA8=; b=DUTVEnnXDNms/M
	GNd90Wtu/U4sAtcb12bq70+Fo//U8NOBAJDl13NQ7iXO8dL1qPL9tmbw4/14whAfp8BmlTHFSTxps
	Ip0kZ40i2+XQXUWpMEatqBIb2MwUEO+HukJUT6cNM9wwybw9KleYxdMxlREwtUa6gl6RqotyVkK6i
	5PQQelTRgAys7MhIHQDXwEVGeMzux5QCfnnkcS1zZ1Eg0ffUvPx52cGG36gqJdsQZhH8vDWPmQ67B
	7v7bfVELP7LFe6UmFYwNAQ68JlJtxp3KKKzQpGCLzsaHInGs0+v/RnjrOUnyLDBwOyEU2LE23TaEx
	UlroTUyRxAi0Re89HwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7ft-008cNg-W1; Wed, 20 Apr 2022 10:35:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fZ-008cCu-13
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450886; x=1681986886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QOPdqsb7IX+uNxgIbEEbkjWa7gFF+UyMRRDlspGrMrg=;
 b=vpapO2n6zNDt84RTFV3noDXD6IhWP3+sqr+XAlvJaGpcA6Mpd08q+SZo
 6/CV6M3txS76TjAMszTWaz9tIs7CdQa91MA7uAhNlj0Uv1VuRmtsJB0WD
 I4BWGPg31vxvo8AOL0sT2IGAfEY1XvOG95dRtJfFX15dIDtJjkZ8tmjh8
 Yoyaki6NgiiPXbtZBSpA1K6Z3S5xTkqRsg9QSqYezvLRqGr75NtX81wF9
 UK39A82PztZd/KQF9C01ViHa0CEKFCJA/F/bm6HC90aPyQc+/bOP1eku9
 qWY/Ap8yYbCFPYY/ahES9vaHdOEGAH8Ca7RliSJYD5QhLJ9kvlO2Eik/c w==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="153206893"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:43 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 05/11] mtd: spi-nor: manufacturers: Use spi_nor_read_id()
 core method
Date: Wed, 20 Apr 2022 13:34:21 +0300
Message-ID: <20220420103427.47867-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033445_176199_21DCC6A8 
X-CRM114-Status: GOOD (  10.78  )
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

Use spi_nor_read_id() core method to avoid duplication of code. Now the ID
is read on the full SPI_NOR_MAX_ID_LEN instead of
round_up(nor->info->id_len, 2), but it doesn't harm to read more ID bytes,
so the change comes with no secondary effects. dev_dbg messages in case
spi_nor_read_id() fails, will be added in a further patch after we split
the octal DTR enable/disable methods.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/micron-st.c | 13 +++----------
 drivers/mtd/spi-nor/spansion.c  | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8a20475ce77a..41b87868ecf9 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -91,17 +91,10 @@ static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	op = (struct spi_mem_op)
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
-			   SPI_MEM_OP_NO_ADDR,
-			   SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
-			   SPI_MEM_OP_DATA_IN(round_up(nor->info->id_len, 2),
-					      buf, 1));
-
 	if (enable)
-		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
-
-	ret = spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
+	else
+		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f24e546e04a5..c5988312cc91 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -98,17 +98,10 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	op = (struct spi_mem_op)
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
-			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
-			   SPI_MEM_OP_DUMMY(enable ? 3 : 0, 1),
-			   SPI_MEM_OP_DATA_IN(round_up(nor->info->id_len, 2),
-					      buf, 1));
-
 	if (enable)
-		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
-
-	ret = spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
+	else
+		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
 	if (ret)
 		return ret;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
