Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9949BF5543B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 01:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agWjBNvEyHwv59Rit1U3lGwBAITSDkCKsUwmU7ifsjo=; b=EWs7dqBa6sWLDi
	vEB4rEUu3d3aCLLB2MG9NpiYI+IMZmtj4a9Gne88D6419pfOahPxm/DNE1a74dxXkL1YCyBAVxGzk
	qxZsPKSpPBObf8MPqEjnaOVezbzr3pPzUmp38zhh/gSPS8bF0IV+5H74XEzxE1vgYYi2fUvwgFM6n
	Ehdf9+ylGTcNOyXcbkclGMS6lPVWpeEqRJLqu53K5mv7CQxdwckbvTv3ZSx64h1+i3xKrdaW1QW3N
	2pnrSi5Ti6dPZ8CW8PV83K9MXJ59SX3qZvFEcLBUoYBYAkvdUG3hl8Wnxd08omdv+345SJfumhMxj
	vBuvNTsqannRo+BGoTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4BA-000000033np-047d;
	Wed, 25 Feb 2026 01:59:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4B7-000000033mF-2hhV
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 01:59:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ab46931cf1so2524335ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2026 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771984745; x=1772589545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILoW48W9hqLRwmHITphjoIJRhEY+2JRSNwPbSj3wbI=;
        b=E6+znnXilZZthP4ZdQ5vS38ngndbUs9jb9+Ex0Nub6mpmP+gGm0WlsZ9o+euewVQES
         1zNN4t4jF7jm1pFzN4EWwoT1lpt26LdPjMBre32K6FplXO9v4mvmT+TuD0Sia6rtSVPI
         1uDikBq6GesMO9gkFS6jUAM1SprXjO7JZnbDD4eEFQkrRXMcAgF2dMXXU4x51kzDNfOZ
         or5RQwiR+5IseMJR2cebE7cHI+3LhozkVDprD7wZonjGTRw+QGKvFaa3QGZDLptZr7Fr
         eB/Jjx1fu3ZtBJR8na/LFeotkqZEwry4rLw7cr79+f4cdJlD/75FJEGalRh+0sr8+yiP
         nylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771984745; x=1772589545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nILoW48W9hqLRwmHITphjoIJRhEY+2JRSNwPbSj3wbI=;
        b=GBr9r8O8+W6s8OlKG00+E2+lsJefVVEODPe6IAQJpMcRhQbPSkPjlR4R9xJwu5yid9
         Kua0sTNSO7C9Um9LF9+P4/aHvjZZiNMkyCxzN8uMUsfQFsDauiwbadGi/UFr3XC81iPv
         2ARZexRaS3EWa7xzhs2ywh4HchBP0EahXHvIjSkTUEOwmz5428yf+TcJ5IvQleIvTCjS
         ou8k66ZawpFKYN70vypBoGKgX7FGzGeFY+Z9F2bXiPUiagsnAlfn5+YVxuPNHjCD8hEk
         Zpgc+65B/0/CmPnTIaK6CpUREy1PP+PGeIQDQ8ApeRi/Yga4UleeYCFA84c5GWwE53ST
         zEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrOGaMA+ze1iLmdKlI9cJCIB4fv2C73jxaKCab8gnCzb+r6HaQs8jeD96ObTmrCPrdj6VfbH+dlRU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvWADCbPgqYH9NSkqI3704V3SVJKC1jI8sM9kuRZ6tzy0b0s5f
	9mTZemI6dHoW6yCe9ZMr8exWCccQwMh+P7ceLPqHuukO9PuiGA7NytUf
X-Gm-Gg: ATEYQzygGtEZVNt7Q1ZRljI5LqVub8p6V10E97itvD3ydPA6HYgJIXKfUDkGQef8Rmn
	5cXA/KeNjlWQljJrf7dz3xDZZLXK0GLaP0dWxFJYoCHk+L1M3xnoOrYcU6BS7+rX2CZJCItQgl5
	B7FDL0boPeQ2XVkKfgPPjy1g05nBSaBAetnFcvo/NFpvCLfHeO5TeogWxPHPqBelGrQIIaOz12b
	/i8HiF82neId8G7GcYambyUAQ9A/ooJb8VkMCmVNRQCL8O6kSWMBucpVQ6ShAgrftCDMwrm+3P8
	w+ON74IZkXk9EMMleG/dBH5cMHr5Z9USXgHMQ7GBFilZKhXR5GcJQxAvzGPjskxzwtOYWhI+7dt
	giPakv/Xmc/RYuiGZJIQQeSriGEy7w40d7yWEfgImkyY/taQUIqErPk5oduCIroKg8YdDZF15ZN
	qNJypHml7pLVBvvqIuroxHAcbBQFY4G8K/YgIayCoBRWbmJA==
X-Received: by 2002:a17:903:2350:b0:2aa:e238:e20c with SMTP id d9443c01a7336-2adbdcd8822mr19122275ad.19.1771984744512;
        Tue, 24 Feb 2026 17:59:04 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fcc5sm118566325ad.76.2026.02.24.17.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:59:04 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 93A694136075;
	Wed, 25 Feb 2026 09:59:02 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v7 2/3] mtd: spi-nand: Add support for randomizer
Date: Wed, 25 Feb 2026 09:57:04 +0800
Message-Id: <20260225015705.1113199-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225015705.1113199-1-linchengming884@gmail.com>
References: <20260225015705.1113199-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175905_684988_85A38865 
X-CRM114-Status: GOOD (  17.80  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch adds support for the randomizer feature.

It introduces a 'set_randomizer' callback in 'struct spinand_info' and
'struct spinand_device'.

If a driver implements this callback, the core will invoke it during
device initialization (spinand_init) to enable or disable the randomizer
feature based on the device tree configuration.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 27 +++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8aa3753aaaa1..77a0371010c4 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1307,6 +1307,29 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	bool enable = false;
+	int ret;
+
+	if (!spinand->set_randomizer)
+		return 0;
+
+	if (of_property_read_bool(np, "nand-enable-randomizer"))
+		enable = true;
+	else if (of_property_read_bool(np, "nand-disable-randomizer"))
+		enable = false;
+	else
+		return 0;
+
+	ret = spinand->set_randomizer(spinand, enable);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1594,6 +1617,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		/* I/O variants selection with single-spi SDR commands */
 
@@ -1881,6 +1905,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6a024cf1c53a..6a68a6c3866a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -584,6 +584,7 @@ enum spinand_bus_interface {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -612,6 +613,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -668,6 +671,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -753,6 +759,7 @@ struct spinand_mem_ops {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -786,6 +793,8 @@ struct spinand_device {
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 
 	const struct spinand_fact_otp *fact_otp;
 	const struct spinand_user_otp *user_otp;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
