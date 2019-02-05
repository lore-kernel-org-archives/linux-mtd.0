Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B36C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 17:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61AB20821
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 17:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1VboQ40";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QJmmaAZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D61AB20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrQ3kW7qg1YXkdpGTA+JV+ElBXTXbERYFeMJwEgXmS8=; b=Y1VboQ40EFaAge
	CZklt+wiY/psOudhI3ZLkk3rzzrdZkgNrt9jb6QnT0bcg/9h9CAzrfSQqGqjqLYiiMQwugr/spcox
	yww4UCYOKKqYANCC2iEaCKCUc1I4D45MAuCS1slr8MwjOjJrKExm1o/LDzlWBSvrUbq0sNd43oWgR
	/hOOs9l39LzNJqbzeBgh/GdvHWzd3CCxTKb/dLuk8KyKazi1/Xi0vyD/uiK5QO4vNRg2POFeFf56l
	QQrYRfpzo1v0bGn+ObshUZTdcl820I48zZvH3LcKSGZTQMAVHNeB+r4fmRboM3yIK2K5kgkKrdwAj
	sCsS09sRrzBoYkdYWK6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr4cv-0005M7-O7; Tue, 05 Feb 2019 17:35:17 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr4b5-0002fJ-2U; Tue, 05 Feb 2019 17:33:29 +0000
