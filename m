Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F4CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6ZgZ8TGCEZTZE9imMY5XkOXrDGiiRxThxnn6kacdDk=; b=Dh0tDuOoJdsjs4
	JNy47rpgeScaXqsx5jtwkwxBt/EvSFkUFIb1al7blAJbNdulQPt0VsCgxSPUVOrINf+Hs/hlzP+/8
	pf4GLdjC+5mw+pLEsx3rf0K8scEoghJ3TRdDCRibu6uFwcM920GKTSZ5f3b33wsfIP4L69YeIipBr
	fepiIF4fPy9O8MCQxJy7NRy+X47PU9rDgVkhw/iEAXW149Wcp/YcWwO7cGDL9D+Qe7EuOohpN7wjb
	/KqhOoZ5NweHdTKHskQhURn31TV28PyuyTLbE/t6WcU/K03qT4BOHRoH86BSpQejlWrwXecvfeRki
	NNxGn/QVpm2+UNAXPNVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnA4-000B2K-9e; Wed, 09 Feb 2022 13:37:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHn9o-000B0B-Lp
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 13:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644413836; x=1675949836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CMjglc7GXjGxSQwp6Yw7IR1ZYGUEHdQnQhIO0fo1b8=;
 b=SQ6fmu7wllyaWrGhchmZ+BLCAXGuDmdSxGIEFg1ZAYFNlN2phrtDDSq4
 2TApCP4HcyWF/99sUEUAXD/G9AK6CxBUDvkmVSEqdJGa3chQ71J2Ezavm
 8RncLqNThUF3eB6OdU+66yTI+h86S92jKzicT7+qi/Z25bOcJTtoo2LUR
 KBpeVOKJp/EmslrA4FiDIeOwnefXCs04pw2IaN7ZmJu1xzN3i1G/2yi7S
 KNRXt556oh0E4FFAcGg0SNOo0x0/WbAepVL2y36noihJhW1oIBAQf9dNV
 Hh+H5QlqhdtJQjqwroyAsxmVy2AbCHoBV/2VZs5uehGBo5iO0ypz5KfZW A==;
IronPort-SDR: xi/Zx1nNoDCg2sQC3WLhK5Wzx5fEgzKGYKSF71yE4UeIQKTHNOwNAsbhdXbO/ELNTvRJKR49Ga
 bcizM52sqMtDQ7sevNWwKROf18rKkULXzKNLUX7PtYiQvx02CjtX7/g3RWCsQJz/CjribmLVOR
 +NRjZ2iOEAtD/98md0tD2KzrvzkR0X5XIBmdNzXj3MFBCmUBE2585CviWj8yWZyaofSGufmC8V
 VmMYEGOf/NvSitx+KGa1lMk3hp6HyeDxPTSE2Masj9n4pozMsF/lBoFgQ6IadRnCxlGJtpwgam
 bksvnOSX0a2RRUJKR40tg7RA
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="145394778"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 06:37:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 06:37:13 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 06:37:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v6 2/7] mtd: spi-nor: Introduce spi_nor_match_id()
Date: Wed, 9 Feb 2022 15:36:51 +0200
Message-ID: <20220209133656.374903-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209133656.374903-1-tudor.ambarus@microchip.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_053716_820375_C0A0EE4B 
X-CRM114-Status: GOOD (  13.29  )
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
index 345f9da96fab..335170fc2438 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1848,16 +1848,21 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
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
@@ -1867,7 +1872,6 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
-	unsigned int i;
 	int ret;
 
 	if (nor->spimem) {
@@ -1887,19 +1891,13 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
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
