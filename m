Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA35C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD195206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGJbj+5b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="CtQMnPMI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD195206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5yLYD4vZ+gjvRmfiOEozkh9foIU6+T01RvW4YVBvYE=; b=MGJbj+5bMtYZDO
	iEuPSbivgNJ5LYehl42tHSCbZ5irTK+GnneFaYpmj0IAQBLiPw4iz9WQuttv3WRyIja3O3BfzOJRc
	wJUXBaNG0tl6EqUBRtsUrbQnO3rAaP7HgyClZxbJBeVnlQ7XM9WdFtl88AAJKL56xfR2k2MnZUKXq
	IUcpqSsuMDScPtbgMoXswV4mT/73GPok41yVxkmjo64coVVtIIhrnNC3DXttFv70CDzT3oc4JGe8C
	LXrINlmgqbAC2BmDFTob4HRt02DJiLOXq2OvXnJJcum3r8IXJzbvQ5uRAtcBZepyHLw1hvdXNgMAH
	09QF1tGuA6/HLIsFsU3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6HH-0002mf-18; Mon, 11 Nov 2019 09:46:31 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6F5-00083N-UH
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:20 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 5nyjJEP5UOy1YDqHXQ7B9aV1CAavZ6W8wSAjX0izGOV7PwDcOlMmJlC+viBq7lGNaO3TjuF05T
 2YfsNDCDLLvZGsB04W6Z/g3oZFm+ql5ObkbXiCcyH0iDB6ZMES25/65XVULSrkq3uyHZoLINcT
 MuaZZYHsP7iN9KyX6BtYsdpbP84NSzHwWN94UlLDq40DHJSbqr6+x7hxS6JzpLyP7EFWWAxCOs
 Bgx0Bj3A+daqJ/qlfhLotdvljSC9055LTJhacT2loegfG5G5MsfRtpXLt7ZO9JQfkIYcAdxjdw
 XKc=
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; d="scan'208";a="54853992"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Nov 2019 02:44:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 02:44:10 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 02:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAKQhc9rnN092lexA8RGscyCv35cZUL0QURC3L0WagJl4wexVY7/ta0EB0EVFuxg/OP0e0p3aLoNOAeU7ArDcMAPSNzGbRBxcmGji2F+1ne6XI0Nsmfe3KfUqz3XuSGtYhCluuYz4eA8sRGB4xYuH+XbmruH5Isd5w0BwD3iD5s8jy3+6o+rh7ysWtPXDYJlnU5G4wZdr9cP6FbECXRj+WWXoR2Iux/KlPYIDASAyd+HBoonhKKlIsEF2yKn5ZjQODgTsQULCHQDi3IK1kmYifsdJKqTbgWBQsK+RPYnJqbAsZphTPkgeHaU2ph3m77Pz1ul4lQnQgS/xTATGoYJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsBDjKU3P/fwUarWajpSNTbdg0qlGUNAAeTiJp9vIkA=;
 b=hPJFisXFNMlUTHvw6LawqxLh2Nf140rCzL5ktlzlfgPu/yxELqGD62+aISLRKtUv01nsNaFRjQhQ8AXPqsm5t+o8TqOtw5ewavBGVYnyNKfODBuB8QaeqWKhXw3dUS5vvsjGE3evesmDgoVhibxL2UmmfnXGEA2V9Q/oHxvF2p+M83U1a8LbFXKKQPy/ZD0VUjyHLuJygbg/KqrJS0Vp0W1J1nyZ66PDV6r1Qbwfnl3FgSmJfLL/kNf4kNQNviLtJ8bmSyxDEiV2eqtu+7ZYHGxfmEU5PZIHAFrzZtBcLhajGrWkn77tRXfHwvXGVBq8M2hwekEZ8Ss21rTARLZwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsBDjKU3P/fwUarWajpSNTbdg0qlGUNAAeTiJp9vIkA=;
 b=CtQMnPMIH2fBb3WSsPi08fuYIxc1sFtA3XZoPmRwMi3XDsZLRNUN+qNkeG6XlU1JQ7iT8+nf93Czj3FZlnarY+1RmI5B+G2bwEyIM21NNEDNOHNmekps2kA6JpRMa7CszBeE/4B7ILji0egqr1OJYB3p6Tie/zJIJIdlQfIGw+o=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3952.namprd11.prod.outlook.com (10.255.181.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Mon, 11 Nov 2019 09:44:08 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 09:44:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: [PATCH] mtd: spi-nor: Make sure nor->spimem and nor->controller_ops
 are mutually exclusive
Thread-Topic: [PATCH] mtd: spi-nor: Make sure nor->spimem and
 nor->controller_ops are mutually exclusive
Thread-Index: AQHVmHSQpwLCmWp+9EG8iC+d50bhxQ==
Date: Mon, 11 Nov 2019 09:44:08 +0000
Message-ID: <20191111094358.8271-1-tudor.ambarus@microchip.com>
References: <20191111100241.717a8fb9@collabora.com>
In-Reply-To: <20191111100241.717a8fb9@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1d33535-8eca-4d7b-8d4e-08d7668bb2ab
x-ms-traffictypediagnostic: MN2PR11MB3952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3952B8C29C6118581B051D61F0740@MN2PR11MB3952.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(39860400002)(136003)(346002)(199004)(189003)(25786009)(476003)(11346002)(81156014)(81166006)(66446008)(446003)(66476007)(66946007)(64756008)(2906002)(66556008)(8676002)(2501003)(50226002)(386003)(6506007)(478600001)(52116002)(6916009)(14444005)(14454004)(8936002)(256004)(36756003)(76176011)(2616005)(486006)(102836004)(5660300002)(186003)(7736002)(99286004)(316002)(6512007)(54906003)(2351001)(5640700003)(6436002)(305945005)(26005)(1076003)(6486002)(71200400001)(71190400001)(4326008)(107886003)(86362001)(66066001)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3952;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pEZRKK1R4brA16iZ5zV7Aj3VOt9ZMSaon419ghrMtpC1jy7xGeMwWOmDyYmTa9PFbPk3/VO7i6DpqvRkcaEItCscAlNgARg59R5v0e8cMR+bvvQwggoKBCFGfUe7z4C7MUi/w5HZNHncqdD5IDTxOscJnZLo9Y4OoNfqBQbiAaP/BrBnMYJnoGUAb0EeJR4DUSsdtxpx8Zo+Nr2MqsjiU+RaBAofRPLuql4GCMW9gn0R7mfBWJ3gcvUu10qKXbTQLZEXgGou7XYzcbrLEMi124RB1dyIGdAle2zfCsAaPiGUYlVF5m3zj4vjRDAVyAuvj8p7qBaw3dWdlod1cBelemEKfTbK0g3LPKHpNiInr7SdIB6gYEIZT8pg3QEQmHOYoXmvacIqVLipUyhx6LP0+SyhXDwpVEauPmnlQj9z4OpIl2X/Ysoki++H7pXUae+7
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d33535-8eca-4d7b-8d4e-08d7668bb2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 09:44:08.3737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubojthSEhVnITJGPKqvhe70Cii+YznQ+elqxjL19eg9tvOJ5a4JkpYAavbLJHRsFmT8KmpfuU8Bq8DkUzDTnGdilxhGyz3PBjRaZtWIsSm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014416_119688_3CA1D503 
X-CRM114-Status: UNSURE (   6.32  )
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
Cc: linux-mtd@lists.infradead.org, dan.carpenter@oracle.com,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Expand the spi_nor_check() to make sure that nor->spimem and
nor->controller_ops are mutually exclusive.

Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v3:
- split checks for better error accuracy
- s/mutual/mutually

 drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 824649eecd59..f5d24ccf5108 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2878,6 +2878,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev ||
+	    (!nor->spimem && !nor->controller_ops) ||
 	    (!nor->spimem && nor->controller_ops &&
 	    (!nor->controller_ops->read ||
 	     !nor->controller_ops->write ||
@@ -2887,6 +2888,11 @@ static int spi_nor_check(struct spi_nor *nor)
 		return -EINVAL;
 	}
 
+	if (nor->spimem && nor->controller_ops) {
+		dev_err(nor->dev, "nor->spimem and nor->controller_ops are mutually exclusive, please set just one of them.\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
