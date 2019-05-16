Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CA2C04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 10:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D8A20848
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 10:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j9HWdCij";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="oYB59ACg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D8A20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yndT4vYrUVl/vXQzAxu1gY1rWrYcb4hU6pE9h3+uohY=; b=j9HWdCijmVjkwU
	VSZrJXPnbY/hwX18XPXDFipVJ19GHNALRXvLUfzFG+sA6/yhQiHrpQbagnFlY9KHa2BJIrkUW59cW
	6NQ/upaZark/6VAVuqw0c+10Lb+7Feze38R4sfuIE/r+3zmKNb/eSr/stwnCi5iEK/POz41ekssD3
	qvBW90BtMf2IkdLwhc/xFxzB552/mmG9rM/u7jtZDp6KzdZD0v2qt7p10eQgZ35NDvpW7ht7BCwcm
	+b5NPN6iUuwdvTWT9iDTNu79JfZNHAGL6scx2HxjnzpbIXnWzukruciHohYhoBwkw8XODHyNoP67b
	5xEgA1UoE4EpPZsg2Thg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRDpY-0002z9-O2; Thu, 16 May 2019 10:41:44 +0000
Received: from mail-eopbgr50084.outbound.protection.outlook.com ([40.107.5.84]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRDoE-0001Bk-Fe; Thu, 16 May 2019 10:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEYbYoqtoaCO5mnD2qF5OBSQYRXuDBlN326Q1NqNL2w=;
 b=oYB59ACgNwowzTK/Nf+ZogaGOFXzOzQ5fk0LOccjSM089odDSFuU4R+UOlK7fKtZRb+AcSNLazDjqoU7ceKjeJB9x68PyF1rh0v/oOBh20oU/j3+8CNh63J6gsRwEsn6DHOeS5Gug0FbzBib/6qetb62+JfLebjbO3RdNziLKGI=
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com (52.133.43.147) by
 AM0PR0402MB3460.eurprd04.prod.outlook.com (52.133.48.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 16 May 2019 10:39:46 +0000
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::f891:76d:8a6a:3dfd]) by AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::f891:76d:8a6a:3dfd%2]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 10:39:45 +0000
From: Kuldeep Singh <kuldeep.singh@nxp.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add ls2080a compatibility
 string
Thread-Topic: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Thread-Index: AQHVC9OtkL2+pIZt7Uy9/HRX7rIojQ==
Date: Thu, 16 May 2019 10:39:45 +0000
Message-ID: <20190516104046.23830-2-kuldeep.singh@nxp.com>
References: <20190516104046.23830-1-kuldeep.singh@nxp.com>
In-Reply-To: <20190516104046.23830-1-kuldeep.singh@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::23) To AM0PR0402MB3556.eurprd04.prod.outlook.com
 (2603:10a6:208:17::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kuldeep.singh@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [92.120.1.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a98e20a-a305-4d05-890a-08d6d9ead00e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR0402MB3460; 
x-ms-traffictypediagnostic: AM0PR0402MB3460:
x-microsoft-antispam-prvs: <AM0PR0402MB346011B28C987CD3280E6401E00A0@AM0PR0402MB3460.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(199004)(305945005)(1076003)(4326008)(71190400001)(71200400001)(8676002)(26005)(6116002)(53936002)(3846002)(8936002)(81156014)(81166006)(1730700003)(99286004)(256004)(25786009)(6512007)(50226002)(52116002)(6486002)(6436002)(68736007)(2906002)(5640700003)(14454004)(76176011)(86362001)(6506007)(6916009)(386003)(44832011)(2616005)(476003)(316002)(7736002)(186003)(11346002)(478600001)(66066001)(2501003)(446003)(36756003)(486006)(5660300002)(54906003)(73956011)(66946007)(102836004)(66476007)(66556008)(66446008)(64756008)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0402MB3460;
 H:AM0PR0402MB3556.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ROgUAS2hbdXiKezD04XNaRsVGzX5vEC/9NNRkhAak+L20TNd5zoNvhljdHnEE3A9Tb4oar+izP99MTrto+EuGslzlQLwX5iGR+CIF8WOaE6stOoMcWTIrvOv95nctWNySQ4XEG4088Xajkljkk4i0TcWnum8I/qszLtbt1Ytjlb3Tu+9UEzgpOnw5V6HKdNG8bS14pyjyF7SdzwwwCyjvJjf3thUjDrcMv6TR7QPxspv/wfy7aF79g9JKFHidzf3PB1v4Y4+3IWs0V+YNnnQdwl+nslHjhyyMNPp71gtl7hvDUeoTLkPLPxSlTGeHkYdOehPKo7vwFArlb6hBqy2iWNXxLtPKSpHEbtvbm7O6u/veiCID66Rq2qV8v716fcIwhGJVd7/Teva1Fi/2A07z8OjI3STffrrD3fLTM+/nBM=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a98e20a-a305-4d05-890a-08d6d9ead00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 10:39:45.8820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_034023_078964_117D1DB1 
X-CRM114-Status: GOOD (  10.68  )
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
