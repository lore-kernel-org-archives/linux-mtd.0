Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96798EE57D6
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6+UXeMq4e4PNMQbjI3e68QiG++Pv4YKTFVrJFYjv94=; b=dI6m6LTzhDufG0
	gEkvpaRlEC6zcXqdf/tjXFNzpRXRH7FpaEO0zQETlnP4MA6aozx0J9Asy7e4ot0udLPycIkYwhj29
	n/nCUPnj81NYmZTcEmSnp/wB6iM+xD3P/OQqMKKMZ0/5z6oSeo+3btxrirnk4X2VeNjQxLpSVrz7/
	qVQximJRKGHM7bGlfmXqpG8EhzzUIes9hx0NffO4siuhvM6rexgSkovp28bVGsAdl3IVelfdZl3K9
	reErPYd+LA0ChRo4FOq9+Oypw3So6AkyVIsG+FSB8ayNBPrTyA21WaqPKlhqxLMhJet7ebGxhSqDr
	gE6wBPIFt0JyPayT9fwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD5-00DBJR-09;
	Fri, 08 Sep 2023 06:43:19 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD0-00DBGh-1Y
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 06:43:15 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5657add1073so1181884a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694155392; x=1694760192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=rZBCuR6g6xtZO65axtBF1ZIgljSbUd5srXEsLEsSIyDFsYx1tmuFQ6SJ4e5C5tjjh2
         mi8f7GOZDZ9TLOlzIfIQePUTwPUKqbJC6JAYbY4MQo/pijdUcTjKlqDRRfGVd9bR8pV2
         i8DRzBTJh8tF1LQfFK4a82DMAaq6cFBotq9XYqfHWFzcWavrkx6eZtGQ5R36Hj0pGlWT
         ZI5035o7XnCr8D6c9IYqkkSOkd2iEMjBA77KWTKi79BFQrw0MoVSCl+oEHGjIvOHom0W
         IwTB/YBZ5/6C6hVL8ppRgOm8OGnm2f8/eIr9TOtVS2ekNqwa7O+cjturADvJlQaxF3t1
         gRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155392; x=1694760192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=HXjhgFpHT6M5YT05hWXrQIYs+4D8Apv+3GgKayQfpLnymkpzke4FQ/QEO2gTHy94QY
         H93jrFqlNhet/YR8fhEjz7WKcCcj5AxWPS+Yc9j88TENEFkoJCnsOpf460MEPK9X67bd
         jiHNDhwwDKmnyKLkddHc89Nre9ncxX1tlzW56YVrZtllYfK4cNPi+vk0uUS2D0O37Rll
         XWO179W6IeqHlDxQlvitzVvrjTSwXLVI1VXSiuU8MDPXKXzHoWAOJ8no9ayraKDg0I9c
         Piu0JGcPACmvzmn09r/Wq57DKUJ4xtH2Z2cPBPvOKrq/ij7mQyfhJS0sBtitbCVeX+ma
         Wwtw==
X-Gm-Message-State: AOJu0YxuRqbCWBBmuK9fcbZ2niugLv1LdzZtT6SzrQdIAqzz0UQAM/1w
	slzfhTefjZYfnekDoybMS4c=
X-Google-Smtp-Source: AGHT+IE/yhTp6MMzj+znPkKUUjra6V3BUhmSjAznSQLAid4fxK2VDfXVt+GrKyNkj2LsF1Tep1gT3g==
X-Received: by 2002:a05:6a20:1596:b0:151:5988:6c3e with SMTP id h22-20020a056a20159600b0015159886c3emr2071577pzj.26.1694155391848;
        Thu, 07 Sep 2023 23:43:11 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0063b898b3502sm674066pfa.153.2023.09.07.23.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:43:11 -0700 (PDT)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 816DE8186F;
	Fri,  8 Sep 2023 14:45:08 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v4 4/6] spi: spi-mem: Allow specifying the byte order in DTR mode
Date: Fri,  8 Sep 2023 14:43:02 +0800
Message-Id: <20230908064304.27757-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_234314_517114_7BDDC274 
X-CRM114-Status: GOOD (  16.14  )
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
