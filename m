Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435BEC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1180E2075C
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fa5VMYyQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="LP0+fHyt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1180E2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkaMYGxm7276CAWXNSr8YOFJszmR9ZEEuGU2D2d7ypk=; b=fa5VMYyQCa6LXe
	VyiGP6UkC8gGAHKdMJ6V0nlvnDlt7rt9eGxdoX/3y14cFxkB+jluOB8BaxISaDDgrXw4r04K4DF7a
	i9jAt6t1jztrNQGNvHEmjWYvOwwHslkrsEVn/2yd7s/jdBk94Rc1jI9goew7czl1KcaJ0q9RBUDwl
	YgVjmaL2eRXpagYOE/viTi9XztHf35KR/VfP4Rz3l4kxc1W7Zgn9IbHR4Tv40bpPD79MlWg41tRBZ
	RAbhXBKUMXqg/JpZ6M9lBtXHirOYQIczuFRHHVAMAlWn1AnOMvztAbuVQx3tCAfVhO+YYHGX6VSAL
	yvpMUX924Gi+NtfeI2SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Hyw-0001Ah-Bf; Tue, 19 Mar 2019 16:52:54 +0000
Received: from mail-eopbgr60104.outbound.protection.outlook.com
 ([40.107.6.104] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Hyt-0001A3-Ru
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9pBeU478eoPjguhFVQ0jaPqfF9iEMnWU4E5cj/ud4c=;
 b=LP0+fHytN+78uIpjtU7q63De0S7+XBm+3WvmgZkoOeqWsvHOXCSO9als5tnoNXZtqZ8+XIwGKuFSHuAfgTFII1iVyPpK7BegAZJRGkA95jn41RjQYEtKoOMCgTv6iokkmGL3N21bLMIVasAWzYnrfncpdSh4HSRZk82T4Mvw8hY=
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com (20.177.198.83) by
 AM6PR07MB4982.eurprd07.prod.outlook.com (20.177.197.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 16:52:49 +0000
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996]) by AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 16:52:49 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Mika
 Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address boundary on
 read/write
Thread-Topic: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHU2XXMQ+jSwdChMUilG2pNVzdJLqYTLv0AgAAGYwA=
Date: Tue, 19 Mar 2019 16:52:48 +0000
Message-ID: <20190319165234.18890-1-alexander.sverdlin@nokia.com>
References: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
In-Reply-To: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.181]
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HE1PR07CA0037.eurprd07.prod.outlook.com (10.160.74.23) To
 AM6PR07MB5221.eurprd07.prod.outlook.com (20.177.198.83)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18213917-2f39-4ae9-6c7e-08d6ac8b517a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR07MB4982; 
x-ms-traffictypediagnostic: AM6PR07MB4982:
x-microsoft-antispam-prvs: <AM6PR07MB49823A208BA27739237642FC88400@AM6PR07MB4982.eurprd07.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(346002)(396003)(39860400002)(54534003)(199004)(189003)(386003)(50226002)(6116002)(52116002)(6512007)(186003)(26005)(36756003)(8936002)(305945005)(81166006)(102836004)(71190400001)(71200400001)(6506007)(8676002)(3846002)(476003)(4326008)(2906002)(7736002)(486006)(11346002)(66066001)(2616005)(53936002)(76176011)(81156014)(7416002)(68736007)(446003)(25786009)(97736004)(2501003)(86362001)(54906003)(110136005)(14444005)(6486002)(256004)(14454004)(316002)(5660300002)(1076003)(106356001)(6436002)(105586002)(99286004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB4982;
 H:AM6PR07MB5221.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SCysBfoT4fjSWoNSyyFSQtCEtGmKVnIEEC2zhvtrrGlQcchaFFl5GBkGvNG9L2gllG3MJ503b2DPFeup/xdnGArPRnpe15533i+t6rArWeGmPcx1T7VvzzAnkpa41SEwtByST9jMT1vxw1y61p7g6+SikpfrtX2p/xV10Kca8U4k7/rupaaMuwfx+4Z0a+RS385sdzATIEyENqJrJCQioWawpDQ3nad+xhTeGrGXEkmo5dMJM86HqsVGSWjqs+twz3Q9MFJuLuSBPwfXbPHp4q+JStn/K0ZHzN8VBLnuElNno1rS74VnSX/htwblGk5dZiVFBof38K3ascXzMs/phSyNdAVEGWGpN9RvCHmAyQacs8ZTRRLIUzkA4eYaNUfKT0hPjH4sDvgpxwFune1ZRLtqoAHAmlPR4esr5n3nKjE=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18213917-2f39-4ae9-6c7e-08d6ac8b517a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:52:48.9344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_095251_905828_07F8C173 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: Bin Meng <bmeng.cn@gmail.com>, "Porte,
 Romain \(Nokia - FR/Paris-Saclay\)" <romain.porte@nokia.com>,
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

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

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
v2: More macros! As suggested by Mika.
v3: Actually compiled. Sorry Mika, the lines are really long now.

 drivers/mtd/spi-nor/intel-spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index af0a220..d60cbf2 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 	while (len > 0) {
 		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
 
+		/* Read cannot cross 4K boundary */
+		block_size = min_t(loff_t, from + block_size,
+				   round_up(from + 1, SZ_4K)) - from;
+
 		writel(from, ispi->base + FADDR);
 
 		val = readl(ispi->base + HSFSTS_CTL);
@@ -685,6 +689,10 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 	while (len > 0) {
 		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
 
+		/* Write cannot cross 4K boundary */
+		block_size = min_t(loff_t, to + block_size,
+				   round_up(to + 1, SZ_4K)) - to;
+
 		writel(to, ispi->base + FADDR);
 
 		val = readl(ispi->base + HSFSTS_CTL);
-- 
2.4.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
