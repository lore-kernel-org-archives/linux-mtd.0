Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339FFC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 09:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E4920842
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 09:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rxYCeBFj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="jjI2P74B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E4920842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Message-ID:
	Date:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YjJ/jk9/qCG0SlNPbMNfN6lDKous5gSPDmogi9MQUUo=; b=rxYCeBFjE9OC76
	9BPmNFkJ0bPAEqczdQsEriYafFj6jWSpNaoksv4tic/7Y92vmpwNp0FNs2jNyqbMFwfMqMyUs3s0c
	9s0eoKJ8bRWsKhgIieKJ7r15AzI025MxI/E6WkBR2JkWPHFoIrHtnDt4Pde8UUm7aUtFC3jzFzOLh
	3ugZd9hBHu/I7GYdOjSK7xGZ/6d4OUxhdKlBiQVvNA0arJXRBVDhgomWVrKO9ho7L+kkt5h2XSjvD
	zxzaDA8wu90EU+zVWnZz0O2p7RucdCr7BRERIYKYCIhHkk7+WxNfQAU1SPfYygAu7UuH0gvFeTrME
	3cs7cfiSNubF787O62Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyvxq-0006pu-Ui; Wed, 27 Feb 2019 09:57:22 +0000
Received: from mail-eopbgr30131.outbound.protection.outlook.com
 ([40.107.3.131] helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyvxn-0006kw-B7
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 09:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJDaMn6jlmACW8jeFGyrHCUnSvt72qXGpQJB7inORSs=;
 b=jjI2P74B2CReqH5pszwDAVIW2gPJGZfbjbPoBOv0gP5ivKmkwhdEYwkvkDrU2EuEOZfdINitqHUFFHbZ2ODNWXlOCp5BP1AYCS5idCNYsV6yE0tB2OESURPAIPLPMf+qViSWZpfnKHuoBQI28FGiHUlLl8lavW6t5G+2dIohm9E=
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com (20.177.202.154) by
 VI1PR07MB5694.eurprd07.prod.outlook.com (20.178.120.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.13; Wed, 27 Feb 2019 09:57:15 +0000
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::8899:2ceb:9508:1c00]) by VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::8899:2ceb:9508:1c00%5]) with mapi id 15.20.1665.012; Wed, 27 Feb 2019
 09:57:15 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] spi-nor: intel-spi: Avoid crossing 4K address boundary on
 read/write
Thread-Topic: [PATCH v2] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHUzoLR83xWyQgGN0a7EHqHdsNcMQ==
Date: Wed, 27 Feb 2019 09:57:15 +0000
Message-ID: <20190227095617.20968-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190226112334.401-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.181]
x-mailer: git-send-email 2.19.1
x-clientproxiedby: HE1P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::15)
 To VI1PR07MB5902.eurprd07.prod.outlook.com
 (2603:10a6:803:9a::26)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8736bb7-e8dd-452e-a9df-08d69c99f3a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR07MB5694; 
x-ms-traffictypediagnostic: VI1PR07MB5694:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; VI1PR07MB5694;
 23:dqrqsS9KuQEHns773i9ZIe3xDF3tTh/CaTtpaRW?=
 =?iso-8859-1?Q?U5nXR0qknvzx6pkmzw2TCLMEdwS0HB/zU0r8J2pwP+Rhe2gADk3D7DNyRU?=
 =?iso-8859-1?Q?mnP3LafZjUQVvO2m0FrBiZzZaNed7q0Pp0l+V+Ug/IXXdB1f1Q6lJUzvvX?=
 =?iso-8859-1?Q?b+8VrReoITpf1TBYJEOJdZGGy8mQvhwwzKASMI9K6KMbzVuKejQgX3i6eW?=
 =?iso-8859-1?Q?ctiPK3E0FsDYppVl5hSz4+ZxMmugXSH4hQu+LPcLoJc/ea1w5v/ezDumeh?=
 =?iso-8859-1?Q?VgWy5X8Lfj+zyuu0PC07KFO2yvKyWpxHgj0J1jVKr+JAsvPncUJWfKp8S/?=
 =?iso-8859-1?Q?i2kFfrG+wQ/XzRJKCu1wt3q+Yys1ugZbEm3Gmvo4lutmfKkbDZSZmXDhp+?=
 =?iso-8859-1?Q?BtcI04Qbf73kdDxGpdO4oy4CPy7EIHBdOYU8GpxM2KfLSiD2ZFmqIY5jIp?=
 =?iso-8859-1?Q?SBkqFYmpHnjI2Lb6cjUuSYQivqOnRYsFVrh0scQtZjQ1NAc9oIy/9xUWxf?=
 =?iso-8859-1?Q?ooZgY6qTg5QPuC1JHbsVeTiLBqDdYeVO4ki0ygVP8AAnjGIyDEMCq5TtR0?=
 =?iso-8859-1?Q?YkQHimuCGruVQdAuoTzmfmHIuvEZhGzQAPPf6vrJz9imLI110ZOUbN0YpI?=
 =?iso-8859-1?Q?5xubBrzllBi92OzNuO+bk2umJfE4JqDyHlP/102YDoio3fi2zX9iMTBCv3?=
 =?iso-8859-1?Q?sYJQZ4Xh34OSyjpnLpvV6vYsILeUNzIXyjhfy3XcCDt7OC/cWa5IE/Zek0?=
 =?iso-8859-1?Q?lSOGjvyKwQm0Y+HjJ/z1NWxLnQJzKOC0noXN6ap2LoIWQN4AcESYFAAvWS?=
 =?iso-8859-1?Q?hC6a3OieZ0XRU/SxQm4tMTDDGFaz0QLxTZdmxjcJ32m+EaHzHreyLLDD0F?=
 =?iso-8859-1?Q?pbhxOMWut8gu0p2wOin6eE5ZaWgEY10iZSx+6PqOdqZzWtzRz4gw98oi5u?=
 =?iso-8859-1?Q?GXaCZ2Z7yxEir9PfO6XdvELXNQ/7ezXNJy9Xp5PTCI2XWyLwaanXtrFoOe?=
 =?iso-8859-1?Q?+dAEj3Eh8ogSMMBDZNl/NCa2YSIZ5WUwQtbg9XVCMuG2xdzmusRp8RS7pT?=
 =?iso-8859-1?Q?i+Jny4a8yf10DDaHCIYa0tCiHUHnbVcZJIYoPfTf+7tkJ3T1+j8b8AO4vf?=
 =?iso-8859-1?Q?rGk2/wFOP066qsHFpsT4qaZsPmT9a6j2iRDDMfe5/z65uTvlhdzxVJxo7u?=
 =?iso-8859-1?Q?K7Z65Q467R30C7xMSkyoN4kefw463/7vTnPde8T3iDYr22Pd8gQYxbv3mK?=
 =?iso-8859-1?Q?QBY6PeYZD9rlqNrF9fXeH3CG8LJGMLETUgO7/z2ul/rvaPcreT1SRIfx3/?=
 =?iso-8859-1?Q?uHlDnB5zwCjFK8DlecPlWIHLzVE86nigrvxU4qI3vcl2Qg69XWYAUkA6O/?=
 =?iso-8859-1?Q?Ak050lIE=3D?=
