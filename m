Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA30C54E94
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p+7TuPp6PeFq7dnWA+b88dPx/Z0KDqcoXNsPvdyuXVk=; b=kTdVcYOA/TRI16
	9ILAqbqzhpG39GpREXk0umG4KaJ8mHsdoDQ08Qt+wiSji0SyIuHBCx1xM7q6rkLXnPf1x93rk38ew
	CqhhgMuEZ5QCadOXLdqCaS87IjvthTOl76GB+hml9JhvI1DTzjjNgGtAb33kbYx35Yxz8cC+pCUs9
	kx/hNFHd3VBTvT5q/JtCmyppkxfou+g+vXvDa65HiDwqDVr2QJjaDdLg75tvwzht1yQNjJ2VkKY9o
	wpgthIjLGIKDWSglcFkdzyBQ+CJDyYfXee0aFMM3KPPz0RG4h+2XDn15CIuyXSY9Uj0hYLug6H53+
	32fZCWUdHz9oNxJwsqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3lU-00BMdk-Dl; Thu, 26 Jan 2023 15:02:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3gQ-00BKee-Vu
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 14:57:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id b7so2056782wrt.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2023 06:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGOKKMo3R8QfnKwfvnMn5JBc0/EEZ44Vy89goIkXDis=;
        b=pdnaei/k5JjWLp8Wd4iQY1Lt89myuCll2DoKYylxvJPlSeiZ8if/vXSwiPujVsUXLV
         UYI/8/4qo4E9giqdW7v/GJlqUBVwL6n9d/GdlqLVvL094Z/kUa7LmZgvJYyjYtushMRV
         zC9EbFXzjASO4vq+Vt8bVeGkf7vtZpXX8wjYV/nzHU29OGOA3IOJinU/BQTKjRdfjVMg
         YEZoBxsyr2mRt7wA4vP6ETp4N3sJBndKc9ltYR6wTzX2bEwG2mRqi6M1/ebZqrRIjqmZ
         c1drlhZU1WihbSRbLxL2OnvtzOYfIs+YfiDILa+qsLbl4jvAZx5HnKNiJtkMqSPu9Tqx
         nxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGOKKMo3R8QfnKwfvnMn5JBc0/EEZ44Vy89goIkXDis=;
        b=FSd0yVPrYGXqfXYTzRIaI/2MbfP/uR/0f0mFvZfOjth8BJNW+Enn1QpZCJQYGgQQMY
         zqtbKtWetTYcvvIM0krh2tdPrnMiyDxxjVGs3/6pApsNEauavK76KPir5RcOmfz1IJq9
         TlbSZpAYIFT4fpwNMW54Ge5ze70OLOrsYUucY3NltDcP9etXAq+Ux/bTYLe0TVSH1OuP
         Qj2PfKEr0jYNz2pFYPS4ZTkx6hJ/XxPO1HPFaooDJUw32BZJvFU7AstEzYlBsYICqqSe
         b3rx4xtQYYI21DzWA34wC7X+IElYyH+jogqUOPVtfARMtEqu2e4i7rLqFV7XqS5IPfSH
         91+w==
X-Gm-Message-State: AO0yUKWP1oFZx/wMIUSLBBCp//FFbKgY76UHsPZiZttoyzgNl3RVcBgh
	4Kz5RkNChwdcNGvBwUM3HKh7Qs9+Wsm8upT7
X-Google-Smtp-Source: AK7set9umNSvClemRa66XkfD020OyxHqFvpxeU289aR0DFrsTVoKnZc8TikzZMkduN9ydkquo4AI8g==
X-Received: by 2002:a5d:5e90:0:b0:2bf:b7e3:6d60 with SMTP id ck16-20020a5d5e90000000b002bfb7e36d60mr6685705wrb.56.1674745017403;
        Thu, 26 Jan 2023 06:56:57 -0800 (PST)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002bc7f64efa3sm1462092wrr.29.2023.01.26.06.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:56:56 -0800 (PST)
From: lrannou@baylibre.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH] mtd: spi_nor: Fixes out of bound shift
Date: Thu, 26 Jan 2023 15:26:12 +0100
Message-Id: <20230126142612.1518046-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_065659_115616_F77E3A32 
X-CRM114-Status: GOOD (  16.23  )
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

From: Louis Rannou <lrannou@baylibre.com>

spi_nor_set_erase_type is called twice in sfdp.c with a null size. The
return from ffs is 0 as well and the shift size becomes (2^32 - 1) which is
out of bound when applied to the << operator.

This considers as illegal a call to this function with null size. It
creates a replacement spi_nor_mask_erase_type for explicit calls to mask
the erase type.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 drivers/mtd/spi-nor/core.c | 19 +++++++++++++++++--
 drivers/mtd/spi-nor/sfdp.c |  4 ++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d67c926bca8b..140a8fa81f03 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2015,15 +2015,30 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
  * @erase:	pointer to a structure that describes a SPI NOR erase type
  * @size:	the size of the sector/block erased by the erase type
  * @opcode:	the SPI command op code to erase the sector/block
+ *
+ * Return: 0 on success, -errno otherwise
  */
-void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
-			    u8 opcode)
+int spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
+			   u8 opcode)
 {
 	erase->size = size;
 	erase->opcode = opcode;
 	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
+	if (size == 0)
+		return -EINVAL;
 	erase->size_shift = ffs(erase->size) - 1;
 	erase->size_mask = (1 << erase->size_shift) - 1;
+	return 0;
+}
+
+/**
+ * spi_nor_mask_erase_type() - mask out a SPI NOR erase type
+ * @erase:	pointer to a structure that describes a SPI NOR erase type
+ */
+void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
+{
+	erase->size = 0;
+	erase->opcode = 0xFF;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 8434f654eca1..8d158243fe49 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -875,7 +875,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 	 */
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
 		if (!(regions_erase_type & BIT(erase[i].idx)))
-			spi_nor_set_erase_type(&erase[i], 0, 0xFF);
+			spi_nor_mask_erase_type(&erase[i]);
 
 	return 0;
 }
@@ -1089,7 +1089,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 			erase_type[i].opcode = (dwords[1] >>
 						erase_type[i].idx * 8) & 0xFF;
 		else
-			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
+			spi_nor_mask_erase_type(&erase_type[i]);
 	}
 
 	/*
-- 
2.39.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
