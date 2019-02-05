Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACCDC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABD820811
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjsVArAa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="nLcEWHGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABD820811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K36tCzMMGZVfQpFXEWjA7ulwH4E2ovHTfP5bK3onOw8=; b=UjsVArAaaDzOZS
	53L5wTtsddA0vvFQVfPLvaLcXpflJfW++mdjxj47KZP6ZSxWVXCUuvS0Y+lYs/f7bOCXjpD6vbbMN
	9edH4bcKv616+m8qW25TgL0L63mYSxQ4dT7m4nWWYD0h2wvPWgQ62iXSTSX62WpnmkjdkoQjPkXfa
	t6oUNElzQ59inEN3vmDiKALcl1ID5xGSO5zq+ug4sWQzY6K5SODCsJF12zWBI8L/K5mFlNmj+QE8Y
	bCtCy8oIgtJoJ0vGlHzJ6i6bc8T9NsLbHIiHDBAFKPKOKyGJhVBI9xs3gaNtZ0PKW9GPddm1L8Zp9
	Cog9VknAgayCRA+2Usnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr2Xh-0002kb-5p; Tue, 05 Feb 2019 15:21:45 +0000
Received: from mail-pu1apc01olkn082c.outbound.protection.outlook.com
 ([2a01:111:f400:febe::82c]
 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr2Xd-0002k9-91
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 15:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs7W3xb+2OqdRjWa8+V+c9twqO2uHQrRXyGcngnRRVU=;
 b=nLcEWHGecDrYonz1V/FW6AtE7PM7k8IdJLaIG7rBO1GlU6SUzlBHsO6aOuDUGTRZIaVme/J9yrRYE7KIEfKA29lu4ZgKvlYJjmwX3CVFPR3fFEz7mWQyUvSFSasoKD3FcsDKZg1cQa1nOdG01RoozK7EWVc7Td6ITQvfv5CYobMO010zTLYdiv50TB/stEGtcSnfHF1dyE1aDs+xFDMrZ6qsOrHTd41gzxBILUTew1okRwD8xYNsbQLF8VnQonuHwkoGqUX4x9ks6n5toGygPxeeaFeKlypkL/WjEiuiQ6ub9RzYDSbqTXKRxZTJWQfObKcod3EBzza8JsvXJgZm1A==
Received: from SG2APC01FT061.eop-APC01.prod.protection.outlook.com
 (10.152.250.53) by SG2APC01HT178.eop-APC01.prod.protection.outlook.com
 (10.152.251.141) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.10; Tue, 5 Feb
 2019 15:07:21 +0000
Received: from HK0PR02MB3634.apcprd02.prod.outlook.com (10.152.250.57) by
 SG2APC01FT061.mail.protection.outlook.com (10.152.251.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.10 via Frontend Transport; Tue, 5 Feb 2019 15:07:21 +0000
Received: from HK0PR02MB3634.apcprd02.prod.outlook.com
 ([fe80::d582:b3ef:f46a:4735]) by HK0PR02MB3634.apcprd02.prod.outlook.com
 ([fe80::d582:b3ef:f46a:4735%3]) with mapi id 15.20.1580.019; Tue, 5 Feb 2019
 15:07:21 +0000
From: Wen Yang <yellowriver2010@hotmail.com>
To: "harveyhuntnexus@gmail.com" <harveyhuntnexus@gmail.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: [PATCH v2] mtd: rawnand: jz4780: fix possible object reference leak
Thread-Topic: [PATCH v2] mtd: rawnand: jz4780: fix possible object reference
 leak
Thread-Index: AQHUvWR+sdKROhIau0qqRvB20gx3qg==
Date: Tue, 5 Feb 2019 15:07:21 +0000
Message-ID: <HK0PR02MB3634AB4C3584FD37B3335075B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:a03:100::15) To HK0PR02MB3634.apcprd02.prod.outlook.com
 (2603:1096:203:97::14)
x-incomingtopheadermarker: OriginalChecksum:8B4C5B4CA616E886C68C96868F183B2FCCA9B5060DBDCE3EDA0C314696CD78A6;
 UpperCasedChecksum:D30840CE915AE8146E15064AB172A22C15BE9937D16B632CCEE9E4C051CC469E;
 SizeAsReceived:9124; Count:63
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-tmn: [60msx8lYGAJx9958YId2dN03TDqQKZ1f]
x-microsoft-original-message-id: <1549379069-15016-1-git-send-email-yellowriver2010@hotmail.com>
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SG2APC01HT178;
 6:oZtls5sDA/0275hGa1dmLhw8uBP9FJAwtEZO+AJpm4ffjVkyi22neZUC3FtAA7kXVD8ilc3xISvZdzcvWMcu1mcGzvf9SbYJe6Mv/dejKHCod3bnsHDMf/s19QW63IRF7C2Rsw0mbzgS1J5gZWW/RshkNFQ2SghAPIh+1z2HoDve7FH4pSgzbRKOnVFRwJXDCajS1bDOa/nj4emS9xVl7r9OUwdKaflcAylHhzbUfdhexR3XcBXa3d1hdHz3S1bRRT6+hD7iw2IZiuszPVYpIVXKxb1+z7KTJucsG6R1OAxdPxuWuu2VrnB0jnkHE/D6UMnWjJjXJE12QtIGFltufx1/5riLlY2iCmGrGB1Tl3fNcKP6qAwHyfistzHYpyY6q6ALubGBVgZYX61iDwY5msH+iSfw/s639JIOCGkhwpEs7JiNvArpdHDgoLgexDqBAvD5Od6U+wVSzRQknaMUfQ==;
 5:086hDpVMrLkXGHesGND7F4I//wlwkQw5uYadRisCgvHBSpkP1XK+94jf+ZgPSopb47HT2Y2jX5XMSos/Pfkuq7RDJ8J/KsyGrUc7o9+juZuGoEm3zsC8rgvbI8sv4EJ5Mg9jREsxNpihJuYJHpaEMcx+4UhvV8uNUck4gSqGsCi+R751E3HmEIcE0MY1rQzazsz7XgQ+SFDVvXa7+KiwWg==;
 7:BponMKW5jSzaiHBYP9xsZEugn/H7PO+0Ixf9zGgunTF1mq9tqlWHcmCQGsfyMG/SzZ1w9mAlFgJVj06x5biwLUHZCKdTETXSq+w2WBvAzuya3SHx9rcuiNsvoLH8yk0ltSkT8JfUqr3SqAwTTplVwA==
x-incomingheadercount: 63
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: mmMLu+WorSyJd0CskFSt5HWJ6J3lecFu+88iqdZeNVvdIuxr7OJhxoxyvY9lcYEm6jy8Wttmf1JF1ktRf7SBGJMItagVW5Eg2ggPZBoXP2lCFMsxmKKnuoMFANYpoH2XsnoXMndGvdNCWYxjKV2Gvt9jh9OD44xUMls/xPSvtXiumtCYHQq5u7ci61D5+h9yr9ZXcdFWaU+gMWE93qKSFXQ9FOUyR7svd0Hx8vC+/suFtdA63V7HHf/EN8zJNDzu6sD19uQjCAItLbm84e+eGBfvFp1c5KuKsnUHjRQWk7HBux4YcAQD6R99+l3pKD3Z0Ss3iavxLJ88iI/sgnKNQixEqV8PhLKmTYDa28G+KV0661U2897E/XqtKsiytCC1ad1odORaHfvMOl8uIZDRtckPX11VdoryX0KNIzt4lL1wQLfELvrOYA747oDzvVJzoVCpwvscqxQVrQgL3dB3MjQUzy90pFIjjCKo/XbfAZ/7xF1YEiO9CulxHfLd++ejBEMC5dbr3gWHvNgkGP4fp8wPN+vvaf8vla7bb5FIeZl3a/VnsyCPBiWq/lUNl9o01T5v/zZNitW+I3QzWArteCdu7uGHt9u0ZhCBQtICucGV8SfCZFDUig1GsHa4EMCJD8/jDUi+OlAKpQQjCDJ7NHj20rhRt90sLg0/Phn8UAmoNHk0mI/ktRV1oIqnsNeReUrydXvHDh7xHAIwjC2nDALLGhAXw3wl
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:SG2APC01HT178; 
x-ms-traffictypediagnostic: SG2APC01HT178:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
 SRVR:SG2APC01HT178; BCL:0; PCL:0; RULEID:; SRVR:SG2APC01HT178; 
x-microsoft-antispam-message-info: 9hMMpffeD2jgh4Wy0RUjQbdNqy21kQMXJQrpm1f1pGnZhP15XiILPcgrc/XjO45o
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 9a4e3081-9524-43cf-bfc3-dcaef82d5da1
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bccf39-51cf-4f45-d7e4-08d68b7ba066
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 9a4e3081-9524-43cf-bfc3-dcaef82d5da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 15:07:15.1417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_072141_474233_BF1BFC8A 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Wen Yang <yellowriver2010@hotmail.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

of_find_device_by_node() takes a reference to the struct device
when it finds a match via get_device, there is no need to call
get_device() twice.
We also should make sure to drop the reference to the device
taken by of_find_device_by_node() on driver unbind.

Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")
Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
v2->v1: Since there is the only one user, let's remove the err_put_device label.

 drivers/mtd/nand/raw/jz4780_bch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
index 7201827..363465c 100644
--- a/drivers/mtd/nand/raw/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/jz4780_bch.c
@@ -281,10 +281,12 @@ static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
 	struct jz4780_bch *bch;
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev || !platform_get_drvdata(pdev))
+	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
-
-	get_device(&pdev->dev);
+	if (!platform_get_drvdata(pdev)) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	bch = platform_get_drvdata(pdev);
 	clk_prepare_enable(bch->clk);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
