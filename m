Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D74C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 08:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322E121773
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 08:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kQuXN/JU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="wU//n331"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322E121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfJmggKhz0WwyEf0yAjnyWToCZ0WpfFgm2LNHmXQx5Q=; b=kQuXN/JU7tYpgq
	wtdWTEyS1RJOxTXrF3Z9miWuPmbGnbYjQ95Y/iqbO7kcKB0ad8TN5J3qvv5dRSB/Smq4izcr+uJLU
	dH+bFqthBwe3wUAP7Kyd75AQP/ppnZ+UDxCZPMLCnTqipIA1uR4nVJ11jj6wUdZkFxxqpne6jnxGd
	RXIPy7YlCCYMhPsD7OrVej7Hi1wsRD+H9vwsT1navAdVERJ3yH6xobC52ATn6PgcOKByI4/tIdOFD
	4XcirwxyNwvx224kT+if2kFMwsFt++Nw3BOjtLI8xinKlal9AQHlAJ1hheGWvUsvXrs2t0/qrnet3
	Lb3rRS8mhlvBNcsCKNMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtT5u-0000WF-W0; Tue, 12 Feb 2019 08:07:06 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtT5r-0000Vq-V3
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 08:07:05 +0000
X-IronPort-AV: E=Sophos;i="5.58,361,1544511600"; d="scan'208";a="24512853"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 12 Feb 2019 01:07:03 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 12 Feb 2019 01:07:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51JLHIZZJj2WMffVsNsCTK4xWdrdrT/t+IacQ1KVS30=;
 b=wU//n331tLPFAAyth915ySOYeu+GD0NPddG7gt8KIu1LaSCLjQ6kO8goOaa5/I2LZINqqoQy0LfpX/MNtEeP6BWP+Yzy/zOPlka7jfbQqRFcCrjOsWglapEWowHY0zLraUr5WHfb84ZCH33806CjNGxv0jb5+ev9ibNCrhsh8sY=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1363.namprd11.prod.outlook.com (10.173.33.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Tue, 12 Feb 2019 08:06:59 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 08:06:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <ahmet.celenk@procenne.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH V4] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Thread-Topic: [PATCH V4] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Thread-Index: AQHUwpwDXjbEwDKio0a+nbPeobK4taXbzpoA
Date: Tue, 12 Feb 2019 08:06:59 +0000
Message-ID: <f2846ef2-bb32-6f18-4830-4d936f256531@microchip.com>
References: <1549952682-9649-1-git-send-email-ahmet.celenk@procenne.com>
In-Reply-To: <1549952682-9649-1-git-send-email-ahmet.celenk@procenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::42) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dcaa62a-b4df-457e-32e6-08d690c1102b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1363; 
x-ms-traffictypediagnostic: BN6PR11MB1363:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxMzYzOzIzOnd3QXdiMkxtQ1dYZmh3ZkdsTzIxN3pxL2Jp?=
 =?utf-8?B?UjlTa09ab2ZUdTlEOHNzRHVnOEFPUjE3VDJuTEYxODNuMUdiOURGbHRGVHht?=
 =?utf-8?B?ZkZDcTA1SXJ6blF0MjRGTnpCUUdvZWRQZG9tQnJLNkV3dExNNW9JQUFjTC9q?=
 =?utf-8?B?bWhlR0g2SE8rRjB5MHY1L0NIN0ZiNVNwSlpWWStRclNGZFB3Z1lVK01Rcm81?=
 =?utf-8?B?cnA1Q0Yrc3c2S2J0SDlGbVlSVGZnNS9PWldFWTNEYURsb29xQ0QzQ1pNR2Nr?=
 =?utf-8?B?Q3hsUmJjY1J3czZJNUtWakh4L2VLSGhrN0RDRnZONjhhUW1OR1RVeTZQKzRP?=
 =?utf-8?B?TXNHMmVNTE1rU1VxWDFKRDJ3bU54Z0MzcklpOGV6SjZOMk55bUNUWEZvTTRK?=
 =?utf-8?B?d3VTbHJ2RkZJZUtySWF3eUtScVBxK0dhUU5ETkxjMjd0R0F5TDJ2enppK3hw?=
 =?utf-8?B?ZlV2Y1NHNkJvaElKbjBPVFp0RVY0S2x1eGsxSGQvWm1qd3NiaXlzZ3NJcHJM?=
 =?utf-8?B?ckNsVStnKytRK2dNRFZBeGZvcG51dXM1bnE3Z2xZRlJ6bWdBem9BREJobHRV?=
 =?utf-8?B?QjlxNlUrNE5NdTFra3FNdVp1akF5UU9GVXN4dnEyT0R5MDQ5cmVNT0VQRWRx?=
 =?utf-8?B?bW9ocEZxb2ttMjhLRzdybEVkd0pYbThvWGVhdE9UV21FaGRTZTFKeWJnSGVv?=
 =?utf-8?B?OWN2OFhrQUFEZ2FTeHkzZGc1RkdMNEptMGMxcHBwRFR6NENLT2VPVlM1Tm5V?=
 =?utf-8?B?Z1RrRlcvSFdkek8zUjE3aC8xV3haSmJmbmQrUHpOZ2FlUTBQSUYxOFUwSVVO?=
 =?utf-8?B?dTBHTjE0Z3FCN1BkMWxyOTZaZXBER2NQbTZqeWlld05Ld3hSajdDOWI0OXU4?=
 =?utf-8?B?ZXMwbHZ3TWJNTTc0YVh4R0tXL3Y4NkVtWGUyKzdCdGxwZkhrUnU5QlVGd2FS?=
 =?utf-8?B?YVBzdXMvVnBwY09pemIxajRMd3F0WTFZZnFCZmlaVzZnc1RwS0RiR0pWeE56?=
 =?utf-8?B?ZzZ0b3VYdGxpd1gvZ3YyTkw1QzJrYnNFTGxGYTVTQ1JXVXYwdDQ3NE1HU0Rt?=
 =?utf-8?B?d3gvZnRlUFdnVEtWa3paZW5wQ1NzUzdRNy81Rm1EQ0Z3L2EzdUdlbGNVNE1u?=
 =?utf-8?B?WmFlZCtaYU9KMUZyTGJscFB2YmRwWmdLRVZleDV2RWVzL3grVjRubnRJR09F?=
 =?utf-8?B?T2xhUGllblRpQmZERStvVFJNSnJFdFVXditMY204T21DNGh6Q3Y4emQ3Q3Zt?=
 =?utf-8?B?VnJHMWlMTm9UdTMxQ1NaR1V6RnhVaytPZ0Rtd3lHb1J6dHAxN2JRdEZBa0hC?=
 =?utf-8?B?Z3lhRGdFRGYvYzYrZkVoNFo0WXhkRTBubzNkcmN4MUkwZlBha2U1R3pzVDZi?=
 =?utf-8?B?YStZOXEzV3EyVkpHQ0JMMlNtMjMzU0hYWjlqd3g5WW5rVHNJTVloaUh1bmlT?=
 =?utf-8?B?MUlEMzNVdU5YSzJuekpZbnhWWmlvejFTbW9EVTQrdDF3NnNrWmlkbkxpYVMw?=
 =?utf-8?B?L25MenZUbkFpQW1FNWtoaEJvOHFTdkdGYVJVOGJ4eEJUN1NVZU5YcllUVUlK?=
 =?utf-8?B?bjNFcjFZR3UxNUhXTVhEVUFmMmlWcCszSlgvTlFKaU01UE12MDV3MUQ1czht?=
 =?utf-8?B?VW4xUHNjYmJzeUQ4YW1PdTg3WCswYk9kQzBBZ0trQnRVb1dUTjlodWFkR3dq?=
 =?utf-8?B?dEZvNFIrQVliazBnWXp0cHdSSGRoMG1QREcvZmdIT0tlM080emdKQThTbHRk?=
 =?utf-8?B?RkdCa3pDMkNBTlVQdWE1UkFzOXZxb3pHTlE4OXVBaGJxMTRTUVBONndMZm5w?=
 =?utf-8?B?amRJSG53eVhVRStpTDAwb1p4RUN1bHh5a3doejAxZHlDNHc9PQ==?=
