Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A9DC63797
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l0pZ5QL/DzMTtxfCWjdMp8xBFJcoctUjf6FYDeSzRnI=; b=S9nI90/7MzJJog
	SVrsKg9t6lKmOjA0ZhlMQy545MLCmbfZvRwlM1n6zYoTv9NkI+hMH4nsGPnhdNJy+eWfa+52x+tmL
	rG8fb54yjj/lw3E+m3n3jJkgXKCCyudsqekIxbZcI3ZVFNH/iNSqsuZb79qN2q52qGVKwY69XGVLk
	cSuGW7ayPRpLquvKLFI9oi6lMn34nV4WsyYQVvOnfGC9DscMS+EYg+9U0lQ3dKqaYk7ouhXWYaLqr
	wNW8SOtx82MYENcCSK4RJJqsEH2UV2xVLqL7SwAr2Tv4JnEBT8Rw4FF3TtS6s3gQ5xXjq1fhfdzex
	u0PKC6A8bCyJnG4oLOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqBH-000i2N-7u; Fri, 03 Feb 2023 07:08:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqAx-000hq1-ET
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 07:08:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t18so3800978wro.1
        for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2023 23:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Giys0e8XwfnOYt8CH3fApqsktaZBDa/ad6diM4SxSw=;
        b=NqOBCeckuZU3sbTdDABRPvqrpp7ftOw9GXJMpQklxBU8O1XSRHIVQadAReQY+xP/qU
         JGYMtotwgpYyDuXc7RzpVvYSLez1sBLmF+6Mh96vDP08xBZmol/H+PRwSXmZloy82IAN
         U2N39pF3Hjtl97Jg1S4Ty60iMmByHsj7+tW5y6ZkIuNKR8uHUXCq2o9kpuRoCj9eUs0O
         mlHl4ROwlgi9gYiIsCM4ImAThRoDTi7alkaQYTDwvhA71DfQpVSuzQEI1T1XjicflILU
         mchuRkOpChOLPGb85xzqwOzUNj//J3BkQLVHRpQ7aQT3UrbVeKxSM60+aTiCg0KwZBbe
         tjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Giys0e8XwfnOYt8CH3fApqsktaZBDa/ad6diM4SxSw=;
        b=5VeXirrXgeMHbvrvv2DDrC/XqWmvxP5uOqBcWrSlS45zacMsu3InX2xwcuCOHL/ybO
         fPj+O/Ano4FASSl3/bhKB8FOzaCwk5yhVkYIonD3ixXH45urKRb/zapiluW3YlmkUwTy
         O5/RsmfPFPFNItJiCO/xk08yw3hbhsxEU3kloZ+bnr0Xq3jsGVO2ozy9v6eC2/88KOQ4
         XWjykx9e47vE2VH0B+446+V+QSEDNLdpRD1vrGxB8LQKiLEj26++PRa7+7v+Ot/tMuWz
         L/Gugc6EDsyqvCIR91rvQ/5xCGSVjZn4Tk9sErCZK5ALyPwQwbgFWGQTOx/J/GAeg6M6
         VeDw==
X-Gm-Message-State: AO0yUKUk04KdEbyld+zpsGNe7fQ9lwKerqrA4/yHg8v/ajWJbaO0CkfT
	z16kOOhkgqiSiDEp76bo8FTlKw==
X-Google-Smtp-Source: AK7set84MRYw+mqtHLSwbpio6M2OBEi0AtOQqqxiJWr6xHG6OCYgNLmnDw2Mi5mn/BGlY3y1RH2Gkw==
X-Received: by 2002:a5d:44ca:0:b0:2bf:ee9a:2a95 with SMTP id z10-20020a5d44ca000000b002bfee9a2a95mr2819535wrr.60.1675408077159;
        Thu, 02 Feb 2023 23:07:57 -0800 (PST)
Received: from 1.. ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id f17-20020a5d50d1000000b002bfe266d710sm1242440wrt.90.2023.02.02.23.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:07:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	lrannou@baylibre.com,
	Alexander.Stein@tq-group.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3] mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
Date: Fri,  3 Feb 2023 09:07:54 +0200
Message-Id: <20230203070754.50677-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3316; i=tudor.ambarus@linaro.org; h=from:subject; bh=Yio6+NRvq86fhGC+1jON5Jhb/KmYRqPSN3DXkVZPQz4=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBj3LLJy49HFYsjPWQGPaS1Esj9tN0xBXOmoRCPu WYVeyFIn8uJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY9yyyQAKCRBLVU9HpY0U 6YzUCADDFixg6QvFGcUyDX6FD/eLlRmmLZOh8joe445suZ5puOL8lyU9eBn2orlkWY6lUIyTctO UGwM51FgQjsaTEzLGfp6VcSG3qTBEqXiylXrElwTtzzrpbqXwp9M3qXjvi/RE32duOrPkSyKVV2 7ZMrGp12EQ1qeTGNHa7Y11ZkDISp47j0boXpDFiGsuC5Dpm3bQbLtk0FJWoNhoEovhTCPnSzpuQ BH7enbvkE/pWAkfhDokFJCVcZShWVkE+FlbVSmIOlULsoGXMa/HHnYgbYp9oyINeZep5k+FHAuh s9kJyUeti/dmXj2VdTAm105wl1QcBFp9nCNJ8o/ABlUioK51
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_230759_555222_DB2A1DF5 
X-CRM114-Status: GOOD (  15.08  )
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

spi_nor_set_erase_type() was used either to set or to mask out an erase
type. When we used it to mask out an erase type a shift-out-of-bounds
was hit:
UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
shift exponent 4294967295 is too large for 32-bit type 'int'

The setting of the size_{shift, mask} and of the opcode are unnecessary
when the erase size is zero, as throughout the code just the erase size
is considered to determine whether an erase type is supported or not.
Setting the opcode to 0xFF was wrong too as nobody guarantees that 0xFF
is an unused opcode. Thus when masking out an erase type, just set the
erase size to zero. This will fix the shift-out-of-bounds.

Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
Cc: stable@vger.kernel.org
Reported-by: Alexander Stein <Alexander.Stein@tq-group.com>
Signed-off-by: Louis Rannou <lrannou@baylibre.com>
[ta: refine changes, new commit message, fix compilation error]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 9 +++++++++
 drivers/mtd/spi-nor/core.h | 1 +
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 247d1014879a..22cb18b6c941 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2025,6 +2025,15 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
 	erase->size_mask = (1 << erase->size_shift) - 1;
 }
 
+/**
+ * spi_nor_mask_erase_type() - mask out an SPI NOR erase type
+ * @erase:	pointer to a structure that describes an SPI NOR erase type
+ */
+void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
+{
+	erase->size = 0;
+}
+
 /**
  * spi_nor_init_uniform_erase_map() - Initialize uniform erase map
  * @map:		the erase map of the SPI NOR
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
