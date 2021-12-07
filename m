Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF855C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAd+Q73GxypF5jD4+9XVJYTwLU86oQCbQk1yKhKOKd4=; b=zlInUDdCWUmy1D
	25MWt55z/xQiquCaHv4sU7IrqzTU9Ch3gSi+DVVPtmtriXo+2SmthAZzATXJgxs+KyqONKCu+167K
	4q00QzBJE0w+OetuAdb8+HxfBXPmWgRKXfRRPcmywp1W+bnTtNI60X5XaeV3TeP183bDPPCQEl0Xa
	t8ciVUMBx4L2TA6UW2p/PgrFx+Aag47M3q5J70KjKK0JxVLlD41A85wHgRX22zHEtYK8vhWRV9wO5
	vFrRcJjQZZIBLNMxx5LMIOwrtddu4lXLBdiii0Fs620vJGhYSs0BA6A9I1QypE7W1MX6iQISb/G1g
	zIubuFukVcwXJxYsdVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mub3o-008p2l-Qt; Tue, 07 Dec 2021 14:03:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub3l-008p1Z-No; Tue, 07 Dec 2021 14:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885789; x=1670421789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/uxEWXgMiVfBk5peLilwzNLeNIDrigGq118q6uhUieE=;
 b=lM85Gu5u5yS0+WX5ZoFtqq42BCBb5SgSj4HsEbN0Gz/I73zhCePxpJIG
 xG3NZGtcYUcezVUg76Kbk2v71YnDJ6o2n1cF6ta+8UsOlnn6q6tZZP/Dg
 qbE8PihoRZ9sQRBbejlfQ62dt0kOykvvz0La/fdFLrj3/yEoaL/MKzPbt
 Lc42/7RIDfS8977xEdBCVj+EK7JnmYme6PL7tTgb9o0mAuRww/oKQJtBU
 xzNrj1xW0mC6rnNtRwZ5utabTRBX/i871HMksmkxzuYoo/wuqDnZCtR/f
 LVXqhMgA2xAtEmwSQmNPGECXFB1fr9drd63TSs9Ogs4z2idZpolV9Ocu2 g==;
IronPort-SDR: ubzH2T/p6yQoy9eNf0AAE+xhgNqdkZHEymGU3A23v9IW9kUobxEDUyksKOPp0x41XLU7h5ZV+a
 sABL5Ek0mshX8zRsTdAkLdDn35emzY1JNiU2zVKiQDGxjsC/iR180D7tLBY7KvTW1kPWCLUxWy
 wFvs94JUrtmj9gJIu2DOTSfAV2rT24eaZa9gFURgSHX726JJg04iKHbumHhE+RGi43OgnbPYT3
 MXEd50p/qfKhr5FklYnb68ArBXI0lFMotBPYjOnILpAVCCWwiJGS4zwDY4O0cGITRzRuE+mOkq
 8zdCMY6HrrQ0eCBNo1tqklmp
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="78762120"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:06 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:01 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 01/14] mtd: spi-nor: Fix mtd size for s3an flashes
Date: Tue, 7 Dec 2021 16:02:41 +0200
Message-ID: <20211207140254.87681-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060309_917487_2AF344F8 
X-CRM114-Status: GOOD (  10.00  )
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

As it was before the blamed commit, s3an_nor_scan() was called
after mtd size was set with params->size, and it overwrote the mtd
size value with '8 * nor->page_size * nor->info->n_sectors' when
XSR_PAGESIZE was set. With the introduction of
s3an_post_sfdp_fixups(), we missed to update the mtd size for the
s3an flashes. Fix the mtd size by updating both nor->params->size,
(which will update the mtd_info size later on) and nor->mtd.size
(which is used in spi_nor_set_addr_width()).

Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/xilinx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 7e970ccf7903..03d3b006a039 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -69,7 +69,8 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 		page_size = (nor->params->page_size == 264) ? 256 : 512;
 		nor->params->page_size = page_size;
 		nor->mtd.writebufsize = page_size;
-		nor->mtd.size = 8 * page_size * nor->info->n_sectors;
+		nor->params->size = 8 * page_size * nor->info->n_sectors;
+		nor->mtd.size = nor->params->size;
 		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