X-IronPort-AV: E=Sophos;i="5.56,564,1539673200"; d="scan'208";a="27308219"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 05 Feb 2019 10:33:20 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 5 Feb 2019 10:33:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGrBLi5Fx7hLrIS0sNlobL3tmxiG1BCbeeRUVBRxjCc=;
 b=QJmmaAZgDOOjWhZtK/wQFG+TVkvF/dcZGPJjeFFbgYmODhhzVpbHb7V7tf65Pum6SkQJ4VgMYv0gXZopXAPnSq3ATbLcuThZaFrZEhC61+M/he81YNb30P7jx8R1Rk6/deYERUnemhlObv886tkQ+5GgzoP8NR+U92hANEkPm4s=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1539.namprd11.prod.outlook.com (10.172.23.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.17; Tue, 5 Feb 2019 17:33:17 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Tue, 5 Feb 2019
 17:33:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Ludovic.Desroches@microchip.com>, <bbrezillon@kernel.org>,
 <Cyrille.Pitchen@microchip.com>, <bugalski.piotr@gmail.com>
Subject: [PATCH v6 05/13] spi: atmel-quadspi: remove unnecessary cast
Thread-Topic: [PATCH v6 05/13] spi: atmel-quadspi: remove unnecessary cast
Thread-Index: AQHUvXjhv0xyV0vw4Ui/dteRJV57wQ==
Date: Tue, 5 Feb 2019 17:33:17 +0000
Message-ID: <20190205173254.16388-6-tudor.ambarus@microchip.com>
References: <20190205173254.16388-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190205173254.16388-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0128.eurprd07.prod.outlook.com
 (2603:10a6:802:16::15) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1539;
 6:mc0zMmzIHQPeZvLzvNAWUH+8GJlZyOT2Rf4z7/hnEtv1B4nZvdgA/2KrAFzAFluOL/LMTfOC7Jk5fPgThZYbTdJ73BpCkLcK36cV93LqyefzraLvsuRYVbmH7eiWPQbbB15QHlsstd05w1GiAibdWBKnbUkloyiLUpZcXsYX6fJVpzxRYpXp0++VCCaNEBQbF8ZHFtXhJsbeklBg/kpm/euO5a3dqk1tWWmdPjarlguqZcrPN8X74UGL/NjKV+Ow7hFOHu4GVv51R5KDyUaDw7w8eAF0AXzLhvcCt5k+jTYcy3bwb1iZMo3fdefJm5ItTMWeitiSAwSeayLk5BEoOCPlHM9e5H/dIthWHlkipF5pyzfph43l2wxHhb3ch0sAoRQboV2UBVj2hELGhEgIJriuzyzXdiZvXHZIS4dfaVqaGlrxl3oSJ3VqM1R0sZ/ol4pojYPZbjGqMda+JnuYkQ==;
 5:1XWUAmpJuU1DvVHcodxolD5H8TH3oVz3GnNA4MW/KTuLZXFIjHmFSLS75nm9jr1pTJ/RL5jtbZkFU+nLO/BI9noSCRk6QVEUpXvpaiFWCIWGyUgd8z3TkpQkczgJCJMz4fKmv5RDYFEuJ72Xk1L3HCBVk6MnkdTfK9NZVhqZGdHxf8poyhAhO44vXb3Ll35UMBIf6AGNzaO5yTxsCp5Adw==;
 7:s0O0kg4dPEdbdPuZE+Bf8UZ0W8BLdh6Ja74LGi79tuHQHaxUI0XR7IDyM+Q20ITTdKntAxODXclhfW41+YRaTDCJDKcBVoClwcrYNXMyxYMCmTM5xCBqPoTeGpM+TuRj/0cnQjMyC1SrOxDQ8XxuSw==
x-ms-office365-filtering-correlation-id: 41c037a4-3118-4a9e-c169-08d68b900356
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1539; 
x-ms-traffictypediagnostic: BN6PR11MB1539:
x-microsoft-antispam-prvs: <BN6PR11MB1539B981349D7C765A000036F06E0@BN6PR11MB1539.namprd11.prod.outlook.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(189003)(386003)(6506007)(7736002)(4326008)(71200400001)(71190400001)(99286004)(72206003)(2906002)(110136005)(14454004)(316002)(305945005)(76176011)(8936002)(8676002)(52116002)(7416002)(3846002)(478600001)(6116002)(54906003)(2501003)(50226002)(1076003)(36756003)(106356001)(53936002)(105586002)(4744005)(25786009)(81156014)(6486002)(68736007)(81166006)(256004)(86362001)(102836004)(26005)(486006)(6512007)(11346002)(14444005)(66066001)(476003)(97736004)(107886003)(6436002)(186003)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1539;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xEZW/+hoNlT12UWnp/LNLTS7Pbw2aIvbN/elwMvT1jdDNXxUORAW+UFPrYfGQGpRl4GR+hR9H4VKCc/t8GYyUCnyb4tNaca6zrT3TA+myv7sVCI9DkaVEbf3CvKcOL93whqt3vni9UfEivG5ID2YuKIeuHVPeK0MAUvl8BU9kiYcVUyZVjdul4+YbV0Hl04ZvB4QqZqL3a/ROHklRC+jDnZaHg9nZ1yK3PE7MmIr82Axpb7tIpji+px6if60Xn4nVoZW3tb0Gn9aPITZbGa8Q2urhc/PVRDE/pmbUew8T030gLDQC0iQbQUeI62O3V0orCQORxytFYkkXBCKx1PW08SGvtuX5Epk1l9ebZBTWXCv1vBP/hQTbojHzW899aTQEJcxQJdI/AzG+ZeGTeZHgdfe8KVIrkVD1EjR4E2hiuU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c037a4-3118-4a9e-c169-08d68b900356
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 17:33:14.5323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1539
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_093324_127336_F3D1016A 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: devicetree@vger.kernel.org, Tudor.Ambarus@microchip.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The cast is done implicitly.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---
v6: no change
v5: no change
v4: no change
v3: no change
v2: collect R-b

 drivers/spi/atmel-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index be1d1ba7898c..be7f87fd5ac7 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -389,7 +389,7 @@ static int atmel_qspi_init(struct atmel_qspi *aq)
 
 static irqreturn_t atmel_qspi_interrupt(int irq, void *dev_id)
 {
-	struct atmel_qspi *aq = (struct atmel_qspi *)dev_id;
+	struct atmel_qspi *aq = dev_id;
 	u32 status, mask, pending;
 
 	status = readl_relaxed(aq->regs + QSPI_SR);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
