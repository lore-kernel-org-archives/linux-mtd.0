Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEB7C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 21:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EEC20684
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 21:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tj91br4w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="a+og0q+2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7EEC20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r7jC9C96/YUoT0pS1LLCdQpIzDVK3iu6GyMGIsr0dXw=; b=tj91br4wbX4han
	lhHRFVCcN6o1/OE68zPyzx0EKUVdMC/XdWSx3WmjqxxhwvGiF7pPQ5LbYpCqM86Qt2Vbx9mxUROOG
	OWJSCkBq/N2zH5177n5HhHmxvH1MgGAU7rjgnelj4uuU3cdLvnuaNzjor5AWQESBqkF1RuJgritzI
	xd/SfvDIMCVFOMKYDBu52VugBAaRwek3ilg2K3wOy6To5HuAnBAQeKn5kJsxMTUSUkderyOoQ/fbU
	NZWvRL8AF9/R+YK6jzXZkJ5gb5UzVN6KLZ1+dpyXOBSBdolm0lEw7nWvYWVsBCepCBYiWP6MiGFcF
	F92Xo5VgaVoza9SyU65Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJP8E-00050z-LL; Wed, 24 Apr 2019 21:08:42 +0000
Received: from mail-he1eur04on0616.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::616]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJP8B-00050C-3z
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2019 21:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+wEvndaxB2q9nE13nG+m5UVzBdo6Iso7ASKP+rwyZM=;
 b=a+og0q+28gThIAIJ4sPqVOE4j95NukOITZb4QI2KrSODqGK+nw3b/Mwfb4H/gOEsxwcg1LojDt0J2gHXoGetED73USNeqCddFAieJKSy6+JCwfxRjNqwt/Lxxe1pY5C7Btj7x5LWpHhshYOQGs6VEmz5FlKRfRYT1a4orSK1HzM=
Received: from AM6PR04MB4967.eurprd04.prod.outlook.com (20.177.33.210) by
 AM6PR04MB4503.eurprd04.prod.outlook.com (20.177.37.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Wed, 24 Apr 2019 21:08:33 +0000
Received: from AM6PR04MB4967.eurprd04.prod.outlook.com
 ([fe80::ac11:250f:e99e:8fd3]) by AM6PR04MB4967.eurprd04.prod.outlook.com
 ([fe80::ac11:250f:e99e:8fd3%5]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 21:08:33 +0000
From: Han Xu <han.xu@nxp.com>
To: "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: [PATCH] mtd: spi-nor: Add prep/unprep for spi_nor_resume
Thread-Topic: [PATCH] mtd: spi-nor: Add prep/unprep for spi_nor_resume
Thread-Index: AQHU+uHfbtBiSaKzx0CN/OQDDONR1g==
Date: Wed, 24 Apr 2019 21:08:33 +0000
Message-ID: <20190424210818.25205-1-han.xu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:805:2a::31) To AM6PR04MB4967.eurprd04.prod.outlook.com
 (2603:10a6:20b:7::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=han.xu@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b62abdc2-a5df-4fce-4fe6-08d6c8f9021b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR04MB4503; 
x-ms-traffictypediagnostic: AM6PR04MB4503:
x-microsoft-antispam-prvs: <AM6PR04MB45032F7E6F76985F6297406E973C0@AM6PR04MB4503.eurprd04.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(366004)(189003)(199004)(486006)(36756003)(68736007)(2616005)(6512007)(6486002)(6506007)(476003)(386003)(73956011)(256004)(14444005)(4326008)(186003)(44832011)(66446008)(102836004)(64756008)(7736002)(66556008)(53936002)(305945005)(66476007)(25786009)(6436002)(66946007)(54906003)(5660300002)(6116002)(81166006)(8676002)(8936002)(478600001)(14454004)(99286004)(50226002)(1076003)(66066001)(26005)(86362001)(71190400001)(52116002)(2501003)(316002)(2906002)(71200400001)(3846002)(97736004)(110136005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4503;
 H:AM6PR04MB4967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fsDWoSmcpb5dy0G5txBtKvhhAB4zl1DW/l96pxX9xT8BnLlwt/8Ov7wXRmg3KHu8ugXZhPo1cZEVVEJjnpuQf/AN4yVafvyQIjQ5nx0L+E2NcWhLwkzjIImZOuyp0aQnndqs1efkC/BbTOSYAUHEP28vJCdEnrsAsztqZuCkF/yRYSvmYxdybmgH8mbZy3Lmcgf1zMETgFBB9rzRZRaLuGUsHxketq3NtjGP4u+7uGlMnOwMX0hyRYLcXule/oOYe1OULFlT64sgvJEuU541lPyQEy6Dg+idZ5nVnE4qorhBvh0W9ZysU/qDlx1p3kH+cT4zqZlM+9tBG3xHQnehquxYzNMJDs2q/G++AP3NTGoevJAxt4OqSUH2pP3k6sCg/x3o21/iK4ouZF8G3XIU8cV/iGt+EzPuj6Id6POqKcM=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62abdc2-a5df-4fce-4fe6-08d6c8f9021b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 21:08:33.1052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_140839_259869_B169ED58 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the new implemented spi_nor_resume function, the spi_nor_init()
should be braced by prep/unprep functions._

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..f6491885fa4f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3956,10 +3956,18 @@ static void spi_nor_resume(struct mtd_info *mtd)
 	struct device *dev = nor->dev;
 	int ret;
 
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_RESUME);
+	if (ret) {
+		dev_err(dev, "prepare() failed\n");
+		return;
+	}
+
 	/* re-initialize the nor chip */
 	ret = spi_nor_init(nor);
 	if (ret)
 		dev_err(dev, "resume() failed\n");
+
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_RESUME);
 }
 
 void spi_nor_restore(struct spi_nor *nor)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b0ee3d..50cf71dd7e9e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -231,6 +231,7 @@ enum spi_nor_ops {
 	SPI_NOR_OPS_ERASE,
 	SPI_NOR_OPS_LOCK,
 	SPI_NOR_OPS_UNLOCK,
+	SPI_NOR_OPS_RESUME,
 };
 
 enum spi_nor_option_flags {
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
