Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DFCC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 14:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B20A72075C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 14:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A17eFBog";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Fsc+cFoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B20A72075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8sZVqZnjJAU63XnFQ4Omr8x960vLg7ouQJJXHz+Efw=; b=A17eFBogiyMypC
	PppvwDChAIdEAIcCpqFypb4zQ2jdhLzYrAyz/kHahZ55FsDnCEwNrVBb32xcOXkqF7vLlMjDkrcG3
	IZhoBoFT4vlvFaZxyzQC3V4C9X+2lGRHwLnklRsos2gzBkyu0HmE7ZtuWYkpAPtrkyWHK4gg+nTmg
	+37gIL/LmUs+0Ce+d71WACa/GCFhXWFIdzcgZvcAeSqKgd3SAWRXGZlJ9O8SVB3TrAPY9252sA84K
	F+sF+07UNjRhiJpe8tHcr840CsV7ukkiMq/eanNojPDu1xSmJxgwaFzB8WK9PyIpLD8BDkuTfMCe5
	qhxwm15Nb/WMr5RIBh6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs7NT-0006SJ-A6; Fri, 08 Feb 2019 14:43:39 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs7NH-0006Fj-L1
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 14:43:37 +0000
X-IronPort-AV: E=Sophos;i="5.58,347,1544511600"; d="scan'208";a="25999748"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 Feb 2019 07:43:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Fri, 8 Feb 2019 07:43:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv6DRGM0cQteB3o5C6tZrCEjMxkVk+LmDOfhW4yu4fE=;
 b=Fsc+cFoJU/D4KJrEua+MghIALhntDdaNT6j1uZU/zkv2287px5NfM6OxTz0haprXrR1LmZvo7NLSyhs8+Q7c4DyTVu4lQ86oH5qMeqvbyOjzXv4Tf0JJcnonOlvpdWsbNS4sMb2ZWtjDB9kCJiG4V328k2L2JQv5wPMYwf8/U40=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1538.namprd11.prod.outlook.com (10.172.23.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Fri, 8 Feb 2019 14:43:22 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Fri, 8 Feb 2019
 14:43:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <beanhuo@micron.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Topic: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Index: AdS/uVD1jG3UvCBSRuC2oJ8LRRcc4gAA03cA
Date: Fri, 8 Feb 2019 14:43:22 +0000
Message-ID: <298d18cf-094b-d5d0-45d1-39c7b75ba309@microchip.com>
References: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0082.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::35) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1538;
 6:AqW4o09fnN4qSyXxF1UzVzrG32nVayo0dCZ+S5GefrE34mobwmwwaXmOnzSBPGZtFU5h/DmkDVHRCdbZQNsAVGb5P/r+lvzTfqdmkaLFwYg7e8rWDQSgY2/UXxhlMRMdtWc84FbwcTRX3oD2P6P4V3KSzUowIMYA8X3eDH2LzlUYILFPQzPe36OxUOsmTnSCdB61Z69jk2kOQAV8xzYw6Er9Bo90oXNfuEi1NaUKKsbOZ+orfVx5/0x1eueUDiaO+BNB9AZiu+9rfOKiXcCXeLWWNE4D7ILjgKSp1DP+A3No9TnBXJWbe86nzVXJuhzddiTdfwEgECZRpX2cxQ/AHvanRNO621RkJZLJYEQHoPyyB39qlvehArcv5nkc4CkYSqgq08z3od5qucFsJ1JzEZJW/3FAWIz1Qsy7QyrF4P1mZihxKnaaKxOXlfIDCLHgCy9B7cHQ8StgYvoEHy6gPw==;
 5:yZhE2ZWupMRJU/TkZRlmiGvjXwKlU83YnzDmFIy2uDw51ZRD1J2Iq6yyajSRGNpMSEmSGws6lX+nQoaMHlKJUNNPfg3klgjHArIzgV/0gB3J9gq+748MLY1Kxj6x4TZMV3tib/oSld4/9OQiBJ9aZkzf6yBBDtePQAUycTrkggcP7RNQ3R6QfyFoHWZJ1LEijzbfwrNt4PLKAzK/94dSyg==;
 7:gX34kBXVMmvI7czuBc/39scQRIngpJO522F1GgSWQKlgULKEWjmM7PsZP2acbB9gxG3jvWDgKMgOLYltlNsxLsLoHkx985KE4xdYWWg9vn9eb3I/B1CMsVoleAKIzMTgV0HBZ/Ur082UhRzl3mB5bg==
