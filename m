Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD33CA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 17:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A4120679
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 17:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="miX4TYwM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="vvfryiQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A4120679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/MSdBoEHMn3yEzVUPcgmkHTdrICLXmuhFcmrOaQZ1w=; b=miX4TYwMonPk8k
	ji0RQUA+mHTw6IBmXbxUhiOn6jxAsVKXKLJBQ3dqriVq8VhFuaTkJEZ+9hxp1ZVh20/wPTvwrpntu
	oSoz8H82iyJR4kGickBUKBAexjoKvM55h02n6HwNrwAfnxeTrZnPGLLrjyiX3hJ+j3/UexMkZwX5y
	uH0LTXEBKXWEk+ToE0xh4dwA4fE8JIoByOCXbVga25/62wM2lFDCBDGkIIY+I/cj4cz+7MzTIgtzl
	PsH0WPLBOnRkYUsV/pxNxwpoLmKl+QrRyHbrw9Rv4Q1sjan+uilg0LBdM3XjmZZjHqBxLtnOCJV2n
	0IOkYTBdtmt9ebcLsoIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMxrV-0000f0-W9; Tue, 22 Oct 2019 17:22:25 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMxrT-0000e1-1P
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2019 17:22:24 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 5SN03XYzfH5hQxr3EYSTfDwK4ol1YFCTpBmyJySlYCroKJ52ZcQeIyTPc2yfcCWIFd4Q9srfsH
 +iQI5aCfGIQCYeEA44mloNOhH2CEGzNJ9Wj+7vvRraqMq8aPMwOtQ03/h9SLzveQXxBP8w2Lmw
 Z1uT4LKTI4NeBOl4AAIzluduuA5qM+otodl64na8g/RIQoiVkjqxlYI7pyqNNP1NwWBwXeC/s1
 G8Or+KDIxi0rXKy4CDlemigIZ4eelsLxioV+hxDiXiPFeEy5nvkGPN/Hl8XOVMtgKeoaq8CJi5
 P50=
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="53645335"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2019 10:22:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Oct 2019 10:22:21 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 22 Oct 2019 10:22:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC4tiTFIZwNqxJHyBxNZvnpMHK524ZpYWY+Z32vUIqnkr53bxGIuhTTmuRMbH4zy0bo01APtA4AjZMhDPMd7L7IGBPBZAb2BwWUoA+mDwvxtI1BqOCCt9ORGap+sdbu3KPQFmyGvLkDBWmtx3N7mxL24DHCYu9RVolhMDWjfezlCn57QVt5u/ia5lx24hfRm/MwfUxbOPBkkXn8ycENg9m82Jtx0gvWznCe4bpuqSat66NBQXdT+U5JlLjegM70ZZCy3CRrDAJEe9LBLPkmF2++oR29ZGW8N4TD/nJgWRFAYQJCQr7tQuf74r8ub4hG5k53w0vWVCMuULXzcSh4tgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drjIz3E1fKZBx/64uFcmFOIfPhS+SWOCXfO/qrozFyM=;
 b=Gqh9L0jkMSEFoWPD/ZNB0YEyqJx3RO0Z3Xwgv9dDupZ16ZzBjs7HKrWP0NbRuQyKPUlnT/u6ibqsiFNz2Wo5tGCydCdxvQXtDvtvRxZA6kqnsw+NfR9FKQEM4uiUavQ4KajCNQ5BjcT6BTXJVGm78/xf9VWKcsy7meAI18HpgZJE4atBfVmRGpoL00+oDtBFh5s83lFY71spGjKofSs7Xi8z8GlzDq6aAa/4cG8uOe/VAgmVyxxFPnehoK4gKmLqQg5E0GF0JX8tV196QYcJztlbD9F37+bKwf1i8aNJgSTS1EZXw+j4+o+B5tfJmmjCVpKxU4WR37UAoFZ3oV23Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drjIz3E1fKZBx/64uFcmFOIfPhS+SWOCXfO/qrozFyM=;
 b=vvfryiQZC5gEFoHuMkNu7SzXYMKQ7VCsnXcrEpvR5AWWNC2dVAhWWJpFfJ7U2EeAlosF3S/L+A1WeDG6gjdJ6AlqEktF34aXijBTDRkwUCWLIm0mjp5hDYkTpxOHL/3HgZDG5HuBBxBNY5ZTTjMkyTVtYQq0kmsOw0q2VZThRRU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3855.namprd11.prod.outlook.com (20.178.253.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 17:22:18 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 17:22:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sagar.kadam@sifive.com>, <vigneshr@ti.com>
Subject: [PATCH v10 1/2] mtd: spi-nor: Add support for is25wp256
Thread-Topic: [PATCH v10 1/2] mtd: spi-nor: Add support for is25wp256
Thread-Index: AQHViP1BNjlSY/AumkmGAXgnFs7kjQ==
Date: Tue, 22 Oct 2019 17:22:18 +0000
Message-ID: <20191022172210.19865-1-tudor.ambarus@microchip.com>
References: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
In-Reply-To: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:802:2::40) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.183.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c03c0322-9dce-438b-ae86-08d757146396
x-ms-traffictypediagnostic: MN2PR11MB3855:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3855F29304F1BB05642943F7F0680@MN2PR11MB3855.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(71200400001)(71190400001)(6512007)(5660300002)(6436002)(446003)(102836004)(486006)(476003)(2616005)(186003)(256004)(66066001)(14444005)(99286004)(1076003)(86362001)(6486002)(386003)(76176011)(6506007)(52116002)(110136005)(4326008)(11346002)(2906002)(26005)(14454004)(7736002)(6116002)(54906003)(305945005)(66446008)(66476007)(66556008)(64756008)(66946007)(107886003)(3846002)(36756003)(25786009)(478600001)(50226002)(81156014)(81166006)(8676002)(8936002)(316002)(2501003)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3855;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ki9T2YhlccM5OKQlkOtmY5C7hWUp2WJNZ7M2b7Llkl3y++efC3Di37m1kO+u2o82krXoXjbA6chm0Ts1vqsB4Z/gdi29TRe86B+vfgeOxZcRDJLHDfxCvUGWFX0YP/N9n2RL5H/CyeqFMTOuf6iUW5E7/dF7j+MC5T2LyZKpqKp/o73uryYVZ7k/rfrn424Q9O60X9ENUw2zoEA9N9ddyfXG02LzsIfcRRTy11La+BJydIssQ6v63rW6WlS2QsaWOZrzdhOHYZyDC3sjEql5h+JcWfE/JYuyt3iOjtVFIvsq1x86QF+jIG4BW6dAdd4doDebjyS/YPrpNTypuuodQcWZX6LQmygYsk4RP8WqBOgcdKn2/rp61f2fKN1BdNU0dXDJ9ReLWZ3YLJKP8MUIDA9BtSGsA9SiJVmrbD9WDd29sx763RVa/fvyY4nLS73
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c03c0322-9dce-438b-ae86-08d757146396
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:22:18.0884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOczIfUzT0XAW/U++4fWj5HuZESgCyUi/YGzduq3jhjuXnGhOsZst1U/Vw8ateNGGzox3vWJ2mB4TesSUjnJrmt7KrdXIwxcCMzhenRCG4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_102223_117632_BC05D98B 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Update the spi_nor_id table for is25wp256 (32MB) device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Use the post bfpt fixup hook for the is25wp256 device, as done for
the is25lp256 device to overwrite the wrong address width advertised
by BFPT.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
[tudor.ambarus@microchip.com: rebase, split and adapt for v5.4-rc4]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Sagar, I set the fixups hook in this patch, to avoid adding support for a flash that doesn't work from day one.

 drivers/mtd/spi-nor/spi-nor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7acf4a93b592..3fc1eb20dca5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2267,6 +2267,10 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_4B_OPCODES)
+		       .fixups = &is25lp256_fixups },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
