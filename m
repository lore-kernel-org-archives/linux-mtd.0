Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D429C49EC0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGVPV+KfNO/kiLoTKlXeIRMDnCG9hSOqpH1ePGd+vgI=; b=rH5xsqUJs4B/Uy
	1tQpyqYMKgt910qDMMKkRoudwQb1dMQqCMXPFbsdCcI7I7p+7vBhLFJ/AS+JcylUq6/TdJNzuncZ+
	iDaSeXjht7sQt4ehiNMcPocMDG5XCcuyq8l41gjgQR3oxebVr3oDRTcE30aJu+g3+g8MOCcxA4bts
	a1tw6vdmoOrH8EBD1iDZ7i/RVMUThb+leSeX203FtHxQGUiGRrUVB1unPSCaIQBUMebNXq8Kv0gjg
	fvp58m8OEaWb21lWOtLNi0bkQzw0M9OEwsAbZ15CCRa80iYrhYX2TuX+haJrlt+d/Azc9PCBfsM11
	AiOAepmz1cJDN4v0D39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPF-004n8T-C4; Sat, 06 Aug 2022 06:35:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPB-004myB-5a
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso4737016pjl.4
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rYH70SZe0UKqkLFFI+9VEJX6HzPBNrCKSuVOv4ipo3o=;
        b=cbcyV6PhEOM8LUOChFIgQwufQSYw9Cbfavd03VeD/E6Sg/HxUseFAyPIreHajxEbV1
         1bY3qzU9ozk1EfE23yyVaGIcNONR7GRJl8w8vkPTnr1rWFBFzF0tDwItYkORiWFedRKP
         JGGkRIQYGQA01cUCgRB0IsKO1laYFqMwRsTpRDKGoIgAbGqYFmT1ceHsgRTmFxDWv2pH
         Bd0AvyEqU23vvZloK4N1luL1tmdMFfmhktnjyYiqNfZuGVfrsglsxz7hQO02jU+BEBA7
         oZUNjvK6OJihH1CDFJuh9xK5sSem+LYS6bEC2hfroUYHODg4laz4xJHCoFeJz40GnFGu
         Do6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rYH70SZe0UKqkLFFI+9VEJX6HzPBNrCKSuVOv4ipo3o=;
        b=KztLK0YhnZlIkYSRAX4fqYqkWBVf0vkvw/G4Y7EbQg77PYyQR3Z0PmswxXKpuiFY3/
         legK48dqEua71XTPqpOABss2iNKO2IC27OcdwKxDKPo90OJplIoOA647719az8QsCffb
         ItJA7+AbmXGMVGbtshiwT+4T1ogVH5Pdfi1rPVxFpP+6gtp9WHvAvng11ptkdnYhb0pw
         zxftFaea4DBR856ZHIzSVOJtK1vMUWrq62SpHSoJJ+TpqdSvZ5acihKVxUayISB9mAL0
         rvuDjVrBaJC2gTZ+0bcVTwyet5fc8lT61CEZfw6eBpTWcUBO6IUt9r/6Tm21KqBe+JPR
         S7fg==
X-Gm-Message-State: ACgBeo11APju3dNfWw7rpkxRPajK6t/hlOP+TMIiMYVkBIpzv2MiIBf6
	EwoM+N6NVdKEFBRi1MXDUHm1cAMrhGuB/w==
X-Google-Smtp-Source: AA6agR6PwnaFeDeCodHEW8daTKdvu3ZklOyFt1CU2dhoEzMi1HUUlFiZuVLm/vTFwsJsJdYE42V6tw==
X-Received: by 2002:a17:903:2346:b0:16e:c9fa:c3ed with SMTP id c6-20020a170903234600b0016ec9fac3edmr9850575plh.30.1659767723712;
        Fri, 05 Aug 2022 23:35:23 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:23 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 1/8] mtd: spi-nor: core: Introduce number of dice and volatile register offset params
Date: Sat,  6 Aug 2022 15:34:19 +0900
Message-Id: <170dce4cd6add0a8fbf0a0c5dc070d988496cab8.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233525_235433_F06CD7E0 
X-CRM114-Status: GOOD (  11.69  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In use of mult-chip devices, we need to access registers in each die for
configuration and status check. The number of dice in the device and
volatile register offset for each die are essential to iterate register
access ops.

The number of dice must be initialized as 1 and may be updated through
SFDP parse.

The volatile register offset table is dinamically allocated based on
the number of dice then filled with offset values collected from SFDP.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 1 +
 drivers/mtd/spi-nor/core.h | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..1fe7a33f3189 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2541,6 +2541,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
+	params->num_of_dice = 1;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..9a4fbeaf90ae 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -349,6 +349,8 @@ struct spi_nor_otp {
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command in octal DTR mode.
+ * @num_of_dice:	number of dice in the flash memory.
+ * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -381,6 +383,8 @@ struct spi_nor_flash_parameter {
 	u8				addr_mode_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u8				num_of_dice;
+	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
