Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769DC6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7h8JKiEyeoEnpT84odPZLRpMWKUCdt4szfmNRUIxh0=; b=V0oxLBYfhXQynM
	7MNCiC4Fpl8rbNp9GZFppcXT0rmb9RWwpV7EWcFnXpHzaQsx+UeOQTSlTkd5f7xOSLmYBVqIZ3YoM
	Qv8CmR1D4wuKm7wCeJJqzEn5XCMobfwzF3Er6VkhxlRX8YU7eFUO59vPrtbKq+Xj/OjXsasaAl7WA
	R6P0oWbfy+eKUsn0FtuwyuIVhGo2LmG7PvY916mvsCA0F2nlQzxynkm6lJ6YsrPjDXzNbD6A7KC4D
	y5lTpCd7N/pTxPBG2QMctaAwTFM7DSfLjMN4RLYF0vtJGCk02W/TWB9yEz6WHb6a+2XgORlBqvUde
	2hSSME6blzuX+CE5y7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9P-00Etoh-1V;
	Wed, 22 Mar 2023 06:40:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9J-00EtkJ-0k
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:43 +0000
Received: by mail-lf1-x131.google.com with SMTP id t11so22078069lfr.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onn7qzpEkAoSPCvz5HXi6C8mwJXx4hkbdPzDlnc9ItE=;
        b=pAABZrarHek863hg3GjsOPwFr4nfpKBBy0573hnYGg0V5rCZsduRAiguChBAceHph3
         NWqdeR4Wt807f2NBJk7UsVYYBKKIvWOh7sv2YTqbp6yoinKlWmqBQhbDASWnMI7US5vx
         Wni0GuLip4ZiJA9f+AHqecKmOTyY0xWnK3kyyBUXu8Ad4ysaQlmmF8SlqKCjDy9BMTLl
         5mECsjSb78wW4eLbPronCGSVt7z5/cLJ92+UwSs9hgReJzEj5QwmWiNHE7MKf67zFyeQ
         9UQKtIrPEq9O5jfDDeWp433V5JRDhTo+d924hi2e2v10GnAL3es474+YiJB/+o2Q1fqW
         +0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onn7qzpEkAoSPCvz5HXi6C8mwJXx4hkbdPzDlnc9ItE=;
        b=7bl5Cf7ABpOe1TvJu48fZfr8taqgEWVhhbR1v1HY+em8+ZUxQD9VhKy/Jax7icbi4j
         d+QOzBOjFg+LNKEcxosmeBbew7oNhwBKbbtT/rX5a5nNQmyJgsV1YIfJmLpIxPvHOfS4
         GNi/OMeUXzz3a5JH4pl0Ljoy6k3hKYRAsVT04MJfCnuE3H1+/Y7ONly15UiaU/4jrD3H
         vo99DhgGI41ZjkVvxpZpvMbpgJ8tr/uj+qrzzl55I2FAkyVF+4/95zeQmFdE5NaX/UA/
         mt3CASWD6/VBkg4hYRJDCprUoALj9NTgrOSd6yWgK/W9OHdm1hU2nUreEV+rWf4ug/3M
         kcRA==
X-Gm-Message-State: AO0yUKXQxirV+rIJZoDsV4QJEVPpglxKtYZzIJkTvfHz58G+h5Hyy+fi
	DUkusmT4j5X9tV4+yv6bKPRsXA==
X-Google-Smtp-Source: AK7set8WvTk1sxAAUY8QOewdfzC3II7UdJzeTUmibypMHp6nvVTMEbWr82rYaZExDxdvogSXvRDVog==
X-Received: by 2002:ac2:442a:0:b0:4e8:3f38:7d21 with SMTP id w10-20020ac2442a000000b004e83f387d21mr1684219lfl.28.1679467239953;
        Tue, 21 Mar 2023 23:40:39 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 04/11] mtd: spi-nor: core: Update name and description of spi_nor_set_4byte_addr_mode
Date: Wed, 22 Mar 2023 06:40:26 +0000
Message-Id: <20230322064033.2370483-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234041_270801_5C1CBD77 
X-CRM114-Status: GOOD (  12.42  )
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

Rename method to spi_nor_set_4byte_addr_mode_en4b_ex4b and extend its
description. This method is described in JESD216 BFPT[SFDP_DWORD(16)],
BIT(31) and BIT(23).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c     | 8 +++++---
 drivers/mtd/spi-nor/core.h     | 2 +-
 drivers/mtd/spi-nor/macronix.c | 2 +-
 drivers/mtd/spi-nor/winbond.c  | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e80dcd87189b..d80366f8a7e9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -508,14 +508,16 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 }
 
 /**
- * spi_nor_set_4byte_addr_mode() - Enter/Exit 4-byte address mode.
+ * spi_nor_set_4byte_addr_mode_en4b_ex4b() - Enter/Exit 4-byte address mode
+ *			using SPINOR_OP_EN4B/SPINOR_OP_EX4B. Typically used by
+ *			Winbond and Macronix.
  * @nor:	pointer to 'struct spi_nor'.
  * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
  *		address mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
@@ -556,7 +558,7 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	ret = spi_nor_set_4byte_addr_mode_en4b_ex4b(nor, enable);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2fc08c26081f..7961b81262db 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -634,7 +634,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     const enum spi_nor_protocol proto);
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
-int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
+int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
 int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
 					       bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6853ec9ae65d..91a8fa7d4512 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -105,7 +105,7 @@ static const struct flash_info macronix_nor_parts[] = {
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
-	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
+	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ca39acf4112c..9cea241c204b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -188,7 +188,7 @@ static int winbond_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	ret = spi_nor_set_4byte_addr_mode_en4b_ex4b(nor, enable);
 	if (ret || enable)
 		return ret;
 
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
