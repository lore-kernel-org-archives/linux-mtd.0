Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22E5C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE45121872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRGf3SuI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="WiqsZqQM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE45121872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9TCBQOTHB80d5AzsVEiCxYZ1bpO6/BGLleEsNeuPPQs=; b=ZRGf3SuI800Arv
	mTZ6s0dMe7rZLuAfHVZRbXvFYdNp2CKc9PmVrcb68LpqlIUiI/CA59R9LXHxn58dA6HL8VsWtU8UP
	Q4/GXrvIpqm2VNXX5vD4xsoDoUGGiQcD+TGSxiW1anjQSPx3bg+lwhjzal8rEe2CW/hJvKk1oiRdh
	QaLzrW8kDzhjQpM5tbE5mIdz/EJuS//zBLUGe3K22YXevEntNholOwaBtc0OTdagarTMLfJyWcY1E
	2NPwtBsk0vSRJlhd0xk5FM6y+6DNEFaUh8+mv3TCHh9gJL8wI4S9ZH9fz1xmCEnruLxOwt48PPPo6
	jvT4F19ZWnmj/hQR2QqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmd4U-0006pD-61; Thu, 24 Jan 2019 11:21:22 +0000
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmd4C-0006cJ-Co
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 11:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmWK+/ak9JHr/hnLtXbXnyV+kZ4gM3zfq1OlahgoOJE=;
 b=WiqsZqQMDZVl01i3PYN6TaPOEomuQsLrhQEoXfAa+HVPSaHd10FRO3DC89Su5TYuAtj4z8KRbSim3FuFdbL96Z8MQMrz9U0+PSYiGVDU5Uxz4rW1upGvcC52FSrQdAxFPtAizu/l+0R6lzRO1mARq0jO3EGUkbvhxvZVktastAU=
Received: from DB6PR0701MB2998.eurprd07.prod.outlook.com (10.168.84.136) by
 DB6PR0701MB2454.eurprd07.prod.outlook.com (10.168.75.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.10; Thu, 24 Jan 2019 11:20:59 +0000
Received: from DB6PR0701MB2998.eurprd07.prod.outlook.com
 ([fe80::2843:5379:602c:d03]) by DB6PR0701MB2998.eurprd07.prod.outlook.com
 ([fe80::2843:5379:602c:d03%6]) with mapi id 15.20.1580.007; Thu, 24 Jan 2019
 11:20:59 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] spi-nor: Drop uniform erase
