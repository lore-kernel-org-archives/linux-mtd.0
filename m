Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7A9C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 11:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4E1206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 11:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oycwrauy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="ijZbevGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4E1206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0Ae1uQMZJp1SrVDMuS+dDgxeEeKt2Wv/aLV/0t+5/E=; b=Oycwrauy1hCkRf
	yjrcBaa/DrQksjY7ovUl2GgsN9TpzUyHZXMwmSqAxB5/ekyMLUluGD+xFuRpBVVyoGidVA3r7dKLj
	N7gTXuAclNoax5YSV2nhP9MF8xPdSN0DiVswkiHNOCtYNTz+EZCoNQf1KC2b7Ww5T0FACVektcaS+
	v5FvzPJIyN+EqE1Tv6PrK/n6KNSWXF2mGYhRXgtQUoGCNClJtdauW3EBOyAyckFjfrnJAYGQZ8G6k
	k+SyQy9J7bd79Rc0+PP8OL9uB9erVZzU7RO+ax/DgUAcW/4c2zRuPl/NhdpQkb3K365bUX4UH+phc
	qHIhDugLnZXI0af5QSBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaqD-0004i4-0F; Tue, 26 Feb 2019 11:24:05 +0000
Received: from mail-eopbgr00131.outbound.protection.outlook.com
 ([40.107.0.131] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaq6-0004bM-VS
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 11:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWTQJkHleLdow8noY8K/FsrOaX1Yg6ktQMzw06Nmuak=;
 b=ijZbevGtf3NnSjKF2IUJQ4yzknempZNsWTVtTYbWft62sWhbeqr3XmKTkGGofXYorklRkXw9cEFCImDrimU7FhyVvaqr5iHcvmh2VakkZNM4uWTpX44YUgEGpYeG5lEVuDI/41NfNj33uphIuD8FciSCjSEE7GO5e/gxB4ylQ3c=
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com (20.177.202.154) by
 VI1PR07MB5136.eurprd07.prod.outlook.com (20.178.9.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.14; Tue, 26 Feb 2019 11:23:49 +0000
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::8899:2ceb:9508:1c00]) by VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::8899:2ceb:9508:1c00%5]) with mapi id 15.20.1665.012; Tue, 26 Feb 2019
 11:23:49 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] spi-nor: intel-spi: Avoid crossing 4K address boundary on
 read/write
Thread-Topic: [PATCH] spi-nor: intel-spi: Avoid crossing 4K address boundary
 on read/write
