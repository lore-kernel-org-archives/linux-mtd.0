Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EE6C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 09:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4474920714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 09:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWJeE0e3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Krp2Gwc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4474920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+i292KGndOAGQz55LCu75SldfTGuDNn7XyihesRtSP0=; b=dWJeE0e3Jww57y
	TVfiQB5XcEPA+e2TmHy4N7fpCgc/mpSh49fqHOgjK6Y6M2fD3WddnEZYtpUyYY9sm3L6bYIJGbk9g
	mtatfMhdbNGiHJSLpJmtasV7DMHhXhoGQ23C0H+jo9HXcWGhaQHQukFpskKV7KLDyhFsL4V41K4dT
	Du0A1CLtE43iiyITJXgylZIbMZcqQjKv/d7Q+DLmFMoEXS+b0TdslwLDxkZK0DeK9kVQyF8tdHJ/4
	y25FgIMjY7pjrF69BfzMHzkExDvr7X1U70m/WXbOqgOPe0GDKdGZIECbdIb2d7D0L2w8StHlasG9k
	CdONTO8dTD6XMpmTjcvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH2ZU-0003IL-4v; Wed, 25 Mar 2020 09:43:36 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH2ZQ-0003Hv-Ax
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 09:43:35 +0000
IronPort-SDR: T2jF2sNmC6EeB/wXbugA2q7sXlzKhKiTR3vzqi/CJ2GHpLbMboQh3ym0GeL0r9NY2O+ruUSKwJ
 Clhuxteh2Vq04axrAUSj57rlvP0bM6B15ebZgAIf5jEGONjZy1YOuUHQj85rx3XbRgu35Rf50C
 Ks2qlPkFRiCPOuJeIE+Qupvg9akC7vWkEdINVc3AHlF0KGxny4pXk6IvaJfzN9B2WaaqCquLrw
 o5FQNopz7hvGnhC26R1goPcOcUG6MiSxMS/bSQ3wIgQ0srsQW1MHIuIutCqs6wc7xkk2MHNPnL
 3Ps=
X-IronPort-AV: E=Sophos;i="5.72,303,1580799600"; d="scan'208";a="70115389"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 02:43:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 02:43:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 25 Mar 2020 02:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFIDT3g5Pdp6gPcGmQN90pTBjR7Picz7afLTVSXyCN3GhL2b/hpFwOfHFdbTmgL/6ST0Wefy0XmrS+vSH6L9B0M1H/4s+4eLitQb4AguJNScoLRwxfiwHME6wCMkNn2T5fG/ProHCFSmwFuk3krCwCfcWUszR5UGGPiDBp4isKJLOjEaBydsTYHFXFJk4MgcMUI7HgB4exytYMNbyNNYsyP9dmPoY9P4wTJ1v85TIpINhnsApgPirmyRQWQmX4zPUIOFWArghjUpHV2nhSF8BrC3sB3GNYDhR4UDfSHZMP5lI49jlFI3S/aIzL95s3xwjMql9sSk8crw2VofFUr7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td/tIy/My8maptDWFdBxi6OZi5dQqO2TxIEUTMZcGdk=;
 b=fzWFmhktU0SgtTvueCxaluVRtZtXWoFjGUaBzmsjiP7uKnQPKOLoQKwlc5DmnYJ+YZaUnpYs9SfbQn8/2nouzTr2jJJvPam5JUTMen/auHXaxKReLO7mFQf58bkEGtE1I0NUEVGY8wLfKDK+VpArdxOqpS+FJFJxr1aisruHy7qRfkUDm96qGoNKvJljHHFhgcChIZW8slr/0zyVsT0QhOs/tSr+W9LEfVvgaVbLyIFXJOFA3/K6UCFNVU6Y7zgCFWhuCMWbvwIoKSfm3LYv/8C2xi4e9qKs6T12hML2b6qyA+VhCAnITjDZwEg6TYkwu/AmTOCqS/SAE1Fikf55VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td/tIy/My8maptDWFdBxi6OZi5dQqO2TxIEUTMZcGdk=;
 b=Krp2Gwc64hJxfnXmtqHfSAwo/MLgWCPFueE2DcdCm5syDYzWI9c/pshwytN8GVSKMg1+y2mL+ExrftKzWQkkQ93W1E/bQ8UnLf8Fn/juVBxZSNnkBNbaX9dHg8MFkxCgpj8e7fzeObu6VZpTVxy5KU9Zq7TF3OlsLEOLMBpNlV0=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Wed, 25 Mar
 2020 09:43:28 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 09:43:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
