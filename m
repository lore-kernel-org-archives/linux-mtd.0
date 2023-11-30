Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADCC07CA9
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6+UXeMq4e4PNMQbjI3e68QiG++Pv4YKTFVrJFYjv94=; b=ags4R9MqTO2EBZ
	whuN7x7eXykavdKrKl8HBw+cUf92amt/MS2evPaPMh/lSu+KC3P5lWljojzucW+YICwwk5QY93xyx
	lXe5wkB0X8sPd6bjSiYB9XU+4lx398BH2Q6xwoU+he6zbAu8CT73bHtqUBC2xgaioO7ObAZKVJI+Q
	4kdv2jhxP34qd7EOx3V2d0OIlwwzd2fDisD1pkim08oVzzsTpj7ZqqbNQt/MoYLIo4pE0sFVJ1lCk
	pjkeJpYlK8EwD5Q11+VjrpcZSjxOezDj8eoVt0aZ/R2ysPKxplTkKZPDFR2BDYSb07uaVJnYDU6EE
	UHlA8EwMu9BdkvDL/QuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZo-00AEVX-0q;
	Thu, 30 Nov 2023 08:39:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZj-00AES9-0h
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 08:39:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6cbe716b511so687935b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 00:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701333548; x=1701938348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=kDw9HjtCju8yjK0YbvMjzV1VkEXyE4UBIx/Un+V7uPPOdOMQXkX2YkC8wlZcpb8zgO
         EpxEfzX8Daml8YcNnQ+vgRf2Q2i2LT6HBIJExvcQI7qm5bmDCgwnhcfeCNDMOJkFpnFN
         ry5eIeeF2cQiqs7Y7tBZT4nozzuUkwec2eFD1cTJHv+MI/VAlOhdYdJieCIfofS0oVl1
         gXuu5jdbHv1cKCCFRH6i0VlAjmqGprzN+IFdO5g/Cw/Clt892QzPhj81603wZVKt4aWH
         /vdcsAfwMzXs6cwbaFobc0/p3exEkwK3JPyAo9aqTmQxIFndIM2bSVM4RkNVo/XxvNAv
         733w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333548; x=1701938348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=soaeyNCsMAG7XS51dMM6fFCJ4rCra+zaVEiwdDnzjwHA47j4j1IdqYvUfb4HjWISbK
         by+eFQ0MWmn3GNqG/K1LFlX3ea+gAiiTYDamMt1MAaOUkcYbXzW8HkFe9s0ytg9SPh5p
         dTTA0GOSEL/F1agD7aKUodltdxImf4X4gQ0AJHyc2uR2Gi3FfIjsocZ37Qe2R76eMa7/
         7tWtrfOewupj1SGqVZHJS5XHNGKn3o8vPbQPpgeREMmP5IdTTqsUDWW0WS2dfRnYRGMT
         rkPlj9bMZlL+ZlvU+VK4p4beXfglDJsCAe7hutMZ9nj1hY9cwM3v6Mby4biB0+PbCxNx
         7ZzA==
X-Gm-Message-State: AOJu0YxjODYnOJ+KlwjR1dCnwXhMrDowIWjivAGAJBobaKlFsM4nvJhp
	OQJpSn80XIXNsEIhRgAIF+c=
X-Google-Smtp-Source: AGHT+IGlZNH2tfX2tE3ddQ9MUvXUv/kBAmEj9VJ4IyBbqrKjUfwFdfx1xIfNaJF9V3C++nZwOB5zRQ==
X-Received: by 2002:a05:6a21:2711:b0:187:8eca:8dc6 with SMTP id rm17-20020a056a21271100b001878eca8dc6mr20143835pzb.34.1701333547633;
        Thu, 30 Nov 2023 00:39:07 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id fe25-20020a056a002f1900b006cdda8519a6sm697328pfb.170.2023.11.30.00.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:39:07 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 723DD8056E;
	Thu, 30 Nov 2023 16:38:45 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v6 2/7] spi: spi-mem: Allow specifying the byte order in DTR mode
Date: Thu, 30 Nov 2023 16:38:49 +0800
Message-Id: <20231130083854.55221-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_003911_252266_DDE771A5 
X-CRM114-Status: GOOD (  16.11  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

There are NOR flashes (Macronix) that swap the bytes on a 16-bit
boundary when configured in Octal DTR mode. The byte order of
16-bit words is swapped when read or written in Octal Double
Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
Swapping the bytes may introduce some endianness problems. It can
affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
back to have the same byte order as in STR modes. Fortunately there
are controllers that could swap the bytes back at runtime,
addressing the flash's endiannesses requirements. Provide a way for
the upper layers to specify the byte order in Octal DTR mode.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/spi/spi-mem.c       | 4 ++++
 include/linux/spi/spi-mem.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..9c03b5617fff 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		if (!spi_mem_controller_is_capable(ctlr, dtr))
 			return false;
 
+		if (op->data.dtr_swab16 &&
+		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
+			return false;
+
 		if (op->cmd.nbytes != 2)
 			return false;
 	} else {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 6b0a7dc48a4b..d4935c5c3c7a 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -89,6 +89,8 @@ enum spi_mem_data_dir {
  * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
+ * @data.dtr_swab16: whether the byte order of 16-bit words is swapped when read
+ *		     or written in Octal DTR mode compared to STR mode.
  * @data.ecc: whether error correction is required or not
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
@@ -123,6 +125,7 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 dtr_swab16 : 1;
 		u8 ecc : 1;
 		u8 __pad : 6;
 		enum spi_mem_data_dir dir;
@@ -294,10 +297,13 @@ struct spi_controller_mem_ops {
 /**
  * struct spi_controller_mem_caps - SPI memory controller capabilities
  * @dtr: Supports DTR operations
+ * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when configured in
+ *		Octal DTR
  * @ecc: Supports operations with error correction
  */
 struct spi_controller_mem_caps {
 	bool dtr;
+	bool dtr_swab16;
 	bool ecc;
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
