Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB45EC4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 16:05:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA40214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 16:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMYhV2lh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lxcrKxIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA40214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLuEldSVISR5tczTwsOujqo7bzEzMmG4Jg97WmF7TwA=; b=IMYhV2lhkf8Zxa
	1vNaBfreAnqlC1EdLCSHGdg3yjzp7vXeiTQbJgudMGnNCi5Z5amm4HtnDtX+/VRsRQ0vjM2sjL2Yo
	HXufLJc1Zp5a9FycMRzGkMCSomdXoxfMXgwNBvyWUHhu38kVCmK8SSHYiOYRr+YDQfprXEUdRtjSe
	8bpbRAGnNEE2+iYDQnQLrhcs4T8lEqtWisN250HxTzzz2rp7JKMCik2nF3WxhQrHAmPQvpMsnt3pV
	fhr/Lsj6U6gZGGGhAS9lVFaC7ugcPkdqnhkYv9hQWogR7LPvK0G0iVVjCmLsI+VVKLn1lC9z4Kqhl
	E6VzChG0OXKmbe+46EaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAFyc-0001Pp-7U; Tue, 17 Sep 2019 16:05:14 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAFpO-00084F-IN; Tue, 17 Sep 2019 15:55:46 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: q5WoxqXfQ3OzCXo/70w7AwtRyzKxh94mJuolg4pevnAdlNP2wRGTdpvs2gVVPzB8/TLdOFjcBA
 h6Lx2mTx0PpqwAoV7NI7YAUbiBTXCse03fzcJLEdJ8rcBuwd2jsbhMUNPq2yEYpwkx1jnm05ZW
 E+WsLJ8nZAjLG/vwW/yXZ2aGQRZFC0KtTbGocU9JclB8FpxYPojTBpH1cn4beYbKzD9cS8jCxe
 ApOH+SyPpOJpyHwOckUjuoZxF3alJ0pO1oo1JqyCCfau+VU5zAhujOGWftp0nq3pkndado3F76
 cTQ=
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; d="scan'208";a="46517800"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2019 08:55:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 08:55:35 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Sep 2019 08:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVcdxrDsgWE+KD7myC7LOWPu0Mv87bX3a/mPHVRpU9tHeRfpTQTxZpMt1RxApWl6MBGlRg6KHn4r3+Ngd1Q+37LQCtm3MV4n2B8akE9huCkwnUgYsMSbb8RYHnrOz6EWIlCb8UesjXVxQPPVERDjnGnPCO9tvonBM9uBhu4rg1mDpZ0srQzCb6Orj1lrUX1enFBDe+ASIbuX3vdJhp811bAjAgN+vmTbocK7jNh6dxCumxgdVGJgrgAACoB2Qez7F5dbzkoyHzyiHAMJjQUBvhMA+F+R19XJjEtRuXK6zcwTi8ZR6r8F/T653RNrqToD/5oONecqKnG6y9ZWsN3HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBL7iguiLlSDqFSs5hLH0kmhMZIgle4FL89EChz1KT0=;
 b=UcZdPcFMiAZb6tfV9PMIQemmm/A7SNUFkSpMpMwQPYoS9XbwCDiJ3wPpbEzv2ggMhU/aG7e59oN/ZQimfAU2L65uZ841ZUAJlpaf+xFVAQmmHhSOib4ZduazvbDmtQxxFJH1+RuLAW9r0zJ1hDHSgx1pGbYNKCvb9JRjRn5FyS9rajxhu34eUz1A9efYBWQXynplSSV79bdu+VhL2wmS0J6Hg1Btljox8udEXXxbtUnoYrDRKPsAUlXrNeV6NKBu/srpQmxKpdTL0sGPlo8ORsG5/jAxrsOtVW5SD94peZnmzU2X5wfx2pbMTrFO6eL4CmZ3GC7rcDMtw+tBUdIGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBL7iguiLlSDqFSs5hLH0kmhMZIgle4FL89EChz1KT0=;
 b=lxcrKxIFweexjjVGZXzLpHeavvZ7FXka4kG8ifFY/K3ix8QQZu7cfG2Z7iYrwZreqbPFJ1JGzDlTh1vg8xae/eKX7PNV7lkeLIbTF/eg4VBIDQ4w9WajC7WOnzWyiKvlTWdgSmYeJjD3p+UCXW/V5aNXO1gehOR8jYqKddkjXBU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3725.namprd11.prod.outlook.com (20.178.253.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Tue, 17 Sep 2019 15:55:32 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:55:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/23] mtd: spi-nor: Fix errno on quad_enable methods
