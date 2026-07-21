Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FADC44529
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5cleahU3SZ3sMOnocqM2iCSZwGrOOIPYf0PCAj5148=; b=xIXKUS4fWXs0GS
	TAs+RL8zB2khfkxOY5vnvS5JoqcSJhbauGxF6tSbsWVuoKe3hp8igKwT023ryjN8CWRPq0LiOfe0l
	kVnSVGQUfTWMzrjDGff/559fVI3SErmbulsBxh5ZdawYzbn6iKevuPjOXOiNDhD652ivlBJV7YPwZ
	OkMugxZGufImAGLxE+qWxaXdbCeNX/AjYcE4iJH5d9ATQnwenEUwtspbAGatsuDNR3E7u0jfRazzl
	ymkC6oPI8al6dbZ59W3EHnBE8uEXk53HwTf5Qjcm/NMMKTo2FpDEAdDsYtGkCe+BxLCyg85PCBAgJ
	Bq/AY5dKqdaGru58oLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7XZ-000000095eF-2MvE;
	Tue, 21 Jul 2026 10:17:33 +0000
Received: from mail-southcentralusazon11011046.outbound.protection.outlook.com ([40.93.194.46] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7XV-000000095dW-429u;
	Tue, 21 Jul 2026 10:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G09MtIFO9jTYox3FtpnpGGfSRcwOO83jE5hDBxnrPjWVyP9r1bVVBAv6luxZcv4qmQEaJ5VEkeYZgStk0k5WuOmBOyyewWmz7Qa8djICkYhfEsCM2X/5JbtoGeOGTk3TXIbArnXqxmpvgS+VLM9DSutV1FVrLzhIIo4I2RYa+xT2ydgWTm1psaZch6c4PfGpDkWIKXcPIYIv0JnPMhfe4FgotWU+GqN+e75RFIWcUlmUExxl1e6pTUUH8rw4hH7NYL0MULE1dQTgF1WXcQIo1lXYA7MwCdAAfLuxhlO7dY9YEkHyhkM4s8O72ihtWovzDhkeVAYtlAl942rxX4k9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPTl3QDhAUaUXmqliUUWunI7uAiyVehigoAcbiwLKEo=;
 b=V9XNQWIfENiRirpYYScyi/ELancyu/ED37eKcJM7x7uc/PCUOVl7ajoRhU1YXyHjC/GqVjRvavXKs5i0XPYE+edUVyg1oxMR+0QVKrv9YcxPRMHXZ/uJGx4E/SVEtLBglIv9/RCBHEzIcq5DzZ/WUb8pZmEJmmZMRxG6T4UeeDCXpXv/tK1KL2h0wZX8XnEtZJO3ImJzfXD0VFeTvrApGxnnFD5f5J4EStflf+TxsGxoT+lU/CC6u6MnrOQ2YxpJWhdpfX9zlmgn/Npv+alUWQfRGYCEQie03PmkewAEmKKxSW+gwxfx3pPSu0JPhMhK1p1T+dRUrU7Fd5qsE+DTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPTl3QDhAUaUXmqliUUWunI7uAiyVehigoAcbiwLKEo=;
 b=UYRE/vX4dKBcc/kY0lSakb6j0XX9zLrcPunM0/oX40F1/02k7JsXpQA5QxU2QzRvBonu8dUps3kaNMiZGXJ5sxelC9E3f3ntFddzlp/udkiBo+oxufzbB2MX43Fe9J4Pt2YCDbj+idSKZBrwuPJlFvamNOX3mE66D+ulzGzl/VYeJ9h2SHPmZ8+l1FSe1302HZ+bTbZnakQ6zYqKrn0Nn57Md5PANv4UjLeaodLJx/x44rXd+NrkNDcgzIrqMVW6TGn2+Kps8/31K1yP1IhXGwO93Y0Tzp0pJSaLQtaXDmPejmM/g587nS8FqFXtbGRg1iUxkruxYevy0YogzOPkLA==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DS0PR11MB6520.namprd11.prod.outlook.com
 (2603:10b6:8:d0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:17:22 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::2fa5:b8c0:f483:22e]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::2fa5:b8c0:f483:22e%5]) with mapi id 15.21.0223.011; Tue, 21 Jul 2026
 10:17:21 +0000
