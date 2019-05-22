Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8150FC072A4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 07:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5453320863
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 07:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lhuYo3e3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="S/vKgDz/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5453320863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3rq6P6nzuZ/UkAG4NQajjxFOSQuud8QG2Gwq8+xgMk=; b=lhuYo3e31uNmMt
	p9017udVHOleJozE9S5ePLk+nXpDhIj556eOjH6//j1/3+Ck3R93AKSC2lwA3+z3q/9x+c0neuhpE
	DlTWK0cG78slD/ip7OlGy1zFJzWF6AcfO8FSc42b5v9L6d5WxyNQyLszddktGUJijpbe9v8tyzH0J
	Mff5FiG5hyJXAMGMpJXnI5zXVVVY02TqXzUmJvSTCjPpyBy0oG9YVi9XJdbZO+5AmxmGyowt5nnlz
	zweLDHBYOzAsOFhJLd7/NOQZ6V6PS9YMzF2jkQBzGGnVRol7WAMHL51iJDGw1g5vZJnfZtNK3k9P+
	DPX+DnAwy4lG/fxE/YeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTLFQ-0006pf-RA; Wed, 22 May 2019 07:01:12 +0000
Received: from mail-eopbgr150048.outbound.protection.outlook.com
 ([40.107.15.48] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTLEv-0006Ak-O5; Wed, 22 May 2019 07:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VouzFgy1tRIaaLkbEIf0KeePJOl53KNIVhskIt8H/6c=;
 b=S/vKgDz/iUrbdRO+C/X5tHqeY6QW1QqkJc/abguSRz7DOepiZLbI0nmp5k9bUwlGPC2r4uGK0qrzblOsbUykfdK7tfYSH4BniPKjZLrhqtweTk1xOFEmPFLIMptEkVfDU2hK0VfJGXoCLZKZnmbjSSxpDpgEnrQK+yty/20rzqs=
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com (52.133.43.147) by
 AM0PR0402MB3668.eurprd04.prod.outlook.com (52.133.39.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 07:00:34 +0000
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::f891:76d:8a6a:3dfd]) by AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::f891:76d:8a6a:3dfd%2]) with mapi id 15.20.1922.016; Wed, 22 May 2019
 07:00:34 +0000
From: Kuldeep Singh <kuldeep.singh@nxp.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Thread-Topic: [PATCH v2 2/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Thread-Index: AQHVEGwN9+M7FDipQkqKEM1raTNGpA==
Date: Wed, 22 May 2019 07:00:33 +0000
Message-ID: <20190522070133.24953-2-kuldeep.singh@nxp.com>
References: <20190522070133.24953-1-kuldeep.singh@nxp.com>
In-Reply-To: <20190522070133.24953-1-kuldeep.singh@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::23)
 To AM0PR0402MB3556.eurprd04.prod.outlook.com
 (2603:10a6:208:17::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kuldeep.singh@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [92.120.1.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ab10938-86ee-4255-8ae2-08d6de832f57
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR0402MB3668; 
x-ms-traffictypediagnostic: AM0PR0402MB3668:
x-microsoft-antispam-prvs: <AM0PR0402MB36688904D832548995B4E4B3E0000@AM0PR0402MB3668.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(6506007)(8936002)(7736002)(305945005)(99286004)(68736007)(76176011)(386003)(2501003)(2351001)(186003)(11346002)(81166006)(102836004)(498600001)(6116002)(36756003)(54906003)(86362001)(81156014)(8676002)(14454004)(52116002)(5660300002)(50226002)(3846002)(1730700003)(6486002)(2906002)(5640700003)(64756008)(66556008)(6512007)(14444005)(256004)(66446008)(73956011)(66476007)(66946007)(6436002)(446003)(71200400001)(71190400001)(476003)(1076003)(53936002)(25786009)(486006)(26005)(6916009)(44832011)(4326008)(2616005)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0402MB3668;
 H:AM0PR0402MB3556.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UEsqVFc0iiTPCeZNDrd0/S31Tk+34nqvqtTiIXgTlfyUPHWsk3j2dhacA8n8ZBT3zryLFU/zkhaexdsP56jTrw+tRe9RKOgbv0kieQmJy+R/BlC8V2QJubfPEi0In7a8V7LBijAvz9+mnTFBIqSrKVtImq139/lWWKllZ4joVAr/kpOKXobb64Rzkqeo0sZtPqVBVgHtx5drcCZIh/AOMVP9BxOK3onbjnB+H85aggstVaA8FO49pRFzWaqgV3yCX5g1Cx5WAz4CEuH63t60laMFrjI6PTz6eqT78RdSasOCAvyRMTOVm4f+af00pFvq/84nEffDBADgBz2/HogTsL6sspJ+NzGE2jLYDPrXbJ4gpWwtaQqbtpRiPNA28otahQwqo7sTAycbn94XJASSvt0tteZ8gvfu+OZMmSYSs48=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab10938-86ee-4255-8ae2-08d6de832f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 07:00:33.9909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_000041_883345_25AAFDB9 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Kuldeep Singh <kuldeep.singh@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are 2 version of QSPI-IP, according to which it can be big endian
or little endian. There are some other minor changes as well.
The big endian version uses driver compatible fsl,ls1021a-qspi and little
endian version uses fsl,ls10280a-qspi

Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
---
Update v2: 
        Convert to patch series and rebasing done on top of tree

 Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
index a72616a1ad2d..2c2a3e919a06 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
@@ -3,9 +3,8 @@
 Required properties:
   - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
 		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
-		 "fsl,ls1021a-qspi"
+		 "fsl,ls1021a-qspi", "fsl,ls2080a-qspi"
 		 or
-		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
 		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
 		 "fsl,ls1012a-qspi" followed by "fsl,ls1021a-qspi"
 		 "fsl,ls1088a-qspi" followed by "fsl,ls2080a-qspi"
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
