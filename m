Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AE4C07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:45:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B850D61990
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B850D61990
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1c+eaiqc2FGF/72qO6c3X1ODCK71Alb3TDYCGbsOEg=; b=abtRBzZVQhW0C+
	Y9h9MAPhUY2clTT3lc2adbnbDbLOJakKGZXUIUcQTMkKTxYF2cVn3Wf4JJ6PVBK01jUoiksctqYCU
	Yw2caLgaurA1cHVnHH3hRF3xmoJBz/WUykWD1HMh4dNJXe2qPZjeXrzfhAz2zrsfcUMjDmVAGWVxU
	EkRwyqNuhGgj2Q81W1j4Dro3FI+7esMriCXkxFJrmbAn9gSVRmegcke8pWBh4MarZN+WV4kWzZizI
	pL8KpeWecWZOiG7+Nixdxq0icML7eMithgxuVXC5DekVz3Sj6H6rhkMef52YQliTEZ7519dSpLuS/
	B0yzuXOcXpeQ2A7J1iLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0eoX-00AZZO-Rj; Tue, 06 Jul 2021 06:44:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ejk-00AXNu-7h
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625553556; x=1657089556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gEWBVdAAc9qsprNJaOFmZjMtuYi7wM2HmsxMq6/0/jI=;
 b=e8PqvWuw4DAM5nt7jLkIX+wKi+iCqeMuSQE7waOPDOWVzD/11/yhVbAm
 q3/xnFnTMeQJfbtpufdq/yZ/FAaBl3B1rzY3tKPPyPuy8Ut0u6c+noJtB
 sBgEHCKJN/UBXRMPpGIyeBCsxqTZN9g2+vhdOgtdT8E6C+WNkYjdiq4Lh
 ULJcHV6LO0nMwJUX6E1xZ+8CkylaBU8TUsq3A/p2jc6SzsUNvzuAOhmTf
 h8kFNG9UvmSuaaNRo+cPoXkSl6JR6PYr/KlxMgzrpGZ8P3GNpG7yKTlPs
 9Thd9NuPsGB/tBOxAyj7pl+GsDyBDNvoMTYLQRkIJ0MaqxxPUbSeXiIUu Q==;
