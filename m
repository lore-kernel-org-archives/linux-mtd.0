Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A301C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPMuRecpB+Vla1MW95u0wDsjB1sYUuRGPGeSs4FLOTs=; b=sEhvNDJE4msL12
	kb70iErxKZWjNHnS8TUDezfkgqkHAkJ3rVCjy2KNum7EM6f4tzCBToUu2BD0knGDVAl/RjmLCoQiZ
	ck0QeKWc9oHzD0mq0h3mDlBKhYrm390PhQuZzIU+sf/JsbtSkeACrxLoUfVXMufmX6xLUGhS3qTNI
	tDZG7kginRCVmAhI+4UhDKN4KR52EHAEiGCvs7GdjFhotGpYxx3iatNDHprMd2hIPk1FI5l5tzZMx
	S5ymzsbvRNJlqBqrVrfL82uifFUAIsOnkqloLshDCNCZRXGLijOx4mHGjYX2DIZWeC2BJ1CwS/MMn
	hCFaSiLblDCmFz2lavtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOGY-001PLb-1v; Fri, 28 Jan 2022 10:14:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOFT-001P8I-LO
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 10:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643364775; x=1674900775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=El2J29fESMhXOs+XLvWnNW1yQxapGJLbEIaEV0bQuDg=;
 b=HtEJ26tMPRwq/ZsmdZzlfA9yl2WRLNL0gbfFxSWxdHz7TwK6WjzHT6mz
 Uga7fAXCl4uByuwqEAJ3NIQhzK31dhx7s+Qz+VX+tRsPEtvVeXh/ua6DI
 rNKXJjtw8O/N5jPIF0ae93hSZMy30Dsxc5BGbv1T74Q6fgawc6oSfaYkN
 t3hfG0Z7uEax5kGqzRERI02hlI8Js09y+msiT0uQprJaTG410aoY1SFjX
 ZVoS4xdkZNnAjh+4bkcn/swKC171SQHlnyaer7rJ7eHz4xDgDwcB20EYK
 hUXJ7TMpnqYfq8rEiUR6dCnkNDynXBlVHsPViz0ijZaWy0mdnfOoduTIK A==;
