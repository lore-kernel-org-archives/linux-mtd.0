Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B119C05027
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+x7AAfxeddIFH4MTI3cMnozgnNxB/xgpHNWWRvZXR0=; b=pxPZJmbv9zRRTa
	ifFtng7SUWFdJT3KHnNuaYXc8aOAlq9ZnBbLCAVlJhcMXasVw8C5BOoqnKbD8HBXESqR9W++7+dev
	ztBt90e/7E69rsaFOubdAzh4l0Qxy36EKVy47ReNXDtJTkMkyPu5UN3wImQEaoc+C4FW1tD/SfuYu
	V783Sdvg02pAvAVhl2CXdyQK7zlLmsxfb829ZgTn7+r0MiMpb/E31EksDpLfgh9qlZEmJ+PRF44r+
	tUDTTdn4znPC+2NMhGo0mlndMe2B39uh9sXD8hTNxdDp3OTMJj5TdHrdyFoCxzUCYE1ppDXjx23dc
	hfge0OGflB4DTTtKaGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNf2y-00H31F-2e; Thu, 02 Feb 2023 19:15:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNf2u-00H2uj-Q4
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2023 19:14:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h16so2620369wrz.12
        for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2023 11:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cuuIDYYSQu+C3zWqyLE6YBJV/AlT1XUkT6NrSVIsSuE=;
        b=paYr8zpf2I9DEpZpSdQqKH6MFWICVpFPHEc5nqN1UqZtu6lMw6GAW//VoL4MUfVa5v
         yiIlPL8cyEXfBFDJUv98dYAj/ak2RWRCXiKVHTSqDT8J02gBI21rkwI7YXHxYNpgjfr6
         mnt0FXNdznM9UwttacKMmWHtJWJ/+S0t8eMB+G4o430IAZfzHJfnsO48yzd7/pVkko8e
         Rw9ARI3wu4sbEqYnMm/5kPZLQ4WHJLyvvGpCB6nyAiO/ao7aaQGtg3xLvqZH5I+Wx/v7
         +BaxR3DbwmzLwQMuQoJSAwaqlpbIm2WO8grklNPfGpMneI9tWux2Ke4XyoNbsexfNreS
         AC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuuIDYYSQu+C3zWqyLE6YBJV/AlT1XUkT6NrSVIsSuE=;
        b=T4kovNNAqtaKyi7wSxdEH5vdysNYM8d9cj9Se05HDzxe4J0B/og6tlRf9siDLqf6iP
         WmqEZu3XTWvqEhxniA6A/6Fk6K9olUa/nHlOQgZfTJ/Msoy8Rj9oufh2jJZ2SSGHs7BK
         L9hfw7xr0wGIXhT7c0EDJ7ZXVbwV/pBDiHv+k/qoKAl7ifteePh/wpOVZbbdfeCBxmR+
         1mmi4PEqssDLR4dY9dOex41UpXdeHYKZQIKxRwagHaEvW8UpsFd7CB9cl3lnFbmY0f7d
         GXclgMoQPkEhDBygyuMHH0aF1WvakjN/oPOm6hztx1JkFeB9ug59UQM4HIsAhhIocCYx
         luXg==
X-Gm-Message-State: AO0yUKXxc4FIyEPxcGWYX9WQbOjHK7u8Ugn9Cg1b4ApU00VkeHquHQe4
	IPDLKQW+pcdJ7SFiMaVH3ySBsg==
X-Google-Smtp-Source: AK7set8oLT+QQSd09IoTQr0pHXnNO7smD9ydEOJi6rTJeX1mL3b6kg1hQfa/4e19wPlccDPY0MhAWQ==
X-Received: by 2002:adf:e30e:0:b0:2bb:e868:6a45 with SMTP id b14-20020adfe30e000000b002bbe8686a45mr5938309wrj.56.1675365295107;
        Thu, 02 Feb 2023 11:14:55 -0800 (PST)
Received: from 1.. ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b002bdc19f8e8asm213552wrq.79.2023.02.02.11.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 11:14:54 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	Alexander.Stein@tq-group.com,
	lrannou@baylibre.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
