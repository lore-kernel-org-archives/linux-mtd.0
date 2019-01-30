Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C286C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 16:09:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648A22086C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 16:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W3M/GYg1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lSI6EUjf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 648A22086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOt5ufD4G1A4/XmxahpXnyrp9eSQVs26miWGvRViUjs=; b=W3M/GYg1GbMFL+
	v+yjqXeoSP7CllME2dDespFumEMzVohUjoC2hd1nBP2xhszhM1eDhwC6br23sEpQi/0rikLDq6l6A
	nwFUeoOEYlZ7p5McJnN0qx1dwcq+K1L6TVS0MWP4jxqqfYU0bTGeC+XoqQSfMcn9AvRVMfGV8ZPvO
	uH8GsHOmaas7Ip4IdGsFn1s7FN/NpR/vTL0/TjdrhdYVjdaeYcq31zTqbwdphbzeygNVAsllsJ0zz
	URpneeTMGPVxQnqjvCWQq8fTzB1jklurelSbqM693BSC9lNT7iQtsRHBJEVHhypNlFV+AJux6pV8N
	YCka/mieAE12ioOya8kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gosQw-0004s1-1F; Wed, 30 Jan 2019 16:09:50 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gosQp-0004ra-3Y
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 16:09:48 +0000
X-IronPort-AV: E=Sophos;i="5.56,541,1539673200"; d="scan'208";a="23211486"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 30 Jan 2019 09:09:39 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 30 Jan 2019 09:09:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGNVnga6sDEqJZx99Nu0Hy3rIuwl02n4471vWzjLsGE=;
 b=lSI6EUjfaQ0GDyp+TMP/Ln6rnUTB85PLMwC48Zfc77VsEmSNvIwXCunplAU9HGbhs0YaLB+GyaJANRF4NYF7EZWw/QfOQgQC8PMhAwFiusB+9l+Xl6oS9+5T1IxdO67b1cgtD6pHz11sGQx2AN04wDxu7FIhNKQY6T5+jMIdxes=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1924.namprd11.prod.outlook.com (10.175.100.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.16; Wed, 30 Jan 2019 16:09:24 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.017; Wed, 30 Jan 2019
 16:09:24 +0000
From: <Tudor.Ambarus@microchip.com>
To: <roger.pueyo@guifi.net>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for en25qh64
Thread-Topic: [PATCH] mtd: spi-nor: Add support for en25qh64
Thread-Index: AQHUnfW1X1Q6EcLfDkWNyBpY9Z4zOqWo1dQAgB9AnACAABnwAA==
Date: Wed, 30 Jan 2019 16:09:24 +0000
Message-ID: <fe18a70e-ef22-a91a-7379-55fadb7c0b5c@microchip.com>
References: <20181227150348.12093-1-roger.pueyo@guifi.net>
 <2ecd524a-9ba7-aef0-0846-5db9ed2cef01@microchip.com>
 <3fae6459-66d2-363d-adc5-d3f3758dd82d@guifi.net>
In-Reply-To: <3fae6459-66d2-363d-adc5-d3f3758dd82d@guifi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::21) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1924;
 6:sUJ86tRNIykN+TfLY8ZtTv/9SDyCkcQQLCXqMsjtYl93LyTaQVrfHHj16UHDDh9Pa9eHgNVi+kJuL74kWAPSKXQeN8eGWY3EBJQgCx2HN/6T+xYeagjSGRtsvULFetsNfQCjm+Ny2qMh6XvVj8nwnm5AkqVoESRmZWu6b4UEQFlCjyqI2ouIblLsp3mA2NIUlS0YI+pDpX3wytObVwIo+wSPfucs9uywBrq6awhMI6khzqDph6BwcrgTER9F+UhLZf2s3MDfNfeqIJcrFkceG29V04q43i/anKIKRltginrJMP09qwp5ShD2sx40EntC97Q30Ze3OBGpr6Ri73ImmFsAQFyYIsam6rQ5Lj/gjyv4pEh2u4+W5DzjOlOZ37YcjYPbeA6g3p+E8tbk3tgFUoY333myr1hQdC4TtvitlOD8h6EYPitAaVAbtsrXNqCFv3Zq8yNzGYYlPMhC857H8w==;
 5:6hGNaTTA7x8C+Bo+rAxhyKwPc0k4RyXQhBnJFkyl7Z9TInVkm6EXZ3CC7dHCHqMYxqeO+fRb5STbw3/w8xPuzZHNEoqMy4bWKYiL+eHG+Qpoi2gUPpDIh4H/Y0OQhOQLd55S3+P+Uqp517IJXmzruVIYWQho+FTgyh9rX1YpITYlJmKYyIavKG/M/oemi1axIx0TK/ylcdDtBMt8jCoCDA==;
 7:2TMNu5hc3euZMMzkYSgnmDfpp1XZMAVgWE6lI+qLmBgWd8o/391RQxvQBqM6BkzzX7XEJMT8pvXko50ZLeYnvle020iz40FsWfOJuEx3LxDi4wDN2Y3pdBD/9ix8KExJmtqrbI2/FsWb0HPPyreC4w==
