Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776EAC282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 17:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47E6A2175B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 17:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDicHnE6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="dzliPKzA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47E6A2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksPdLYeEc5QM3v8ahGfbIVIe4M9gaOuKmGjv/wa9yvM=; b=pDicHnE65hWjj3
	dv+YyFexSPG2syiL/pX4q/C8fX2RO56C3wi+ZNQTouuiJzHyoDtWSBpHValsEtzfEnNqmOs5Mq0t6
	Pop9WKo4PC/R9OddHULmFxJnpejTBGJmvXeiCy82CxxS75T7UNNlwEdNCuPWdQIh3qaYxDUBOckbe
	acDvkqdD76fmTVyAurz8K+L+gmKoE4jKd389Hvbgc9IVQOpgNmK+qISI4DTcPGEjKLJhuQDqCRHUG
	IJth1Sf9zgX7WqdA8iJoSwZisqs3eUhh2lDgahpCPB26Ad2i0g2+4uKcxs9eSqw/lesjzxK67v9kx
	ug11SqOYVOt4sX8LuQ8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtyU4-0006Ip-JE; Wed, 13 Feb 2019 17:38:08 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtyU0-0006IF-Lu
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 17:38:06 +0000
X-IronPort-AV: E=Sophos;i="5.58,366,1544511600"; d="scan'208";a="26504863"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 13 Feb 2019 10:37:51 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 13 Feb 2019 10:37:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmimxU55TllXSOjDWoihlOkLtXWVGJUmNFDjygcYR3w=;
 b=dzliPKzAWuHwkFwWAItnSOZWXptuMNQ8/k0T34xu3luLdfq5Wu1sZI3cSYAzyuSe4zE6R/hXQM5hOTYy6+mT/baF7dPJCRrwcB+i781EYXV3TUZzDhQpzgXCahzeGmx0CNBvGaS0qCgxUIHNrVMDvuJLKEJaSbJkMI+VDMEb8GA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1378.namprd11.prod.outlook.com (10.173.33.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Wed, 13 Feb 2019 17:37:49 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 17:37:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <palmer@sifive.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 2/2] spi-nor: add support for is25wp256
Thread-Topic: [PATCH v2 2/2] spi-nor: add support for is25wp256
Thread-Index: AQHUu8lZNYJ2Ubpy8EavTZ/VcmOfWqXeCw0AgAADBAA=
Date: Wed, 13 Feb 2019 17:37:49 +0000
Message-ID: <92a75f0c-372f-df8e-f99d-264217046f55@microchip.com>
References: <20180807194059.26348-1-palmer@sifive.com>
 <20180807194059.26348-3-palmer@sifive.com>
 <ef174850-93df-6032-c742-68237c37afde@microchip.com>
