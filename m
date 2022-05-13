Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42DBC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XyBYI6uCeHu7QMIqtXMCy71sc6nBf6USK9YWK4TVRA=; b=ayNppBddTQ16ZB
	bH6Y/WBk7rZZ9kIpz96H5vbSEyA+0K0kaxtoeRE9IiBpQhE+pTUM9J4/vUD+PYfRov9RsMYqPJqev
	ejpgSrIMVrPOwiRdSura16eFgBlMtagF1E49V/fcFibsxUeglnstU5MEgQ5zJj9YdVQ1hi6rawDbh
	gu41XTnSlaLXfci2UrEOj65cCnd7XEmZWes1ztJeVqdp3gIGYQn7o4GxXExrelV1O35J4Pnzrryu2
	hW1A4gvCsw+HdlE0hQLkIrt0zqTqByeCrYYuRB/9Y+707KQ6NIvx4m7h5D3jMbWUyZThspZH95p4k
	yR8bIyLPQG4lyP+lc9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npVSU-00GIME-Ns; Fri, 13 May 2022 13:35:54 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npVSH-00GIGb-2l
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 13:35:42 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AD66022253;
 Fri, 13 May 2022 15:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652448929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SVQYJZn3MFW22DboTz0AGRIBdFV6caUuIlQOpfVNEM=;
 b=OqgVcIKS9cWpiQSb6R55BgLtStx6Yx9vXWnqlEsYfTEm5DYWcLaRCzLRvv6cTYbrhFCvng
 hy7n5II+ilnbm8VrXTtcrzWBghu5e5J3dj/HsoXNSZVFJhDTZlnjfSjjnU8vQyHb86QlCg
 HlOfx8oSH8wmt9CvAPSNdXx5046yqXw=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] mtd: spi-nor: sysfs: print JEDEC ID for generic flash
 driver
Date: Fri, 13 May 2022 15:35:20 +0200
Message-Id: <20220513133520.3945820-7-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513133520.3945820-1-michael@walle.cc>
References: <20220513133520.3945820-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_063541_366930_3E1B2B32 
X-CRM114-Status: GOOD (  11.28  )
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
