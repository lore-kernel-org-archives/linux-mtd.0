Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810EFC2BAEE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:02:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346902074D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:02:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAUPAMzL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mhuWwp5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346902074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZRrftGfZZokjczF1A7jLRdb4j61+RvCXRfNscGki/8=; b=fAUPAMzLhh8NeM
	glUH+Pjl3iI/cRo9QwJQsFARCYvgD2TMvKxbMfh2j2GKCx23P7/fMWxtELnMu+RVOIRtArFNEcJE4
	FSrJdjOrz0/8ToxwijLEjZg/OZN+EEPQQEhywsp5D+B0UfrjIYT+51qZqDEPR1FdugWFb04N/Dq/1
	epuezpfX8TW9z16h9SDGMxDDEh20nW50q01kCI7uarjLRkMqec0RVVcYSJzSAwZD3wkM3QZLHYDee
	pe1HbpFXRELRxm1RBrfwXcH87XHd8YTq6Cocr6PHAPH7BOE4XBjQ/X68q6oxfgrv38T2gxjKGAwjW
	QpQOjeJ5tIvjvKFcFsDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGcdR-0005jU-NV; Tue, 24 Mar 2020 06:01:57 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGcd8-0005KT-7G
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 06:01:39 +0000
IronPort-SDR: ljihu9PxI9wuFZaUMUsMxvTKdFPDkwX+nCwHIIKrPGrFWHDFo2fc0MK3rGXVQAEhXGuAnXaFFv
 DplXLBvS4Yscr6ujLYUhGjHnuWvzXSkY5U0/fPf79S4g7sqgv1hNNeBdd7eOlQpa8VhTvO1qSP
 bvpHiyIOaT5njktpGmRiFgypwlBF/VHmAqlG8g3sEI1bMpQUhhuCi5bU91sv7jfYxomBcSGk5s
 A4Pmfj4bl+zUwfYQGM24wKO4dl4qj1PPc3w2j3zmLwxmeL03QME4GwKrhk9AOjmH35AeuVYHKc
 M80=
X-IronPort-AV: E=Sophos;i="5.72,299,1580799600"; d="scan'208";a="73217564"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 23:01:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 23:01:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 23:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYb8ZcpT7gB3eQHD8ayGyWPQutUh8Ez1pw2xDWqJYIfT5P94x9GemOIDK1FsNUCIuC5Ic12+sEIop0P3aEovgOhkAHKvYJhj5TNdiWyHk68nkaXGhUM3HaHjmy0+eJiTM2dGaoHx/eOXFRt4paC8xazIPUoGZzkgTeLCntf8unAgY7XxdJBX4JdsWCk2g4ofdxhKXV5Mi+MNGOENRr7z6CcvH5iFFWC8gbyjRxM05lnST3TxMJ01T1M1Sy8g8OM7hC7hhgKd3ERXIEucXTaT+wuvOh0e6O0LH8AV9p5OR6heGhea/LHbQuZmaUNpcb9liyRA4eFArAfT/nYfWllBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=637C6BIZsGCX+1bzPDSmV4dAmf7p+4usskJryQKfk0Y=;
 b=byKgi1MmlAhalhumH/wePJifjWyKkLz3DgbrPBNdoOg7qgXntKC/j0ONSAaKiLtXe2AZRRlvyYBgEwJfWFe3D+K9NQUw1YiU8ozzHg0Oj3FWF6P+p6zt77Jmro+yUpM0+a+17EBSgJWWQtZOeWe8zmpv7dxEi+IjcSXNcPQ3fxRfaI6YhUENErJLbcszTiSSs97opSb/CZ9jdVqLVQo4Hg1Kr2xSrrzi/3Kcz/wFGE5TnpcNW8COmZh1SMx1T2oG9xKQZPyg+UDR40TMTnaua8xaFVxxIbe83f5iBdd64RlItAsOm1nM3XSk1/eF2crBLb8yGCZtHRBbDQ1kIOslYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=637C6BIZsGCX+1bzPDSmV4dAmf7p+4usskJryQKfk0Y=;
 b=mhuWwp5jUYOj+vu/+vSUd2uhcfJANrZpwtcggcm9TBuSkfENw3PwP48tgSJQapJzhfqJQQwPixJhmvUQjLN2bW/IhFV39mSftBIJg/0Iox3FrTUIJ/uWPVD87ph/BlnkFvpqewZ+iLrWmp5b5zZgdBdyCuvoJFvKGKT+E2+sgXU=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 06:01:31 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 06:01:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v4 4/4] mtd: spi-nor: Enable locking for n25q512ax3/n25q512a