In-Reply-To: <ef174850-93df-6032-c742-68237c37afde@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0068.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::12) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 071c789d-7f01-4c9b-0bdd-08d691d9f8e2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1378; 
x-ms-traffictypediagnostic: BN6PR11MB1378:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxMzc4OzIzOmxHUWRnNjNyQ0ZUR0dVWFpoM1pDYlo1SEFz?=
 =?utf-8?B?OHBJcXpwYVZueTNEQ2NVdDRveVdJK2phdlc1Z2tybGZzUzloTU13YUpycm9I?=
 =?utf-8?B?bUFhQzN1bXJZYjVONFdRTUVWZVQwYzdmVjI2K1A1bVRDRlFOdUdzRHBzUVVD?=
 =?utf-8?B?ZFFwbWUwb3hGeWVCMit1V1ZWalpRdXluYk1QS3NKM1hiOG55WUJ5OWVQY29H?=
 =?utf-8?B?YUIrRWQyRkRIUVRqaHAvVGpDVjZXVUh3eTRyS3hpbU5mZ2ljeE80aWNNcjJr?=
 =?utf-8?B?anVRa1g4YTdvSkZxYmdGTVkzSHJkRmp6MDdwL3NrVFZFOVp5REgxc2FIM282?=
 =?utf-8?B?TUtjQWZVQ0E2OHFMdmQyU2lFMFNrREVRK1VTcXcxVGFWWmg4SnRmU2p4MHls?=
 =?utf-8?B?dFM4c0Y1YnFlcHJjeGZScythaW1jNG1pbWpxOTVHYjlBL09ocnEzS1Z4Y0lL?=
 =?utf-8?B?UUVRR2RYSWdCRk82MnljSnRtWW1kMDk5azF4UHVDeHBZUmN3dVZJYWdpcm1w?=
 =?utf-8?B?UlFGK2E2Nkp3K1RiTlhjemxCc0FraTBOSHYxZ3dTTGF4VGVzZ3VqTFEyaStF?=
 =?utf-8?B?VGFma1hCSTlKdnVUbkphRkFTQXY1cDc5eHVBN2JDSS92OHlKZTB3SnlsNTd3?=
 =?utf-8?B?N2lZRWlsZVhtK1FOOHE1eU5aN25DZms5WjB0Vjg2ZHJCcEhtUllybTRxMERs?=
 =?utf-8?B?MzkrVHpZL2JYd1BpcjNhU2UxSmc5OXhENUZZSnJSMVJOYmRtN0l2TjdOY2Q4?=
 =?utf-8?B?YjRwN3RuUkRaZUlEYTFWQ3cybUhwMTQzbzNiQ1hiZ3o5bWplcG9UMGVLTTNk?=
 =?utf-8?B?RWsxWUllMkdBVmwxTkpxL0FEOHlEamp3cGZ6d24yTmdXYU9McmdOcldENlhO?=
 =?utf-8?B?YktqMVpDZnlWYjdXdmx1SjlFVTRYVkgveFVvR2xTeCtHYmxhSlVHdjJtNVQ5?=
 =?utf-8?B?NUJReitoR2VIRi9KWThXbWhhUU16dWlaaW91MEZEaFprQzhqRzBjY0JIemw1?=
 =?utf-8?B?OXRTNFBRRVcxNHZPS2xyYklHYVczd2Z6eHkxelkyNWpxcWd0ZytsTW1qTDhD?=
 =?utf-8?B?dy9JMGorL21TZ2JudDFNTWNodEVFQ3hxR0lra2Y4UDRhemlwTmQ4cG1Gd1Vs?=
 =?utf-8?B?c0NJNGtVNEJtR0ZQbEczV2t5eHY2MGlOSzNsN2ZyLzhrNEJPQWFnTDN5TWZ6?=
 =?utf-8?B?Z1NIa0ZlM3J0Nzc5ZGc0VG5BeUJyUy85WC9oR1Evc3gwUk1lZ04wRndpK00y?=
 =?utf-8?B?NVVNYWYxK3plamVWQkFaVlpRSmlQOXJEeWxQSGx2T1Fwci9BT1RmWk8xLzRF?=
 =?utf-8?B?azAvUEpuenhCRno1QVM2eXF3YjhPWG5sRThwYU9JS2gzT1AxcERKN1hFSEYx?=
 =?utf-8?B?MFl6aEhLeUVjK3pBeUhkckZHWDV4NWhWUm42c2JiRGc1bDBUY1hYSU54alJj?=
 =?utf-8?B?RThPcEdlSnljVlhQSTBDN21yZm5oc25scHFlcW0zK1ZtU1o3NE8raFdJQTE1?=
 =?utf-8?B?eVFWV1lrc05meTVFM3J6QUJwdFNGbW1kU0lmeWN0VXEwcU4wVTNnbGlmQS9t?=
 =?utf-8?B?NWxvYzFMSTZscnJSRUIxdlh1S3RUTVBhbmwrR0NNQ2NYRjZBWlQvN1NaRzMy?=
 =?utf-8?B?SFkyRCtHeGNzZHIrdHp4K05zbXN0UzB4UGlkRHlRZ2QzL1c1NXZJcXhxSjJv?=
 =?utf-8?B?UVRWUko5MDBmTmhVS0MyU3kwZlYxcENQdllQenV3NmNTM3NGd3g3ZGdkamVs?=
 =?utf-8?B?dTk3Z2JWcklubEpSeEJ4RzAvYmtJWFdzL2NDNTRJdERJOXZrWTFCNnk3SXAr?=
 =?utf-8?B?RS9OR0lrLzZpeTFnN2sxMnp0c1FCZ0JyVmNHRjM4b29aTEE9PQ==?=