Thread-Topic: [PATCH 0/2] spi-nor: Drop uniform erase
Thread-Index: AQHUs9biCKMjvDuezU61BTX5AaNuHw==
Date: Thu, 24 Jan 2019 11:20:59 +0000
Message-ID: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.2.12]
x-mailer: git-send-email 2.19.2
x-clientproxiedby: HE1PR05CA0141.eurprd05.prod.outlook.com
 (2603:10a6:7:28::28) To DB6PR0701MB2998.eurprd07.prod.outlook.com
 (2603:10a6:4:73::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0701MB2454;
 6:qwXppPvrLF0R5kr2ms+5Y4fAb3c8vHACnsoqawJPX++72cjAfxklMnw5Yu7SR+7cdnuVfBH6lOzPsNNZril6YWnmMc3en7QZVX7SHROZ7tEsbL/3tZCEMPdjKhJLl2SbtvqWc7mlfG7rOsrIRXYJ48yAI8DETztr3d04BWjPgkXM462f1JSpM1GAhqj1+WEEXLozk55npwN/ER+9ybqgXVUN2ybY1bX6g3PLvwxUTFeIXD3OOG6ArVxvMrdSr4CCq2oOgDPA/+9r4sgW6AfCfnNsUO5tmdJE+dySW78l7+LBUlPH8bLZBTd/kUO+JslcoMFVDUUwmVHOPRk3plWU/CWSS0q3FedXgiab36RDVi9cNl4fRovQ2aBijk/9EBXA87sOlRo0QRdIG5fKbFY3A9KUV5erB9bU7mQtoRR5edCW7s7bs9827L7PsEzOHWO2dPF+AEaUUuDGIorBH0r7Rg==;
 5:udFryxRFSjunDR2vJRFofQXBedzPq2ZhH9yrqCN4J8gA/nD1ZarztrmutFiX57nrxFyzoXefzsTYTXBuJxKuJXLvGGDBtOm8H78R7KOOO8pAYXmuqb3IlvNrJc1cD3nYO5gpef2xCyNNjM1bmDraNYwhVofoKeNXtjhEndYL4H+XgL82UadtBCEY7PK5b3y1g4w6nlhJ/ByRtihg6eWdgA==;
 7:+y8q6qOG7j4RaK8a5CffpibpmLyKfOwN8s6Q99QMpelphQ1sRPx0HZuithrJYxNtSd7Xj+sDzc7OCO1QZ3Rs9iqgYjJHwJf0FOZFkLHYB7D8SxVSzuiggFSauEgD30ZAO9+J0omJTDC6W6wVNSFgbw==
x-ms-office365-filtering-correlation-id: 089f30be-f96e-4c2a-e374-08d681edf334
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0701MB2454; 
x-ms-traffictypediagnostic: DB6PR0701MB2454:
x-microsoft-antispam-prvs: <DB6PR0701MB2454CE7EB6DDC6D8BCC56697889A0@DB6PR0701MB2454.eurprd07.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(366004)(346002)(39860400002)(189003)(199004)(316002)(53936002)(25786009)(50226002)(186003)(5640700003)(3846002)(36756003)(8676002)(81166006)(81156014)(6486002)(6116002)(66066001)(486006)(386003)(6916009)(7736002)(2906002)(305945005)(97736004)(6506007)(8936002)(4326008)(6436002)(39060400002)(86362001)(14454004)(478600001)(102836004)(256004)(54906003)(52116002)(26005)(68736007)(1076003)(2351001)(476003)(2616005)(2501003)(4744005)(6512007)(106356001)(71190400001)(71200400001)(105586002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0701MB2454;
 H:DB6PR0701MB2998.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0sbP/H81nsDevThm2PJyNCzye/5LO1+sp35PSS+TB+WQvplxiaEnu/Cc8+ic4Agph8qfoz7bZHiZ8M4lpwWJxKWHrfD5WtESVzQJS2RuAJPOxXHf+C1zvK0OWHUtTG/EXW8tqI4CmciIMrCek0nZc2v1IQ8/35h8Nqf2q0DFS6nNvMLg7PajovY5Sn3opP3ryWDOiaTYN50jmIBR8PCK+y1SCkdvWSk+upa5/to20eAe8OSAeimopn95D1c1Nwu+mA4jkoQqw3XBWQZq9m8xhW9c08g9asvKnmgmZqaTVHkb02C6WUg283OyK5N8+RFPmqulV/xwEM3v0tGy2r4Esroq13LPv4dL58Eml+o1fMPwsN7qo4CuZuzd9/JYXDO9Gimr1jbNBDYa/lKlbiYMnv4S2keH0iv5ZItykh4qsxE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089f30be-f96e-4c2a-e374-08d681edf334
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 11:20:29.6226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_032104_468903_257A1965 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, "Sverdlin,
 Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A series which initially started as n25q128a13 erase time regression
analysis but ended up in removing uniform erase completely.

It has been tested on the following name/ID combinations:

n25q128a13:
JEDEC ID 20 ba 18 10 00 00
JEDEC ID 20 ba 18 10 40 00
JEDEC ID 20 ba 18 10 44 00

n25q128a11:
JEDEC ID 20 bb 18 10 44 00

s25fl129p1:
JEDEC ID 01 20 18 4d 01 81

Alexander Sverdlin (2):
  mtd: spi-nor: Fix comment of spi_nor_find_best_erase_type()
  mtd: spi-nor: Always use biggest erase size

 drivers/mtd/spi-nor/spi-nor.c | 48 ++++++-----------------------------
 1 file changed, 8 insertions(+), 40 deletions(-)

-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
