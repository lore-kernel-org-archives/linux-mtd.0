Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3FDC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lxUJlLrpb2fth9XHo4UfPSowEt/TlFB7BBgEU6/1KU=; b=IReYAQqjOD6VoD
	LA2sT9OkvlK0soY+BUfO1Xur2r0akXjVOjrdlqhTGnRyaexnZK0Vi4J057pZd4oAm6tglIgw3ESZ3
	VQJK/yLlAyXU2ektAfVShvZbOcHZXRPCuei1tjGCr9udnKlXeZSBBth1+0SHUMT49QPF+ngPuEIqs
	RcYcpWmO8r/JU+3z9y7X+eJrbJJMK8fZJSm0NFKoC7AxozpRnHiPml5OHk/GyUdYhJvpQQVvaITYT
	HPcybw+FGANeDjtKiw+CXPiHF/yp5xPIT7xxUsFj8QoCli01MjiDbvl6OG9BHA9FfdF6Msw+mdKIY
	MnCaIj6Ni6l+6mbj0E7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrs-00FfU0-8C; Wed, 10 Aug 2022 22:08:00 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrH-00Feqq-P5
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:27 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 8C69D22256;
	Thu, 11 Aug 2022 00:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPT9n9q6nJ4yFRRCNrEaQmcmK6+6ARgdGxqRYdby07k=;
	b=AestYAoV18zRkiZfPrntjjb/ZrFxiF0t0kU8pU+Df/bepk0elHQMH3h47qHqqmSwOTDPaM
	UyLhoM7lWtQGXomt+GDVCea2DoQFy8ZKWPDFap/vq/K6z1/7v+nWkFXJvKlQKs2caeIZ4C
	T8GhXFzjOtrbD+0tB1fSPXHXP+CbFRE=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 7/7] mtd: spi-nor: sysfs: print JEDEC ID for generic flash driver
Date: Thu, 11 Aug 2022 00:06:54 +0200
Message-Id: <20220810220654.1297699-8-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150724_084035_25454CE9 
X-CRM114-Status: GOOD (  10.39  )
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

We don't have a database entry for the generic SPI-NOR flash driver and
thus we don't have a JEDEC ID to print. Print the (cached) JEDEC ID
instead.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sysfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 20563c1926f4..c09bb832b3b9 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -35,8 +35,10 @@ static ssize_t jedec_id_show(struct device *dev,
 	struct spi_device *spi = to_spi_device(dev);
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	const u8 *id = nor->info->id_len ? nor->info->id : nor->id;
+	u8 id_len = nor->info->id_len ?: SPI_NOR_MAX_ID_LEN;
 
-	return sysfs_emit(buf, "%*phN\n", nor->info->id_len, nor->info->id);
+	return sysfs_emit(buf, "%*phN\n", id_len, id);
 }
 static DEVICE_ATTR_RO(jedec_id);
 
@@ -76,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
-	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len)
+	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len && !nor->id)
 		return 0;
 
 	return 0444;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
