Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243B5C3DA4A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ow/zkVULQT1V4xVewJjlUubtaswYAStdbQXGh9l7eR4=; b=Yn++Uv0eUbbsSr
	d4xeWSni15rXpwkNUU3j9NbmdHeQzFRw6i2edQuFUFx8tv9E/J0OSNfCfIKhOiwZkfWnc0qXJDj+D
	Qrz/E2VbpnmGB5WiBr48e9Lu7jX5oJEKvoUTVcqcaeB8pg4vFSu747ramquH8FIsONF/gJjzKJzeW
	eDhAh6TczoinjldmtO2vhauE0Ylr0pwo9lXD+0PZtubRHTsZ90X07dESl+h5rFe71ZvCj8o/Ivg7g
	wnvicu7UwsXPqa0Lnqd9kKNJX6TDqu1npA8XskM67a2NlY+bzcEk7mWFcJX46BQKPLGuidQQv81HB
	jaWeZL31eOcmkmPiM4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmgI-00000003C5a-0CqP;
	Tue, 11 Feb 2025 09:35:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmbb-00000003Azz-23NH
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 09:31:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43618283d48so36469285e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2025 01:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266258; x=1739871058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GF075tACuMVMVh8PNKT0nRFACsnr6kvsDOiw0epdSs=;
        b=eTyzHNQVnpeUt91G6GYOpZZWijCrYsI+TW2WpT/aFZVzD8CCY53ZunlTJVhFuW/V/Y
         EU9I+k8JFsG8G8+3KXRCoYBB7H4Pf8MTLHMOZQjHabpzoshF+h/1/9KiAPTCw3YHMCEl
         MOn6lyzUWe6N9tnkHgsYsXT+J8NZxV0HeGGmjFM5Y2xfDHmeCcP2EbgNqdS0l75EgwnG
         k1JmxCMZadFPyhP+d0264Oxidy5aCJ6V4yvM/zxPwC7tkDCfmWRDiZyfcu3TyOSf5KlS
         wwJriAJRdTXG0RKEaxNr9tqgMc1SjCqsGNfNHNfKZrW9+ErVO4ZMMZQgVDptrRWpJSYO
         buHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266258; x=1739871058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GF075tACuMVMVh8PNKT0nRFACsnr6kvsDOiw0epdSs=;
        b=vkcIA5eMAqanWJWXaqjwxX3HCHjeXwZKRb5iEm8zYeTC6ocX2yTo9caNo6cNjshgij
         4hLAmMlVJn64k0Cj02w5sqFjZIlV4i8Ga0DHdRSlNJfVj928Z3EZUCGFJldbvujSPArc
         gTuIL60kT01+fGxJQcvW4q+no5vtbC95fP71TYbU3ldnhhxq9anFADKC0TvSnY2Ta8cB
         3KatbTvNd0qAveruVtUy4k1WCznha5tW9pBOy5bxoscQFCulYEwHGvDiFCfaVIZXt0H9
         /YOZc0XRKss8t5CZKStjZeZdLg+JlKRoelGLAUZ6yjEA1E3OqHQuPkAzi8GjzlC/pc5L
         YcJA==
X-Gm-Message-State: AOJu0YzIkonTcEK3OyfCMHJclm5d8ZCl15GROeYVDqGeheOQSGpVLAZ0
	jNJPIzUqknAMmJ3yCsneJrVdA0CARTbBDpBJfKt4HMttTAYH+WgcNqyT5Tg61Sw=
X-Gm-Gg: ASbGncv7eMBk0e9kPetHgBDpLa7NAH6J+syyFsVbMLcIhOBi4+fdMa52y8srWcM1NUT
	tGZEXMsDqvYJd79nWzwE6ASsk54yQNjHvUolHrxHVHz4HJW7lM4pY8K1MooAGosjilrE8IV+BaJ
	MVGQ8/e44Nix1s6gwrQOk0PQfk6eBs79j+ndZn+lIayNrlX4ihbI+gLX5KdGME5UTP+OjWE3Crr
	IFszoFDUnZjgHmMgDXWxF4uuMVNmJucQBNwO0DY6tPx8svMfkf1xv9hBBdDczzkPwzq3rZE1TP8
	Rod8H5SoNBft/4Ea5DbUhN9axtDpSbnPCv3bO7MYOnyuaTP3K9vwNuSo2dyyD7lLnjoxcbw=