Subject: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related subsystems
Thread-Topic: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related
 subsystems
Thread-Index: AQHWAonVXc8Ih56XF0O/r9YkJEY3pg==
Date: Wed, 25 Mar 2020 09:43:27 +0000
Message-ID: <20200325094319.35841-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d624a052-038f-4b68-b3e0-08d7d0a0f87f
x-ms-traffictypediagnostic: BY5PR11MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB43708916FD11B3AC8EB616D9F0CE0@BY5PR11MB4370.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(366004)(1076003)(71200400001)(54906003)(26005)(110136005)(86362001)(6486002)(316002)(6512007)(4326008)(66476007)(91956017)(66946007)(64756008)(36756003)(478600001)(76116006)(66556008)(66446008)(8936002)(8676002)(6506007)(5660300002)(107886003)(2906002)(81156014)(81166006)(186003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4370;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hK8VDnUbogMT02GDmh9Eu1Fhk1/79movOpgLVdYTFSC5r8JYgFQrMLivRAMsXr2s6o28lHKqMUJqpRcn7VKxepiQlUboOt94fEL53Gbe0wz+N/dEYxU4HQ/Rqkx0FO1so/PhwOfdMCgGHHcJB8KXOe8Ir2b3xs6Z2Yu1yxTt2qXTUTgk7tZlE20Z27mk9LvPh/hU04QeP6hwxEZfaTzmxGlHBbTmaxGDK0QLtX0avYRmhR/lddQ7rmGxOPt+QcxuWJjOD2BbjPeZS2666PMBAe1rKW5BbESJRieWFGlYTgSkmPaM2f4YNdOtNNsyF9zpqY+KOVe6vimFC9w7e9hjL0ktjNrXZHtyOJ6LyPb8bSH3kO+Obffx/+bT2nonuFNDeP6XYKYZBPJgNq25i2Urot5vDCnLYIbQXlxZKNyiiazee/hht8jtat9MZgHSRBhospZzndiyuIaDP7pEUZYmTxGoUlTh+DNTmYCTY/ff7EXafRHiJgZEvNoVWalXmb03CeJsXWCSqX7/W2Ve60sJgw==
x-ms-exchange-antispam-messagedata: nz+qSUoYvnV1JqWji4eBgefogX8A6ttClAiSlpmUMjGyvC4w/zTd0riVjHC8cVs+zyLVHQVZtPddZjbQcDud7hGAE/L16ilGulWbT/uoCGO5Dv3OgXmuobbKs6zf0z7sXCJWurdDklmK/+h9QprHwQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d624a052-038f-4b68-b3e0-08d7d0a0f87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 09:43:27.5689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XkNKgqkNvS8Q706LDOIoLD6WXc1ODmVGbcyELybbpd5FNUFjNwP2jVnThjZCb/8i/wysk8vPyOM3KJmv/zOX+z5uyTjW+9kZ8kdfr6B18Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_024332_478033_3F9DA003 
X-CRM114-Status: UNSURE (   7.39  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The #mtd channel (on OFTC servers) is being used to discuss MTD related
topics. Add it for better visibility to the HYPERBUS, NAND and SPI NOR
entries.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5143e248170..8124d8faa8f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7769,6 +7769,7 @@ F:	Documentation/ABI/testing/debugfs-hyperv
 
 HYPERBUS SUPPORT
 M:	Vignesh Raghavendra <vigneshr@ti.com>
+C:	irc://irc.oftc.net/mtd
 S:	Supported
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
@@ -11451,6 +11452,7 @@ M:	Miquel Raynal <miquel.raynal@bootlin.com>
 R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
+C:	irc://irc.oftc.net/mtd
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
 S:	Maintained
@@ -15689,6 +15691,7 @@ SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
+C:	irc://irc.oftc.net/mtd
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
 S:	Maintained
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
