Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85887C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 17:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D6520863
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 17:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="He9XExdd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="Pi3de5X4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D6520863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkFWJqbrw5ne/7HtRHmhadWNfQpH95+drkUcF8RFQMY=; b=He9XExddJmCZMf
	T7/H79vPfG6w0Or7V7Cv1G4xrV6Um8IesQnHh8/hpegsQfb4RCdPwY+pKI8MfxLcCvzVgUdHg8Rbw
	4/vWqoLEFTW1mLx2ZJbv6pmZncuuSrUn/EpAw9GxuA9v8nPGpsei+V4baqnpU9OFRV+jiASDyr1Lv
	neEIworRXh3miunPPnvihL6O2Txp2k4ghhnj1emwYAXSV9g+Yz7R+PycgMCHxo8HIVMQb8BwBEOSR
	iLwftiSBF8P6uFQ0LDuKpcIJ97grkLx0pMS19Y5+QZ6WNzwyBMZi8Ha8lz0SuM2F6ct3IAQsoFFlE
	1AxPhwMhEgTljDZfsl4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6INT-0004Pe-NF; Tue, 19 Mar 2019 17:18:15 +0000
Received: from mail-db3eur04on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::72c]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6INR-0004PI-Ep
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 17:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2DXBvHSEBZF8Y1QXQBk0KbD6CJODWg1HHfiZitX2gM=;
 b=Pi3de5X4oDLMx0h3Vb8xQUV5ulzg+q74PfChwxeuhZuUNDHaDMrIhzjDvrtPcQOBYC4c7epegNBG5DVNmzuXmNb/MMVdDY/3MPAGL98/R++ox2KBZRYrIELFXUGeyYrpT822914S2fhrM7mALGEErRABU6c7DYDL52gmSdlNPGc=
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com (20.177.198.83) by
 AM6PR07MB4851.eurprd07.prod.outlook.com (20.177.117.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.15; Tue, 19 Mar 2019 17:18:07 +0000
Received: from AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996]) by AM6PR07MB5221.eurprd07.prod.outlook.com
 ([fe80::f4d0:bea0:7f8:8996%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 17:18:07 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Mika
 Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Topic: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHU3ne40uhmtPAeGUad2jKkx6BIFg==
Date: Tue, 19 Mar 2019 17:18:07 +0000
Message-ID: <20190319171749.19052-1-alexander.sverdlin@nokia.com>
References: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
In-Reply-To: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.181]
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HE1PR0802CA0020.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::30) To AM6PR07MB5221.eurprd07.prod.outlook.com
 (2603:10a6:20b:6a::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d119808-12e5-4560-e5d7-08d6ac8eda75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR07MB4851; 
x-ms-traffictypediagnostic: AM6PR07MB4851:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-microsoft-antispam-prvs: <AM6PR07MB48511581C6B9292B8209FD3F88400@AM6PR07MB4851.eurprd07.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(54534003)(189003)(14444005)(476003)(36756003)(4326008)(478600001)(14454004)(256004)(386003)(305945005)(3846002)(25786009)(54906003)(446003)(6116002)(110136005)(5660300002)(2616005)(11346002)(316002)(53936002)(6512007)(66066001)(6506007)(76176011)(186003)(26005)(52116002)(102836004)(68736007)(486006)(81166006)(86362001)(81156014)(1076003)(8936002)(99286004)(6486002)(2906002)(7736002)(97736004)(8676002)(7416002)(50226002)(105586002)(106356001)(2501003)(71190400001)(71200400001)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB4851;
 H:AM6PR07MB5221.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I+ZppWY6dc2MNI2zdsv2s/uCQCly9z8edZxci+cQ9xhq+ycHEoRdWzy85LjXR8OtvzU3cZzUVsHIJwpWMm6h783ayr2YBw/9qPfNsh5zQB1gV8fFD1K4vUcSX2SLvq/ccoOAe11fXmmBu+NKph3zCnj/63XLTH38+8lfALLKFUOq/f8CiIUqhOiaZzFWvPAx2m9nHhCh5aGKBtR3M8pIYERcQd9gAlEerNNoaLYHPAb1O7+uS0sOOAw5VzSkup8C5acVGcwnSQD9caWgsB1UkYRwFP0ngjyQFioQ8xxAW92bfQDgZZWEdlGf6xpw6yjnlTa4VRWupvXmogsDVKkFbCjjSLsS/n5E/eWAc6m/C85MitU3QWC9yaK0ZOeNKI+SKNQTKPaCHefpUjwhrdMNSj33hw5nVBzoPJCIKMEbbvg=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d119808-12e5-4560-e5d7-08d6ac8eda75
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 17:18:07.3369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_101813_581036_D88DE185 
X-CRM114-Status: GOOD (  11.87  )
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
v4: Add "mtd:" to the subject

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
