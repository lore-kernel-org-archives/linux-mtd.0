Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117FCC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=px/xVLVL1SzZAqbfSuQjk68aCnxGU7u5XWW8AppjRXo=; b=nZQetxxknK82y2
	LS53NI9j51p9cvkR/SNAvViIjClyHOnNjn2hKXVMr7+kb90tn207sPpMdTROaGipvBf05uuC0UTTz
	NnNa5wTZti5Iuj5DbZ9sc2yBbpyOFKfUK5bkKFKUgCxEhI41vk5QLH0wSg9KWe753Odb+y2j5NAuk
	Sfw0M0P9hE+NYjv/XH2N2uinye4m4tzTjzyn3fH0Qav5gCgipgqnxmhhKWRwpWn4DKqY6uTHV7Hjw
	1iNpSHJhE1HqOWUkMGCC4jB1SVIWqC/zIXSpiM/F43Z2grvpAzEHSY5j9u6Q/NgchUcX7EoenvYkK
	5POS/Z14ItxRBu9aL5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeLK-00BvcB-85; Mon, 28 Feb 2022 11:37:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe24-00Bn2n-6O
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646047056; x=1677583056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+858RdAMNjlEkMUdfziJy7i+wtZ5Om3Lqcya2mdiono=;
 b=EvNXISqonlQh60jb1LBNxiMyZfb01+q51pN2KQqUcieHr/wd485fJpIJ
 NaeRzTSBGnv8bhDukPMlVSrRRR4jG1T3Cj7RkmL5b0RfwlQE6NLszJ/ZY
 lG90Upn2zK5L9Sc9VxKLRC4Hukjxp7ly75pQ2dKG/ZbL3qIJ6gyyhXjqW
 6YHx7vm6XGW1xLDfs6W+1fkexOIkkSREE0/Np+9DJ7k0PAJe0ehBb3jNV
 p0gd5ELXaXh5TyRDJVu1buaq59HDaFfz0zHR1HAgpaH/xCPjCgF1P0Tha
 Cx+LFDl9w7Xq8tVHM9d23Cganq+fuE5miyL5mfYzO5Xx1Nk3+C8+/dIrj w==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155099347"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 04:17:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 04:17:24 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 04:17:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 2/8] mtd: spi-nor: Introduce spi_nor_match_id()
Date: Mon, 28 Feb 2022 13:17:06 +0200
Message-ID: <20220228111712.111737-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228111712.111737-1-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_031736_308858_632A5A22 
X-CRM114-Status: GOOD (  12.64  )
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

Similar to spi_nor_match_name() extend the search of flash_info through
all the manufacturers, this time doing the match by ID. There's no reason
to limit the search per manufacturer yet, do it globally, search the flash
in all the parts of all manufacturers in a single method.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 40 ++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f3c359d03163..f87cb7d3daab 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1629,16 +1629,21 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_xmc,
 };
 
-static const struct flash_info *
-spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
-			  const u8 *id)
+static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
+						 const u8 *id)
 {
-	unsigned int i;
+	const struct flash_info *part;
+	unsigned int i, j;
 
-	for (i = 0; i < nparts; i++) {
-		if (parts[i].id_len &&
-		    !memcmp(parts[i].id, id, parts[i].id_len))
-			return &parts[i];
+	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
+		for (j = 0; j < manufacturers[i]->nparts; j++) {
+			part = &manufacturers[i]->parts[j];
+			if (part->id_len &&
+			    !memcmp(part->id, id, part->id_len)) {
+				nor->manufacturer = manufacturers[i];
+				return part;
+			}
+		}
 	}
 
 	return NULL;
@@ -1648,7 +1653,6 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
-	unsigned int i;
 	int ret;
 
 	if (nor->spimem) {
@@ -1668,19 +1672,13 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 		return ERR_PTR(ret);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
-		info = spi_nor_search_part_by_id(manufacturers[i]->parts,
-						 manufacturers[i]->nparts,
-						 id);
-		if (info) {
-			nor->manufacturer = manufacturers[i];
-			return info;
-		}
+	info = spi_nor_match_id(nor, id);
+	if (!info) {
+		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
+			SPI_NOR_MAX_ID_LEN, id);
+		return ERR_PTR(-ENODEV);
 	}
-
-	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
-		SPI_NOR_MAX_ID_LEN, id);
-	return ERR_PTR(-ENODEV);
+	return info;
 }
 
 static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