x-microsoft-antispam-prvs: <VI1PR07MB569405DF5D71D4CBEDBC6F3788740@VI1PR07MB5694.eurprd07.prod.outlook.com>
x-forefront-prvs: 0961DF5286
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(346002)(136003)(396003)(376002)(54534003)(199004)(189003)(5640700003)(8936002)(186003)(6436002)(316002)(52116002)(81166006)(6486002)(8676002)(2501003)(68736007)(54906003)(66066001)(476003)(486006)(25786009)(11346002)(2616005)(99286004)(4326008)(5660300002)(81156014)(6116002)(3846002)(102836004)(386003)(53936002)(14444005)(6346003)(7416002)(105586002)(2351001)(106356001)(71190400001)(71200400001)(6916009)(6506007)(7736002)(2906002)(36756003)(6512007)(50226002)(1076003)(97736004)(14454004)(256004)(478600001)(305945005)(26005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB5694;
 H:VI1PR07MB5902.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r+x5pc4lybc/A8R3gquwARWgxU4vA1QIKcjBkLpoOm80XXQgvumpc9f7Da+mCkwk2hTwiDlDqZ+a45+6AJ1rvD49TDmfX6keExYJ7UFpaw4qehG51uDjaR/lp/A9lbS9d25RAXPJp2bMGw97iJGYb4T/OUsFZpswXcB5eVtmuxqlKqgNqdjoeOLmbmOwQEvQrIUM7aU0b4In7Wgkc094clJSzQ3Q1eRUtxRCKTokqEyVEHdzsurq9p1rz071ZH60vfcA7G28KebqWZhO8suGbV57l8CeiKJ/hhL4R307UZXxinxk+fNIDdd0xMbW0aNKGdrISMaZmBfkWcWtBreVn2DwtBAFTJDqwBl5nuo2c0vmIiN5lVJ6bn3eYYUYxG808exCEHZK2M0/mw1QqWdeJNk7vTi6AdZoICY2fKYmhKg=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8736bb7-e8dd-452e-a9df-08d69c99f3a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2019 09:57:15.4245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_015719_428158_98D0D360 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Porte, Romain \(Nokia - FR/Paris-Saclay\)" <romain.porte@nokia.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, "Sverdlin,
 Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>, "Fabreges,
 Pascal \(Nokia - FR/Paris-Saclay\)" <pascal.fabreges@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It was observed that reads crossing 4K address boundary are failing.

This limitation is mentioned in Intel documents:

Intel(R) 9 Series Chipset Family Platform Controller Hub (PCH) Datasheet:

"5.26.3 Flash Access
Program Register Access:
* Program Register Accesses are not allowed to cross a 4 KB boundary..."

Enhanced Serial Peripheral Interface (eSPI)
Interface Base Specification (for Client and Server Platforms):

"5.1.4 Address
For other memory transactions, the address may start or end at any byte
boundary. However, the address and payload length combination must not
cross the naturally aligned address boundary of the corresponding Maximum
Payload Size. It must not cross a 4 KB address boundary."

Avoid this by splitting an operation crossing the boundary into two
operations.

Cc: stable@vger.kernel.org
Reported-by: Romain Porte <romain.porte@nokia.com>
Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
Changelog:
v2:	More macros! As Mika suggested.

 drivers/mtd/spi-nor/intel-spi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index af0a220..8c279c4 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 	while (len > 0) {
 		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
 
+		/* Read cannot cross 4K boundary */
+		blocksize = min(from + block_size, round_up(from + 1, SZ_4K)) -
+			    from;
+
 		writel(from, ispi->base + FADDR);
 
 		val = readl(ispi->base + HSFSTS_CTL);
@@ -685,6 +689,9 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 	while (len > 0) {
 		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
 
+		/* Write cannot cross 4K boundary */
+		blocksize = min(to + block_size, round_up(to + 1, SZ_4K)) - to;
+
 		writel(to, ispi->base + FADDR);
 
 		val = readl(ispi->base + HSFSTS_CTL);
-- 
2.4.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
