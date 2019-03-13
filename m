Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D033C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9542184C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kshTn0p3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="JWT7wWJY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9542184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MFUArLeKfGNk6z4TBuwJdYrB1u8bH02lmuIBGkjtJTY=; b=kshTn0p3A/5i1o
	Nmcb/o33aOxuUO19n1bQYlIdf1IqnIgfRX1a+jFgvrn/eRr0YqLw8recRSBdQ4O3+hs10Xix3sF8z
	JuVtk8lVrcU7tYuUelq68OjWd8t46jk1wHf5A2s4wUwG1syI4oZNt8gxhKJcaKh4XFD9RPCbJBESW
	DeuITdFWNnEJv8U7iQym8dQnZDjgN6nFzjncZMUITn/1Fz1Sswd2KG2W5CNBrnn/bHpHMB0zWG9iK
	dxiwLAzi548BnYRoyPkD2yAv33l4ymdFc7ghWv82Zh6Qj++TeheMSPMLRuLCY8WwgZSCcPj0kUBer
	bGXCmETOwD4UaXvs38bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h40md-0007Si-0b; Wed, 13 Mar 2019 10:06:47 +0000
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109] helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40lr-0006ag-G5
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 10:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mZzVM3WCyGXgaOhnIi/wLRwtZlf4jFIqBC8XQwtAOc=;
 b=JWT7wWJYXHx2U4Lx+uQbWvQQWoS4wJri256R7NyL/nzfp/RK8YgjUAJ7pFpw2k5qevF7Pzgr98DAxxTi9Oo6boASHcJvmunR/HrOIe+DdEkW/j1H1o0IGZUAVN6HD0S9XOSjWArIYS8SKpBLQJHZO0+mJEthIQT7vRteuYzZBDQ=
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com (20.177.202.154) by
 VI1PR07MB5328.eurprd07.prod.outlook.com (20.178.11.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.8; Wed, 13 Mar 2019 08:21:46 +0000
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::e8f9:b49a:ad04:a8e5]) by VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::e8f9:b49a:ad04:a8e5%2]) with mapi id 15.20.1709.011; Wed, 13 Mar 2019
 08:21:46 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Mika
 Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address boundary on
 read/write
Thread-Topic: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHU2XXMQ+jSwdChMUilG2pNVzdJLg==
Date: Wed, 13 Mar 2019 08:21:46 +0000
Message-ID: <20190313082120.17913-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.181]
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HE1PR0701CA0066.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::34) To VI1PR07MB5902.eurprd07.prod.outlook.com
 (2603:10a6:803:9a::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ec377ab-a2ce-4d24-d752-08d6a78ceea4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR07MB5328; 
x-ms-traffictypediagnostic: VI1PR07MB5328:
x-microsoft-antispam-prvs: <VI1PR07MB5328D0179B56E8BD6FC3F98B884A0@VI1PR07MB5328.eurprd07.prod.outlook.com>
x-forefront-prvs: 09752BC779
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(136003)(366004)(346002)(189003)(199004)(54534003)(26005)(102836004)(186003)(3846002)(8936002)(6506007)(6512007)(386003)(5660300002)(6486002)(52116002)(86362001)(476003)(2616005)(97736004)(50226002)(4326008)(68736007)(25786009)(6116002)(36756003)(486006)(14454004)(478600001)(105586002)(14444005)(53936002)(256004)(71200400001)(66066001)(71190400001)(2501003)(1076003)(7416002)(6436002)(81156014)(8676002)(81166006)(99286004)(2906002)(110136005)(54906003)(316002)(7736002)(305945005)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB5328;
 H:VI1PR07MB5902.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5fHBkWwfadKv0D9EJu7yhpAynNuQtI2z8cbyqwuiKS1oHCsU0KoTJekixK/R0cSjjVP53Jwgx0mT9XqFGUpHs6ZzlkztqWxRDIQKdd20RRrZGnOyZQUqcTMLS4V5ZgeXv0Tsb2f22gHfWUf5aDPfk+qmV7lDErvDCeLhD9kEPH5bnmhQjIgRso1eyqWuxWWOMXdO0TbQ0iz67p2eGVCD9Z4dwrb7YFgXAoVbvBgSmzSW2G7oH+NmkkInvJ+JUiTh1DqCLtRab3D/JTE+b+dpshLy39Ne7FV2pfI8umTlH92tQiE2Q02KXaQhy+AUF7hddPl8fh7hGGUyP8ZfhJnSvf+213EG7huzjKEazd+u5phQpGS7P92MHVOu9oOLwumbkMb5cWUU7xAdNDAKh9paH1SeDF4KCdE/AHkSty/wC3E=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec377ab-a2ce-4d24-d752-08d6a78ceea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2019 08:21:46.3206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_030559_820813_15DDD809 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