Date: Thu,  2 Feb 2023 21:14:51 +0200
Message-Id: <20230202191451.35142-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3822; i=tudor.ambarus@linaro.org; h=from:subject; bh=iKQGjGNpvhffSxY5NHmj2gjmtWquRWoatIrxAXoi2HA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBj3Aurob14sGr7fKmeOulA00hcONr8iP9bQNd8Z S6GXR9C6e2JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY9wLqwAKCRBLVU9HpY0U 6YiTB/9ey4lz/jh5tK1eAzCGIvHMnC9hiLk2cyw6nJT+PQy6zp25EU4qvxCdr07+T/ho/k+8Ij/ hwTMRdLusG3F/dGirDWkSlXY8f8zOVQIoV7GCqN6IembhSujyVdnX1/JO2XXLWOFN/g1bpI8kV/ Tn6Xwovy5hK7tp2jLRXjEcejLernMQcrLT7kioFq8uAq8HYRMj/MSPr0vAe8dY6+b3UBtmk40qj pvjBlNICPmoIV4QcvYFP4ULMYzpGtEEkCKf/lq7VpGE6Roib2JFkunkwxu3t//ObG2mnK3DhBb3 C/tIamnBuPvZ/k41SBSBYc2DCtqvsS5KFVZXNcjrNddXxYKO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_111456_874040_6781B924 
X-CRM114-Status: GOOD (  18.64  )
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

spi_nor_set_erase_type() was used either to set or to mask out an erase
type. When we used it to mask out an erase type a shift-out-of-bounds
was hit:
UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
shift exponent 4294967295 is too large for 32-bit type 'int'

size_shift and size_mask were not used anyway when erase size was set to
zero, so the functionality was not affected. The setting of the
size_{shift, mask} and of the opcode are unnecessary when the erase size
is zero, as throughout the code just the erase size is considered to
determine whether an erase type is supported or not. Setting the opcode
to 0xFF was wrong too as nobody guarantees that 0xFF is an unused opcode.
Thus condition the setting of these params by the erase size. This will
fix the shift-out-of-bounds too. While here avoid a superfluous
dereference and use 'size' directly.

Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
Cc: stable@vger.kernel.org
Reported-by: Alexander Stein <Alexander.Stein@tq-group.com>
Suggested-by: Louis Rannou <lrannou@baylibre.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v1 at https://lore.kernel.org/r/20211106075616.95401-1-tudor.ambarus@microchip.com/

 drivers/mtd/spi-nor/core.c | 20 ++++++++++++++++----
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/sfdp.c |  4 ++--
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 247d1014879a..9b90d941d87a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2019,10 +2019,22 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
 			    u8 opcode)
 {
 	erase->size = size;
-	erase->opcode = opcode;
-	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
-	erase->size_shift = ffs(erase->size) - 1;
-	erase->size_mask = (1 << erase->size_shift) - 1;
+
+	if (size) {
+		erase->opcode = opcode;
+		/* JEDEC JESD216B imposes erase sizes to be power of 2. */
+		erase->size_shift = ffs(size) - 1;
+		erase->size_mask = (1 << erase->size_shift) - 1;
+	}
+}
+
+/**
+ * spi_nor_mask_erase_type() - mask out an SPI NOR erase type
+ * @erase:	pointer to a structure that describes a SPI NOR erase type
+ */
+void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
+{
+	erase->size = 0;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f6d012e1f681..25423225c29d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -681,6 +681,7 @@ void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
 
 void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
 			    u8 opcode);
+void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase);
 struct spi_nor_erase_region *
 spi_nor_region_next(struct spi_nor_erase_region *region);
 void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index fd4daf8fa5df..298ab5e53a8c 100644
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
 			erase_type[i].opcode = (dwords[SFDP_DWORD(2)] >>
 						erase_type[i].idx * 8) & 0xFF;
 		else
-			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
+			spi_nor_mask_erase_type(&erase_type[i]);
 	}
 
 	/*
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
