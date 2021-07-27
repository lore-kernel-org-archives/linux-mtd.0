Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83ECC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81DA860E08
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81DA860E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIM/yRS6jqTGZ2QSM7Dn5wKmpY/Qc8ew9lDDmbWfTOs=; b=rPivLiUKFcH2hv
	/FF4o11jgArv8nikkHd3R+T+Y+iwU/s6r2EUPdcXwE/A+qhG5AsQ7xCzeJbo7mn8o29dUihoGzLNU
	jdsprTvOAKQjxpF7tNDK/E2rhO+pqcEsosWrGLgPJTqlw16m0F6ajjeqT14v1T84ZaOnGYleN3vim
	WfUNzEvyWYqlcYURBa6mTzH7plG5PS9c84PqvmG5e+IZq3O3lcTEifau7eJT710ukmQ3HTXpyb5Sd
	LMPpujRsDKwq1jGI7nDV6dJ3byaEkGLoKZgaBN/a2UDs+ed0QN4wswSTozUGhCWyi6J9d95oP/K80
	cUKfnuW4qEzL0OJ+3W7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FR8-00DO7B-MT; Tue, 27 Jul 2021 05:15:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5m-00DHYa-Dp; Tue, 27 Jul 2021 04:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361602; x=1658897602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4h/b2thfFZv8AmUSRxRfy4fl3H7wKOL2R1o8uNHRrVA=;
 b=1+5KMk07bikmHKsO1TK/Aeh4M/puJh4BkGNbezvA5zb9niWvCXggrnOT
 K1VLGkpbm+6pVgXiphgU/N2OlCkj0Tg7R8ZekwmW6uXrVbKndFiYkl5wu
 3g4pOiwUPBWvmnQICxRCh3l7h1VQSLtUpWmyw9ZBQTlQbT7mW1gfvf7gQ
 K8yjOA3Rx2F5oQfVc8mSfk+jnwckMBlU0lE6aX/SGC9bNowNjQw8Ugo7D
 hnV/+hmx1Gut1R0SXhm2rBIr3WnKPLyKnRjSRjBLKjP4GtLc1LOW+l8K8
 bOdVROiBDurNPlgZWoyluVViarM3fmgPmJ2BSSlECxy40TENyw8EFOvv7 g==;
IronPort-SDR: xPJVDUWZ/g9XKMwVoFSB0T4dwRpUA0uMLVFcfbNvF7Ebq8dd3iirJuk3g0sHOapHuWHSIoFDkz
 UveztIpldeTPHFofuMZIAMzyIcAEse89xRzp5Q+Tg3Z8CtMGcqMJ9lxN7br/XwhpvTGUEbtHK+
 pQOO2cctj8CE/bF/AX1d9dv3YuYucSzl6UMoMTUW0PKkHzLO0d98Y6DO5YJeAPpBnSKPm6ic3Y
 7vqbz0XEvplMPwUqiwo0W0k0jBW7DwCCgFwY3yGPkABVsdy2rDrifWO/fuKl3quPTAyjdAO2nR
 FOshww2Nj+IBWICk5Sg9bayF
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137653949"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:20 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 10/35] mtd: spi-nor: sst: Use flash late_init() for locking
Date: Tue, 27 Jul 2021 07:51:57 +0300
Message-ID: <20210727045222.905056-11-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215322_514401_6F9A8D53 
X-CRM114-Status: GOOD (  10.87  )
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

Locking ops are not discoverable via SFDP, use late_init() call.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sst.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 980f4c09c91d..29d100febdbf 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -46,15 +46,11 @@ static const struct spi_nor_locking_ops sst26vf_locking_ops = {
 	.is_locked = sst26vf_is_locked,
 };
 
-static void sst26vf_default_init(struct spi_nor *nor)
+static void sst26vf_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &sst26vf_locking_ops;
 }
 
-static const struct spi_nor_fixups sst26vf_fixups = {
-	.default_init = sst26vf_default_init,
-};
-
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
@@ -88,7 +84,7 @@ static const struct flash_info sst_parts[] = {
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
 			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		.fixups = &sst26vf_fixups },
+		.late_init = sst26vf_late_init},
 };
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
