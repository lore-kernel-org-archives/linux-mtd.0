Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2839C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ec4zc4jx/Er/Njg5R2+QHPBzAlghcNz5mMIbCGLdznI=; b=K7zvvIqyucOhZz
	qReWgRxy1GlJkAC/qN4T0b1I5li9o363je6jPtwtlLzAqCrJk22ExIlNLrgOBEgrgp9NH7ufOlbj+
	cAUqfXT2QvKjVl+6E3UOR4+YzBEgJNDaQZTI5Bp5zn2+hjCLgGvA3sTg05BqSXKOWz2ogjRaG1Skb
	CHVOu9c9Q8mL1qlhZyYMzKdeuKDFiNa7K05B9QBLFyKTZNSiSnVyCsLZClsGc78xKNR0cqlMsjc91
	yOImNkSG6XjzewPr/WDxuVwa8RTfWkATb4t4a10NcR5r6BvxJKLWWALxlTdfGwEGJwg1ZTwOc9+oX
	3m9j/juywvv+th2MqDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOiy0-00DLip-UW; Mon, 28 Feb 2022 16:33:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOixx-00DLh6-Jg
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 16:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646066021; x=1677602021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UdSjyJ1B+8BlqPXgKZCokBvRIg9/Y/nN4hv5bYbeSv8=;
 b=H93m1Zy1ONPvoY1GqCE8xWHc2CzPIOZxV2P4nKKwmx97+qNzNC3IG0NQ
 lrAB4/Ii/yvOp0h39u1lkSGxqsh8ATdq2bDY+8Cu8odDSgH4hshRUWQPb
 YLmXX+cxgIZLJvx9KiollU2OK+czBA2E6HEDwk4hyVUWMp+e/IsB7hVXI
 XJRM7DB6ZN45Bm6oVB4H//kMUspaWa7pOkUBc9ymev1yd05zuMGn9q/zy
 JvbfUGNfmKmZAJgjBaZzV4i+VQEZPHpMOqdyE0j3DUcXIqEMAn2RqAm2M
 BtNcAn+AHHtj8xDRpUmHidljcZGC/Zt3j3f8bd7zTrMFRQHfX+MGdVls1 Q==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="87262415"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 09:33:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 09:33:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 09:33:37 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 <stable@vger.kernel.org>
Subject: [PATCH] mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is set
Date: Mon, 28 Feb 2022 18:33:34 +0200
Message-ID: <20220228163334.277730-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_083341_766109_D51AA001 
X-CRM114-Status: UNSURE (   8.84  )
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

Even if SPI_NOR_NO_ERASE was set, one could still send erase opcodes
to the flash. It is not recommended to send unsupported opcodes to
flashes. Fix the logic and do not set mtd->_erase when SPI_NOR_NO_ERASE
is specified. With this users will not be able to issue erase opcodes to
flashes and instead they will recive an -ENOTSUPP error.

Cc: stable@vger.kernel.org
Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 86a536c97c18..cd2d094ef837 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2969,10 +2969,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	mtd->flags = MTD_CAP_NORFLASH;
 	if (nor->info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
+	else
+		mtd->_erase = spi_nor_erase;
 	mtd->writesize = nor->params->writesize;
 	mtd->writebufsize = nor->params->page_size;
 	mtd->size = nor->params->size;
-	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
 	/* Might be already set by some SST flashes. */
 	if (!mtd->_write)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