IronPort-SDR: LUju1zNyAkyP+7inomdWno4NpBjsgzcNNYHsnf7djzsYaYWVw0gmpzRINa6CZMVttyQ36di4BO
 A+5nAx1wMEce4knJQoyp7fEjj/3ubmnF45ixLKqoDr6WEqQB6MqFpxIVpwluQIBODb2ENdKzci
 Mx4zPO/s30d7TqGwxSWUu1BRdh68GGpM9OTjg/EgNfrxp4gqkFgzKyVb4ZXEDo3QyLOdop1wxn
 TBKUi64S4htIWUnJs9KL6wLSM2LI1qzIvxnykBDcyEDUq+oHV/xgsib0WR/QLRedl4dHdbQegH
 rPKssvprfytEPkeCI0z6XkqL
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="151763564"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jan 2022 03:12:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 28 Jan 2022 03:12:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 28 Jan 2022 03:12:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mytx8cpcpMtPL7eTpfxt3JRE9z2OAitQXXoMKKYBKv8Vm4YFvcy/6sErBjAcgePR8Aj+QEbmLQPbtwpXVVxbD5eJKW/eFrTWNhhsAMf2CPShV7KBiTRiLpi0u/94C4VqHie89EVFwu20bt9r+r63SWfwaHMeMdtIuab8ztBDP3KGVSA/lPOkytt2GjcjC1QP61bP9oOEc8VXWkwHsLOd+kaqhKHkW1wWUfMm3ombENAGW9nCkuL37ei6jEb+w8TygZ63k3n5sGIrcLM5TIFaEOg3gDFqnd0RkwedA4ZJYv5G+Y8zy/EAUcqBdBP/hLPkX0Lh7vED/vmpgnmyBJzArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El2J29fESMhXOs+XLvWnNW1yQxapGJLbEIaEV0bQuDg=;
 b=FUYdcKklobKCp6oj8wnQuDFOUTUIPoA7e4FG8+I/j46NwgQcSydLe89d7f1ZxAjuhAq8aBMo9R6w8DQ2k9Cyd+ps/27N+tZhJPgYyeau1HFdDBNPAlbHoikNxNAqSREUD8C35/m3OdL8T86KBr6G/Hsa/ot215b6jxFj2YpSSypwJklDOY/xdVQmVV5j9MlTiK2CLYfty4OYcxl6hFqifEwOEdu4B4OOTv8WfPKjEh9IZw8N9qWmnfiqYkENfdz/TCk5iEoKpLv7+Q11eJzWm8nD7I94B9jNYTRzTMC+87lu8w1mghJpcTWCjCz4NqA02WyYOLkltMLzH2nZRlLpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El2J29fESMhXOs+XLvWnNW1yQxapGJLbEIaEV0bQuDg=;
 b=pAJkzOdv/iAQxVJz5NWSxEAhJ42WPSPynVWRBOF9GkD+u2RoejVnGAuuNVhtrQsz2RgpScCZc2UIK9DXrPG1W3Qy44X/EtzB1ZQbACQPh3ESZ6x8hNFBmeKQ6w2BVTjwMholVx7KqCbmt6iBBTluLGU25eJKdd4OinmpLzlU2yU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB2002.namprd11.prod.outlook.com (2603:10b6:404:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 10:12:51 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 10:12:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 2/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v7 2/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYFC+aonkG3waskkGaKXuTmZneOg==
Date: Fri, 28 Jan 2022 10:12:51 +0000
Message-ID: <67f7901b-a3a3-ae4e-78f1-ef54de3ff1b7@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <26f6a4d7e1d3c4dfdf7bf161a72f140c3364a3da.1626677855.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <26f6a4d7e1d3c4dfdf7bf161a72f140c3364a3da.1626677855.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ba2bc15-a602-4b37-4310-08d9e246be0a
x-ms-traffictypediagnostic: BN6PR11MB2002:EE_
x-microsoft-antispam-prvs: <BN6PR11MB20020FE106A7796BB5EDBAB1F0229@BN6PR11MB2002.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lrOOq1vz39/IwvCOg3xbAk9Oq1LmtFCM07pMRBW9DK71QsaMM2j/xRX3rSGaZf9EfmKjaKZugMmBh78SO1bCOTcExVtYWHDjThrP5PYixh4jyEQA3uGOlmOPHckpK2G5Gp262R1wnVU7PZmdBOQ6gSg1L36EYKRI2b3LixToSgtnY/auOjTz7U3dj6mWu4Z19qvb4Y2WTnWBOdMOXXBJfgzDTf7HyArYf0eOOEyMyNw1xJd46a0CAs0dM2tlg2Zdx/49ho1lFwgnBJcLw0J3AMa6kq9KhiTxTeHb8ZlhM63l2mqSZCOwtycvD7ZPajh6gZGRb4VfjZpdU/2be7Cl1BNOU78ODt8aCdKqKbEygU6k/QA3Xvz9w4/rkFK4+W9LbyPyqmXrUqF6WEY6J/C4d8ReRhApggK3S6cpM8j4U2icPhjHp5Nw/3/AYxIPrb2qKJu0lPvjA3xoCr1ULLVb8mF7Nhg8RAJ7tk+JwM3B678FtkAFrxCltTQxw38wEb4lwRR3Ix+4UQvxa2HA+A4BiZj5L5Hl/s3BvzbhFkH2Cl6QVX43bZcfsoSChvpfNYR/dQgk3biDnuRY7kVZ8ib4ZBPBvTRg8yx0oq4LuxKei0+wnfd4bzf5a40QNlGrcWI6xu4U6kK5oSXlqXO02Il90rjLEmjtqWya625nm2PlABjWrZRn0dvKznyoqc+u3GjcNGGHme4j1HyfdTJ/JdKc3w7NqVameT48cJvHmRvj828chEtvesRbnVBvYkL+5nxpcw9ct2ajkEUrQJvn1PHl3tWH4bW5O1vOEzRhlCSzdhQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(5660300002)(38070700005)(31686004)(54906003)(53546011)(36756003)(122000001)(6506007)(2906002)(6512007)(71200400001)(316002)(8936002)(110136005)(8676002)(31696002)(66946007)(83380400001)(186003)(26005)(91956017)(64756008)(66446008)(4326008)(66556008)(76116006)(66476007)(2616005)(6486002)(508600001)(86362001)(45980500001)(43740500002)(357404004)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGdBVHJUL3BnNmkzemhmaXV5c1VtVngxTWM3WHg1OGdRNUZyTkpZTTBCdzkr?=
 =?utf-8?B?K0Zhdkx3ditFd1RwbnVqcldMbWUzbFhHYVNyQWNUTWtJY0xOTzdvTDgzNVNa?=
 =?utf-8?B?eWNLNm5BVlZDTEhaR0g4ZjVoSU1PMUVmZUlOUnEwZnczMlZySk8wRVgyTDdk?=
 =?utf-8?B?YlZPcWRoZDRieE9mUEtjYWZiSlgzL1JnSy9qaXBCamYrQXFyWVp0bDFsd1RT?=
 =?utf-8?B?Zi9aS29RUkk2YVpyenROaWRlV0dHYWgzVnRWL3p1a2JaeW5jV2pSL3hFU01z?=
 =?utf-8?B?TnAvZW1mZW1PWW5VSlIyemxOOXN3cmtaV0JwUXlRRGozWWVKT3dUSjhMYmtU?=
 =?utf-8?B?Vi9obGVzYi9YdWtuNkcxODBQVlVJL1F3a3R3Mlduc0pnSGx5OTZsNExpOFF1?=
 =?utf-8?B?QzRUOTlpc2pHNklxTzhFV0hVZjMvbFRLYVpJQVVRSHVvS1BDbHcvRm1uQTdk?=
 =?utf-8?B?NGFINnliQTlKWFhiQkRmdzFsNGlTK1RJN3FhbHArd1JZYU1SNmZvemN2RGZt?=
 =?utf-8?B?ZFdFV0diTlBYVUViUDN4anRXRUtEZ1ZuOTE1V2ozbzllY0xhbkxKNm1jd3Bq?=
 =?utf-8?B?SE9FTEFubzRSSUNXMng3VCtoQlZFNmpHZGd4ZisraGFJVlhJelFGcUxXVXJy?=
 =?utf-8?B?amJ4NVF5ck53NmcvQWdPdWk0OVpwSU5mS1B2T0lVRnhJZEZuWmplVzljMk5M?=
 =?utf-8?B?cmwyRkJUNStDRDFpQklWbVBSbGI3UkdnWG5vTURXY2lGWENFb2tPZjFDcmY1?=
 =?utf-8?B?bDUxaHU3TU1mSkx0OU1lSm5adDEzOEExSEF3NlV0ZHZRd0JmcjZMcjgwc0RH?=
 =?utf-8?B?eENYTGU3azZNU3pPeU0vbUdnTFdXN3JlSWdQZi9rb01uZnRVbGcxdVUxNERI?=
 =?utf-8?B?aXNHcDR6V0JRaytUZFhSWDR5MXpmbUVuTDhrSVZweXpZbkI5N0d1SkhoaWpu?=
 =?utf-8?B?eDNlZmxOM3Vub25oQzVQRVJCWTN5VVRDbGlmNUJLQUFYMzRFV0pOYzZEY1hR?=
 =?utf-8?B?Y1NRMHVweWRVZEQ0R3FpMEVrTStzZ1llRlhOWXJNald3aElQWlY2L1hWSmlW?=
 =?utf-8?B?WkpoM1I0eW9lQjcxSWNsTHpjMk1SVHNScUpIVmJQVFJUeTBuV1BJWmZ3NEdI?=
 =?utf-8?B?eHFRTk1XWXNQdHVBZitRS1JxNDhxdVlUNGFJTDBvN1Z2blVTV0J4YWdWd2Yr?=
 =?utf-8?B?UjFwMnlzZmMvOGZUUmVpOVRtaS9nOEFVcXlBUVV0bGNrSlFOUWRCdUpWcUt4?=
 =?utf-8?B?OWx0MlZrR0NJMlVscTdNRXlPaFhwOW1NUlFpODJPOHpmVFRkWEdPNEdLM05q?=
 =?utf-8?B?TnZmUllGdlZMSmRVQVhRTHA1ZklUdHdrVGxOSTJGUTJOZ2ZTU0hiTElMVHIr?=
 =?utf-8?B?TE9sN0RLU01ITEJDMTdaNzB4MXE0SkYrNnZqV05qV2VWTEFZd3pDVENLZ2ZQ?=
 =?utf-8?B?SVlOSmtZcnRZbWJsMUVKZ1pJK05FVWlrNVBnRHpBakp4d0E0WTlCMWJOZHZv?=
 =?utf-8?B?QmFJeDdiRUo3UGJEYzlVdGNGWDVWblJYUjNVV014UUlRQ09jQk1kbGdXQitO?=
 =?utf-8?B?ak9wL3VKWHJOci8zaUFHbWNjd2wxMmRLam1iamhBRGNnaTNEMHFCK2JQUkdF?=
 =?utf-8?B?MGlURUhLUGlSU3dqdFRxbUZQMVNSTzczNmtHT0tjY3NGSHFtekw4akZSdVFn?=
 =?utf-8?B?QStYbzVWaUdsUVB1ZHNmdDBlSEZGVDZLa3YzM2ZwZ0pVQmNkcHVKNVBQZ3d2?=
 =?utf-8?B?UDlGUVl1MUpOMW5XVUFOOStVaXRCeURkcURoZ3hYbGZnN0xxS3l2aUJZbGlz?=
 =?utf-8?B?ZW41d0NQRVAxWmJxQ0ZoTWNONzU1cnFvSW9ZNGVyNnNyQXc0eHFIZkRUYzdQ?=
 =?utf-8?B?RWpxSkxvS0RrMCtHY3J0OUd0dllhamxlRVoweVZaNy9HUWVLbmR6WlRJd1Yr?=
 =?utf-8?B?RHk2bjYvREhIS0J5SlcvbUllTk0rNkl2MmN0OGdUZ2ZCMEh2NWpkMWFtVkhs?=
 =?utf-8?B?NlFMNHFBeXk2Mjd5NGViRzZmVklURTBFSGhMeDUwMW5IaVpxckZOYW15Mi9r?=
 =?utf-8?B?U09rbkY1Qm5IUjF5d3AzN2lkK29Vd2cySzhLNXpZeER6VmlyVzJ0bHo4MUF2?=
 =?utf-8?B?NWwvK09vYmNEaW1ycXBDWmlKQjNBUHhoVjB2SzhFQ3I3VUtFcDQxaHQyUXl2?=
 =?utf-8?B?ckVBOENyaytQaFkrNWdGeitXVEtPTk92RVhCMU90U0t0bCtYbXRoNUIyMmpt?=
 =?utf-8?B?TGg0VGZON3M0REkxNjFRWHZqcXFRPT0=?=
Content-ID: <28004DEB3F92714C839D02477DA8B851@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba2bc15-a602-4b37-4310-08d9e246be0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 10:12:51.2630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbEME3aWvP623KiuzBUCKRn7SlFWmMwQEYJIY0B6rsrXBCkJ3QuRRjIcKWNuxbsVuU85SWkTqPZLMpwK50vaeY3Rif3CTPszhP9BQYk/piI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_021255_849561_B71F760F 
X-CRM114-Status: GOOD (  27.21  )
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

On 7/19/21 11:03, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Spansion/Cypress chips support volatile version of configuration
> registers and it is recommended to update volatile registers in the field
> application due to a risk of the non-volatile registers corruption by
> power interrupt.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v7:
>   - Add missing macro definitions in v6
> 
> Changes in v6:
>   - Remove multi die package support
> 
> Changes in v5:
>   - No change
> 
> Changes in v4:
>   - No change
> 
> Changes in v3:
>   - Add multi-die package parts support
> 
>  drivers/mtd/spi-nor/spansion.c | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 5e7e62704e11..ca50e77b4220 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -10,6 +10,8 @@
> 
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> @@ -161,6 +163,63 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
>                                             reg_val);
>  }
> 
> +/**
> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
> + * @nor:       pointer to a 'struct spi_nor'
> + * @reg_dummy: number of dummy cycles for register read
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up. This function supports multi-die package

Why do you duplicate the setting of QE bit in CFR1V if QE bit is already set in
CFR1NV? Does the Volatile Register has a higher priority than the Non-Volatile one?
What happens when QE is zero in CFR1NV and QE is one in CFR1V?

> + * parts that require to set the Quad Enable bit in each die.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
> +{
> +       u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
> +       u8 cfr1v, cfr1v_written;
> +       int ret;
> +
> +       ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
> +                                   &cfr1v);
> +       if (ret)
> +               return ret;
> +
> +       if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +               return 0;
> +
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               return ret;
> +
> +       /* Update the Quad Enable bit. */
> +       cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +
> +       ret = spansion_write_any_reg(nor, reg_addr, nor->addr_width, cfr1v);
you'll need to pass nor->bouncebuf and not variables on stack, they are not DMA-able.

> +
you have an extra blank line here
> +       if (ret)
> +               return ret;
> +
> +       cfr1v_written = cfr1v;
> +
> +       /* Read back and check it. */
> +       ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
> +                                   &cfr1v);
> +       if (ret)
> +               return ret;
> +
> +       if (cfr1v != cfr1v_written) {
> +               dev_err(nor->dev, "CFR1: Read back test failed\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
