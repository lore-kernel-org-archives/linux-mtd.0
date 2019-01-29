Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E87C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 08:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8225220844
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 08:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NG0+VYST";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="nU7N497d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8225220844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xaePJvKO+GvuTmjZZ2wooAmIWKMyJmm09LhaszrglpM=; b=NG0+VYSTRySNw1
	teWyhuphuGo8vrPGFbeL/VydQhrIncAeO4gUzr4kKH3VIpyXPx2hMeK134yNfV7afO4CymdYJ+4Xk
	iYdZlfwQArl09n4B27ENvqTUS9tR4YYQ4bPtW3nTdmIgdW9CiR7b7G3ATvZfZvlUXQHyvkptrasUa
	z/VPqpBnLEghYWT2gxUwGqi+OvWXVZ56eEqNtU5fbc8zosfVDr/7bidkWa3RZpquH7yMuaZXssTNI
	l1b5A+WTQAFUF4hkma/y0U9/VQOijC4flvg2Fp+019bOeltMEhIanYl9EdcjsHhO9Pkuh9yfgZP+5
	iP+u9z2H3CQyXg/ies2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goOnr-0003gh-Eq; Tue, 29 Jan 2019 08:31:31 +0000
Received: from mail-eopbgr50088.outbound.protection.outlook.com ([40.107.5.88]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goOnj-0003fc-T7
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 08:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PyrdFGt/O1UK88sG2MoHDFKEoZiBuCLWzrz9dzw4dU=;
 b=nU7N497dBxWgfgY+ckNMsxgxpRtbN6orF2t5ad4PTj8cm0UftD66IjBuyFUP99moA1vqMowJMPNP5HMJnEykdXRL4zujijCfRa0RCI/2pdIbaOLOO2OfKBrW/vsmWdLXp/wQZqcmb+n0gjL5mflA07bgf2ClZWvAevEP2JNms4Y=
Received: from VI1PR04MB5726.eurprd04.prod.outlook.com (20.178.127.24) by
 VI1PR04MB4927.eurprd04.prod.outlook.com (20.177.49.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Tue, 29 Jan 2019 08:31:19 +0000
Received: from VI1PR04MB5726.eurprd04.prod.outlook.com
 ([fe80::a1c2:cc79:80f3:3bcb]) by VI1PR04MB5726.eurprd04.prod.outlook.com
 ([fe80::a1c2:cc79:80f3:3bcb%5]) with mapi id 15.20.1558.023; Tue, 29 Jan 2019
 08:31:19 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: [PATCH] spi: spi-mem: spi-nxp-fspi: add module license info
Thread-Topic: [PATCH] spi: spi-mem: spi-nxp-fspi: add module license info
Thread-Index: AQHUt60C8UqS3FnMwUazAVqci9fJ1w==
Date: Tue, 29 Jan 2019 08:31:19 +0000
Message-ID: <1548750550-23565-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To VI1PR04MB5726.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yogeshnarayan.gaur@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-originating-ip: [92.120.1.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR04MB4927;
 6:U+7Hgt8Ojy/EVum8WYj1imxMH347pTiaNwNV6+P47Fnad2sGQ3zojZUBFS9jnTx3YcO2dTBAFAYkzopMobGGwONx80J+mHzzKHU3lO64rp9uMgN465y2pm8I1usqlNrVvpFV7di0Qw5eXqXl36duucbrXaPI+csj3YL1HDWGyUxzxnHvv5i36nzKDnTPfkGvWZujZHlM/zoCkI67eEyWtAqlikRcEyDt/xPZu5uNyPjC3XWEvbXL7cDWfVGxz+Z0vxAnvwiNjIdItGmAeoIv7nyqqqhe0D+IT8HseGqdYjh8ZvbiJIbrkSq37KgZhUWHlJbXsG4lJrmnSDA9gmB4I9fmGt/FwpgAJepkVFTqmiK1sWumhP8s2BbMvUBJBHys7q4aWCY5G09GL+K2MS6rIwjvYpbS4txk2rw1jkCJAlkwfDPtJJYxMkd2eDD/cyYpDir4UJHjx3JCr8Aq4qkuUw==;
 5:FHlDNFlGT9qNll1gqJNlLOssLgEMjdHYSbfoh9BopeReYCwIFFwxDbJLZuqFIW1MxrOz59mkLc2pLYA13fMfI/4DYaRW73ikP95rW7VbWIxtK5oLPHhut+T4xykrG/s6JirFT03QTcjWVFGDmY3h1TZP2P2cMURe/dOkUX+7nVT9BJS1x+MIxpLpA+O986tWSYp4ixQyMaz4BlvN5WEnOQ==;
 7:bED8DtI7xJ+/3zmxySvIA7rX4wXgyaqp2buD+51v8Eh1UsRfre4xOR/Um641AS8DD+nr9Uh875CkucdualfA6MKpwsB3w+4R9XDuSIE3HsxfgjHdjXLh1V5IjklcVgNlSe/YNKR6KJ9IYCoxIWKMJw==
x-ms-office365-filtering-correlation-id: 2586ebed-2a01-49e1-1de3-08d685c42446
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR04MB4927; 
x-ms-traffictypediagnostic: VI1PR04MB4927:
x-microsoft-antispam-prvs: <VI1PR04MB4927C6BAABC2682303E2026999970@VI1PR04MB4927.eurprd04.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(189003)(6486002)(39060400002)(25786009)(86362001)(7416002)(6436002)(2201001)(50226002)(81166006)(6512007)(8936002)(478600001)(53936002)(106356001)(81156014)(2906002)(14454004)(4326008)(8676002)(66066001)(305945005)(26005)(71200400001)(7736002)(186003)(36756003)(105586002)(6116002)(52116002)(97736004)(256004)(14444005)(3846002)(486006)(99286004)(6506007)(71190400001)(2616005)(386003)(4744005)(68736007)(476003)(316002)(2501003)(110136005)(102836004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4927;
 H:VI1PR04MB5726.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GrKI2aZtoxbJiLKtB8J/xr36ZYJiktW+1FO4a9qYgPimiFEScTMrbOXZvhWh/j8sgS52MaKxBQU+FrnUt7mSGnpvBx6UKF0lm0/UCzcGYWiCp9UjiC59vOSiUFMh5lYtp65wb11AvJPvWCuKatefzOsxbNMoMUYi8seX/uO4Q8TvRX6M6m6l6Ngvtb12JG6IDYEayFfPGF6Ipk1YFvY6Z0lgzdObSmFqSzCWDCkm5if8LnUNsbxZekmojwuU9JPkiAiX4zIzUDhfAsBMNfLpLkKLEFaoom4eW388TQbYKhFLx+ZoRNdq4w28pGemCCKX11swM+QS94eTJG3LnPy7cMmcj9H6455flOJfVbt+Ef3nK9gt2HvRBmkPBnaEa6pmOY9nYjPb4LrQML8pmIe3J5XFX2howSMou6q7PHJdiM8=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2586ebed-2a01-49e1-1de3-08d685c42446
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 08:31:14.9515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_003123_946970_F7E5FC76 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add MODULE_LICENSE info to fix below warning:
WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o

Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
---
 drivers/spi/spi-nxp-fspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 0327216ef7aa..90f3d2e4fe5d 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -1103,3 +1103,4 @@ MODULE_AUTHOR("NXP Semiconductor");
 MODULE_AUTHOR("Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>");
 MODULE_AUTHOR("Boris Brezillion <bbrezillon@kernel.org>");
 MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
