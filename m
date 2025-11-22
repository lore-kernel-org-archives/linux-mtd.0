Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98262CFC538
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Nov 2025 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VIKVd77plQBs3JL8be/92+we6+nrRAIlISona/VDG4=; b=zpF9Cs4NVvqc4F
	18Vjxain7x4sPIZPXFGDBnf1ddcbH3MQ1n9e/B1Xh29obS6MasSTas7z8wRy4kK4sGcYYloU5eL1J
	fkjKYkNWTOBSEo92m3XwqFG9PhXgmK8zgYaC+ZiiOseSmpduJh2fj+TUn6YDNSV7w/d5kQZs4q6MA
	TXz85Yuub8c70WXn5IBV8euWCpM+CfL//+cmUajLLQCeStfNBFD/AQcIoio9OL3PkebZ0uaycw1cp
	oY2S1MgskeshVg0RgU4AFStSmW1AZBSntwTta+dVaZbczB1r1k7e8mF3WXvBp5VHxPHUkzHbYF3wC
	VV+v18+sVex6s5EUyN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vModU-00000009fKj-4770;
	Sat, 22 Nov 2025 14:30:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vModQ-00000009fKC-36Mu
	for linux-mtd@lists.infradead.org;
	Sat, 22 Nov 2025 14:30:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b737d4cde73so50742766b.2
        for <linux-mtd@lists.infradead.org>; Sat, 22 Nov 2025 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763821842; x=1764426642; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IonXB13b+5hfzrrB25ARqMCumn5bxMg4g17Kb2I3Is=;
        b=naXD+UZTNhEfd7ugB8Fmt2o0mnew/DuV3EEb/5eJPVcGwEup2Ccn+xv7Qs+Wnth13d
         LK4o4BpEZPzx6sqtc2yUErWzkV/2q/WAYKq0TAG1gHFmykrhCYe7MHNdtqvFzoLTadzu
         bCChyljpdqsGPbbo8RQQVLd7bh67Qg9m8G1A7+EX8tZTqF0kvk5x2i0DeHozwiOTRu+d
         YHXHT/KOjodJTuqW1t5s1k5QY5mlN3deO/UbZ4B1z8Y1pXHrociYkeLkxO5axffk6E8o
         XKdICVow/G6MSWxYuGzCkXYnsiwnX7o8Z+M9ZLhne28oLSkFgbYNcdHI7E3Ieriyux94
         nOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763821842; x=1764426642;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IonXB13b+5hfzrrB25ARqMCumn5bxMg4g17Kb2I3Is=;
        b=GyxsWhZxaq2BOdRRAyBBpnh5SQDPmwrjTAxwdC/AhYCk/USXPwzy7w5Lbg5pmZ3GS5
         G5/f7RAHBfr2Kk124e17qumYFmNkiyG7SbaVtiCSmCYrgAiT/b/AX308XKOTsXualweL
         N/cvIhaKOFG/KnRyUt4c0QwIke+kDj7jn+7V4k3Rbam7J3n/cztqr0Hx7GteK0PR8wes
         t80PoLodvlEI/eSSWYNNc2L+MFijp+6K2Kup6fSoD62456e+fTDlN3Z10YAb/JnaRbcA
         eGIaR9eLoVXX2aidzC7lNsPwxqN9yxLYjK6cW6R9o65fLcPHvVSoETZ0oORNe759vG8p
         E4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn83Fkh+ZNXW9Qq403XgGkNleO5n5Uzp1+OBymiyJrBdiW3MPx1ao/yDyBDouqTutrLWcc/TQG/WA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB6CvSzawg4Mgk0asBZSPArlF2uNyS8mCXuJfKNvLD6onVEDLG
	No+H2KsnUh5G1inPbPKJryNplV6AjSHv76mMxiLo+TnTsouYRkkHf1QB