IronPort-SDR: MnawaVMYuOB8wKwUt8pVj48sHEukd1KGDcSP4qx3yqMppL/cdjK6J+6c0k9E/yyx0QPdjjLoqz
 +aAe3cdmknv9AoHp6BmcsCYJDoebCXjZtneACPIXTKylgxyAO248N5G6kC8zbaECOvnKaUyii3
 9Ju0jZDmxBUO6AG+X/Hv4R6A0cOXzXKxCpP3E76rW6XD4KmDU0sy3Ou/hzLZF507Kh3ennooHi
 MXvu4urg0e9aPUXkya+uj2yjBZE+klRPMoIZvVftQAoHQX95EbU+aDB5XNdHQTfqb58IC27Vp8
 oes=
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="127769071"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2021 23:39:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 23:39:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 5 Jul 2021 23:39:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEsEbn09Zf8g02ItOuk+s4yMgZA51NOPqIjcgXPFFwnwJSzbrGrBj1HOlBGoHZstCioUlVThaAObfVYAfTpJmeAepHx69fg0cqBbwWlLRPNZl1A1S8YjT8uYmfFh9uh3c+AyWNPAey8CPXsppAHWQP38YyLp0TVIyiikddG4xQ0S4xSYY5PSLMavU+AhVq3u1XOQf4g7f3329PBo/auDiNXHVaJJaGrKRpi72G/hY+fCk5sikzxX2yEXWbjAstPuxrPpQyM4465E49/S11cE8NKRwpJQVYT93rp3z2d135zARvZODrRFTlyi04xx1VBUx3JYgWzBx5FuhosRKlk+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEWBVdAAc9qsprNJaOFmZjMtuYi7wM2HmsxMq6/0/jI=;
 b=c/hrCsjB5SpAtntDhehhFO+Zmd9YL6ADIpCJhuokneDJbnJoSHVOiT+Znh26Qhx2vJwTvYW7XgqtEiSa5ksiJ4jt4sAfbtemfgkF5nMtt39eQH/2LYu7Z4Yuk/kGAytGIMuv/+ldtA/3wb32E/JX2ViShjqIX1mVwXYzltzHnfL0XpOWM8sS/2ffTVIDNgzJDMdNTo7GXyfJiqxLYBoxa0QH3P9JV/BuzkQi8wQPUMY0kyQtkxxVUt+dQXcY+Cgz/ps0EJDsSiNcRJyQN1TwurOOBCuArQLqY4UNaH1tL1MNO+a1WwzI4M1iPuJObhbOU9B6YSm6fFR/Fii1JwtzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEWBVdAAc9qsprNJaOFmZjMtuYi7wM2HmsxMq6/0/jI=;
 b=FA2xNZwpLUPXSYkdYj7TOuk0AaYmOz6ywb1KI5HPGwc150TEcFDiZiUMNU67WIQ+UIzrGHLpzCUU7Ve1X/0/9go6+J+xAsJtHuRq5VAMjeZASeppPJ4EXBQ4Zsei1ijpvz+y/YD3TXOfAKhmeTZszqnIT9/d/lfWEfBI4vAmODY=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 06:39:09 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:39:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, 
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 6/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Thread-Topic: [PATCH 6/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Thread-Index: AQHXcjGfNqdbeEzqZU+jjiziE/76Ww==
Date: Tue, 6 Jul 2021 06:39:09 +0000
Message-ID: <56f48714-b7c5-40c5-d95f-4cbc4c51953f@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-7-tudor.ambarus@microchip.com>
 <20210706062806.m63v2kaqkckmwgwx@ti.com>
In-Reply-To: <20210706062806.m63v2kaqkckmwgwx@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c61dfcc8-74cf-444f-2e1a-08d94048c255
x-ms-traffictypediagnostic: PH0PR11MB4999:
x-microsoft-antispam-prvs: <PH0PR11MB49991D7F1157FC7F08B23E97F01B9@PH0PR11MB4999.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /fqiv5S2uEyhnp0o8ruPIJ3952nGy2dPiCfXsm+kXjphqhZ6E1vRtjvi20PCJBwpwjiJLEkb1UOywwoVqrO1clMuChjMml0GMVNwcXi+024FGAxCeJPNuHJ/rPsJcEi5TOh8z5jEioieaFYFnMv4tuudz9ZvVW3OwqAKXlYW1Nwa0SnC4hORFUoIj6pjU2W94IoHNnn78Ty9PQcpy3jOejngCeZzvAjNmeA8kp7N9efkdZSMF1MegbrKafqN57KZrm3WefGfejGOXudIXA4YXTTsx94QE5ihKS7s6HvkF5DhaL9m+fub6DdjJ/jM5gbyMWYpFcgXD1BdOtAWI0nll6XwCIwvbSHarAOKs562CBxQDT5xtqOw5/t19Z+ImOFHfFB3PxsuVsl8VFx6lTxNt+oBmh53EXp4sfPCLxVV+kS/JZNUuS9bVBXhaXJ6G5QSxxw3tThY6PfjrsTpYz+6soEzNzrd7W5khU84sEXfFfB/SGZu62IVnvQFBxDs1MuCtqUYmH64TqdIXKaMUrJMFrXD+7sUUrmn0NDrkpH7q/yQYWQElMzW77gM2V3tdtzJRhUeDv2m8udB9zJoOTZePPRboVMd+38uoxQL+uUH1AOkWFbNjIcVuFedVzC5Ywgdi5tgwAphExZpruviMuMv8wcunBOWfu+i2v4TewD3k1sp7tNxCed8G0gNjVPinQwtqHgGAfcutHiNJsOSYL3PN41Y6X11k9QdOifxdU6FYO3KYXrf2TfWPn3a7hlzNg5jNkbuYU7daQ9RwVWgngtTdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(4326008)(86362001)(31696002)(186003)(122000001)(71200400001)(64756008)(6506007)(26005)(2616005)(66446008)(38100700002)(31686004)(66556008)(53546011)(2906002)(54906003)(66946007)(7416002)(316002)(6486002)(8936002)(5660300002)(66476007)(8676002)(36756003)(6512007)(91956017)(6916009)(478600001)(76116006)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blFTQ2RIcDRqNlcrMUpUY2xzRVFNSEd5Q0w3SnBBd2hyMlpMZUYrQ09vbWx0?=
 =?utf-8?B?ZTh4bnMvM2hnVUdiVW5KNXk0WXVleVNqd3RmN0NSRENPRWhDQ282NStjNTJ6?=
 =?utf-8?B?Z3I5S0pKc0xPRzhxb1MzWUZmOE9rZFppZ1UzQkswYmdGQlU5TlRlaU8xZXR6?=
 =?utf-8?B?TDJ0RzdNSjRpWWlhdjNsRmpCcE1naDlra28yZXRZbmpkMGdUTHpFT3NXQkwv?=
 =?utf-8?B?S1h5SXAzTnQwNHlxeEZtQ1NKMEtmWlhYVjJ6TWZTUGRRNzR0MGhxOUhnT2tx?=
 =?utf-8?B?cVJFWWRwNktDWUVOL04vdW96T01PT1EyYVFDWVhXVnBFWjNUYUxQRXl0eDBu?=
 =?utf-8?B?aW9yK1lLeHAxTkRpTkEyVHVVNjhqS3lFS1gxejJiVGNZakJ2aG50ZTN6K1Q4?=
 =?utf-8?B?UEdhU1FBUHZlT2ZRdEM5TFhDNHBiSGtMaXlpQVFzSExqR2hGZ0pTQ0x4VnNp?=
 =?utf-8?B?QjhJL0VwK3BRME9ZN3oraGRycEJFcWpDWk14TkErSGlML1VCNkEzT2tKdFlv?=
 =?utf-8?B?WkRxRjJ6LzdhY0FFeWJydjA5R2prQk1zeEFHeEJJdXFMRTg0WFY4YnZHT0JQ?=
 =?utf-8?B?UnFvejZrOWZQNS9YTGVjK2ZvZ3IrVnRYRVY4SmhhZEQvOVl5Y0JDbGdKT3A0?=
 =?utf-8?B?VWtVMUhER09CWXkxUVhRTWViNXVGUmI4bUxFMWFnb1RiT3F3Q3B3M09xTzBr?=
 =?utf-8?B?Lyt0ajlJOW1TaHQvcFo0eUY5Q2lnSFZaalRKVk1LSGdFeGVzdmc1amZGSnJa?=
 =?utf-8?B?aFQwMW5SYUgrSW4vNXpGNlRGWnd6UVlpT2E5NWZrbUllbmxPZkJVblB2NnZi?=
 =?utf-8?B?Sjd1OVZDUFNxNTUrSlQ2dlNDcE5YcXg0QUcxYTByYzE4VlFiTFFlNWFtV1Ex?=
 =?utf-8?B?ZFh2cFRQaHo1WW4xT2NiSjJBMnpEb2lGVEw3ODBsb01ESUh4Wm1YRmZQODhn?=
 =?utf-8?B?TGY1Q1JPNG9qRXFBOTFIMklBdnNVRDJtSFI1eGJKajJzMkthcFlESHNKSE81?=
 =?utf-8?B?SkJTY2wzRkgxcDhCdFVMY1BrWjh5M3VSd3d3M0hqN3oySWdKVGEyeGw1WXhX?=
 =?utf-8?B?VUw4LzJ4UTUxWllrZmU4VmhRckpHc3c5M0RmZ3I5UnEwTzdkcjhESzBRc1hN?=
 =?utf-8?B?ZWhoT3BmTHREMTNtQk1wd3ZDb0ROOWRFUXRNS05jU0VIWlo1V09OWDFLWlZL?=
 =?utf-8?B?KzJ3eVo2SFRKODZ0L0R2aWxxN3FKTUhBeE81ODR3TWVhdFl5QkRFUWVYbEov?=
 =?utf-8?B?bkRpUXFCc3ZlMHRBd3JwTHBTdERrUEp6NmIxZnM1RHJlWUJ4Wm1aY2c3VHR1?=
 =?utf-8?B?b3BhaDVBK3R0dytQaVcvSWhoQ2JqTnVnTHBPZEwvWGYreDhUS0NOVklSajVR?=
 =?utf-8?B?NEFOUlppWXZNMVlnaHJYaTJRL1JpVXlqSndpSEhvZkFLQzVETU5tZ0g0NW5u?=
 =?utf-8?B?MWpkeUVEelFsb0hOaUZlVkJWRy9yQ1hVZUxzZ3lnMHRaSGprNzNZbFQwTkM4?=
 =?utf-8?B?SGpVSExnL2FNZW9peDBDaDB3U3hXUUp1QzZHeng1NklFNEl6QU1maHNMMlAz?=
 =?utf-8?B?M3dUbXlLd3UyN3daeGY0UmlNUUFCUmVWQ2xzQ01xVlpXbGJUaUFhUEl5NlU4?=
 =?utf-8?B?NFljMFhwb0dUbGRHVW5ieHFxK0xWS0NzTndGUFdvRHRjbkhnc3IvYjBpcTh1?=
 =?utf-8?B?SEVLQVVLY29mQ3R2ZTlZLzl4SlFyZWdrWHYvQXYwelBsR0hDQ3RjSUxOZFlU?=
 =?utf-8?Q?ojJmRFj9xm4NfMAH4M=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E0418B9FEC16A646AA0E5C152B69B59E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61dfcc8-74cf-444f-2e1a-08d94048c255
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 06:39:09.0397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXkocoZpvYmV/Q4WS91mHXI0eqS7IPOYFcBX7OnuQAowKHJ8hk1UT737DJbTEG+XqFLolDPTIj78jQjgyvZUT5MrnG9QgBKnLGgCXzvIDuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_233916_469677_C68AEF12 
X-CRM114-Status: GOOD (  16.44  )
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

On 7/6/21 9:28 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 02/07/21 05:41PM, Tudor Ambarus wrote:
>> Flash does not support continuation codes and may collide with a flash
>> of other manufacturer, Intersil being an example .
>>
>> This flash addition is just for demonstration purposes. As I don't
>> have the flash, I assumed that it supports SFDP.
> 
> I found a datasheet for this flash via Google [0]. It does indeed
> support SFDP (section 6.36). The data in the SFDP table is not listed so
> we can't say if it is completely correct though.
> 
> I am not sure if we should add support for an untested flash. We ask
> people to only add tested flashes and I think it is a good principle to
> stick to.
> 

We won't apply it if not tested and without the SFDP tables dump. This applies
for all the flashes. Chris Morgan (in Cc) proposed to introduce support for this
flash a while ago. If we get support from Chris, we'll consider applying it, if not,
not.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