x-ms-office365-filtering-correlation-id: ec8c72b1-f8b7-4a55-8bd0-08d68dd3c5fe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1538; 
x-ms-traffictypediagnostic: BN6PR11MB1538:
x-microsoft-antispam-prvs: <BN6PR11MB1538E2A38F9AE168EE98FF0CF0690@BN6PR11MB1538.namprd11.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(476003)(66066001)(6486002)(229853002)(486006)(97736004)(186003)(8676002)(3846002)(2616005)(6436002)(14454004)(81166006)(81156014)(105586002)(72206003)(106356001)(6512007)(6116002)(386003)(478600001)(6506007)(53546011)(446003)(11346002)(36756003)(68736007)(31686004)(305945005)(102836004)(8936002)(7736002)(31696002)(6246003)(14444005)(2201001)(76176011)(71190400001)(86362001)(2906002)(71200400001)(316002)(52116002)(110136005)(54906003)(53936002)(25786009)(256004)(2501003)(19627235002)(99286004)(4326008)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1538;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EwygdxNQMwHtE4Qe0jV9hVyW+gB+Xg7V+KKrpmetOIHB5Blna9tgo3gIcH3W9VvbjJazdNegSiqZ7qlalO7F5ozVq4mX5McRi76M/aYhXfIZh0dXmPHJdI8YogZh5vYCZf+gEfZJx83RA6k6HbaVeYYKGIGB15/GAKTToBi5o/MK+hlHsGyT6nKDNsnhhYKJJdHkC5ZaaGhInGjFvvu0IhF1pW+fALXK4+M/NsBe8lG4680PB8jmrUr96MEwMa2vQKH3D3b+qjNdEITmpcb9wo68Xi2qMexpV0sDOSDx3q9mIiYJnes5JqcYqHUQW7eHSK5sCEOsPhe5DDIuROTpL/jUdqIvAY4BYFgk8ybcJ4HHBZGBQDWskUqdVWQLFY4/oenJk6S5yvI5AbpSuqv8XhN+rbgHzufMX/F1TCh6A20=
Content-ID: <9C9729E30C3E1E499579A21793CD15CB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8c72b1-f8b7-4a55-8bd0-08d68dd3c5fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 14:43:20.5472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1538
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_064328_388258_E636A410 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 richard@nod.at, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 02/08/2019 04:23 PM, Bean Huo (beanhuo) wrote:
> Change SNOR_HWCPAS_READ_OCTAL to SNOR_HWCAPS_READ_OCTAL.
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>

$ ./scripts/checkpatch.pl --strict
v2-mtd-spi-nor-Fix-wrong-abbreviation-HWCPAS.patch
WARNING: Missing Signed-off-by: line by nominal patch author 'Bean Huo (beanhuo)
<beanhuo@micron.com>'

There are scripts that check that the author/committer has its SoB, depending on
how strict the check is, it might complaint that SoB an author/committer do not
match, so please change gitconfig to make them match.

> ---
>  include/linux/mtd/spi-nor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 2353af8..b3d360b 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -487,7 +487,7 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_READ_4_4_4		BIT(9)
>  #define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
>  
> -#define SNOR_HWCPAS_READ_OCTAL		GENMASK(14, 11)
> +#define SNOR_HWCAPS_READ_OCTAL		GENMASK(14, 11)
>  #define SNOR_HWCAPS_READ_1_1_8		BIT(11)
>  #define SNOR_HWCAPS_READ_1_8_8		BIT(12)
>  #define SNOR_HWCAPS_READ_8_8_8		BIT(13)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