x-microsoft-antispam-prvs: <BN6PR11MB13783DB1AB4520DBC8B43078F0660@BN6PR11MB1378.namprd11.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(376002)(396003)(39860400002)(189003)(199004)(53546011)(7416002)(386003)(6506007)(7736002)(6486002)(229853002)(6436002)(106356001)(476003)(486006)(2616005)(305945005)(105586002)(11346002)(6116002)(446003)(3846002)(4326008)(102836004)(26005)(25786009)(31686004)(186003)(14444005)(68736007)(76176011)(52116002)(478600001)(72206003)(2906002)(6246003)(2501003)(71190400001)(8676002)(81166006)(81156014)(8936002)(86362001)(6512007)(14454004)(66066001)(97736004)(71200400001)(31696002)(36756003)(256004)(316002)(54906003)(99286004)(53936002)(110136005)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1378;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RDsogw1e1Y7OOnG8axbYngXP8JFMLzHmnk6J5yq817aA+Z1BdcIrkxDgXAgE7Tz7OfLDEwVF+DaLI4Cu46QK9jTJsgDPdy28hwU4CCTXZedy2X4lAwQdyhy9V1CIZlA/sUSzJpxQujFsSitQ9QT5pjDgkPj0mFVe7T4Rz6C7N9FesXdDOZQiUAMI0Avuc+OJse3kipIh5jvbRLrqL+lNybqk6hzsU2at8xR3JngLZQXM+HdU0OZjhSCns3fQRMSW7YpH0UWskuysDXttGqyd5Ox8XlbVfeQyPlGTu4Nfu/ylyHvhQHeel6tIB9X+vDAR3iDDDJJgO8hKMIqTPctZdhLXcq18ZtDzDyhzNy/t8iIVkzqakPXPqaZYF+iulJh5CKHtlqhbWqGxwwllMwHHINyX9iOqaToQuy9xofnOCYg=
Content-ID: <47E67AA48EDB804A9BCD83DC11602D73@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 071c789d-7f01-4c9b-0bdd-08d691d9f8e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 17:37:47.2885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1378
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_093804_808666_F54914C9 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: bbrezillon@kernel.org, wesley@sifive.com, linux-kernel@vger.kernel.org,
 richard@nod.at, linux-mtd@lists.infradead.org, paul.walmsley@sifive.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/13/2019 07:27 PM, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> This one looks pretty good. You'll have to start the patch's subject with "mtd:
> spi-nor:" instead of just "spi-nor".
> 
> When in doubt, run git log --oneline on the file that you are modifying and see
> how previous patches are prefixing the subject.
> 
> On 08/07/2018 10:40 PM, Palmer Dabbelt wrote:
>> From: "Wesley W. Terpstra" <wesley@sifive.com>
>>
>> This is used of the HiFive Unleashed development board, and follows the
>> pattern of similar ISSI devices already listed.
>>
> Please add a comment and let us know how you tested the flash, it's always
> comfortable to see that new support was actually tested.
> 
>> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index aab93463a5e7..f10017b4543d 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1072,6 +1072,8 @@ static const struct flash_info spi_nor_ids[] = {
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "is25wp256",  INFO(0x9d7019, 0, 64 * 1024, 512,
>> +	                SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

don't forget to fix the checkpatch warning when resubmitting:
$ ./scripts/checkpatch.pl --strict v2-2-2-spi-nor-add-support-for-is25wp256.patch 
ERROR: code indent should use tabs where possible
#40: FILE: drivers/mtd/spi-nor/spi-nor.c:1076:
+^I                SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },$

total: 1 errors, 0 warnings, 0 checks, 8 lines checked
> 
> You missed the SPI_NOR_4B_OPCODES flag. The flash has 4B opcodes, let's use them.
> 
> Cheers,
> ta
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