Thread-Topic: [PATCH 16/23] mtd: spi-nor: Fix errno on quad_enable methods
Thread-Index: AQHVbXBWK2z2ghqXAk2rbgya4YOWuA==
Date: Tue, 17 Sep 2019 15:55:32 +0000
Message-ID: <20190917155426.7432-17-tudor.ambarus@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0007.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::17) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eabe5cfd-42f3-4d89-4a45-08d73b877855
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3725; 
x-ms-traffictypediagnostic: MN2PR11MB3725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3725B13D3ED19BA9EBA519CAF08F0@MN2PR11MB3725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(76176011)(52116002)(5660300002)(71190400001)(2616005)(6486002)(6512007)(476003)(11346002)(81166006)(6436002)(66556008)(386003)(6506007)(26005)(66446008)(66946007)(64756008)(186003)(66476007)(102836004)(316002)(446003)(2201001)(110136005)(54906003)(8936002)(107886003)(478600001)(50226002)(25786009)(2906002)(86362001)(81156014)(2501003)(6116002)(3846002)(256004)(305945005)(7736002)(7416002)(99286004)(36756003)(66066001)(14454004)(8676002)(71200400001)(4326008)(1076003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3725;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aHLH4Aq+wWbztE2OuFXntWxKRSvEwFl2UM7MaM1gDMs3wXamfIAYj/hzYKJ0DbonHjsW6TenraWCV1Ml45CpNvuh+heCJm8jVxHZ3KO33P6h3+rol5TT5Txfpy25cTXEyrOk98sDx32QB+dIAevwMyQ4rLb5STDR8UAZ+bOhDNmUDBq/KlsXCn6vzRIGgcqWSXybTYTXJK2q25W1IkvGcEom8q+HBxwx/M9Kr17cBnnr/LCL5ytj0Ip3dfzrPIac1NxdR2UGOWAR7GKghgXyU1HciQG3F/OfYkXpObAJrLXRgUk5b+KwOlUEAq4Y7thG6y2JDghRe9h9dnbBdxDzUnfQphBNAYzym7EchkxPRfnizfzpvZ6wSNCfyi6O/9qGcyCyUi1Oe0+5lKVbnB0tpKjWQZhB/iub4m7WElWEq4o=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eabe5cfd-42f3-4d89-4a45-08d73b877855
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:55:32.5671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qW3BmoKn73Q/7p8babo6HX9bRg6+z9Awxg7zIPty4BOl+VOOvi6VPImbuXKL//HwBp6VJ+lqleErhND2Bd8n34U9dRxR1YyBWtzGAFJJJR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_085544_269718_DA013961 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, Tudor.Ambarus@microchip.com, andrew@aj.id.au,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org,
 joel@jms.id.au, matthias.bgg@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

When the Read-Modify-Write-Read-Back Quad Enable methods failed on
the Read-Back, they returned -EINVAL. Since this is an I/O error,
return -EIO.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 20d32b7db268..303a7bcf3423 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1862,7 +1862,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	if (!(nor->bouncebuf[0] & SR_QUAD_EN_MX)) {
 		dev_err(nor->dev, "Macronix Quad bit not set\n");
-		return -EINVAL;
+		return -EIO;
 	}
 
 	return 0;
@@ -1940,7 +1940,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 
 	if (!(sr_cr[1] & CR_QUAD_EN_SPAN)) {
 		dev_err(nor->dev, "Spansion Quad bit not set\n");
-		return -EINVAL;
+		return -EIO;
 	}
 
 	return 0;
@@ -1985,7 +1985,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 
 	if (!(*sr2 & SR2_QUAD_EN_BIT7)) {
 		dev_err(nor->dev, "SR2 Quad bit not set\n");
-		return -EINVAL;
+		return -EIO;
 	}
 
 	return 0;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
