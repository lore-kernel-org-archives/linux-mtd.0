Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E179EEF30C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agWjBNvEyHwv59Rit1U3lGwBAITSDkCKsUwmU7ifsjo=; b=LoIty0aNiY4pw/
	QREOpGqy7GO5Jdmvz5oTs2uUAGJ/3AdJrjLtTfJH8JbeJ/lL0ngskaIVV2yCEjf6bQOvGXZ39sKx6
	4+tcCzXUo8cW8zPDjHF4CJXikIWrS6fucdInf+G8StkjEm/t/6JarAJ4oWf4tHNPQfojcPHRlwYFK
	ZnCBc1lN0UmDpzdw93+Cp4elNOyz+vvj3lHASBKwosKRCT+17beben6WWaxZ69Ysj3ZKtd4XdVNiJ
	xD30V7kiWUgZ1M8JVzH1aXvUWELydZ8Kht+ZKKZhhOQBUdhWUWcA4ZIrPCBu60FW/b4MhWp7T72PZ
	EC5xZK/MDG8eHdme0RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2tE-000000014JS-3g2F;
	Thu, 05 Mar 2026 07:12:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2tC-000000014Ha-24XI
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 07:12:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ae50a33ff8so33145485ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772694773; x=1773299573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILoW48W9hqLRwmHITphjoIJRhEY+2JRSNwPbSj3wbI=;
        b=XzIshjP/gchkFFpDgjzRlv2kXg0aSaqBWv1sk1fvW5A0AYY8fdKJujA5Y+Xp5XVYYh
         QehvgU9Y7ct5jr8CUBZ1DAAimtGd4xnw16yzXkNGeqjPUpUK0x8x7zVBVs0zNECBStJp
         xUmI53X/OCJ38axAsFc4+Dk85sTy1w/b/apapxMsZEtU2+5SJP13m4GmsV8wP7oNnr4K
         2+s4XQ4aGjbbEVKCaq38HDmocqBgaSd6AZgvjq//5+pXKHMuk68WXriUH/rgswgQtUMn
         7e3d2rae9gcc9RNZ9Ntg9lHTmfDIn9pABeKZXBp323LbQZ1GIjG3NxJC8iXstXgwSwgY
         Hs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772694773; x=1773299573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nILoW48W9hqLRwmHITphjoIJRhEY+2JRSNwPbSj3wbI=;
        b=pwgRCMO8irXclDut+NTlBfd1x9PiSmRW6w3xhDGsMwbJxp7WXhI0fhwYkk6DDWS65o
         nJkFEpJmqfdp9cvJwZI7Yl1y+Zn0Va/7VkTo+3Xi4YDRsRSVVl4Ept7kS/FOEPvUc1qX
         UtS65a4YUeK3qWgiXZHcoCPlFnH4MAxSJwMB93mRnlnJN+1MfSikXnxpiA+9ow0rb731
         HYrCRiPXBuAuRLmmtOZHKlK0zx62PlY+z4XhV6RblHVYE46SUpKnstiEI7nmmtuzZZKN
         qnLFKAeLgDKZl/re7JCenYzer6FnHdTjYo/4XhNOvnLwu0OXiHIEKE/GWbsyHI4uF4P4
         z+dg==
X-Forwarded-Encrypted: i=1; AJvYcCW7kpTmSzbckTVKo1FwYXqbqZytm6azEPdSbe8SNSQRzPJEqBsk1so5v087/q0I/mpe+35tHuaA/J0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB5GTKPITSTZ5OZE6Xqs6koT0lUHoblS+2W1c1nXwtGybs8/a7
	j9H4fUN9et2pYJzfcJzi5cTrHe5w6IzK+9BHu30Ck8/JdXKwJW93uVWt
X-Gm-Gg: ATEYQzx9oa0pOj0afFHo8tLSFv0jSAEtTh6Gvr7wHF2Na8aAc4hjDNTIzQtogTdumxs
	ymgv5l1DizEAVi+iCKJFPuaQwLRm9MJGe9Kg4V0bIf7bxbAD2J6k7s/uusXiIVpAQ311+o6+9bi
	hfUyCzQ1axe5TurmQcO9jl/lnvYxxHGLk+fj5Fm5G5X8QcweNonRhCzBR6uzErUJNFJkzJlbAjO
	QFtola2tbkGFyuoMb3YGi7wQGQW0NVFYFhIK83p7qM5zssKAXY5Gz3pj+SNZPuLLBHuZbhUFcHB
	QNczHOms9gNtRFLAe3Y5Vg1GJr+qgOjshOXyzZIbYxYasf4Tiv1PmMDNPP4KT/D7y0WpE7mx22v
	DxrEjlX+OGX4Ml6VeLe9GmMBmWNQrR952Sa27DP465tofJ9i6QekXLcT/kPiG5frx1mYl4rfK5g
	LqaOCHx3tnAaJh1ox2lJ7M77KjA11uv0s8eoN6iwz74IHelw==
X-Received: by 2002:a17:902:db0f:b0:2ae:57e6:616c with SMTP id d9443c01a7336-2ae6a9c6eecmr45501805ad.3.1772694772962;
        Wed, 04 Mar 2026 23:12:52 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69ef1csm227491785ad.53.2026.03.04.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 23:12:52 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B91B74163B71;
	Thu,  5 Mar 2026 15:12:50 +0800 (CST)
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
Subject: [PATCH v8 2/3] mtd: spi-nand: Add support for randomizer
Date: Thu,  5 Mar 2026 15:10:41 +0800
Message-Id: <20260305071042.1193522-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260305071042.1193522-1-linchengming884@gmail.com>
References: <20260305071042.1193522-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231254_528783_1835290A 
X-CRM114-Status: GOOD (  18.42  )
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