x-microsoft-antispam-prvs: <BN6PR11MB13631B3CA82EC8537A464E28F0650@BN6PR11MB1363.namprd11.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(6486002)(72206003)(31686004)(486006)(6506007)(386003)(53546011)(2906002)(105586002)(6246003)(186003)(97736004)(102836004)(53936002)(229853002)(8676002)(81166006)(81156014)(76176011)(106356001)(36756003)(6116002)(6512007)(3846002)(8936002)(446003)(316002)(2616005)(31696002)(14454004)(86362001)(14444005)(11346002)(256004)(2501003)(52116002)(68736007)(54906003)(476003)(6436002)(4326008)(25786009)(305945005)(99286004)(71200400001)(66066001)(7736002)(71190400001)(110136005)(26005)(478600001)(138113003)(98903001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1363;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N8Ijd5qm+NChGiyHchOrz/vKF6+4Wv8vUH9BVBEyhZW5IZWYy57ybfSpRo9AilkMTSXF6MP3h+UUTQt5TOe5BX1atD3HI2X9HtW3q7yVCcD1nBLEvMfPS+4AGgcVo0+BgXhwp0t+ClJ3C26uinC2Ve5Q1vdF9iq2FX/G0hl8ok1C8VTiP9xzOWphJur3WLTtyT9UDKGwswe5o0Y9VKaPUvX4d+KtNofdqMMtsYAVgayVlEaOESAjPnXsEVxxOvizL4fKWm3w6P1XRfubZT76YhEJu3w8WffO//A5a4o0OQO5Jnxs6Vd9XSfDtxIB2IK+NAvwT7a1o6CpOXa0lDeG/hm9vZ+pMek+xQcy9QsnhI01pfs14hq8xFhqGq/8mIRzlG/VUNZsIk1rSm+6qnXUTxLBJ6DXX7XWCFB10F97W4k=
Content-ID: <881FA36ADB841D4A97EFBA52F3D4D428@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcaa62a-b4df-457e-32e6-08d690c1102b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 08:06:58.4160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1363
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_000704_180784_9842EA47 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: boris.brezillon@free-electrons.com, marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/12/2019 08:24 AM, A. Celenk wrote:
> From: "Ahmet Celenk" <ahmet.celenk@procenne.com>
> 
> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
> split into two to match the correct JEDEC ID's for each version. Solves
> paging related issues of S25FL128SAGBHI210 chips.
> 
> Signed-off-by: Ahmet Celenk <ahmet.celenk@procenne.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> ---
> V4: Broke the over-80-column lines and put entries alphabetically into
>     the list
> V3: Added missing SPI_NOR_DUAL_READ flags to new entries
> V2: Removed the old s25fl128s entry
> V1: Added 2 two splitted entries
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f9f7de2..6e5b591 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1893,6 +1893,10 @@ static const struct flash_info spi_nor_ids[] = {
>  	 */
>  	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
> +			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
> +			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> @@ -1900,7 +1904,6 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> -	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
