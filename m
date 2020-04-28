Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A898EC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B228206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VlWy+D3z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pQPFEZ1O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Qx7TQr1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B228206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXKZOT/gxiCbY9uAPmHKiqNIoQByADFb6d1yAUpurI0=; b=VlWy+D3za9u6XK
	VHeZee+B0xoo+J4+XJEMx1iRfV1s6lcLhkfjVK38LLkMGXRQhst8Oqid4V0aCYjzkWQkf6X6/c5nd
	FiFrazUtIuBD60fJXw2cS9mr8UF20fRizkyme0TyqAZkuW0VuS6E+Fi5+LREvcLkzt69tqH5OhmJd
	ii3e27BAyOzg+ybRcZMIepgQdQbaLx+XQPjJRQiZI7WxQ3K7etFj08+DOvlzbi1ISJG1bKNSHVamI
	SBUPLg7huIvh2rOqyS0Gjrvu3ncAogKW+qCEP2MRWERE3bX9NDiVMiGHSNrG5DlOvPc5YpbDo3w9M
	mu7F7w/XFli/2Qr7RtFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTLuA-0008SD-Er; Tue, 28 Apr 2020 08:47:50 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTLu6-0008Rk-NB
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588063668; x=1619599668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QhCEovkxLOO5SYo4WSyhAjgUyVM9kXGteth0bkgSnTQ=;
 b=pQPFEZ1OqG4NbhprBOmMCO0XnidNK4VcfJaIy8LdjxXjVjnBqaZFBKyp
 fNw4NqopRODcmm2SRfQCZDyqirty71D7PLSog23SyDoICWDKA7UE2V4M+
 YRtr9kJDAp3x3g7Ote+3pDrQtLJoBYj1zZuOdNiElGtPgpK2WFPSr2x5T
 0Q3JZ8o+t5ndC0MPl3sU1+yd0CoqkftgET9xlxnAvjh6Osd8JL0Xw89I6
 ZZEo+NUMu1m2yjtnv6YvVNPRg8hXFAEzt6422HvhJnRzaHdLydhQrBmGc
 5ubEf8f7DNG+OFJ60CiCt0z0hQcTYLjdghlE0djQlJ0CX0TgM+k9B3mM2 w==;
IronPort-SDR: UUmPBEI0M3N7Q58r6jMc++iUuMMkQoGs79a8gZ1ZZoXPGCyogrlN4GM0V52hwObeDnXNshWTI+
 kf0gna5wWoWkhrVlckly1ycO5DPmH7lWSIPfBbSBrhz5XMY+f5uGkpX9sNbF2kxDzaPB4PE3jC
 Xl9r+RW0JC078DQPDn3F3QIubBEvuHWKgRlTORP6xQLNyoJMobFNglJZyY01tPVAWkidczipX8
 I8W6c4zDTk6Qh27ZHqCrpO0WmxoB9Cgol6eY/FiJ1mVbdxLgfgVSwUG1pwN239q1L49O1eo/z3
 Qs4=
