Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CCEC3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+OBXXC4j1HNJ6cYGpwzHgIZon9v1DFYbXCDbnkFIEMM=; b=N7Vug71bwD1fjb
	wxG8Q/2Ar6uCC6wMW04SCxXFdu9qZfYj5ms/cJb8xOHZ7Ia194TErVjRMweOwQtZ6jIQEJVlvTN6a
	edtP0bWz7V8CVjYHibo+RHdKv80QBb6z+RpGndDh2ii9ilNc7qWMaspIJ+Xk5zVALdhLTUT6qCDPG
	8eyIz7VNMH8XZZogLgC/p1HBrRlgRZqys1x8rf3MotHpHiyR1Djm5VGdQnIP8o7eh+WPzWJ51LMSa
	EjIIBUZOvoeYyTUtcFx7IgnawO6+fEtsFPxdjPbFZb3ek8OQ2bkwxSUgS06PofD2MDgOJPvN0n9Tr
	tTzi4ToJ04xRJbQUqTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHfwe-00ANLu-2n;
	Mon, 25 Dec 2023 08:04:16 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHfwa-00ANKw-39
	for linux-mtd@lists.infradead.org;
	Mon, 25 Dec 2023 08:04:14 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5ce10b5ee01so466357a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 25 Dec 2023 00:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703491448; x=1704096248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SRYh9JcdZwrWgCTkyT+A6gkekbb9XBl7XM7HAyspNY=;
        b=NU93agdt9MG91iJSjsZhy4DOG/q3qbxXSqCdQ5qg1kso9yIaGqKtDE+pP/OBvnhc6B
         2HEfKNLFqK2k1zTt3dANIhwpcRNgTTqjfQUf6EDdZ47knuAhfL/FURMFbhrt/KPDMC4a
         wpNBX3MRT6OOdTGYHNUWobmjuJH/idxhYmoiSiz1gTC1nFXf7KhbtPrCrKLB5lriEjK8
         wnQYQiN5+mku917bvRxoutctNLZwgqlDYN18gzPfnDKEG22ftC4muOquWv5Nrw6GndJ1
         HpneGOpVP5/sOpBOITufE6O8DKhJs8eroxTocKnqobO5d1t+neYVfgw1rck9jhGKc0zq
         Fr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703491448; x=1704096248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SRYh9JcdZwrWgCTkyT+A6gkekbb9XBl7XM7HAyspNY=;
        b=dupAVIrwokrO5aJgIR/VII0eF/KjkHVoNlvKvYqjClDWTroiRPQj6zcGf1UDVZw8ii
         vwdidL133dPMzxacYc8qZTtSU/EMQhRVtrk2Bt3Tjigc13o0vmP4Z7W3CphlSs7z2aHY
         BT4AhCsOAccFlk41HxSaY/wJ3vA6ZJ49GZ+mXEkA3Ejo5zhAhaD+ShwW66p05Aql/N83
         +sC+a5oAwyRsI8eUlQ0yYWSxibMiXx0ZrvVuI/unHkSl+hXoUIJWqzcxBdBDX276Af1h
         /vNyUMhJkA02GYJBBtw6A3wDA6P0T7fiWXQM3rEPFpjAh/zrEYaUR0xayV5COw67u243
         nZxQ==
X-Gm-Message-State: AOJu0YwR2yjCEbwkSCkpa+jqFCGW5MR4e++Mt8OTaMqW7Joa481pacM/
	ygf5jwGQ1+EXxSf1LA0zWYw1xa4p7OU=
X-Google-Smtp-Source: AGHT+IGO5HIP1ZKDRvQrIGFY65Nu/aApkXOd7L/joDKUVHxS7sei9Ix7KShEtJAr08PiRb1Xc/nk6A==
X-Received: by 2002:a17:90b:1d85:b0:28b:f6b8:576b with SMTP id pf5-20020a17090b1d8500b0028bf6b8576bmr7046408pjb.25.1703491448443;
        Mon, 25 Dec 2023 00:04:08 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090a540f00b0028c05e64f3csm5773608pjh.7.2023.12.25.00.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 00:04:07 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform erase map
