Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56017C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4n8AyVw6kWmExMLk+qeqwmrjkXAWwRb8HmuRrhkLHt0=; b=gdq/ZQRU4X/wu7
	B+e/MtOhW3VKZgDQX72+mWt1qNYHx681LprofHh+O07zTp6QcBI1IdCJhndSIC3ogG2q3ce9dNUrq
	PWFmp55KUY6SPauV28n6pKFI+DPU1ryi/rAGBadw0UUT8tOM6lvRKPn0tUe0zMMxdAuLrotp6dAq7
	x9I467pri5am0VS4iP+pKip2uaMXShifsb3f8+/52b5/C3b1YUIm7wXp9n39zRph04XpytWCCpPrn
	vgDFyUBXPNx1nmZEJf9OE2Q7C2he6zefVTjXrbjN2lDBckNnh6ReueSBa6Bi0JRrXzyxvt4i6Gya2
	jOgdBrS8J8LGxaSOIvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeO2-00BwbG-DB; Mon, 28 Feb 2022 11:40:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe24-00Bn1x-Hj
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646047056; x=1677583056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKoKfdaQ7sfaHkKYIDfL8XSqEbj7jOZmi0dTb4Ji8IE=;
 b=Vrw9pEVgjhainkEwBH5PMGE1AUmOoZ/dfVP6QMN06HzQHKpczkIQ/mTT
 rgPayZxiRPL6c/F5QsaBr5bX3g0/r/aTxPVP5/SNXqfhsRPumGBG6fq6Y
 X1HkBpPVQ1vTZ5NaeC5Oq0mvMiQbxlZukdMSurqFgMAJkyKYIjSZAFLLC
 ggrgMfjisei18FGTS2PGj+mGMd8hHfeqA+rd8Z3o7wjNiO+WDE4pKnqLe
 XPKY7Qp6Ox6aKuwG2xddiVTxH+bvqUMmTtKUkmmPXL88JjIT6Bi+/lxJ4
 BEFd9gOKwdTAyD6EYIXlgM3XgOi2vFjoGcBWuzqaJvqi0Oq7Te6jw3vsF g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155099358"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 04:17:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 04:17:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 04:17:32 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 5/8] mtd: spi-nor: manufacturers: Use spi_nor_read_id()
 core method
Date: Mon, 28 Feb 2022 13:17:09 +0200
Message-ID: <20220228111712.111737-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228111712.111737-1-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_031736_650318_AFBFD6C2 
X-CRM114-Status: UNSURE (   9.40  )
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

Use spi_nor_read_id() core method to avoid duplication of code. Now the ID
is read on the full SPI_NOR_MAX_ID_LEN instead of
round_up(nor->info->id_len, 2), but it doesn't harm to read more ID bytes,
so the change comes with no secondary effects.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
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