x-ms-office365-filtering-correlation-id: 1980f180-4d15-4b26-e83b-08d686cd4d0c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1924; 
x-ms-traffictypediagnostic: BN6PR11MB1924:
x-microsoft-antispam-prvs: <BN6PR11MB1924A66614820F949415D3BFF0900@BN6PR11MB1924.namprd11.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(376002)(39860400002)(189003)(199004)(72206003)(68736007)(53546011)(97736004)(99286004)(2906002)(6506007)(478600001)(386003)(8676002)(8936002)(26005)(81156014)(81166006)(6246003)(39060400002)(186003)(14454004)(31686004)(66066001)(446003)(102836004)(36756003)(3846002)(6116002)(476003)(11346002)(25786009)(52116002)(4326008)(305945005)(486006)(105586002)(229853002)(106356001)(6512007)(53936002)(31696002)(110136005)(316002)(71200400001)(256004)(6436002)(86362001)(6486002)(2501003)(71190400001)(76176011)(14444005)(2616005)(7736002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1924;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 77PoangOwxyTyI/I6PJyM7v42d6EbIapRKQFXO5c+pJ+F7qB2nABvQv3GV+u3f1p2rx9RHtYDabGXCq8PtrkCtu8XogmbEnYp1bnUiK3HG7tRW7qF2UaN4BWZ6+jKTzwf5sn/cMcHMVkH+9WYDY306Po6qg4Irpfd58SsblSDxE46Keywsdok168eihXkpzkdDka8LZH7KOqpaVxE6w4pkRt3NEp5OFwLH4YABSFpOuJI9CNacryGM54zvXx0CgeRuRsTjGqRFg7hF2QARPZUUeTyA7bjWZ/LjHXQxGDcT9UANfP9NblsZYqbHlqbhNl6R7ZaRv8EVfZrJHAoTwWmCQs70VtlRorifIIiLhttbzBv1XsnitWttSzBbqD1iV3ekbpcAUs9PuOmi4rQUvtyLffnrxqO7qfPfHqRCiqQZI=
Content-ID: <3752B23B11F31245858F142B5A683376@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1980f180-4d15-4b26-e83b-08d686cd4d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 16:09:23.0196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1924
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_080943_253127_3A7B623A 
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
Cc: marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Roger,

On 01/30/2019 04:36 PM, Roger Pueyo Centelles | Guifi.net wrote:
> Hi Tudor,
> 
> El 10/1/19 a les 18:21, Tudor.Ambarus@microchip.com ha escrit:
>> Hi, Roger,
>>
>> On 12/27/2018 05:03 PM, Roger Pueyo Centelles wrote:
>>> The Eon EN25QH64 is a 64 Mbit SPI NOR flash memory chip found
>>> on recent wireless routers. Its 32, 128 and 256 Mbit siblings
>>> are alredy supported.
>> s/alredy/already
>>
>>> Tested on a COMFAST CF-E120A v3 board.
>>>
>>> Signed-off-by: Roger Pueyo Centelles <roger.pueyo@guifi.net>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 6e13bbd1aaa5..4bb6f4d203dc 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1741,6 +1741,7 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>>>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>>>  	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
>>> +	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128, 0) },
>> The flash supports 4KiB erase type, so you'll have to set SECT_4K. One can use
>> larger sectors, when available, by disabling CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.
> 
> You're right, I'm setting it.
> 
>>
>> Also, the flash supports SPINOR_OP_READ_1_1_2, so it's better to set
>> SPI_NOR_DUAL_READ in order to trigger the bfpt parsing. Note that at bfpt
>> parsing, SPINOR_OP_PP_1_4_4 will be enabled and the reads should be done with
>> the ebh command. Please test if these assumptions are valid, and if correct,
>> submit a new patch.
> 
> Do you mean that I just have to add SPI_NOR_DUAL_READ, and not
> SPI_NOR_QUAD_READ also? The chip's datasheet [1] says it supports both

yes, just SPI_NOR_DUAL_READ.

> DUAL and QUAD modes; I tried setting both flags, and it works fine.

The flash supports SPINOR_OP_READ_1_4_4 (0xeb), but it doesn't support
SPINOR_OP_READ_1_1_4 (0x6b). In  spi_nor_init_params(), when SPI_NOR_QUAD_READ
is set, we assume that SNOR_HWCAPS_READ_1_1_4 is supported. If for whatever
reason the parsing of sfdp fails, your flash will wrongly advertise that
SNOR_HWCAPS_READ_1_1_4 is supported.

You'll have to set SECT_4K and SPI_NOR_DUAL_READ. The latter triggers the bfpt
parsing which will enable SPINOR_OP_PP_1_4_4.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