X-IronPort-AV: E=Sophos;i="5.73,327,1583218800"; d="scan'208";a="74073219"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 01:47:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 01:47:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 28 Apr 2020 01:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFwPn8woC8zUNp9MpMp/H/0OIF9v8nZkVP/MT3O4SB+1rMok/iz28LhvuPwkinUFyMR257SpZE8kUxLtFJ0NHcNOnvC7xrW8MrBaFdCAM4gvHzXJXk6cJAaLCpgkTkOjAZyZOMl0/6aHJ6FKKjg2zdYfmmWe/18ScmqTPOdsjTRwEL9eYRy+2yvmKLdhqIWXmbuKLRRjQHtDrV1AED2dDpsISAtjkH8DjMvDlrI3c85BBJAOFa1cSwnIl1mJYSWxrz7Vq1UqFOZfr0tjRtdIjUBqbmAvEuGYbAg5YDmsQCSIM3tLvIXJTJmB/wVzI36Tv6t5fSvZbLJZNEc6vTXrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z88A50ZqtoqRGompYYtgTvxY2RLZadr37L7BsflGBo=;
 b=BVOZuZ0XY/VkkXoNOurZ+raAXLptBnpdHRjyYm9LQbXt4s133x0IheGNiZJWUmUCrTHfcsJ8vrU4jYNI0CbyOjM/myvbdlnMxp906tRR7/LZF6Kppr+/qQJ5TtM0FifCgpZfKRLf0dL2LobStGyX0FfYTrVpvhako+RSX7NRzVhAiiUzESLbqCKdlhP5WSTzR498oATplfqNVo1vx8g4YAcqeuXiFAKDu1VXPBQTuCPgLMbP4sXOrtd00QWufW5S+CxPncHNyN0TkcBP38ZbjvdiY9SYWn2lrjWeOkoTUUjWuSRi+BAE7R0/Zmcql4eJUavv8ecnBqC2ANnNDolV1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z88A50ZqtoqRGompYYtgTvxY2RLZadr37L7BsflGBo=;
 b=Qx7TQr1olHh+QAWMZEe6F5ArDyBTXTBIfmIcqzVPBg557HjCq8ctYHQepcnQIG/iUBQ/hDkVvy2ateM1W2HPNKve/1G3toXAbl4NIADQHpPSgz0O8I09BLMej1LfMa/VA7IlS3Lz025UmVltYp9p4VWrdlz8DOKs9y4usRdgfds=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3989.namprd11.prod.outlook.com (2603:10b6:a03:191::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Tue, 28 Apr
 2020 08:47:43 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 08:47:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <vigneshr@ti.com>
Subject: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
Thread-Topic: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
Thread-Index: AQHWHTmu4YIGhT4FWUWxDhX9JtN6Ig==
Date: Tue, 28 Apr 2020 08:47:43 +0000
Message-ID: <20200428084739.799468-1-tudor.ambarus@microchip.com>
References: <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
In-Reply-To: <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef11a746-7898-4451-2102-08d7eb50d133
x-ms-traffictypediagnostic: BY5PR11MB3989:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3989F989C46416D0AC8052C8F0AC0@BY5PR11MB3989.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(39860400002)(376002)(396003)(366004)(6486002)(8676002)(8936002)(6506007)(186003)(26005)(36756003)(107886003)(2906002)(2616005)(478600001)(86362001)(6512007)(81156014)(4326008)(71200400001)(76116006)(1076003)(110136005)(54906003)(66946007)(66476007)(66556008)(66446008)(64756008)(316002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QRn5St7oD4k1sdd9svwM9CXHOkbi4plgHye8uXe5G354gAnoOcNbpCuWmB0d0m9vmKf0M8n4mDoz3gYUwFVZmo/TNAu3EPb4zHNPtR97EaCWPr9BcjZMXEQExMny7+/fTcBQfmer1W2YRs20DH0M0DDWuluJlAkCoPG0awM5Qq3OtYQSNPSYDYnMnNU4oBui0G7cKLmhQh57pJnoYA2X+8BcJtnEu0KO8AqxXwD/PusOz/2SnSoh/d9+ESXuB86O0n3sfhOPjsfWhwkr7hCNxgribe6mRthN1vGw5Xes/679jG8aAJtdctKOJZ1hh9sLGw7vTQ4itJcW3qL4W7jZQcvhtp5xdZcjVChnZ/vnEZPMVlzghUByckNYqsgbCDU2Y3xrWpVRZMB7OueNXzHUURYNM4Jlc7+HUWmdFlC1s/2PbUX0L3YKJaPPOq0f9UHQ
x-ms-exchange-antispam-messagedata: dzz8Idk2SWn+MkAQ3ozVp7/wPcxllOkd+gyrvkAIg8OGYC/EkIyJrrlG/xh5c1P7angWq7/djGIVpn4fRpvPRp+ddmJJImizRgXtp1cG/ZIw2jr6TPf/eYmR9n5TUg84/ysWKGZE/Jnoq0FF5C85aJc1ilIL2zHc6SO9+NM4+gBzq+61Js2V3gxb3KfA/A9SjDbuoxUcumQG7caC56ohuTFwz5BpT7BeALE9Q/J8nPNdKYdfpjN++7+vMMXENOJWsmKo0C8XrR/bRoMWrVJ2xWPOhC86sVypX8BEgBGIekGElct2Z8tjvUSsjc9LMLFULB21xvEI+KkxQolrNfbDEPvjuOBrhuK58alJGiZoZZQE2K8PCs8eIWuYar4IO1D/syst+DMsyBIZmkNHQVy1iJEH9tB7cdlZqKsJl8wyI8evgDkVT+OgLkcNLA0WDGrWNehQ9y4+yt/6YDbbWV/BhLi4Mig7HLVYNUC8aPVJeRj7qOO+h+A67GQ+EYIxaWEVVQgaFOWnu+PZIUJot8FfJPkiWDyjHBsulayrVD6Y0cmxTCp3MB+mjgIl27SLv5As0e18eWn4GdbDUczs331pu7yarjJNKIXEE6d7y0aMvjvJ4FwiQZI4DeTSp6JvZz7w4pmPx4v4IRuLg0MQ/Yung1bHJQn1QpMh+MvyhPlrDUokq1IxLR8dEMJ+QYiuLhBf8FYaQPgdUA6LOUGtckTrrz+JVupv+RX2DKXSDF2J7SqFhCmr+yKlf40yW6TymIijygL0tUNgkleejhi1hLbgtaOJ9SzDY5TPAPzjYuSaQR4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef11a746-7898-4451-2102-08d7eb50d133
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 08:47:43.4045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Fb4xx/MK5HnEonuO3vH+uPdeRSxCmuTZshmn50XV/SFBaDzeFNIrTuy8GDb9jz3jTOMtFy7zyyqCK1ulIu1cYbbPjqM/S/6m7Vza78m7XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_014746_766146_17C02A8A 
X-CRM114-Status: GOOD (  15.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The correct terminology is serial NOR flash or SPI NOR.
s/SPI-NOR/SPI NOR and s/spi-nor/SPI NOR across the subsystem.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/Kconfig                  | 4 ++--
 drivers/mtd/spi-nor/controllers/Kconfig      | 4 ++--
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 2 +-
 drivers/mtd/spi-nor/controllers/hisi-sfc.c   | 2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c  | 2 +-
 drivers/mtd/spi-nor/core.c                   | 4 ++--
 include/linux/mtd/spi-nor.h                  | 8 ++++----
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 6e816eafb312..ffc4b380f2b1 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig MTD_SPI_NOR
-	tristate "SPI-NOR device support"
+	tristate "SPI NOR device support"
 	depends on MTD
 	depends on MTD && SPI_MASTER
 	select SPI_MEM
 	help
 	  This is the framework for the SPI NOR which can be used by the SPI
-	  device drivers and the SPI-NOR device driver.
+	  device drivers and the SPI NOR device driver.
 
 if MTD_SPI_NOR
 
diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
index 10b86660b821..d89a5ea9446a 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -21,11 +21,11 @@ config SPI_CADENCE_QUADSPI
 	  Flash as an MTD device.
 
 config SPI_HISI_SFC
-	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
+	tristate "Hisilicon FMC SPI NOR Flash Controller(SFC)"
 	depends on ARCH_HISI || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This enables support for HiSilicon FMC SPI-NOR flash controller.
+	  This enables support for HiSilicon FMC SPI NOR flash controller.
 
 config SPI_NXP_SPIFI
 	tristate "NXP SPI Flash Interface (SPIFI)"
diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index ae85e4c0e114..7225870e8b18 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -727,7 +727,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 
 	/*
 	 * TODO: Adjust clocks if fast read is supported and interpret
-	 * SPI-NOR flags to adjust controller settings.
+	 * SPI NOR flags to adjust controller settings.
 	 */
 	if (chip->nor.read_proto == SNOR_PROTO_1_1_1) {
 		if (chip->nor.read_dummy == 0)
diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 6c7a4118752e..95c502173cbd 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HiSilicon FMC SPI-NOR flash controller driver
+ * HiSilicon FMC SPI NOR flash controller driver
  *
  * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
  */
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 9a5b1a7c636a..5703e8313980 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * SPI-NOR driver for NXP SPI Flash Interface (SPIFI)
+ * SPI NOR driver for NXP SPI Flash Interface (SPIFI)
  *
  * Copyright (C) 2015 Joachim Eastwood <manabian@gmail.com>
  *
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 757ac0e21554..ed69a44e8964 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2469,7 +2469,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
 	nor->read_proto = read->proto;
 
 	/*
-	 * In the spi-nor framework, we don't need to make the difference
+	 * In the SPI NOR framework, we don't need to make the difference
 	 * between mode clock cycles and wait state clock cycles.
 	 * Indeed, the value of the mode clock cycles is used by a QSPI
 	 * flash memory to know whether it should enter or leave its 0-4-4
@@ -3126,7 +3126,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/*
 	 * Make sure the XSR_RDY flag is set before calling
 	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
-	 * with Atmel spi-nor
+	 * with Atmel SPI NOR.
 	 */
 	if (info->flags & SPI_NOR_XSR_RDY)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index bebff2729c18..60bac2c0ec45 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -302,7 +302,7 @@ struct spi_nor;
  * @read:		read data from the SPI NOR.
  * @write:		write data to the SPI NOR.
  * @erase:		erase a sector of the SPI NOR at the offset @offs; if
- *			not provided by the driver, spi-nor will send the erase
+ *			not provided by the driver, SPI NOR will send the erase
  *			opcode via write_reg().
  */
 struct spi_nor_controller_ops {
@@ -336,7 +336,7 @@ struct spi_nor_flash_parameter;
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		SPI NOR part JEDEC MFR ID and other info
- * @manufacturer:	spi-nor manufacturer
+ * @manufacturer:	SPI NOR manufacturer
  * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
@@ -344,12 +344,12 @@ struct spi_nor_flash_parameter;
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
  * @sst_write_second:	used by the SST write operation
- * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
+ * @flags:		flag options for the current SPI NOR (SNOR_F_*)
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
  * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
  * @controller_ops:	SPI NOR controller driver specific operations.
- * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
+ * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
  *                      The structure includes legacy flash parameters and
  *                      settings that can be overwritten by the spi_nor_fixups
  *                      hooks, or dynamically when parsing the SFDP tables.
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
