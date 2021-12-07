Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F09BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4jpp8XQs6Qajebodvci278PmzIaqPTUoOM7NZYNfJA=; b=p1prrN7F2mY39a
	SzceaaTezXl5a9r1TSESxPjkuqVrA6XiMMV0S47mNfAVX+8JG/gdhEUdNrSMeUZSonaGWBdHkJ+Uo
	LdPwZhAKjP9QCXjZ2DOrPHb18720pD69mA6KDPLuAZ6a/052kHbs/S0Rbd0pQ9ZP2M/mbppIwmGcv
	lcUtQ+w4R3rT3oDpBqfx2R7+jkBpaZNQX0KuZrP3DU7bcfulr4GO16G02hnNETaH23knxJB0xHDxu
	3WQGnfQCfnnHFKhY2/TLBeUN/hL9kiAupxWtK/xDKRtQ5GWopJvgHmACkFp8VXWFwzqNQz1Sm7bgk
	TrKPEhXAi/Iuoy9i4ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mub4H-008pAT-QR; Tue, 07 Dec 2021 14:03:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub3p-008p2n-1f; Tue, 07 Dec 2021 14:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885793; x=1670421793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LptpMUX1vo3vHRPDgrh8hhkE4Fk/ISwz49WN+BRpCtM=;
 b=FjotkqlCmkBWD4bI+dbvN0mk4lZXu7SellgeUN+feSNel8ExXWE8bPPP
 7eOyOEIVxxcKBOOuxCrLle9saUAJ9R2M+i7p3Cz8EeEh6NBe0bJzOjj2H
 qDDi7CzeV4GsONon2StjIfftZqFLZ0zr0hjbCLrTwe9Thwe6OHMYvI4sv
 /0x4LEkaD9z98Ft1thOPs0QKihSlLXCCEf4HjZqRbs42mvHnzpjfIJE5e
 m49zXHUcb9ZeSerrR5yWmcgS9bvws+MB40pkqVChWmLim6+H90TxoOUeg
 QxVSHyfnle/lxCusqAg5K5cuFKWVQwiDgjwBVk+nmsbU0/HUtWULcjPNq g==;
IronPort-SDR: 0zK85eFkVwQrsx7X3ue1NAV3HDTDj2v+BKIuL47NfBL7ROjd5mtoLSYGp6yh3KbWyrfQCGSA51
 1hZFP5Gzc9Kw3tzycTPJnkED9SVg25JLVGuDPEhAxHocCd3DEOiT826xIsvEcpYyBGdA6UsqG5
 Ksi2b7YU8JIsXv0v0s2zFyE28lpJS8VTyM0yhZo2vA+R7iUMlL35hGj3j9TzSFPx/f8rkY/+Ve
 YdOH7vLVEfArNyNRKRzfStVBZBlmdChu3625HBO+N9J0QwyvelrYZ/VoVdir3rjq8CLXYgM3Bd
 cdKKVFaSZp7naAgv2pyJWFnM
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="141566123"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:11 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:06 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 02/14] mtd: spi-nor: core: Don't use mtd_info in the NOR's
 probe sequence of calls
Date: Tue, 7 Dec 2021 16:02:42 +0200
Message-ID: <20211207140254.87681-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060313_197393_E3AFDD05 
X-CRM114-Status: GOOD (  14.81  )
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

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
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
