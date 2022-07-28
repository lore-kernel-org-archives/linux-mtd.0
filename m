Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D47C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPCXrs8w9kBKSX+0VlrcDhQAq0IDSTr9wMo3eoqks2U=; b=F/a2YFqj0bQ2UC
	heLY5+MmBOlCWGi41VMqt39qBYMUeNVLwiitS+NYdT2b/LIOCPryzySBagRWXsrftt4tC+4AbSENq
	Oi+Xwd92pKobGc2I6Dr/tYVudyJpDBWcKkIfT9qnTC4DJrzJqC5fHQyXLIIMMMs522w7+dJ1G/9Ef
	/AUoP6lo1t5jhG2O/mr3aFq4MoFRcN8tOyJ12XPoL0AL2U24l6ICvrgRjF2lt6Sjp09FRH8bHyRDU
	QOzsohjPBvj1bT5J/drTRNBo9d1OeC5BagpMB6K2nMx4qrjAJdW1WsAlKAI8HoLZkoDNGAd9vb8bQ
	pdvo1S/YJpQMOC6lSM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuvS-0041Vx-W2; Thu, 28 Jul 2022 04:15:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuvK-0041Nj-Pm
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 04:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658981698; x=1690517698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HV1+B7lVwDrqlTXhMFSpAf1W6p2D2GLqYHmP7ZN/kUM=;
  b=vt779SYy4ICYVXDlASULJxEnCWj2/7J2qUUCA6S7eYXeQzsWBfYl9CJG
   HNWhlQdtVq7ZfQlJPFkjYox79HGUYZ5PTKBF/mxbZeQ6pEMQqPxV0+6Kx
   eYDjoWh255/Ref7/+GKmJdembfm2GFyqDABfPzhXvYzJDP89F5Xc117f0
   rjMlBgAId5ANWOgtKNhuUbUEKkX6eU7XH/MgS9K1VTcdyJ53PCEsX1iYu
   h+lVTXZWxDVl0b5IrLl8AyT/4wG9IHe7qI+lB//ZOqdWXCigQLTbmMy/T
   NBzSdKiGUu9Fk8ZWVsszNzTYdV8OzAeVRxFjOEfKoawCfz/2ZATSODtQ8
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="184070461"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 21:14:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 21:14:57 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 21:14:55 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: spansion: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
Date: Thu, 28 Jul 2022 07:14:50 +0300
Message-ID: <20220728041451.85559-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728041451.85559-1-tudor.ambarus@microchip.com>
References: <20220728041451.85559-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_211458_892143_F83646FC 
X-CRM114-Status: GOOD (  11.33  )
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

We track in the core the internal address mode of the flash. Stop using
hardcoded values for the number of bytes of address and use
nor->addr_nbytes and nor->params->addr_mode_nbytes instead.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 0150049007be..676ffd6d12ec 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -49,11 +49,13 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 	int ret;
+	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	/* Use 24 dummy cycles for memory array reads. */
 	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR2V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -64,14 +66,16 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	/* Set the octal and DTR enable bits. */
 	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR5V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
+	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
+			      SNOR_PROTO_8_8_8_DTR);
 	if (ret) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
 		return ret;
@@ -97,7 +101,8 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
 	buf[1] = 0;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(4, SPINOR_REG_CYPRESS_CFR5V, 2, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
+					  SPINOR_REG_CYPRESS_CFR5V, 2, buf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
@@ -191,7 +196,8 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 static int cypress_nor_set_page_size(struct spi_nor *nor)
 {
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_CFR3V,
 					  nor->bouncebuf);
 	int ret;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
