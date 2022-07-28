Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F535C19F2B
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 04:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yctf3ECNlnQRuBXQorvRalyfCaQOgFOLwIcVDX9vWkE=; b=ZH40E051scALm5
	PBBZzDQ2WsTkvKVhzZxJsbK3X4O6tr2EH83jsmu5ycEyHauPqnJRw9Z6PQoYegh42IcBmqtX8KSRi
	KcVqgRXS68GEtxsjk+NUcwMWOgOf9b2jqp2ZaJZ22gQ2ddzEj074lpuxQb0s9SMyzhvXlKBv3994h
	PnJ8tbTL9Zt3NV/LBgw6C9Tr94XbxyDWkvdRmTsSx92QFyrVqVJ7vOuIrwTQha9+VXWKXmRqkay7r
	rUEOYow97meF6lh1j9Aew17wkdCxSX7GWKL57bY1sVBp25FomMX45BZaa+bTQg3IMDXX7Sp/B+Tho
	ej3An4hW7wOc+7fWJyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuvV-0041YD-Tu; Thu, 28 Jul 2022 04:15:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuvN-0041Lx-Rf
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 04:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658981702; x=1690517702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+HflFpshvkYjw7pnki1du0Gylx5jPYUXgkpawnrGcA=;
  b=bqh+jcKoFDBDFF/wLDr5fbdwa0qwipRPZJpV91sLWQl2U7el18mSUrLB
   rihCcfCEPqxx01NVYBlMz2LO2NnDSiKoYA4q+w/f7c2/gquCCWedndhfn
   nyUmQoWY9SImzCcGyHtdVAcx0TMcF0pRD6KNfygicx+Lw+Gyq2Ld9gOq+
   CPoYetvIqYj/4UKFinjqfltIBqXaIgv8JjXUhqbi8BXrn9uoPTuwYJtAq
   1QD7axl7pBGcb/xEv5QxL40kzdSMlL7QmG1N6QT+VRKVnzzTj/Z0QjVCg
   uPAh4EAEusrjaBOnxqJUgaDIHVFDL3B3Aky5K1Ihk4b2D09I9NAW/ohY3
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="173928639"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 21:15:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 21:15:00 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 21:14:58 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] mtd: spi-nor: micron-st.c: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
Date: Thu, 28 Jul 2022 07:14:51 +0300
Message-ID: <20220728041451.85559-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728041451.85559-1-tudor.ambarus@microchip.com>
References: <20220728041451.85559-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_211501_999191_E9D7812A 
X-CRM114-Status: UNSURE (   9.32  )
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

We track in the core the internal address mode of the flash. Stop using
hardcoded values for the number of bytes of address and use
nor->addr_nbytes and nor->params->addr_mode_nbytes instead.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/micron-st.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3c9681a3f7a3..3c8a90b39c8c 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -52,18 +52,21 @@ static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 	int ret;
+	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	/* Use 20 dummy cycles for memory array reads. */
 	*buf = 20;
 	op = (struct spi_mem_op)
-		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
+		MICRON_ST_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
+					    SPINOR_REG_MT_CFR1V, 1, buf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
 
 	buf[0] = SPINOR_MT_OCT_DTR;
 	op = (struct spi_mem_op)
-		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR0V, 1, buf);
+		MICRON_ST_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
+					    SPINOR_REG_MT_CFR0V, 1, buf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
@@ -98,7 +101,8 @@ static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
 	buf[0] = SPINOR_MT_EXSPI;
 	buf[1] = SPINOR_REG_MT_CFR1V_DEF;
 	op = (struct spi_mem_op)
-		MICRON_ST_NOR_WR_ANY_REG_OP(4, SPINOR_REG_MT_CFR0V, 2, buf);
+		MICRON_ST_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
+					    SPINOR_REG_MT_CFR0V, 2, buf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