Thread-Topic: [PATCH v4 4/4] mtd: spi-nor: Enable locking for
 n25q512ax3/n25q512a
Thread-Index: AQHWAaGqh8NFj6s2eECgk/wjHXaRhQ==
Date: Tue, 24 Mar 2020 06:01:30 +0000
Message-ID: <20200324060123.1533917-5-tudor.ambarus@microchip.com>
References: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c035f821-43c7-4fdc-32bd-08d7cfb8ccae
x-ms-traffictypediagnostic: BY5PR11MB4184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41843072AF78F1BF2E977415F0F10@BY5PR11MB4184.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(136003)(346002)(366004)(396003)(6512007)(8936002)(86362001)(2906002)(71200400001)(316002)(478600001)(54906003)(110136005)(81166006)(186003)(26005)(2616005)(76116006)(91956017)(6506007)(66476007)(64756008)(66446008)(66556008)(36756003)(6486002)(5660300002)(1076003)(8676002)(81156014)(4326008)(107886003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4184;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2m+mfv+HqI79yNNus/167lXllxyhYfgGv7eKwtyagqFI4ssKfuaAdU95geM9bSsDzDXuPg80OlMLfrfaXE55A4somnGmuWfABj7WYg7MhspsN0Px4uKvn+GQ0LviRcUuMfLVAoZs1RC2GJK4hiPr+7yVRDhTV5VQWvL2rzqqSf46gBWSugwSTzGo8NJuwIDAYOg9+pskIoI1rS9GWS1GAccNGG7aUlMgAzKnVKIUcF395KRYOyvcETaDYeDwwtJdE11sn8HrpSUvwLNvzZdil2g3xJSbUFWJdhxXEeHZx9ykNAXG15j1jlb2DzISNMN2rtzFojAdr3d2hCgKbZ7XQppvUq9WbsI7mUHiHjsqhIXBMm+OI76nhq6gkKb4LUJ/wBqcxJGGvjjS7vv8P3ZJkJrlrXzyYg9xC8mMR8kXcOsFQNyylfUBXXbu6yeRDrro
x-ms-exchange-antispam-messagedata: FNxzExRm/4Gwt+HFMnQVyoVHJEUneZdp8IrdTqlkXUnlmA3m1i8w1RL9b1Hfx5rp6t0s5rGqyvjd8vqjMo44lxNnS4fqWfaAi9UpvBETZc8EWDyk4ZZhFiaB8T2TA/qbmIC2H701MmKxYNZ/GIr91A==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c035f821-43c7-4fdc-32bd-08d7cfb8ccae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 06:01:30.9485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yAovL0zPqccFK4rnD9SVa0VFAR7yoLpv0CTI507BvHDuiJoCC1V9G4LYZrDYKA6l9Rb1LvAagTEeONmGI8bxZRz8eBoODbQWje+bJBogerg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_230138_288705_9554D607 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

From: Jungseung Lee <js07.lee@samsung.com>

Some Micron models are known to have lock/unlock support,
and that also support 4bit block protection (BP0-3).

This patch support lock/unlock feature on the flashes.
Tested on n25q512ax3. The other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3874a62d8b47..6c034b9718e2 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -47,12 +47,16 @@ static const struct flash_info st_parts[] = {
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