Thread-Index: AQHUzcW+bDXgxFVkf0awRsRkik1DPA==
Date: Tue, 26 Feb 2019 11:23:49 +0000
Message-ID: <20190226112334.401-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.181]
x-mailer: git-send-email 2.19.1
x-clientproxiedby: HE1PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::28) To VI1PR07MB5902.eurprd07.prod.outlook.com
 (2603:10a6:803:9a::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5380a806-1304-45c8-faaa-08d69bdce11d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR07MB5136; 
x-ms-traffictypediagnostic: VI1PR07MB5136:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; VI1PR07MB5136;
 23:yPhmf32px/sO+A7xaguXqs8QdEof3wK38nfH9hV?=
 =?iso-8859-1?Q?VcXwH1/JKRtzbCxoOlzOe3Zx5QU59sgzxQBDESRzfsa8Si0rM1X3p7eAut?=
 =?iso-8859-1?Q?M9rtHqaGPQJn69hSnrPIMU7e1SxeNx03hY0u25VZ2XopyyI4JXlxXUi3wn?=
 =?iso-8859-1?Q?5CfGrWB3uY9IcPDLjhqMbNH0LzCj+g75b3TeXm8U5BTL3gcHstX+/5F5r3?=
 =?iso-8859-1?Q?88+6UjNxZhkUavB0tv/MzwWNVzZRU03f6wj5gAoroQp4r8X4kFuJlwzDoL?=
 =?iso-8859-1?Q?eBknWB0UWYq0/vorw7oXYC09ShBWbSnQpTFmnum0ghPZ4yUGkAaUOJeBdr?=
 =?iso-8859-1?Q?qJCA51+iLF9NZZNpT+wLxtty3I7Rifg8TVHz84amZ84iWQKvhRT1vcxaST?=
 =?iso-8859-1?Q?Ayo5wjrwdcS04hBrnt3gQRGPL5nMTLXCf6bkIzIUZAcQNhx4zi5yNLWEbZ?=
 =?iso-8859-1?Q?gSA1/eHOi4YDa/bEiSxCG39MHhMp6HHz5L1otS4y+Nozu1wYUB9hdBeqyP?=
 =?iso-8859-1?Q?0jcCzb5ZqRltCVwoCVmu3shCsY0YFssjveFsfRPfmzQlAJrtoB2QYTwp9z?=
 =?iso-8859-1?Q?873kuWNvbk0MPZIg+aBcZaR7hETF7VtOC3F+GEE3p4bgmr98YQgOBsqzD5?=
 =?iso-8859-1?Q?1C7VhMkwc40cXPQf32v5JGTqtYfsiNftmC2VdTEAzKBc20/wE/wvyXmPqI?=
 =?iso-8859-1?Q?LL5ovPj2MBxZOUlXCcYxIiEusJAneVZU6J9ITeTcajALELZ0eBU5Fjh/e9?=
 =?iso-8859-1?Q?X2ijJrhPbIaIgyaOcUZKy69Qn/M7WtxOpHsik+LEaPVBd3pRYFmad2XplS?=
 =?iso-8859-1?Q?bKUdGZA9bfZfh/01xu5DRw6xaX9/jD7J4rBM03Yivd7WLjRYhVRP8jqdy8?=
 =?iso-8859-1?Q?IyGbT5ht57D/8CkljJ/KYyCpaG8RzHdp8km6AeBwFsfZa31HABZPH7ntVy?=
 =?iso-8859-1?Q?TiVPOATFr+VVaPWog5+b6kz0kMGBSICBmW+QWQosQ6c1KYeQQU6cxtVEdb?=
 =?iso-8859-1?Q?+n8sbmPj8Bq4DaPU5lo/D4gzjvexzSJOPB1EHfMGID9MqbX9OaWCUeuUfk?=
 =?iso-8859-1?Q?dsQ0ooqhhhAky8vYsF/IsN8GCuPAsIg7+jzlOkh5OGa+tp5QiMrD1ItGju?=
 =?iso-8859-1?Q?AtAD/ahX7UPDBQ/JG9EppwX9vQX0DgSg4Jqfc0OhUU6hsfRI0q5pKs0Z8s?=
 =?iso-8859-1?Q?HyuSdLwFTdjP4zrTOeLo/9ZboL+8QaCP0Naf5jgpdqlLjfuHN2R9gae9UY?=
 =?iso-8859-1?Q?+7NuXEFgCw/6kb4sar5Uyy2hrwTgIaLn2M7Nfbdu2wZHagnpQoyAYJcdqd?=
 =?iso-8859-1?Q?wM=3D?=
x-microsoft-antispam-prvs: <VI1PR07MB51360F71808D33F0D177C020887B0@VI1PR07MB5136.eurprd07.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(39860400002)(376002)(199004)(189003)(6916009)(54906003)(186003)(99286004)(68736007)(106356001)(105586002)(305945005)(2351001)(71190400001)(71200400001)(7736002)(478600001)(7416002)(6116002)(26005)(3846002)(8936002)(86362001)(25786009)(102836004)(50226002)(386003)(6506007)(316002)(5660300002)(2616005)(2906002)(4326008)(52116002)(486006)(476003)(97736004)(6512007)(66066001)(256004)(5640700003)(14454004)(1076003)(6486002)(81166006)(6436002)(2501003)(8676002)(36756003)(81156014)(53936002)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB5136;
 H:VI1PR07MB5902.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p9dp7F5zcA4loJxT24+njLl6lYimBp/LcnTLIgTZ57Ofh2KaAbei+gMk+AMeb+aYVz9ciLUHrgpMz8Cswuy+xs6tuhHoLUV7jW1GOX/Edxd67mhuroRzv1ExNqc0NHr8vcBaaf6VU3QeGhV8PA8YCf6q/N8e98gGU7enMGkyf48JfQvZzhPNuWj3BWg4E3i8TQEi8s7HcTMx6uLci0ps1B6O6nPsLGGCy8VL7U1wBT1HfkVJ4vu/RbTH2M+3Gi4sIEdbn4yk/tihsJY9GQrtoOU4vb2U7s9XsuZMjOO+CGcZxm4doVRRZ7222skvTybHu7ljedFhDBrLcNJjdNzSRkn2A6JjPJw9FXahRF9WWrBEnJ4GLX1kl/VziKIORW2208+i3lVtaLhcH5v2yWb2cNm9ysy/Sd6557inBRZu9ME=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5380a806-1304-45c8-faaa-08d69bdce11d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 11:23:49.5075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_032359_067575_50AE2CEE 
X-CRM114-Status: GOOD (  11.40  )
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
 drivers/mtd/spi-nor/intel-spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index af0a220..b83ea79 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 	while (len > 0) {
 		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
 
+		/* Read cannot cross 4K boundary */
+		if ((from ^ (from + block_size - 1)) & ~(SZ_4K - 1LL))
+			block_size -= (from + block_size) & (SZ_4K - 1);
+
 		writel(from, ispi->base + FADDR);
 
 		val = readl(ispi->base + HSFSTS_CTL);
@@ -685,6 +689,10 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 	while (len > 0) {
 		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
 
+		/* Write cannot cross 4K boundary */
+		if ((to ^ (to + block_size - 1)) & ~(SZ_4K - 1LL))
+			block_size -= (to + block_size) & (SZ_4K - 1);
+
 		writel(to, ispi->base + FADDR);
 
 		val = readl(ispi->base + HSFSTS_CTL);
-- 
2.4.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