From: <Manikandan.M@microchip.com>
To: <mwalle@kernel.org>
CC: <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
Thread-Topic: [PATCH v5 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Index: AQHdGNH6W/JjL8NI2ku7431FrmE4R7Z3jD4AgAA2WYA=
Date: Tue, 21 Jul 2026 10:17:21 +0000
Message-ID: <c921d021-b6c3-4d91-89ca-0e3c41169e81@microchip.com>
References: <20260721052859.171341-1-manikandan.m@microchip.com>
 <20260721052859.171341-4-manikandan.m@microchip.com>
 <DK42262TYFG1.NZKF4VGZGSRM@kernel.org>
In-Reply-To: <DK42262TYFG1.NZKF4VGZGSRM@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DS0PR11MB6520:EE_
x-ms-office365-filtering-correlation-id: 4fbaa634-b93c-4300-a6f5-08dee71140b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|11063799006|5023799004|56012099006|4143699003|10067099003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: N//bZYwBswBtng4lx0BCQKo3Ky4LYXOQJ0Us1qs05antRFAGYXXoUHdUzLoyUsUb9kEM0qDrTSSCC/RBrgiHjafSlRWTtfh1B97bfhuwo/86KDkEBO9MqnLcGkFy1NYX0SdkrPxm8olNLPmyqQ2U/pP1jub6zoegAm+/w5ZHGc683fgB2VnJtpXqaKhX3dbdgqNEOH/hF3k8UpI1ktjSeFhrmqU+3FdkaEjIpNfO1aKNKLSDPwijoGt86tt1ZePaTEuIcpKB8CF9vSYWZIS7acDoZy6ZUeIIdwi5FrXnJTSXmMM/nxjYylkI89mKJAj2MtDZiuTatwVGO2S/l7q/RMydbzqwHa65VCy+Cy2ClpflNwnqtiEj5sTO+XBMUFV6pQOB0gHoX0sFF+kSeszwf+xhvhg1l4XA2o+Gb9fyv6K7PukiwqT0b7eBuy4cknR74BCYqdIvHT6DJW7htacuhK4x7bHCm+rUxpNxn8K3iJsFL4cffIcONFNFdS1Db8gWU/1LFhaKUK5YOZtF1YKp/GXZEyzdNXISIVA60v+k/Z2NYlwSNoz9QjQentkTpmf7iA/aXOReSgJr8zPxI1SwDt5AILduWUaz1A1erPwaG7GxbST8HdRnbUZwK3m7Gz9OXcj0LB/0Lgy54mO6007rgEzCPQ9+n3jrmPC3G3yfDv9UQLh2+SUGrjzPd0IKfG8iEeyBPxl49Tl1mayc0cggov1arp4hVy4srM38YRgMTqk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0dUWDJDbTQ5WmFjUENNT1JQRXhTZXhDNnZxaXpsWmp4cDJoK0NGWi9oTXpF?=
 =?utf-8?B?ckY0R3lEdkRCNzhQSTFaT2d2WE5CY0RuUERTbnBmNmpNRElzTjlrVzJqdGhl?=
 =?utf-8?B?bW1kaFhsWm5rdS90UmFHRmc2L2xQZEhPaFp5enc1c2szTzVFS1hNWmxERExY?=
 =?utf-8?B?V3dHQmdkeGlSOW5zZUdwcWNEWElxTG9MTkxRMzkwY0ZsZ0RodmluVDNvcXJI?=
 =?utf-8?B?elVoNCtHcUVZRzJkL0ovcDlYWGRXelQ3LzhwSXlXeXZMRk1Kby9WNXFPSFN0?=
 =?utf-8?B?SnpXbTlWRzFzek5iVTk2Smp3Z1paaE9rNUsvVXptMTQ0c3JiaWN6dGZnc3JW?=
 =?utf-8?B?SUgyNTMzc2lnak5qTVFHQXAvYlE3SzF1L2RDcVExRis3akFBZFViNy81VEZG?=
 =?utf-8?B?YmlCcWhoWTZXeGcrRkdJVmpYQWF1V3I5aDZtbGZZRWgrMGdBOGFnOXUrMTZY?=
 =?utf-8?B?LzZ1RUFBVThTb3RSUS9BTDRXbzVNRHNsbTdOWUFjME1wZmhjRjdWZC93cklD?=
 =?utf-8?B?MGJSSGJPZ0JZSzdLUVZnOE1CRFV5S2VKZTZlN0NLeUJ1VFE0RWF0SUQ3Sisw?=
 =?utf-8?B?aWJzWGpadUZ2S2kvemdRMXZvNVNtZk41MEwxbW1PREVyTk9BdUlwWmZuT3Jq?=
 =?utf-8?B?Q3FpSjdQT2hFUEk5cWgyMTNHZTVnb0VRSWRJNkxFM3M1bXp6SjIwQVdmc01B?=
 =?utf-8?B?cEJMSFU0THEwbTBybGVBSEhobEo4cTlpSnRHUlNOZ0h2VllHVmJPZElzSER6?=
 =?utf-8?B?YUlKc0p1WE9HNGJSTXQ3Z1lwTDYvOGxXZWJuMVRjQm1UQjZsZWFjMWZnQnEw?=
 =?utf-8?B?QlZwMEtOQmZQVTRZMHFCZHU3ZndMaFhTYk5HWlNCR0JPQ2hGRU9sdVBvaXlx?=
 =?utf-8?B?TjVEem1HdEdFOWdGYkRDbXptRlVIREpqNXNYdGg0WnVvRWZxcVFmc2hETm9i?=
 =?utf-8?B?TkVJeWt3SXFKVDM4YmpaRnY3WEFBTUxJek02cCttREtSRStLRHZnNkJvVjZm?=
 =?utf-8?B?Yld0SHZvVTZaUzlsY3BBYmlGcmVLc00zZXdTMC9ncEhxRVRxS3BPd0UvZHVj?=
 =?utf-8?B?dm1weVlrdEtsQmd2R3FYcTliVnFweTM0Nll4SVFCUVNDM1VZVkFtQkFvd2R1?=
 =?utf-8?B?aWh1VGRhYkU4Vzh6a1RUdVh5bXJjUGlFbE4vM21tNlJoS0EyQUMrUEJFeGFQ?=
 =?utf-8?B?RnFlQXZ3bWswR1BSWFZSd3ZEcG5uQTdsVjVsYmJObWtqd0JzR3V4M3VwbnVn?=
 =?utf-8?B?TkxZZHkyVEhuemRTYmk4bXZ0akJkL3VzRWxRNkVWVVhaMENiZUYvZFU4MUFF?=
 =?utf-8?B?N1MrSGRqOHQ3Y1QxM1dRTUJoRGp4MzRiVkJ2eVNxWUFPS2lpYnFpSEloRlVV?=
 =?utf-8?B?Y2E4TkE5NVJWelFNVjR6ZGZTK21MYTJsYmhnRkdhRmliVWpRZ2s1aFdTWGNs?=
 =?utf-8?B?allXS1RKU2RBbVFBTVpyZVdwaDNhRVNDeGN3dXRDQUI5QWtLdlAzLzFVSnIz?=
 =?utf-8?B?dkpsQzh0bUFCZjVqWG9lSzBrbU94S2R6ZW5jdllXM0QwalpaWElVYnlhUUFw?=
 =?utf-8?B?NzBBb0NHeTFhZ3piZWxCa2VpV3NXK1Y4VEQzejhoVGVqQkZhYzIyakFaeWNZ?=
 =?utf-8?B?b2JiU0hZSmVJSXZIUHg3TzlUWEQ2YjlpVDlFTnEwQUdvL3NzZElsMVVuSURx?=
 =?utf-8?B?WWNwNXhpQmhWbjdzSG1qUkdhWW1nSUxWb2Rvd2pwRE5XRUF5Q29oazJVOVVo?=
 =?utf-8?B?VFFRYWpGRHQ2Qytia2hvMWhoY2RWZDIzRlgwVXFzMVZrc2h0S2x3UTd4MzBa?=
 =?utf-8?B?RnFzVnVRUkIrY0k2U0h3RVh1S2RUd0ptRnR3dFFraDF1cm53RkF2S2c2cW42?=
 =?utf-8?B?eTFQcTlHdThwbmk1VEhXc1RLWWs2dmdpN0lYRG8wQkx4N2hSVDUxQWRCR2FJ?=
 =?utf-8?B?T3hEclJHTkV3b0ZObjJxODFZRncxaVJaT3hqRGxlL2lUR2JkeHRkNVNUb0dT?=
 =?utf-8?B?d2JGdkEzazc5ZGxCNjhxVG1wV2JiWUF5ZmM3bkdTdWFWSXpWcCs3Und0MGQy?=
 =?utf-8?B?Wnpyc3JFZnlxSDN4SWJFeDZUTVcwbkVMei81NHN2eWdjTW5hek5zY2pISmNx?=
 =?utf-8?B?ZnJmY240cnRpeXFCaWQ2ZjhMMDZsZTJNVjUycjRRejMrMmV2Mk9ZYXdOZWNh?=
 =?utf-8?B?RUVHTXF3dmxrV2NQekp5UEZqY2FFS3FBZVE0clo2bWNGMmtRZ09MRXV3dlUw?=
 =?utf-8?B?ZGpHdUdrT3FNMnZpNndTeFl1QXZHNWQrMmpaT21wREY2VUdmU1ZMQWtZTzFM?=
 =?utf-8?B?WnJnNG5sU0x6UkowVUdRMlk2cXZJdFpNdFE1eXZ3T2tTdDhMNytWZz09?=
Content-ID: <B5446CBA07A23B4A9949916C5A58E8B6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbaa634-b93c-4300-a6f5-08dee71140b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 10:17:21.8539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4z5v/mORcR2zFYw/EI2WTd+YqDTe+65JJgbAWvh6tFtNKG5fK9a9a1BJ9HoFG0NZs6lCJADRtte5XSRM89brofJmLU0yPwSLq6t2mZpXp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_031731_064137_2E7BD876 
X-CRM114-Status: GOOD (  26.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi Michael,

On 7/21/26 12:32 PM, Michael Walle wrote:
> On Tue Jul 21, 2026 at 7:28 AM CEST, Manikandan Muralidharan wrote:
>> The SPI NOR core already reads the SFDP tables during enumeration and
>> caches them in nor->sfdp->dwords (see spi_nor_parse_sfdp()). Re-expose
>> that cached data as a read-only NVMEM device, in on-flash byte order,
>> rooted at the flash's SFDP child node (compatible "jedec,sfdp").
>>
>> This lets NVMEM cells reference any SFDP data: a fixed-layout for
>> parameters at a known offset, or an nvmem-layout parser for vendor data
>> whose location must be discovered at runtime.The device is only registered
>> when an "sfdp" node is present in the device tree.
>>
>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>> ---
>>   drivers/mtd/spi-nor/core.c |  8 ++++
>>   drivers/mtd/spi-nor/core.h |  1 +
>>   drivers/mtd/spi-nor/sfdp.c | 86 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index ccf4396cdcd0..b833d8ec2d65 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3204,6 +3204,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>   		spi_nor_init_params_deprecated(nor);
>>   	}
>>   
>> +	/*
>> +	 * Expose the SFDP table as an NVMEM device only when
>> +	 * the flash actually provides one
>> +	 */
>> +	ret = spi_nor_register_sfdp_nvmem(nor);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = spi_nor_late_init_params(nor);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index ba2d1a862c9d..0a6484298c5c 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -698,6 +698,7 @@ int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>>   
>>   int spi_nor_check_sfdp_signature(struct spi_nor *nor);
>>   int spi_nor_parse_sfdp(struct spi_nor *nor);
>> +int spi_nor_register_sfdp_nvmem(struct spi_nor *nor);
> 
> That's probably not needed if..
> 
>>   static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>>   {
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 4600983cb579..704799fe92ae 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -6,6 +6,8 @@
>>   
>>   #include <linux/bitfield.h>
>>   #include <linux/mtd/spi-nor.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/of.h>
>>   #include <linux/slab.h>
>>   #include <linux/sort.h>
>>   
>> @@ -1612,3 +1614,87 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>>   	kfree(param_headers);
>>   	return err;
>>   }
>> +
>> +static int spi_nor_sfdp_reg_read(void *priv, unsigned int offset,
>> +				 void *val, size_t bytes)
>> +{
>> +	struct spi_nor *nor = priv;
>> +	struct sfdp *sfdp = nor->sfdp;
>> +	size_t sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
>> +
>> +	if (offset >= sfdp_size || bytes > sfdp_size - offset)
>> +		return -EINVAL;
>> +
>> +	/* The cached SFDP is kept in on-flash (little-endian) byte order. */
>> +	memcpy(val, (u8 *)sfdp->dwords + offset, bytes);
>> +
>> +	return 0;
>> +}
>> +
>> +static void spi_nor_sfdp_nvmem_put_np(void *data)
>> +{
>> +	of_node_put(data);
>> +}
>> +
>> +/**
>> + * spi_nor_register_sfdp_nvmem() - expose the SFDP as a read-only NVMEM device
>> + * @nor:	pointer to a 'struct spi_nor'
>> + *
>> + * Expose the whole SFDP, in on-flash byte order, as a read-only NVMEM device
>> + * rooted at the flash's SFDP child node (compatible "jedec,sfdp"). This lets
>> + * generic (fixed-layout) or vendor (nvmem-layout) cells reference any SFDP
>> + * data. The device is only registered when a child node with the "jedec,sfdp"
>> + * compatible is described in the device tree.
>> + *
>> + * Return: 0 on success or if there is nothing to do, -errno otherwise.
>> + */
>> +int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> 
> .. you move all this into the core, as the sfdp.c is just for
> parsing the tables.
> 
>> +{
>> +	struct device *dev = nor->dev;
>> +	struct nvmem_config config = { };
>> +	struct nvmem_device *nvmem;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	if (!nor->sfdp)
>> +		return 0;
>> +
>> +	for_each_available_child_of_node(dev_of_node(dev), np)
>> +		if (of_device_is_compatible(np, "jedec,sfdp"))
>> +			break;
> 
> There is already of_get_compatible_child() doing exactly this.
> 
>> +	if (!np)
>> +		return 0;
>> +
>> +	/*
>> +	 * Register the put before devm_nvmem_register() so it runs last on
>> +	 * detach, after the NVMEM device that uses the node is gone.
>> +	 */
>> +	ret = devm_add_action_or_reset(dev, spi_nor_sfdp_nvmem_put_np, np);
>> +	if (ret)
>> +		return ret;
>> +
>> +	config.dev = dev;
>> +	config.of_node = np;
>> +	config.name = "sfdp";
>> +	config.id = NVMEM_DEVID_AUTO;
> 
> Or rather NVEMEM_DEVID_NONE? There will ever be just one SFDP nvmem
> device.
> 
> How does the sysfs path looks like?
Currently the sysfs looks like:

/sys/bus/nvmem/devices/sfdp0

I kept AUTO so that the bare "sfdp" name would clash on a board(if any) 
with a second flash exposing a "jedec,sfdp" node.

> 
> -michael
> 
>> +	config.owner = THIS_MODULE;
>> +	config.read_only = true;
>> +	config.word_size = 1;
>> +	config.stride = 1;
>> +	config.size = (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords));
>> +	config.reg_read = spi_nor_sfdp_reg_read;
>> +	config.priv = nor;
>> +
>> +	nvmem = devm_nvmem_register(dev, &config);
>> +	if (IS_ERR(nvmem)) {
>> +		/* NVMEM support is optional. */
>> +		if (PTR_ERR(nvmem) == -EOPNOTSUPP)
>> +			return 0;
>> +		return dev_err_probe(dev, PTR_ERR(nvmem),
>> +				     "failed to register SFDP NVMEM device\n");
>> +	}
>> +
>> +	dev_dbg(dev, "exposed %d-byte SFDP as an NVMEM device\n", config.size);
>> +
>> +	return 0;
>> +}


-- 
Thanks and Regards,
Manikandan M.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
