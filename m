Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED21C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkekNBb8h+Qy0YzDsm7e8qaedO56eEZPuDRCEisDhS0=; b=BxA5I8hWiXzLLB
	CKj4OYsVA95c02x258oUR/nUeRNzTD56ooxl9T16b0yfni9WqOi6wP6d+EY4HSxJfj2CwsSxfq8PD
	gdHKeNuc46g0jd1ML2LbNe0x9Sm8q0Q+uaMVt+z9R0+SNDWo68a9fV8irQDK3ze1LCxnBpfLzr6Mw
	437VjZ3/w8BlwwktlurhCNF9USQ5VHlks/OqTtxLiGwt5VhxMwWaWO3/hWyUsTpWQTS8iuAgcGCB6
	dpJG8+qZLEVYy4QG1jjrohL8V6SblR70VHo6A81bUrHlACKDL4s2m9rx0lLW05MWpF0Pb78y7Z/Hc
	p7NWzI+ty+IULsGEI5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrc-00FfAH-54; Wed, 10 Aug 2022 22:07:44 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrE-00Feg0-Fe
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:24 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 1A7382224E;
	Thu, 11 Aug 2022 00:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uos5wFE9l5TNcF0CpsE0RvCrDFSCsDt4ePVcmJm7B3E=;
	b=Dz3MjLS96nYUJuqYuqS7+zXmH56Xj4kQDQ0EwTvCN9keEqeC+kovPxNAxACJIkQQm/A3pq
	0v+r5qV3ZBO12M5xgH5uiweOWAz8SnQ+XtCoNywLAxgU5pYto0IgCz2P8TV/tjjq7ofwFI
	/z9lj2FtLYjmk7vfextXcoksqKdVnXI=
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
Subject: [PATCH v2 3/7] mtd: spi-nor: remember full JEDEC flash ID
Date: Thu, 11 Aug 2022 00:06:50 +0200
Message-Id: <20220810220654.1297699-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150720_830352_DDB9D832 
X-CRM114-Status: GOOD (  16.39  )
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

At the moment, we print the JEDEC ID that is stored in our database. The
generic flash support won't have such an entry in our database. To find
out the JEDEC ID later we will have to cache it. There is also another
advantage: If the flash is found in the database, the ID could be
truncated because the ID of the entry is used which can be shorter. Some
flashes still holds valuable information in the bytes after the JEDEC ID
and come in handy during debugging of when coping with INFO6() entries.
These are not accessible for now.

Save a copy of the ID bytes after reading and display it via debugfs.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c    | 5 +++++
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 include/linux/mtd/spi-nor.h   | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..f1d01c7dacce 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1664,6 +1664,11 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 		return ERR_PTR(ret);
 	}
 
+	/* Cache the complete flash ID. */
+	nor->id = devm_kmemdup(nor->dev, id, SPI_NOR_MAX_ID_LEN, GFP_KERNEL);
+	if (!nor->id)
+		return ERR_PTR(-ENOMEM);
+
 	info = spi_nor_match_id(nor, id);
 	if (!info) {
 		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index df76cb5de3f9..ff895f6758ea 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -81,7 +81,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	int i;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
-	seq_printf(s, "id\t\t%*ph\n", info->id_len, info->id);
+	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
 	seq_printf(s, "write size\t%u\n", params->writesize);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 42218a1164f6..25765556223a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -349,6 +349,8 @@ struct spi_nor_flash_parameter;
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
+ * @id:			The flash's ID bytes. Always contains
+ *			SPI_NOR_MAX_ID_LEN bytes.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
  * @addr_nbytes:	number of address bytes
@@ -379,6 +381,7 @@ struct spi_nor {
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
+	u8			*id;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
 	u8			addr_nbytes;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
