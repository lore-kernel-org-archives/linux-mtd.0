Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D226BC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:28:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22E62184C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkWDoiwt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="g+58+4CZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22E62184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSu4GqxS10FjF0a2eZsa5M8bvUsg7ZQkPu8ISJSmSGg=; b=bkWDoiwtoz5PrW
	Fp82Jgqm+q95rKLodVp03rh/ILuHfIAoc7Piw0/5Do5Je2tPVQ+1kY6XNGk6E/zk83m2K/mDQMOZ0
	cgXbYimtZ7ve07oLdg3dp/1rU5pzltZjlgBVp/x6sjVUlx3jsvLJ1DevT1A5vPA8D5nGc+5kNUTOT
	bo35tncW9d7wuXtIyzeImblvjZ3bjh1DDGjB8y4QudfU5lPgDofTPe73T++2lWw4Mq3Q+QXcaPGpx
	kC4ZIivnA+hJ4N2E1LpkvgLVKwdQtQgpZ9SS1uzTEa9kxAKU8J7PbHPgpaGYhJ5yQZWIwkw21/r0O
	y5gE0ohSiDSiiF48XXSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFMI-0007SC-P9; Mon, 11 Nov 2019 19:28:18 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFMF-0007Rn-Nu
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 19:28:17 +0000
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
IronPort-SDR: AWf6sTb/Eo20aMmAfNOBXxsTugFh5cTur3+RFqiSaDyfJ3HskOgUTWP6+BLFVhmiKWVUq1mkBI
 3mdtDL5Br+hLabTWu71a70h9kpPkcX98zspWKh17s+926EKC7/ivkt+zQRiMJ/hiUxUQ2FBiuU
 v5i3jzdE5gCSfugdsKXTM9KtAJVPFWkoFCTknDk6ZcuJBr5N72aWEoVVSj+kBwyAC98pAkm6NJ
 r2TzAABmYQoMuhpe+YH4CknbDdduLqOmK1Tr9ruXuM5scJM72NSqbAgf5Zek3IN/L5yMf7KDvi
 QQc=
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="53780336"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Nov 2019 12:28:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 12:28:13 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 12:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jj9hufI34oGrhk15MazjXIOcRPFrkFvcbEl5W16BsD8PKk6ovRZTqEwX0MNzZUAhXfUTYGMCu4G6/keE8BVshjRNb82TWPMpirMcMyzwKNbZWx/pxo1kxrpTSYXkf/SRFfPbEaPxkmz5swo7d1wq46/aG9B8NQNSZ3YfQMBhhPGavUu6vC8USN2Z04ueOewlGKNICaX3jXlLFF041rtQ4sLg+xCtwvDLgv2YTSwvXKxPr1xh/OLgWsKNlY5jKXWEhsYolJ+jZ5ZEJn16+OckS/W8Jp23HzP08hiqlWfjRGWlFfQeh1DNA0iMYBJAC/x2hwTvhD04AOycOfV7uv/UQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzuyVt1HdOy6E7/Ak7Osai5soea90jBYTDBn1JSKtw4=;
 b=X5K+/SVKuULaGm7ZtOe7RRJ7AmA1TGu5SzeX3rYWmqRHw1UTkaONalSRBjfl0SPrmdEy1Qyn4sANwRkzZE+XglANlAXdbgt2/rmupZSOF6RRBK95kof4/rTXJGfHneIBn05SO9iyLZyhgJL6LQv9Q5XoDSIPvooOzQJRwNdT1Cfgo9baS/4/2UO9WGH7Pk7OF4RO3lc1M+TwHMbXmRTB3m8NVQUkeWz1ZaWcuaVpCroFgws/XZv97//uzhOfTXRdAiIsWNlEikpeVpVrguYUmiLwLEG926ZfHTWvA9hcCkHmAWlenf8DUCJRLdX5zw8Y6zoUbKo1O2hokOocEnGNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzuyVt1HdOy6E7/Ak7Osai5soea90jBYTDBn1JSKtw4=;
 b=g+58+4CZD06NRawDAKCtJNkdQCeR4lKjQ150QPNzlKa+LtYDGI6CO6hdBQPcPQgd6Zm+ddpz2gN0PckGcXevZVinh8ZiNfBrqhoR/Rs/E3RGbM6S9/uxrp9bBd364B/Ur4OU2aB35/bdVqsGji+/nJBNBJ5UmP2oZAkM6y9djnY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4352.namprd11.prod.outlook.com (52.135.38.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 19:28:13 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 19:28:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Move condition to avoid a NULL check
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Move condition to avoid a NULL check
Thread-Index: AQHVi0B8ZFvBMGy4IUWcxJaI+wCV6aeGdcmA
Date: Mon, 11 Nov 2019 19:28:13 +0000
Message-ID: <15f0d059-2bae-4ce2-6f42-2ec52e94307a@microchip.com>
References: <20191025123217.12790-1-tudor.ambarus@microchip.com>
 <20191025142811.541-1-tudor.ambarus@microchip.com>
 <20191025142811.541-2-tudor.ambarus@microchip.com>
In-Reply-To: <20191025142811.541-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0154.eurprd07.prod.outlook.com
 (2603:10a6:802:16::41) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.60.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86ff92e3-7c79-436a-8439-08d766dd4b04
x-ms-traffictypediagnostic: MN2PR11MB4352:
x-microsoft-antispam-prvs: <MN2PR11MB4352BFF37CF139505570273DF0740@MN2PR11MB4352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(6512007)(446003)(11346002)(26005)(186003)(66066001)(6116002)(3846002)(2906002)(52116002)(102836004)(476003)(486006)(386003)(6506007)(53546011)(71200400001)(66476007)(6246003)(31696002)(99286004)(14454004)(71190400001)(478600001)(76176011)(2501003)(86362001)(2616005)(66946007)(110136005)(229853002)(316002)(305945005)(8676002)(31686004)(7736002)(66446008)(36756003)(6436002)(8936002)(4744005)(5660300002)(64756008)(66556008)(6486002)(14444005)(256004)(81166006)(81156014)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4352;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0uSFuDdwhlTYebVxnIlGiN2ufTKJyHM8AD6jYwnrhhUYBpoSPh5NdyrxKkYhj9SJs/2SVqRLnSqR4VFNdp2As7QdjwIfRAwiQemdMToWcjNXBiStxxyCM8SjwLYP5KuKufVNfbZD9TE1FAQjST/BEQbU0r1aYx2AnzErw64zonont2AqHzxKEdGdAU1va5gwI2J3JBamkl0rST8vtY4ywVkeZENBSa3YdJyOU9ssV4DNxPSaQNAZ6dUaSnJDad83A1MgbCCZxtI7Rw2IphfHeXDg0CLNyJOqC7NNR90YpVym9d3AC1s3Uogesa1Ocpr1YWVexi0zkqd48i1juJf1Sp5e8fwCFh4KxiOW7MpFOMeRvqf0ymBx68wT+R9Gj8TVRM7eO9FajUF4U0Edai6oqKS34DDiMAs6spjtpP8WYUUXp1KfnnAklijRfJVvBTsj
x-ms-exchange-transport-forked: True
Content-ID: <8813DC037EE3FC4C8E01A4DC67C3C3E0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ff92e3-7c79-436a-8439-08d766dd4b04
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 19:28:13.0995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnenTWuMmwGYe05wWoXjKluoNQhzvWRaenZsnr/Tt4CXFdIFHsEa1oshYnA7TNjd82rBAHz5zoMQt6kDIvroRKaXGSZ92/GA1WuEvnFbkPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_112815_851593_F5866601 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/25/2019 05:28 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> When the controller is not under the SPI-MEM interface it may implement
> the optional controller_ops->erase() method.
> 
> nor->spimem and nor->controller_ops are mutual exclusive. Move the
> nor->controller_ops->erase != NULL check as an 'else if' case to
> nor->spimem, in order to avoid the nor->controller_ops != NULL
> check.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v2: add Reported-by tag, amend commit description.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Amended commit description, s/mutual/mutually. Patch applied to spi-nor/next.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
