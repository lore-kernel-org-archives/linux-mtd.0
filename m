Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E4FC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177DB2089F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ebWVhX9v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="WduY9zbw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177DB2089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqN6sxM6OAA0QZ4GI+tXIVC2dNI2I2MG60D04haAHT0=; b=ebWVhX9vc76zPU
	OrCavUgfCZKSNy2IPzBA1xJF5i+Y1gyL+3bChlWpMENvogeR34mjtuYNr6yFIyFnvYl/pS/Yssd6F
	UudScr2X2uxDBUU1rFXvLbwqyL+YsG8BagXWQxCyHlu18+J32EY29a0nt9qWUPTeAFhGqkrWVUXi0
	my/dBO49pcfvTa5auD25xQQTiXvQgBuvXBFf496lVNQkqsWRIacQhuW3kkGioJgjAQypC5S7aeYRE
	6a+FBILMzpTpOEUrrW4sD5l4ngh3L6RJGqJRqeqvXyO+GKfqWhLgwVZQK3hyWZGbImT/lE9xrd6JJ
	jPTo4mjongwZnvN8ElpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwYnr-0004kF-Sq; Wed, 20 Feb 2019 20:49:15 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwYnp-0004jY-79
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 20:49:14 +0000
X-IronPort-AV: E=Sophos;i="5.58,392,1544511600"; d="scan'208";a="26627370"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Feb 2019 13:49:11 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 20 Feb 2019 13:49:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm4wT/NLOdTrQALZyVdbSxKHczzfmWEunlk4RbeANbE=;
 b=WduY9zbwIDB+uM8JtNumNuAusijdBNY/iMGt92jvNPzaa4UAUA8Be5QsAvurt1mKqjXnMYALIRAJ38pggUuEtVKR2YcHjdWxHkatLMMcuDoZnhhDQAvDxBTSwygTiGDC1YOJ8tb0iqyvBz3r97/r1BjKvEMYHtHf6r378mwDm5w=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.92.17) by
 DM5PR11MB1897.namprd11.prod.outlook.com (10.175.87.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.20; Wed, 20 Feb 2019 20:49:09 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1%11]) with mapi id 15.20.1622.018; Wed, 20 Feb
 2019 20:49:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <frieder.schrempf@kontron.de>, <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add support for MX25V8035F
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Add support for MX25V8035F
Thread-Index: AQHUx4KDfFE6B3CJYkGZ26wCQda7VaXpLGQA
Date: Wed, 20 Feb 2019 20:49:09 +0000
Message-ID: <b471c532-00b5-55d5-14ee-ec09fd98b970@microchip.com>
References: <20190218120421.5034-1-frieder.schrempf@kontron.de>
 <20190218120421.5034-2-frieder.schrempf@kontron.de>