X-Gm-Gg: ASbGncvkytI2YeKRxcvoqTWIO0Q6RTRCw32vcHLg+IsdmwZ4xlGbT59484oOyOQjsSL
	R06dpWO6+v6o91aTbw6VMXuSrP01TFlE64haNkeRMAPM5/C4deKRwkkxXyf6spIk39vc72ZOFD5
	8Sfoh7ZrgzkzQ/Qk55YqZV/BX70nI99zXLsoe9BxT/breqRU1BFCwpAs5824nOVLHTBu9vUE0YP
	UWKFCWWVjSfjWWQKPgt3u/nK86UxEYlgcq0b06wDOnJjVuuGR6bNrmCz0UFSC6aqWtzjqgMIfiT
	cUeItAgRIErquHMO/oRfpiXp/ybLDfsIRy2pb8ZeX79BxuR1a9cw5Zl3GLl5fzK5D8N+fk3k6wD
	176PrpdnWVFagujWvbVajEmHCO0w3xxLljk3GSwJJCxA1dqu/JICkXNRT0Sbdf96CpgG1DIIGD3
	rRhTGXbuBftypSukAoGF/fBkpdOn1h+t79L9FRXfK9qetoMw==
X-Google-Smtp-Source: AGHT+IGB/wGkOMQJWYBkXIrr+tQ+4PNhJvM5RG4W26+gkmSj+MzOzzn6h95JtNEIgBCNJWWiq+rcOw==
X-Received: by 2002:a05:6402:518a:b0:640:be87:a86b with SMTP id 4fb4d7f45d1cf-6455469953amr3140835a12.5.1763821842143;
        Sat, 22 Nov 2025 06:30:42 -0800 (PST)
Received: from ?IPV6:2001:470:b51d:1200:19d:5bbe:f594:c1bd? ([2a09:bac1:6180:3380::388:3e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453645f2easm6865096a12.33.2025.11.22.06.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 06:30:40 -0800 (PST)
Message-ID: <130e0f3f-93e4-47cf-82f0-93ba58a3a670@gmail.com>
Date: Sat, 22 Nov 2025 17:30:38 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH] mtd: spinand: add support for FudanMicro FM25S01BI3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_063044_803752_38B42755 
X-CRM114-Status: GOOD (  10.26  )
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

Add support for FudanMicro FM25S01BI3 SPI NAND.

Link: https://www.fmsh.com/nvm/FM25S01BI3_ds_eng.pdf

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---
 drivers/mtd/nand/spi/fmsh.c | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index c2b9a8c113cb..f417955f7d1c 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -9,6 +9,13 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+#define FM25S01BI3_STATUS_ECC_MASK		(7 << 4)
+	#define FM25S01BI3_STATUS_ECC_NO_BITFLIPS	(0 << 4)
+	#define FM25S01BI3_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+	#define FM25S01BI3_STATUS_ECC_UNCOR_ERROR	(2 << 4)
+	#define FM25S01BI3_STATUS_ECC_4_6_BITFLIPS	(3 << 4)
+	#define FM25S01BI3_STATUS_ECC_7_8_BITFLIPS	(5 << 4)
+
 #define SPINAND_MFR_FMSH		0xA1
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
@@ -45,11 +52,66 @@ static int fm25s01a_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int fm25s01bi3_ecc_get_status(struct spinand_device *spinand,
+				     u8 status)
+{
+	switch (status & FM25S01BI3_STATUS_ECC_MASK) {
+	case FM25S01BI3_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case FM25S01BI3_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case FM25S01BI3_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case FM25S01BI3_STATUS_ECC_4_6_BITFLIPS:
+		return 6;
+
+	case FM25S01BI3_STATUS_ECC_7_8_BITFLIPS:
+		return 8;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int fm25s01bi3_ooblayout_ecc(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int fm25s01bi3_ooblayout_free(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 4;
+	region->length = 12;
+
+	return 0;
+}
+
 static const struct mtd_ooblayout_ops fm25s01a_ooblayout = {
 	.ecc = fm25s01a_ooblayout_ecc,
 	.free = fm25s01a_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops fm25s01bi3_ooblayout = {
+	.ecc = fm25s01bi3_ooblayout_ecc,
+	.free = fm25s01bi3_ooblayout_free,
+};
+
 static const struct spinand_info fmsh_spinand_table[] = {
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
@@ -60,6 +122,16 @@ static const struct spinand_info fmsh_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&fm25s01a_ooblayout, NULL)),
+	SPINAND_INFO("FM25S01BI3",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd4),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25s01bi3_ooblayout,
+				      fm25s01bi3_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops fmsh_spinand_manuf_ops = {
-- 
2.40.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
