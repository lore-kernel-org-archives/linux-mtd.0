Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F60CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B0F214AF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/J27myr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="sjOB5/2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B0F214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUO2OuQQEJKnjycn3Uy6hHLgyqitNZr6EmxbS/Fs8Pc=; b=d/J27myrX7w62Z
	202LNydsFCcvAOy5phHALn8fpMiL/QJzcNvN8M0CAKp4WX9StJg8T9pHRYgXK2TdF/4Swg4Nbo62J
	ZT3tWGODqveeZ8S6LvFP3d5n5M7NVrEoYw2w2b9b6VKEwz32o5BHAsdR5dUPhFdfegyNH2IwSsVpm
	m9BnGuvag/flBmLeJ4PbB7bspugKfTCAbjGu+do5EAUFmbPeZMgDTIh3QsxA/D91KwLKYKKWKUUT3
	2plQdi42uwOIgh1OKL9KHwpkHt0oaJ3EH/52OSs4IQDSnN7gCkffAZHlS/zoEgEAzrLE1w4gdTwOk
	foW+aw3dvQbaY8TJGZog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqxN-0007h2-K1; Sat, 02 Nov 2019 10:48:33 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqxK-0007gT-G2
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:48:31 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: wrbtraoPEgzwdKikkxERcQUc++dN5mxW02nsjv2VKpQUvf5Zc1nKrRdboZwYb7C96LwmqB6nZF
 Z+3l54c2mOH+4WPf0uUYtYHsc3fqy/v2koCrRh3hit2KPxFD8T5yyCXYpanedvUMq6EB1c035t
 23R9ijyB2Q/mHrRoqyNzaI5SpLLnojauLVukW9L03NilVl8hXzK6EEbBSn5DEXz/Dj10S67mPg
 OD+6jRaQhjX8vnAy1+0b0ulch69WNJWJsEeZbH4P4cZWQ+P9QQeB9l6p4PC2ssh/HYhkkQNibV
 Gwk=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53868348"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:48:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:48:29 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 03:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNDdfGLL5nlprlZguucm3vOvJR1t7a8yCF7S6+C6tUpr+bo998kw6gZRPo0br28qffXkkecILSbIZkuYN0IKfzUfNAhSyj8fSmooxXU06KL4sMQFHdA48iDEObpccSnF2U0hQ7OqvKbv5Jbh8xluuNqokvcnGxGUvh8ZPxVjkRgdv5boUuVeD5bERHsK4UwhS2U07Y91t/vr9iZ0BcefB4d1FqR53p5kWcbUvefBFuz6AamArnufPcOUOBnYMVckJHOKxTyyeEMnlwfaUSgIKpeh5/maJHrIucz/+5JN9sTr55MfOr2J7ZqtKakbq4f5HcbYkQOyn4ijs4TuU79V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H51ctBbtACVbUouLuvQ4yKj20/eD3Jc427TsBmKLP2U=;
 b=V868xQSWBj02+ExhNvsIDNDcX7VeBNx8w+l0r7HpiCEtVg7btabpVmJlAYUl2U3K6IJfRq4TspBvfyEYek5ByFti9XUEjFGHV1oOWHnzZXy0P8YQPFOGblyJ23jBdzris771jo30DnwbPUjJ5dggj6+GincNQJFtIgp5FUcmQUim1IivQpdsijV8nciS/824qZntzFBS00TTLPFDxoOJiK6L75HsPSQLVDfZhGNKY28hTFp607yJ3orXufQveCIYw4xA4ixfGDBoqrL82HewcEd6CVqUfdn2ITykqbubHk9S/13iwa2Dfu2fwan8fUvb0E+9921pBXpsPvVin4E8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H51ctBbtACVbUouLuvQ4yKj20/eD3Jc427TsBmKLP2U=;
 b=sjOB5/2VKCZPIgAoKH7DhDML4XitQuSAfrfkcW2m41yhM6Sm649Rf5gCi+Re8Nk3Znvv3tvc39jjn0DdNo2/RhWlSw392IvNV2UVgl5JznC2oEnTyrwxUJNqMrdfIfwkuLf4NWlE6wmFVfr0HfOy+oZI9zGrdn9caiOLqhNsUeA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 10:48:28 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:48:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 18/32] mtd: spi-nor: Constify data to write to the
 Status Register
Thread-Topic: [PATCH v3 18/32] mtd: spi-nor: Constify data to write to the
 Status Register
Thread-Index: AQHVjkpsCYpkWXjL6ECEsiVdkEng9Kd3uXKA
Date: Sat, 2 Nov 2019 10:48:28 +0000
Message-ID: <7d5d6403-0a62-4a8d-5e4d-b686e7df3f84@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-19-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-19-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0156.eurprd07.prod.outlook.com
 (2603:10a6:802:16::43) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 089c66bc-1049-4884-e410-08d75f8231a8
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB362952D5C0777E0C228830F2F07D0@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(64756008)(5660300002)(3846002)(31686004)(6436002)(7736002)(2501003)(256004)(476003)(186003)(558084003)(486006)(54906003)(26005)(2906002)(110136005)(6512007)(86362001)(76176011)(305945005)(6116002)(386003)(53546011)(14454004)(316002)(66446008)(66556008)(66946007)(52116002)(2201001)(99286004)(102836004)(6506007)(2616005)(66476007)(81166006)(81156014)(71200400001)(8936002)(478600001)(8676002)(11346002)(446003)(6486002)(25786009)(71190400001)(31696002)(229853002)(66066001)(4326008)(6246003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3629;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6DBd82ke1JY/Bi9t+T8l9VxGGyfz4C8fkjCQD20ZQ3y1WFilV0l7iZRybLnM1fH/Qpbs3gJoYIe1WuBAvk3cDj62Kdrb0n903LAzCox/0QfExo7dmbdjfcESRO/Hsl4JEfx3aieTCHEhx5dl+Y72LwLUm46p81PhSbw5dP7JrY5uOctRgFSLc1tOQpHDfrl6620VK2voK36ZFqefXsiJOjlCCIfEFuMIlOIJ8trxlEreEyb1vbWvBMSNRRRWCwLp6n2iGdlFLXR+jcoYHrRh0XxPU8XGctvsYn9VzUQgf0R6n8eC8LBj71t+eT8QxnTeQyPh41mD0GKq4rwtfqfBRZA3EYpTZp5d4usfiVD9R8Xw0YQi3ybwtdaRVQouqo6Z1t+ujbbZIfmT50v+Id978O8vuEpE23TyXAqXJnA2rqvIFOGOUIa09ch8DbZHEDJQ
x-ms-exchange-transport-forked: True
Content-ID: <9CEAFB6C08CB41479106CE6154F9199C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 089c66bc-1049-4884-e410-08d75f8231a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:48:28.3391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuWHJUzIAcfCzDVZcksEupagkn/QceeOJjhv+Rw6A8fa6XML0p/26fauyZVURqce0sXnxA7K16aE4Y3y12Mrxa+G98HtF+KkUXb1B4hiV6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_034830_583160_90F2588A 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/29/2019 01:17 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Constify the data to write to the Status Register.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