Date: Mon, 25 Dec 2023 17:03:49 +0900
Message-Id: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_000413_032882_95FDD55D 
X-CRM114-Status: GOOD (  20.66  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Some of Infineon SPI NOR flash devices support hybrid sector layout that
overlays 4KB sectors on a 256KB sector and SPI NOR framework recognizes
that by parsing SMPT and construct params->erase_map. The hybrid sector
layout is similar to CFI flash devices that have small sectors on top
and/or bottom address. In case of CFI flash devices, the erase map
information is parsed through CFI table and populated into
mtd->eraseregions so that users can create MTD partitions that aligned with
small sector boundaries. This patch provides the same capability to SPI
NOR flash devices that have non-uniform erase map.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
The s25hs512t has 32 x 4KB, 1 x 128KB, and 255 x 256KB sectors by default.
Let's think about creating three MTD partitions that align to region
boundary.

BEFORE applying this patch, 1st and 2nd region are forced to read-only:

---kernel log---
...
spi-nor spi0.0: s25hs512t (65536 Kbytes)
3 fixed-partitions partitions found on MTD device spi0.0
Creating 3 MTD partitions on "spi0.0":
0x000000000000-0x000000020000 : "4KB x 32"
mtd: partition "4KB x 32" doesn't end on an erase/write block -- force read-only
0x000000020000-0x000000040000 : "128KB x 1"
mtd: partition "128KB x 1" doesn't start on an erase/write block boundary -- force read-only
0x000000040000-0x000004000000 : "256KB x 255"
...

---MTD Info---
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_ROM
mtd.size = 131072 (128K)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

zynq> mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_ROM
mtd.size = 131072 (128K)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

zynq> mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 66846720 (63M)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0



AFTER applying this patch, erasesize is correctly informed and no read-only:

---kernel log---
...
spi-nor spi0.0: s25hs512t (65536 Kbytes)
3 fixed-partitions partitions found on MTD device spi0.0
Creating 3 MTD partitions on "spi0.0":
0x000000000000-0x000000020000 : "4KB x 32"
0x000000020000-0x000000040000 : "128KB x 1"
0x000000040000-0x000004000000 : "256KB x 255"
...

---MTD Info---
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 131072 (128K)
mtd.erasesize = 4096 (4K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

zynq> mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 131072 (128K)
mtd.erasesize = 131072 (128K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

zynq> mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 66846720 (63M)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

---
 drivers/mtd/spi-nor/core.c | 55 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..e512491733a8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3408,7 +3408,51 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
-static void spi_nor_set_mtd_info(struct spi_nor *nor)
+static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
+{
+	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_erase_region *region = map->regions;
+	struct mtd_info *mtd = &nor->mtd;
+	struct mtd_erase_region_info *mtd_region;
+	u32 erase_size;
+	u8 erase_mask;
+	int n_regions, i, j;
+
+	for (i = 0; !spi_nor_region_is_last(&region[i]); i++)
+		;
+
+	n_regions = i + 1;
+	mtd_region = devm_kcalloc(nor->dev, n_regions, sizeof(*mtd_region),
+				  GFP_KERNEL);
+	if (!mtd_region)
+		return -ENOMEM;
+
+	for (i = 0; i < n_regions; i++) {
+		if (region[i].offset & SNOR_OVERLAID_REGION) {
+			erase_size = region[i].size;
+		} else {
+			erase_mask = region[i].offset & SNOR_ERASE_TYPE_MASK;
+
+			for (j = SNOR_ERASE_TYPE_MAX - 1; j >= 0; j--) {
+				if (erase_mask & BIT(j)) {
+					erase_size = map->erase_type[j].size;
+					break;
+				}
+			}
+		}
+		mtd_region[i].erasesize = erase_size;
+		mtd_region[i].numblocks = div64_ul(region[i].size, erase_size);
+		mtd_region[i].offset = region[i].offset &
+				       ~SNOR_ERASE_FLAGS_MASK;
+	}
+
+	mtd->numeraseregions = n_regions;
+	mtd->eraseregions = mtd_region;
+
+	return 0;
+}
+
+static int spi_nor_set_mtd_info(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	struct device *dev = nor->dev;
@@ -3439,6 +3483,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	mtd->_resume = spi_nor_resume;
 	mtd->_get_device = spi_nor_get_device;
 	mtd->_put_device = spi_nor_put_device;
+
+	if (spi_nor_has_uniform_erase(nor))
+		return 0;
+
+	return spi_nor_set_mtd_eraseregions(nor);
 }
 
 static int spi_nor_hw_reset(struct spi_nor *nor)
@@ -3531,7 +3580,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return ret;
 
 	/* No mtd_info fields should be used up to this point. */
-	spi_nor_set_mtd_info(nor);
+	ret = spi_nor_set_mtd_info(nor);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
