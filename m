Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79652C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 10:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487DF20879
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 10:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nD+7pHXb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Fr4JtClq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 487DF20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owAl1SGbAorC3bAUkw83EuC68Ab2Kk7J1Tv+j80c31s=; b=nD+7pHXbtpHcVg
	LsNIThsg0JvQcxGWLn9YTOyOpEJ0nZONdHT9aAX+vfvGJhmcQXWD2MLJfNGlMrHk4QwmcEwkQud95
	1tFVbvszebYh9PgVhzLG9UZ4KlHpyMw8cwlH6sx/FNJjoD11d28dAT7h7+jgSbjKoqqV9xsU41pow
	9PiHQUW7JYhJZ9hOBfR/3C/5PbmoEp86OqEOgkTFCCk8EzBL8W/QwpW85nu+zOTR/gZfmiNrjEPAS
	O183CGYywlLAtIl7yBQGCMnx43z2WwBXO5L0zpHn2JgFjiy9zrVmqm/xLW2HDk+Jp8LKZS654PG2C
	3jELo/S6Z8Hy70+dQLJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glt8M-0002oF-6v; Tue, 22 Jan 2019 10:18:18 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glt8I-0002nP-NW
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 10:18:16 +0000
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="22894183"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 22 Jan 2019 03:18:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 22 Jan 2019 03:18:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGFbHNLTAZJ7OaD9pXmGRlbZjW0sCAl7K9kzh5Ay0Ec=;
 b=Fr4JtClqiL/QB0q9DMe6XDjZ6ECvT29mS0rBSj0lQXwaj+xBghbSBpdZpTiZVJFthK99traSt8BtW2b22hGgzhs4q3uyUqje8ePV/uYMMZW69l0b4b9gGpGn/ZaaiJhy9VUAGlhdBGCB5Cc056cmF9q2WBtetWW/5Q8X6soRZ1s=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.99.146) by
 BN6PR11MB1555.namprd11.prod.outlook.com (10.172.22.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Tue, 22 Jan 2019 10:18:11 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 10:18:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bbrezillon@kernel.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: add Spansion S25FS512S ID
Thread-Topic: [PATCH 1/2] mtd: spi-nor: add Spansion S25FS512S ID
Thread-Index: AQHUrcRV5NKcZKuN/EqPu6p6vBO+V6W7G/uA
Date: Tue, 22 Jan 2019 10:18:10 +0000
Message-ID: <260bdfe0-d618-8715-4a48-05582a04a3bf@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <650c47f3-8657-0fc9-81bd-63974bbe06a5@cogentembedded.com>
In-Reply-To: <650c47f3-8657-0fc9-81bd-63974bbe06a5@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::30) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:103::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1555;
 6:EriWHEBp24EATPP1VGkJrs+v0DTcWCoF4hhQjllOFX+FOiLpbFN8aKpt0hv4rxnWYvhDBX0UUfKi61wlcuCUPjdTwBPlv3DFoombfrPVOiGFYHx5m5ZwgeT94mkqSzr/tdCjrhNpEbgfQLK5ocbBUs2EbaJP85dXmZarl/RSImA8xtuPYWnSn8gWbX1HYZ5kP+AE3y9qqGeaUQzT9BW+orzZggL70FGd+nxOfJwh1ItGczO0DYlHWobcdTc6fQBxX0yt5+sEgB3jv+9B9gWRs7UarEFWVIFWi8UbOlOyR01udkehvhvNQI0PSh6/RigU4s1KMM87Bc8JAZYZZPXea1kZIWbH/S8eycvXjfIxsB63rGdmhic3dvpePKzeHCiZCpM0yO50CVJ76DtkS4YPr4BlOdQJZyzY9wItEqiX8OPmzO3FIuAa7HXN49Lzu6hVn3luMD9KmdquyyJtmHV4WQ==;
 5:d/HMFKTRTsgnEpS9Yq0TawOJF9GQsHTR1+ntAxofGCttY4azjeY1NM0lDi2KrHLeh13Vq0J4uGGBKuiIAKRWrifqvE8a4gYkFsAK2PtrKlq9uSVmYY+MYZpK9CVFeJKTeJAXpqmosCZ2a8YVwQga+APwhkgkoAufp/eKj9eFcgvDMCtje8lKXLuskgkkvtqZMvRENoYCGwz812jT22e3tw==;
 7:TpMRZkg5folPHkEaDYASS2D6HQIIlSe4bMJ/PLUbaQ5e23xpKA5+uD5DjpahhvHbTeypeidqdcpgA2/xEdmqt7ohWSy7WT0qJg8RkrcvxSMR6bbm5EDxdg/3mO5ZEmQNS1dBqKiJNPz3XYwvtgyF/A==
x-ms-office365-filtering-correlation-id: 2c127d5a-c128-4998-836f-08d68052e90e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1555; 
x-ms-traffictypediagnostic: BN6PR11MB1555:
x-microsoft-antispam-prvs: <BN6PR11MB15551C93B9D0DDBA84196FCDF0980@BN6PR11MB1555.namprd11.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(346002)(39860400002)(396003)(189003)(199004)(99286004)(71190400001)(2501003)(71200400001)(66066001)(52116002)(256004)(14444005)(76176011)(6436002)(316002)(6486002)(6512007)(6306002)(86362001)(31696002)(53936002)(110136005)(72206003)(31686004)(2906002)(478600001)(8936002)(2616005)(476003)(446003)(11346002)(305945005)(7736002)(36756003)(6116002)(6246003)(3846002)(39060400002)(105586002)(106356001)(68736007)(81156014)(25786009)(14454004)(186003)(229853002)(97736004)(26005)(81166006)(8676002)(486006)(966005)(386003)(6506007)(53546011)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1555;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eL8kwKszltonxwbIiDetAJu4GPbauf7pgMdbXN39JnRTLbxhfej1Xf2rr035945VcCnqIvTbUCUa/GleKEH4mCOoO4osuDVJ1hvXFD89pCrGB8SqaUYT8wGcjrWnxS+kZtqLvYvDTLgm5Fzt06Fa2qElnJGIfmHGLoHz2bax5DLBWQfJ7T1tOt5UyZajxKQR5IgAtBALIuOPTNs+2llL1fIoihZlVpl03T7BdlRGcvMS205+NrjSAJrZBbaWe1tggrqwtRxRcnoi96+mCwVqAN0qIZ2QTYFAF3YtfyFtPl+08zzEKe+aRjWP/UuaBNrb5nrrLYFX5thgpzdyCmqS0lncR4UZJHzlHgfrTv8oSQ4T9z9Kbt6Y5HjurHDK1b2Ow8R7qdvXv38cNSsPCPg3yz+Uj9q+A6fvNg4OZcn3Izs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <840A068FE6613C42BC65A6B75987801E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c127d5a-c128-4998-836f-08d68052e90e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 10:18:09.0817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1555
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_021814_850561_5A32C057 
X-CRM114-Status: GOOD (  13.66  )
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



On 01/16/2019 07:51 PM, Sergei Shtylyov wrote:
> Spansion S25FS512S flash is currently misdetected as S25FL512S since the
> latter uses 5-byte JEDEC ID, while the 6th ID byte (family ID) is different
> on those chips. Add the 6-byte S25FS512S ID before S25FL512S ID in order
> not to break the existing S25FS512S users.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> 
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux-mtd/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
> @@ -1887,6 +1887,7 @@ static const struct flash_info spi_nor_i
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
