Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CCBC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2+5mahuM72bvwJsiJWWyaYgod3DnCR6hvJqUV1zGNA=; b=Yfynf7UI8GF+kl
	p6inJlQjXI16Ii2A9H1hTOY1+USMLKzlThYBr1a9MAcAcouWp0jL1EwJZYMXdw3EMVqfOONp72DVF
	i/JvGJhmiLmtMpWDgrwDloPYfFGBpKVSe+dhtxxypuAkU8vk6H6Eu5usJVgjUHbL+9U6G235l0+N5
	ARYLcLEqlocbeOcQunBvFC2mBvc9ZA1Ug8EYQ01GkHYPeEWBqpkVhZxaF+5HabG7OE4m0d55zVFWy
	OspdL6GtbwarBY7T4FbY4H55vkykui+4khsioajrEICf0VslierULbpUbfkVagBAeEYCOEz647gtv
	C0ruweVBpyyef0qlzwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLJ-007WxB-Vy; Mon, 25 Jul 2022 09:25:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLA-007Wnn-21
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 09:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658741128; x=1690277128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P7R29tb43MgRnq9v473EJ/c3424pZyXG087RWWYU9N8=;
  b=d+OCZYtvs3DuJX3biRfh6H97X4Qmr2F1/RTXCn9/zAMa5Pc0JboTqVrq
   kk+l0Jkg1HthCxMpA+KDAt9OzvHXNn9Lbmy5VjfwulZuSt1/MlZcTFh5A
   4lH/yQ6iFAFizsmpiOeKbgHIAyg+J45fBlew0IOiB3k9+6SYZwdmFjF6m
   J4tuX0a7+W+DSPCHVH77Rxw1kKjdH40s6XV1zDjdxELAGRgIPrh5FMLTV
   lpcwLve7i74iKQEZrdwWsC0aeHTlUUU9pLHDSKOm7JzUE6Bd1ZXG3VcTJ
   A/dAjjfBZWhniULdLCTkOwOgyZC12CfFDIeyc6NIe/qA1KxMM2Wr7tacX
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="173491224"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2022 02:25:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Jul 2022 02:25:26 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 02:25:23 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <tkuw584924@gmail.com>,
	<Takahiro.Kuwano@infineon.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v17 2/7] mtd: spi-nor: core: Shrink the storage size of the flash_info's addr_nbytes
Date: Mon, 25 Jul 2022 12:25:00 +0300
Message-ID: <20220725092505.446315-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725092505.446315-1-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_022528_119081_0B68DDA8 
X-CRM114-Status: UNSURE (   8.19  )
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

The maximum number of address bytes in SPI NOR is 4. Shrink the storage
size of the flash_info's addr_nbytes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 14921a507b0f..19a692e27c92 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -487,7 +487,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
-	u16 addr_nbytes;
+	u8 addr_nbytes;
 
 	bool parse_sfdp;
 	u16 flags;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