X-Google-Smtp-Source: AGHT+IFiydCLeAvyEeW/5ArSvXalUmxlAwauB30Q787ws04Fjnw5BBYoJGg7Bc0g2UUutEuxX4DAng==
X-Received: by 2002:a05:6000:1887:b0:38c:5fbf:10d6 with SMTP id ffacd0b85a97d-38de416d65dmr2356745f8f.7.1739266257863;
        Tue, 11 Feb 2025 01:30:57 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm12591296f8f.79.2025.02.11.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:30:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 09:30:54 +0000
Subject: [PATCH 2/2] mtd: spi-nor: use scope-based mutex cleanup helpers
MIME-Version: 1.0
Message-Id: <20250211-spi-nor-guard-mutex-v1-2-05ed77a484d9@linaro.org>
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739266254; l=6004;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=A/I48PbBb5I5iIc6Shl7ozap+VkugdClZDkBLg/W4xs=;
 b=M8SYru7/AL6WclLtCUHLw2NOZOMXHyS08tR6ubyxEcEb+BuFrMRefWlULpzaP4icIWZlwbluz
 Z0nLiWyXXYAAfj2CzZNJEmKOJEt+NYyUUIHjJluJ3o+nPlpEuQBlDMX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_013059_641288_4C2D2736 
X-CRM114-Status: GOOD (  10.97  )
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

Use scope-based mutex clenup helpers, it reduces the code size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 71 ++++++++++++++--------------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1bb4a500be6e..c9b970f35c6b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -639,32 +640,26 @@ static bool spi_nor_use_parallel_locking(struct spi_nor *nor)
 static int spi_nor_rww_start_rdst(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	int ret = -EAGAIN;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd)
-		goto busy;
+		return -EAGAIN;
 
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
-	ret = 0;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return ret;
+	return 0;
 }
 
 static void spi_nor_rww_end_rdst(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
-
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_lock_rdst(struct spi_nor *nor)
@@ -1212,26 +1207,21 @@ static void spi_nor_offset_to_banks(u64 bank_size, loff_t start, size_t len,
 static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	bool start = false;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io)
-		goto busy;
+		return false;
 
 	rww->ongoing_io = true;
-	start = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return start;
+	return true;
 }
 
 static void spi_nor_rww_end_io(struct spi_nor *nor)
 {
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 	nor->rww.ongoing_io = false;
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_lock_device(struct spi_nor *nor)
@@ -1254,32 +1244,27 @@ static void spi_nor_unlock_device(struct spi_nor *nor)
 static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	bool start = false;
 
 	mutex_lock(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
-		goto busy;
+		return false;
 
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
 	rww->ongoing_pe = true;
-	start = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return start;
+	return true;
 }
 
 static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
 	rww->ongoing_pe = false;
-	mutex_unlock(&nor->lock);
 }
 
 int spi_nor_prep_and_lock(struct spi_nor *nor)
@@ -1316,30 +1301,26 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 	unsigned int used_banks = 0;
-	bool started = false;
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
-		goto busy;
+		return false;
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++) {
 		if (rww->used_banks & BIT(bank))
-			goto busy;
+			return false;
 
 		used_banks |= BIT(bank);
 	}
 
 	rww->used_banks |= used_banks;
 	rww->ongoing_pe = true;
-	started = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return started;
+	return true;
 }
 
 static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1348,15 +1329,13 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++)
 		rww->used_banks &= ~BIT(bank);
 
 	rww->ongoing_pe = false;
-
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1393,19 +1372,18 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 	unsigned int used_banks = 0;
-	bool started = false;
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd)
-		goto busy;
+		return false;
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++) {
 		if (rww->used_banks & BIT(bank))
-			goto busy;
+			return false;
 
 		used_banks |= BIT(bank);
 	}
@@ -1413,11 +1391,8 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 	rww->used_banks |= used_banks;
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
-	started = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return started;
+	return true;
 }
 
 static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
@@ -1426,7 +1401,7 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++)
@@ -1434,8 +1409,6 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
-
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)

-- 
2.48.1.502.g6dc24dfdaf-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
