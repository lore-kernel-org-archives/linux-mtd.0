Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F0CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1djMIsujXPgMTixHvT2mJ8JUzPeGUhXuGlpwcE5rwk=; b=NPt0P8BhLOzb0i
	5+pB6sgctIELP77KsCaDze03uNwhVASCX0LYEVUSAQOJg6aqtwruDgCQzJlTRXr9HKDUBpaxod9by
	DwMdaacV33XxJxSgT0NedXXV5pcsoCB885LncyIhYK8+cXy1L1PGzc1ufsdTXKwfm575VbAEBWkpQ
	JZSEfozPVsylwNrjSHyOUB2iq3y96cWNgcFnNi9TWZg6boxoYk0OsMDmZ33k2E5sEGwL6fo/0Y5We
	j35F8x0B6E2iH1FPTwM0ZoO3A/KZx7c/uuLsU3DMWMdbzjG6rlOR/JmlA9hDkCy8/A56c6fMtoxr8
	QxYfLKQEnlUGQxBxiO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9TK-00G80A-5t; Fri, 03 Dec 2021 14:23:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Su-00G7va-Tr; Fri, 03 Dec 2021 14:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541389; x=1670077389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pjrGyDAnno1WiQsVSso96VBXw9Fi71sKN0/2ZQDNSg8=;
 b=jscTd5kOFXixZMlEIjur9gw9wCbsZB7Xi8XQeVzCVjNs2cEMviSjEHlJ
 /EOb4/Su9I1JRwGC7QKMtFP+TnZW9HqYX2d5F7pbZ+wED5r4F/bh9FGAq
 5mOn4mwsIU9r2cTxI5x4tzbbFJejADpwnQwWW0zmL54QolFDZn9b1Iy2f
 lgDlwtpMcl3VaOORZU+0nflmFe52oxYeRjugiMub2VQMp9l3KcEs3Or8p
 mtcKrz/hheqg86if9Osxf850Tdm3afxj+ex7bdQUzYdq+VFcjJgmRsvw1
 yEVl5ZuCvxN44ZWOgMVglXuOQ7zVRbp/dqSAIxOhn/fN7UFP1eDNxBU6B g==;
IronPort-SDR: slbWBwQKiGJaQaHGHitKQc41Pu1tSvTXouKksBaCLrFHJABtE0bD5lf2rFiQv032y6da4YtnZp
 kOoVai0x2H0ga4RoGYq9r5uzcmkRhSOXs4w/XQUc8zhClZCSRSaRW/ut5FbOMU/Meqpl1WkeJl
 1V5YXVJeLmUL8OIinEYfDisW8RNuxQ9/LylFbmvU711YpTkZX4Ojj15cBqTyRfKf42PjjphSXd
 UkdYUtsrvgHwZpSBCFe7KBwWcLFHBsi/IR26HwxvJy2sOX1yMLuNHCwnK1ehtIBypZ0eLHjpmz
 s1ogdxFwgGZfw+29Vy001VL5
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141189157"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:06 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 01/14] mtd: spi-nor: Fix mtd size for s3an flashes
Date: Fri, 3 Dec 2021 16:22:43 +0200
Message-ID: <20211203142256.47370-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062309_054753_17C4E215 
X-CRM114-Status: UNSURE (   9.89  )
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
