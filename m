Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDC0C61DF4
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaFvIKC4TMQtfk6W68CAEJ5Pk7dwstBplBg3wsag9/A=; b=b+OesB7X+DF+Hm
	H23vL88NjfL6FruEuf1x101iprST1j2RYeSwMzsME57OBepPIfTI2Lk0wo8OGGEM8e//FRxz9sMTz
	y3BgRbRZjBwtMz/aWb3NjtiRphqErRBS2Ow/5UTomKoVorIKvOTQMt118IJcZsBCp8WIN+jag+Vdy
	IHtBXtD5ZY7X1F6HXxg0+0aCJd+79wA9hHqNVnidrv4WLsIr8Jr9gttgZdd24hLDhY05VPVi9bB/j
	p6GfScwhklqu3jdzAYKkIQj9Eo9c/AXxy9GeunKAfEAxpTCrbWFppJLb8zfTr/GTKqUYZ5JHgpkWw
	cjmiVJ1tJ7xZVNJY0Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt8-009Ehc-2M;
	Sat, 25 Nov 2023 12:35:58 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt5-009Ega-36
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:35:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54b0f2c50eeso1088962a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915755; x=1701520555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcXs8DG65Rtg58oE+up88Lq4hTYhaQzAZwdBNatPv3E=;
        b=oa/CtdhbzRZK92Bh9O7iGyfFB+b/J21N/ah9mshbghaPAIl/o7s8/CGYmHhzwmgdJL
         jkBv0quMD82OcJAwytKO0Eqw+DACsF0eUZS03rXvKp8iAUMRX90asOZ3i65mVuPTitOk
         vt2DXwwaAq4ivzZfl8IH0KPsNXbuQV8eefsqiLEuYSyZlLxYEgI5J8Xu9rhFqzDfLLlR
         hq4K7kDz0Z/6bC4g0IkH6stbuZIsZxr0k521XP82hjuXX7z6pQNkLfUAhhMgkFHksVy7
         1+A7gKh559N8x3LCSWhE57lFYMgU/uoqlJzXrG2gAA88dPOcbNUKCIuUVAORWyFps5ms
         GGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915755; x=1701520555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcXs8DG65Rtg58oE+up88Lq4hTYhaQzAZwdBNatPv3E=;
        b=thU4WV5x8OCJHD+/fXapwSmeHm5QdyLSO6GjfhKwGxDgKFcsdXAqOV9pSXFXFm4W0/
         BXsPbJelQj8eLZd2Ak7W8T2xYmqV5ED3EH9dnTCarE5YDEmqnHWuxR720ZYm8myXTiTI
         /2HfKgoYwPtuVy1dmHS9S07/TOrsAk4g3WMGKFZ6vy5iAS8VABHgI3vSiOlG9UEaPDoO
         1RyUO5kSc0QxOeCgT9Wg0sQIULQz4mTnPG2tKzPtfY6nlOBOR5ftBKixEPpKzajM+XQN
         fUcFqkzIdPUZ2/GJkRo1RapanOF4Ou5yKou+fvrgRTOG/Ur99kEK00/iygvVn7Ab7Xgu
         8Kzw==
X-Gm-Message-State: AOJu0YwzM8VpNfNQyLoIJ22oGmEnw8akqrO8uFJ2uYoZTPZfyj31ZjEB
	IsS7Pxcb1DCWUY4T/TgMuhAUDA==
X-Google-Smtp-Source: AGHT+IHdeYl/OJTLXATqbQBrqR9h57XosEk+PYRoSMKkDelPWWmhTNWK1ojD/74xFrBnLuDA9IZh0Q==
X-Received: by 2002:a17:906:9e08:b0:a03:4acd:750f with SMTP id fp8-20020a1709069e0800b00a034acd750fmr3994977ejc.20.1700915754802;
        Sat, 25 Nov 2023 04:35:54 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm3390163ejb.209.2023.11.25.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 04:35:54 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 5/5] mtd: spi-nor: micron-st: Add support for mt25qu01g
Date: Sat, 25 Nov 2023 14:35:29 +0200
Message-Id: <20231125123529.55686-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=tudor.ambarus@linaro.org; h=from:subject; bh=qdPCdEgUWxvGLhVyUwHlXAj47Qi5sR15BlnuG/9ieeo=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYeoRDj5E4PFoxCRL/3RvCsy7w+UgyF0bJ7L0g GgDTQENszOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWHqEQAKCRBLVU9HpY0U 6UMzCACZkv+KkQDtK9Sp9Q28aV734tjYoM3xi8jyX50siPTnkCfEL7b16dE+YjCIpq/pamgVI87 oVbj35cv+nkAsguGeV7t2csTEZhL3G8YtjYgQjBsm5wT4a7fw/G23sVMJVmCOGm5Cdm8IfTp1rI U/8W06YQXPHySueKChRgJetNWByFKjcrqe7Ud387Mj+LnffKk30aPwYZTTtIy4Ymgxk6OVHdxRV l9LaSKQ91etjOk8ixjOa7GFgRdbwKTsPnJaa9KpUx9VYyfXspK7Y7PuXWLtTAR/RCHpJz97yfGO j9awPMW/+e4gBGRVcUoixIICbiTJOztAepE9gV8yE6CKDlrz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043555_999308_3D9D076F 
X-CRM114-Status: GOOD (  12.36  )
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

From: Fabio Estevam <festevam@denx.de>

Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
model.

Link: https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf
Signed-off-by: Fabio Estevam <festevam@denx.de>
[ta: introduce die erase]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index b63f1e9b97d0..3c6499fdb712 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -209,10 +209,30 @@ static int st_nor_four_die_late_init(struct spi_nor *nor)
 	return spi_nor_set_4byte_addr_mode(nor, true);
 }
 
+static int st_nor_two_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->n_dice = 2;
+
+	/*
+	 * Unfortunately the die erase opcode does not have a 4-byte opcode
+	 * correspondent for these flashes. The SFDP 4BAIT table fails to
+	 * consider the die erase too. We're forced to enter in the 4 byte
+	 * address mode in order to benefit of the die erase.
+	 */
+	return spi_nor_set_4byte_addr_mode(nor, true);
+}
+
 static struct spi_nor_fixups n25q00_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
+static struct spi_nor_fixups mt25q01_fixups = {
+	.late_init = st_nor_two_die_late_init,
+};
+
 static struct spi_nor_fixups mt25q02_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
@@ -455,6 +475,11 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
+		.name = "mt25qu01g",
+		.mfr_flags = USE_FSR,
+		.fixups = &mt25q01_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
