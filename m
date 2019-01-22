Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A4FC282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 10:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE582084A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 10:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J0KAGnt9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pwNxWWOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE582084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp/Z6Kj9P9sfcNz71WIrmgoFrwpKHCE3okTxarhRyr0=; b=J0KAGnt9x9FMJM
	tNWA0jcb4B1n15AjHBgFJFq1Hp4uHTjIrDJDee4tbZbawDm5wHXVXKV0zlw6AGKANEabe+hVDncZO
	jZAUV522VP74gYD9tDmtj7NuhD6i/wvMWbYPBxUtDOsOV35AUf2EyQl0CQ5JSOnCtsqL4KVmZ68oX
	/eBq3zjmuQ9uIukPmIqEr7BeU9qiO3lU+ixN7I/1rAH/VNiUdqQcxXqRVHHrQNkheFOI6dcqCTHTq
	ANXHVcd8WahwL10kJmXKxnThXtd82h2VIjxbiSDrF/HLy5Or0O0yyUB/pPyVZtDT3tNFrLCGL1pIH
	mvZcs0acp/1ewnNhDufw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glt8v-0003NP-63; Tue, 22 Jan 2019 10:18:53 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glt8c-00033v-Sv
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 10:18:51 +0000
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="25620083"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 22 Jan 2019 03:18:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 22 Jan 2019 03:18:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtD68GSJa96EXXGSrEyzgvq9T/ITTa63JA11WWQ5pEQ=;
 b=pwNxWWOucDvU1iCy2FAoUKiscwVumDGVnmudE+txTIQ7tCaaI61DuXnTcViLIi2okF8tydMkaDztUPgmb5r88N1+u+aQi69U79g8FMpbnd03cA3jh1y5vZKUeSFHB86bDXpsKx4VpBvkNADtEG7Oo9+r5iIaxbPut4ygvRuUa+M=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.99.146) by
 BN6PR11MB1555.namprd11.prod.outlook.com (10.172.22.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Tue, 22 Jan 2019 10:18:31 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 10:18:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bbrezillon@kernel.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Topic: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Index: AQHUrcRvVk/NwsnjPU6u4yY8M2eQPqW7HBWA
Date: Tue, 22 Jan 2019 10:18:31 +0000
Message-ID: <fee36e04-2208-fd21-7b13-710677e3112e@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
In-Reply-To: <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::15) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:103::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1555;
 6:A9N1MYtEbrWJTOGEEmjuHS5RPlQ7udf+TT4vPj0EX1H/wirFrKTenm5XR+iBvzgJJhBmahRqFgg30erix+Gi+tmOoFUWuyztXuDYTnEkoi4E6tUJdtJLYscz/AmcFiTz22oa35z0faGJK7K33V9HDzsr3tLfM24Nc1OFnJGoZoguS5tmG8h7FjvJyRmPRTRRlPoi/71kt84rASBmrim9KOalwUlQDJ+pY2+ydDycVu6S4IbAJrbUuLMAD8dwEnsT6U7IqES2MZnyZkf8db0cZd98KNCcQnzPK3lpeP1RCrllTgYOiyzMRwrS1p8Oordwwk/wBHfued6UpZs6QaSvAnvTeekBP9J0VryrOIFYGeQUxtmANaay6fyhmgJ/SMEQkQ25WJr5qlSc3187WOYkI7Pald1MvWRTJ+mX+jGtkXV/p1A/j7/70dsIdp4N/OxNPgPh9ObMr7DSnW2bvmFlFg==;
 5:aWZIMEITatXISZ5wyaV7SUxeqCmK2vmaESo/amRYBLw99jGDkyoSkp1ymN4CUi+E1S2+QYhcLB9yVh6ISZbN2eqm3e8HiovBkNcoKUFRvd7VefepCTtLmO2GmPiRfug9z0mT98R9MKS7rlM5WVXEO0V/R9zDUsIlWznzZ9taMY/bgg0RbY0cfxF4DRSMm8C+le8dRoD1KLqBUsrsq2mX0g==;
 7:OhvWPmcwsOPs69p05dG20QyaxZCTOehLW0qKxDVBX60KoMzf9zvHM048tniu95RVlWJQM8+mo379qra/OAVznOw95251R67nsWDJqzQW+L4+d6ZWs8uW+t7OUKneYZ6Bn+F+tXRo8o6Usrqry/xwSA==
x-ms-office365-filtering-correlation-id: 5abae7af-a71d-48e4-183a-08d68052f573
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1555; 
x-ms-traffictypediagnostic: BN6PR11MB1555:
x-microsoft-antispam-prvs: <BN6PR11MB155581270237795A37C73DD2F0980@BN6PR11MB1555.namprd11.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(366004)(136003)(346002)(39860400002)(396003)(189003)(199004)(99286004)(71190400001)(2501003)(71200400001)(66066001)(52116002)(256004)(14444005)(76176011)(6436002)(316002)(6486002)(6512007)(86362001)(31696002)(53936002)(110136005)(72206003)(31686004)(2906002)(478600001)(8936002)(2616005)(476003)(446003)(11346002)(305945005)(7736002)(36756003)(6116002)(6246003)(3846002)(39060400002)(105586002)(106356001)(68736007)(81156014)(25786009)(14454004)(186003)(229853002)(97736004)(26005)(81166006)(8676002)(486006)(386003)(6506007)(53546011)(102836004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1555;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0FS7aYj/CVnb5BJJKFVutEDFY1Y16Kzv0Km12AVq6EJNoJVVN2QMdrlr7kl0tBasdOzyjTv/R4wtu3Y03yT8sSU4R3QCafmooHHuT2rkhsOde1PFBsJ9kyr8L1da8vdyqhBLq5CSfLGeyfHT8nskrikaN5NmZS2wzrjkTsIcTv2cF8sPjpHUUTVkrCKeO/r1Z6pdhNosPuEjmyd2wK8qZf5uAmA7KCYP49FKL+MsVAxUKY/dS/IZw8HMFQ3n/vZZLn0awaZV7Rqz2bLt82clmTxZiJh2cUn7IdlC4VC6XNBXGy+zyyoUsIjQmh3rnXQQqWvyX/MAztYIvyRCsJBD5mLo1Yrj9Vai0mZNf9WE5FkUaLA/sT+OqEd+ENBYUOD+jikZXRHP8WVrOnpptkbc4wXjb/lCRc8MqXKzp9ibJyw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <20836A8AFE68354FA04F6E83B2C2E44C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abae7af-a71d-48e4-183a-08d68052f573
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 10:18:29.8986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1555
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_021835_554437_C2A7F614 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/16/2019 07:53 PM, Sergei Shtylyov wrote:
> Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
> family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
> covering S25FS512S and now that we have added 6-byte ID for that chip, we
> can convert S25FL512S to using a proper 6-byte ID as well...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> 
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-mtd/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
> @@ -1887,8 +1887,8 @@ static const struct flash_info spi_nor_i
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