In-Reply-To: <20190218120421.5034-2-frieder.schrempf@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::27) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:114::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.52.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a82b1945-a982-4612-41eb-08d69774dc7b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR11MB1897; 
x-ms-traffictypediagnostic: DM5PR11MB1897:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtETTVQUjExTUIxODk3OzIzOllHLzM3VVR1MHYyWTFBeVlVNHRYVFB5aWtV?=
 =?utf-8?B?RUhNSEJUa3JYbCtVVm80c2x6MmhYL3c0WjlxallQcXl6UmlqY0FHaXhacHo0?=
 =?utf-8?B?VDlGYnN1TStaWlplV2p6Y2FpL1M2N3gxdzdtaG4zckswa1VnZTkrWUtuK005?=
 =?utf-8?B?ZjE3R21MTmF6blJsN2k1LzJuajNsMnVEdUlOOC9WQzU2U2hLcDA1cG8zeTBJ?=
 =?utf-8?B?SDBZTmgrT3JrNDg5cGpQTldvYXNNMTEzZVJnMzI1RHdrSTgrNXEyQ1hKTUJE?=
 =?utf-8?B?WENhN1Uvd0FJai94clNQREliYzlIQzhvL1FZRG1pTGlJQ0E3V1RwNjVNWElT?=
 =?utf-8?B?b1lBWHdwM2wyOEIyVDZ4MHZmWFI4L1Q2anhxbk1LNSt5b2JmZyt0TzU2RndM?=
 =?utf-8?B?RXRwVXI4dlNOQ0FXSmQ2QmdpcVdlNGViZnFob1BxdFhITlhuQ0lOSi9JdXFM?=
 =?utf-8?B?YmZuRWVCbi9NWjduT2FQYW9SWjh3TlUvLzkvOEVMQ1FTY1FkVytkUkVEbnNI?=
 =?utf-8?B?aUZSdmY2VmZsQmFpUGJEZW5Bc2FYRE1KR3l6bHkvTUVSZHRVbjVkVEtMSmdH?=
 =?utf-8?B?cDN6aitCQlkxUm9nTG9KM2ducEFLcW82eVk0TlRBSTNza21JY1NDSFBPQXhE?=
 =?utf-8?B?bTlSSkFUa21ZNVd2RTBKUjFlS2lIdmR0M3Y3QVZkVDVmbVVsVnNYeTk2M3Jw?=
 =?utf-8?B?QVVmSFV2bDlRYkthQUU1NHlvYzJEd3BpR1JFWGowMGFUcS9SekdDMm1ENkFB?=
 =?utf-8?B?eExnUGI4dWpHMEFua2tuUFF6d0ZOSVhXSkNWeTYwSWt6aExsY2NJVE5oaitE?=
 =?utf-8?B?RnVHVnZ2N2hTblpoSDkvRUZJTlRkYTJMcWEwWm9OYnpKMEFZdUlBYlhkbGsr?=
 =?utf-8?B?L1JPdGMwWVlnbVVQYTAvbmJ5Zm5tNUdRZWVlUFBtd1FLTC9sYVdJaXlKanE2?=
 =?utf-8?B?S0cyNkhNS0FrbGdqNzVyV3VWZVNPY2txUFgzZHlVeTkyZjRHQUI5M201Znhi?=
 =?utf-8?B?Vk9seWhCb2EvR0lCZGkveTFTQm5nL3hMVC9TOHVxenZFbHZJaW1IblJ5YnMv?=
 =?utf-8?B?YWJucG42N3krWTlLRlRqdy9lRk1RejN0T0tRQ29jMXlXK21GNUpURU95aUM1?=
 =?utf-8?B?bXZ6SDFmUzRLQ3MwbWlZOGZOakc0cnZ3eEVtYndMbjJ0d1VBYmJGS0oxSmt2?=
 =?utf-8?B?S2hSdVdNYVN3b0pWYUR6Vy9Ya3Ftb1ZlREdQOThQVk81Wk5GWG95T0VUYTVm?=
 =?utf-8?B?OXhuSlBJNmVFWEcxdW1ybmtoZmVtY1MwZXlmclA4Z1JVQi8rZjV6S0Q2V2tq?=
 =?utf-8?B?RU1jZGxRUmplcVhXLzk3NE0wYmhWbXBCU1BlTVhWZ25SdVNydUhVWGtuYzZL?=
 =?utf-8?B?T3RWNHA0Z2JlTDAyclVGTHpheVdLSXV6T29GbnR4NXBZRTBIcGk2R29ZcE56?=
 =?utf-8?B?ZE5iODg2UWZLbzl2eVJva1h5eEdaR21EaFZnRndNRjVkb24yZ2tGejNkaFVv?=
 =?utf-8?B?aTBZeHBtYU1TWjlBNTN5WEdEZVBmL2loYnhLU1YyKzlWMXJiUEVEVHYxWGcx?=
 =?utf-8?B?QjRTM3N6azdGVm9JNVAyeWZYZjhnVTA1LzVRVzl2QklCbERvRFJKeUsvRmh4?=
 =?utf-8?B?RVVSUThWZWx1TUR6VmRwYkJYZExKdUQvdWpVaktmYzYyTTh4MFZnSVEwbDJw?=
 =?utf-8?B?SVQveVBXUEpFQjRxdEE5bStCMTY1N2VERTI3SzRTVnczaGpmcGxJOVZ6RVFP?=
 =?utf-8?B?K1RqK1ZZNDBJSUpHcUp1Zz09?=
x-microsoft-antispam-prvs: <DM5PR11MB1897FFB088ABB939B421ACBCF07D0@DM5PR11MB1897.namprd11.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39850400004)(136003)(376002)(366004)(189003)(199004)(71200400001)(256004)(2906002)(6246003)(71190400001)(81156014)(8676002)(25786009)(4326008)(72206003)(81166006)(14454004)(486006)(6486002)(106356001)(68736007)(31686004)(8936002)(6436002)(186003)(476003)(6512007)(11346002)(2616005)(478600001)(105586002)(386003)(36756003)(86362001)(99286004)(31696002)(53546011)(52116002)(97736004)(5660300002)(6116002)(102836004)(446003)(53936002)(76176011)(66066001)(305945005)(110136005)(7736002)(6506007)(316002)(229853002)(54906003)(26005)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1897;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3nqjjEiTlQN3Ha5fWzWASiMWXb8yd80SFDcDClFiOwA7O2nrzeuMIyTsJUU6Ii7aI0fYgms0W1DJFOzVu4cJxQT4Fu/7GldMTEwmOwM91NtDEmKBvBiv25OmmzsgYKIqdehL32A7TF7et38tUdSVYjusHqn2SDh8sTdj/TYUAWhSre2DJOEoZok99hya81plnnlocY0BqEQhYbp4YHRPunEoQEL6x19ji4Z8kuqlmeCx/81FMv1JZa1FqSihqN9aWaGnNMBALoKxWoz/EhqQiziGYg0c5rLJiEkNXqmRbe9afEOBG1bo35gdGBOTo4LMKHJMQlQSkoKHfFBXumaYSWMdf08MaeZ/vL8NqXx4uPPpipQiDlQRf8VEOPvqfIMORtmDcsbE8K2zU+mvdYSY5f/tLWIeQKGgjpwXjLOdKXs=
Content-ID: <F7FD16909B6C3C4E8B245A8CEFB2BC6F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a82b1945-a982-4612-41eb-08d69774dc7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 20:49:07.2094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1897
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_124913_346267_FE20BCCB 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/18/2019 02:04 PM, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This adds support for the Macronix MX25V8035F, a 8Mb SPI NOR chip.
> It is used on i.MX6UL/ULL SoMs by Kontron Electronics GmbH (N631x).
> It was only tested with a single data line connected, by writing and
> reading random data with dd.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> Changes in v2:
> ==============
> * Add information about boards using the chip and testing to the commit
>   message
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 7d7436facc57..44be34c1d2c3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1849,6 +1849,8 @@ static const struct flash_info spi_nor_ids[] = {
>  			 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  			 .fixups = &mx25l25635_fixups },
>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
> +	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
> +			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
