Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B574C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 09:55:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0609C20870
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 09:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uenHygD7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VIgwn3Oh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0609C20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vfJzPnpT9pwbs3Md1MLRmudsZOvUuU8lOc+3nHNUbNo=; b=uenHygD7mLwFfm
	B51npVc6uK9CGGr+/o39IJUx9nSK6N2BNVxdYvmYyZGI/1C7tqPbkdUlRH5t2mOJ48CIUbnBY/wYb
	eLLnZOJjz1JKpV4ocrZMdyIRtLZCQbo73MqseCbInNRimNzUe3Q/sSw3Qv0ZPntFGTmOGjMqrmKXf
	JaVCZgNcTL05aLo4QOLAThAqGQ2ykbYobEAbU0V7oZA3Wj76nEr0ZzREnDyw1fxDSxDlN63RdsGGP
	SAXiPjVF2uIsM+Rdajft69AYgFz0nLsYDvPo/njrTbFXSvww8FCg6vYsUe/sMIwb0qm0AACi09Tzm
	9b3psW7ItJY16WjiX5Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goQ7B-0005BU-My; Tue, 29 Jan 2019 09:55:33 +0000
Received: from mail-eopbgr140074.outbound.protection.outlook.com
 ([40.107.14.74] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goQ78-0005Ag-Sb
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 09:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLlUmvU6YtVSP3dvL1aXrY1wWUoJOzqTVgC+ni8onvE=;
 b=VIgwn3Ohp1w0X3E07azEbo5QpkaJHKmdosdAyu1qp3Gcultfr0ff0Gx7hq8puj46JphofKiv9aEf/LhLWj+Q7YjxSCPQmjNQ0u3dhYpcPfQ4N3mukHxjKBD459TQdvByYuBXFdkaoclDMOsDEG9+tk2BSPze+isfaKicogI3jd0=
Received: from VI1PR04MB5726.eurprd04.prod.outlook.com (20.178.127.24) by
 VI1PR04MB6079.eurprd04.prod.outlook.com (20.179.25.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Tue, 29 Jan 2019 09:55:27 +0000
Received: from VI1PR04MB5726.eurprd04.prod.outlook.com
 ([fe80::a1c2:cc79:80f3:3bcb]) by VI1PR04MB5726.eurprd04.prod.outlook.com
 ([fe80::a1c2:cc79:80f3:3bcb%5]) with mapi id 15.20.1558.023; Tue, 29 Jan 2019
 09:55:27 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Thread-Topic: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Thread-Index: AQHUt7jCop3Mc0YUEkGW97blapUdPA==
Date: Tue, 29 Jan 2019 09:55:27 +0000
Message-ID: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR04CA0185.apcprd04.prod.outlook.com
 (2603:1096:4:14::23) To VI1PR04MB5726.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yogeshnarayan.gaur@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-originating-ip: [92.120.1.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR04MB6079;
 6:hJlG1r+Dda+3s15JU8ex7pp9Ykqa7oFGruH5BlqjFBVRuAdt3uCyN3cWcGaEXKoz6jl0m5xeX/G1JXjEKkMTUOAk7AXrif4KGTyMOTu+CZrNFhgcf1GNkUIcXt9pkBDfyXB+U9ojK6GeX01KFlMmahpLKdLs0scVEhEBDYovChrBW5GtPGxSchtrBidSRQzj9lACA49tHhGyZBh95a8KGUXcO1CKrDjRoylf5JUS89Pf3iVB5DDrOUt7z1X5G/4fZWwxECvDd0nRx34WDmAXp3J4nFTsVnSatzMPcq1SyeQ0WaYvSFpln9lP5ce3RqkvcheUTSNB7qgaMmWM+WvHa7AjzCq6JRLOmnhm+pcbBPXOUiX8Lm8mKDJuzOyg7vlKZEsoyFhkH6MddKdns2RbWKv6at2FBbeDAijYys9Eirz1XUTiKNrYOMVPwM7hzBticLyffHZof++eNwlhjz0wnw==;
 5:PQQADW+lc9hOMCWLqUGRckCKjq2PeWnYZJOesEGoS6vdJUymKDTAGD6BAF21VfP1mH6a/xG9RwgQxGzCUGA0HqaTeOVsglLPX06wI4SlWkcm1Y5nDDysYjBw+GonffgAaFBmXQeu0eKBl6vdyiFsfin2LjuWkSN+DfZoWJM+VIlBEYTAr6d3dNVgmn5TQraaT1Gtdi4rfPctWjWDJ1iEVQ==;
 7:mzauu1lbbA8kJJCcIi/BARtKEXgXr0Tte9ak0jshrJuYyIRfYbGjckhB1FIuJgWM7yBMUc943g58LxL3gesjRYkko6s4aidzsMywgL/nBijr4RyE3QTRqH3vK+RtxxFbceMXZm54UYEg6o4sbG4vTQ==
x-ms-office365-filtering-correlation-id: ab2a15a4-801e-441e-6e46-08d685cfe525
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR04MB6079; 
x-ms-traffictypediagnostic: VI1PR04MB6079:
x-microsoft-antispam-prvs: <VI1PR04MB60792315E01B8D4C1927506D99970@VI1PR04MB6079.eurprd04.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(4326008)(68736007)(6486002)(486006)(14454004)(2501003)(305945005)(2906002)(476003)(2616005)(66066001)(14444005)(7736002)(71200400001)(71190400001)(86362001)(36756003)(52116002)(105586002)(256004)(53936002)(25786009)(26005)(2201001)(8676002)(81166006)(81156014)(6116002)(106356001)(6512007)(3846002)(6436002)(102836004)(8936002)(39060400002)(97736004)(186003)(478600001)(316002)(50226002)(110136005)(99286004)(6506007)(54906003)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB6079;
 H:VI1PR04MB5726.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 51mdcFn0OOt6J1L8G+G2dM2BGlGEKMu+1G90lhV/ig4DtChyaKK60/4BSemEUlzGmFtz1J85E+i4ug6tzlMnTq1wLkM29MnggPz+BM4udslFJW70STulJ9mL6RV3OqgSFfu+QIaARZsRrgqzVDXne4htD0/7S9kv4YjZEC9K7VtkUnVA4syLLSfkuuweQ08JaNUzaPmhHNJv6vF2i3AhYtRHHw3FHcbmhxVgsc/z/NDHS33oGDuPvMJi49TWWtiHZ3AY3LZALgOJERozVufRemCQ/EsJA7Oz3yP4H5XfVvGAimvhLlHQAHtHfofRxe1F6VCp44Bse1YGSDm0lnS8JFEx5sQvl5YpPaZAEz9GmsDZWOrNnvalAytULC4zqfXvVnJdv3fMbr7iK1AAmSJ3kdZ4aUE6CUGniLDWhCEHWqg=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2a15a4-801e-441e-6e46-08d685cfe525
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 09:55:23.5390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_015530_928288_74F11ECB 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Typo fix in Author Boris Brezillon last name and update with new
email address.

Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
---
 drivers/spi/spi-fsl-qspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index f0a340026ba4..6a713f78a62e 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -10,7 +10,7 @@
  *
  * Transition to SPI MEM interface:
  * Authors:
- *     Boris Brezillion <boris.brezillon@bootlin.com>
+ *     Boris Brezillon <bbrezillon@kernel.org>
  *     Frieder Schrempf <frieder.schrempf@kontron.de>
  *     Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
  *     Suresh Gupta <suresh.gupta@nxp.com>
@@ -959,7 +959,7 @@ module_platform_driver(fsl_qspi_driver);
 
 MODULE_DESCRIPTION("Freescale QuadSPI Controller Driver");
 MODULE_AUTHOR("Freescale Semiconductor Inc.");
-MODULE_AUTHOR("Boris Brezillion <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Boris Brezillon <bbrezillon@kernel.org>");
 MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
 MODULE_AUTHOR("Yogesh Gaur <yogeshnarayan.gaur@nxp.com>");
 MODULE_AUTHOR("Suresh Gupta <suresh.gupta@nxp.com>");
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
