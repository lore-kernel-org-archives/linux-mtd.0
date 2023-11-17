Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58165C5AE4B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6+UXeMq4e4PNMQbjI3e68QiG++Pv4YKTFVrJFYjv94=; b=A7zmaIoMbOE4HZ
	rSAmS4wj8yt2RjD7kyZARxH0XX10GIDcFlPmD0+FXTCsENPuwwNfT9iae04U0wf1+FeSRGzDCMGQE
	+ZRbpIgn5MQ/ri87cRmNrdd1xcT06Mn6RtdSDwc+MnHbD7uPJoMDuVxLEWuecuMv8aDXyN6MbR/tO
	B7bUrHuMBW95pcuo8IhMuozbYXoCQxZM6EOFECZjnXCQjnSejmY6C4SFMz4o2Yo2ffy3cdazWCU/p
	ZjrRswGRNp7kix/41k7b/9MUMkk3n0bS8RIA9JRgyfUxa/E1JarnaRjjZ5o0b6lq1g51zBf3aHTV9
	TjE5driiOtC2jGcZguPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNb-005xFX-1f;
	Fri, 17 Nov 2023 08:39:11 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNV-005xCs-1R
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:39:07 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6ce2add34c9so913811a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700210343; x=1700815143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=VyW/tw+mevMs4OSzpjvhGIhAxcN9gvdgBJKRoPESi4g8XGIdozYT5R7495M2sFQ1R7
         D8u5QGho5ry/zAdxjJRQNUf47/2juZD51sFnRxlCj9YdLdazYEh2/TvWpv/6wfXc9lZW
         kvaHH6WvID9iV8wROVmMDi6Oo7aKe1jDZN50tfWkAR+mwqKw4G7M+OA1iir4x7vflA3l
         S8DQTP6gCs6nD4JRkXWXXYqml4Hk6gjPEWP1GY9DR5KeOj2iuvx4MgQHQZnSpZAWSURV
         kHvS0qPd82b0QtShPlovGA1MFWFqpLHyM3lCk6lM8y5zv3iPb5Ks5EZo6rkhU94Z21BY
         /axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210343; x=1700815143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=Tb7SKMmrvlgjLFrrKv4F5/RyFRon471YdTS2yfygmHJED15b8cWOagLOagrZ9qjYwG
         h8JOXDrOeUJ6Qe5DXDwk/hx1olaIBcibQxq6GfE2ZcEElamB065gTCJvuFYpNgM6Usxw
         OwyIhBFKS5dd4e13z0diwnS0AIEQi2YxyzhMgsrPAEpiNyMrrHJl3El49YIgBdr3zPdz
         Y3D4axPdqjKQQGbOoLFXArzS88s+LYCVDsMrdBv5FxGjqltZxyOjMZx9zbU0Oq9ueTeY
         1NCgLz69ktKttiqfgmk+EWHTWYoU1fNbxy0GNw6Vs1M5/rAWdbaksg0eet0gf5F9U2pl
         uA1Q==
X-Gm-Message-State: AOJu0YzeZLtEmjUQl+ckgD9e4vTHErgRIuHOansdJO5Mt2etDnN9yb0Y
	+8FyjeojdTQXM9v0gPECfxQ=
X-Google-Smtp-Source: AGHT+IFkrMTriB2mgfXu63eGspuLcvoGCxq6rgKRb0mA+qtQRYXAjNViOZ7aCqsddDOZ2VF6fCEung==
X-Received: by 2002:a05:6830:1c2:b0:6d6:47c9:36b6 with SMTP id r2-20020a05683001c200b006d647c936b6mr11874146ota.22.1700210342275;
        Fri, 17 Nov 2023 00:39:02 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id n7-20020a6546c7000000b00565e96d9874sm794635pgr.89.2023.11.17.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:39:01 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id D34D880527;
	Fri, 17 Nov 2023 16:39:00 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v5 2/6] spi: spi-mem: Allow specifying the byte order in DTR mode
Date: Fri, 17 Nov 2023 16:38:49 +0800
Message-Id: <20231117083853.33329-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_003905_487662_A71EE08F 
X-CRM114-Status: GOOD (  15.52  )
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
