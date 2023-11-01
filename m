Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA0C001B2
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/k3t7ePdKCo8ceE9gVEYlaRYXQw9PB2Rt6rKratsEeo=; b=19R+QuqOtzqwEi
	HzKk2op/nHhQmPxJro5kIQ/rkb4CweFs7Q5zUu1fJU7k+LqB3cvJ4/yjvyGYf90MUSye4SuynctEp
	gE9uNwyv7/cDwLTaFhZew0pcOtnoz4zWroXqZSK8c4O+w5wj/mfBjEzEgnjrNP7+uqP0qBf1dh9PO
	sqB8wGGaShxyyCchEZ6rI03DawxNUiaNcSeOHDC0izPAi7+aO6hxlv7+Sz9xplLAVICtDfFBa/+Bj
	dSutoA4cQsn+wrO9gzluKYbFKjBDjTg4gSkRJTXUFc/VAtkRjt3wCyLHR20PhZmBzJ91Kl3/VALj4
	kcQ02Z6nrFlkcjy1lZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lI-006yBV-2W;
	Wed, 01 Nov 2023 09:43:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lB-006y7Q-1E
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1006917966b.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831816; x=1699436616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV7bNPyhQKRemTJ07hn6UF36Lmm0ImJMEdDZsvvQDyc=;
        b=q9kKMGmg4ZHvPGDTunYg79k70G99XDmlMoWrw9WuqujwuWDeO+L3rLjSF4fe8phePL
         AJreWbuersqrdFLOrHf1iZnRLfzRqZ8AzGLg4v+h1/coKqo2K2ON0ptYnm+WIhYnNFtz
         3uS3ZeFC4sJhjoBNPottKwO19v5NgDrx/mxBP9Pk4de2OgmwaBfyGZbDyolzIhtd+gkE
         Ma5deDVXTgI2QoVydfG3x6GVFPg4O0WzBthmNXeWFhFyIs2/JPMW+4V7f/9WIthWhQ+Z
         cZOm9SP1gMpIX+CbO3h9UBjkjopzSyMblc4oGm66JqwHqstxsYSCH/u9rngOS+S3SxzV
         iI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831816; x=1699436616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV7bNPyhQKRemTJ07hn6UF36Lmm0ImJMEdDZsvvQDyc=;
        b=txHy1xlSYZPLZRa7uDK1q6MrZshT9N4bj+gG7R4BQWWrJxiTp87IdoyxgMpfc4xTZp
         4RuwEnfLvtX6QAWQTtYHMD+n4P8VnshMeb5foeiuzYCCgYLpVej8SG8+foojBTu/+U4b
         KVesOI96n+VKj0Oq9j1VQhZ983w3KlwcbYvqC49k7HT1p7Qa1zEGvWCfrWLb+nSPPb92
         fVE7duic5wDSPNEaIDY3tCOiEP2Uuvu0nsNkw5kjUVr9BCMInTAn3UwH8LXa7F38KXCE
         JpmU6zgP2jIGsy52lBvdYvUzkRQBfBncrQxFeU2AnKu/2Q2EhU5Ls3GJabBqWq59Axlk
         GI0w==
X-Gm-Message-State: AOJu0Yy63aRH2DaxaWrWaeQyL1LHAzzt6Qh+bcSINGTBZwepb96ej9Wk
	1xppme19lKRH1NFdJ86CtPUZqQ==
X-Google-Smtp-Source: AGHT+IFncgAJfe6YG5PHRaDdQ6wLw2+vCbTt66EY3Qbc5QgcLrCLAkacOlUysSHloS7TgCr+E0pe/A==
X-Received: by 2002:a17:907:3e20:b0:9c7:5186:de23 with SMTP id hp32-20020a1709073e2000b009c75186de23mr1449978ejc.2.1698831816134;
        Wed, 01 Nov 2023 02:43:36 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:35 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 4/6] mtd: spi-nor: micron-st: use die erase for multi die flashes
Date: Wed,  1 Nov 2023 11:43:23 +0200
Message-Id: <20231101094325.95851-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101094325.95851-1-tudor.ambarus@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3051; i=tudor.ambarus@linaro.org; h=from:subject; bh=nA2hD+SgRKNyNEk1b0eo3VQFtRBch3W6/UtFaLLl7Dk=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlQh29+HnAKoB0wCdAIwSEV4jXgOMA9RgPy/RN0 Vr9cMJEYjqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZUIdvQAKCRBLVU9HpY0U 6eAHB/4/gNKfdAmpU16jjxCn/YJicoFIflbEl40LyKX8S3HfKcm1tvZHbOX2T6y6xdWPPbZCG1H OXG3w6RRcCwVa9OzPwF1BRTa0vv0Ll7nYc3WkQRdmxtIdl0mZ+qTnejPLg0Lnv5l9g1AoJCRbGj qeuDSPgow+8+5zuwT9bun7gtJBrrjsll2Z0P4XqDmy1478kt8w9qFmwAlDp0CaZl06uXIjliEJZ G8xcrPchM60swftI0GUkVgdh6AkhJsgctZTQOalc0jif/7SFAX0EvqjbhCuImJPMGScazOSHwWF l1cuW2I7ESzIl7RoTX0qJJyX/1JHFJWH8bCsjcFFiNKoOeJ+
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024337_416949_E9DBCD1E 
X-CRM114-Status: GOOD (  13.41  )
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

Use die erase for multi die flashes, it will speed the erase time.

Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_1gb_3v_65nm.pdf?rev=b6eba74759984f749f8c039bc5bc47b7
Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_l_02g_cbb_0.pdf?rev=43f7f66fc8da4d7d901b35fa51284c8f
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..8706ef841375 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -11,6 +11,7 @@
 /* flash_info mfr_flag. Used to read proprietary FSR register. */
 #define USE_FSR		BIT(0)
 
+#define SPINOR_OP_MT_CHIP_ERASE	0xc4	/* Chip (die) erase opcode */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 #define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
 #define SPINOR_OP_MT_DTR_RD	0xfd	/* Fast Read opcode in DTR mode */
@@ -192,6 +193,24 @@ static struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
+static int st_nor_four_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->chip_erase_opcode = SPINOR_OP_MT_CHIP_ERASE;
+	params->n_dice = 4;
+
+	return 0;
+}
+
+static struct spi_nor_fixups n25q00_fixups = {
+	.late_init = st_nor_four_die_late_init,
+};
+
+static struct spi_nor_fixups mt25q02_fixups = {
+	.late_init = st_nor_four_die_late_init,
+};
+
 static const struct flash_info st_nor_parts[] = {
 	{
 		.name = "m25p05-nonjedec",
@@ -366,16 +385,17 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "n25q00",
 		.size = SZ_128M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
+			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x22),
 		.name = "mt25ql02g",
 		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25q02_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x15),
 		.name = "n25q016a",
@@ -433,16 +453,16 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x22),
 		.name = "mt25qu02g",
 		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25q02_fixups,
 	}
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
