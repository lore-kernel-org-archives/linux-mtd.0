Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20859C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 07:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSAmmNpifLu9N5pWIk8Y6SeucIiYGAgKncUevH0FP/o=; b=Wdn9G9x9V22oLm
	w+6DphHtMMQ22qc0VxXAt4Y2CZxsCqSzeuRrzrFsIGDEkb6X2b0yiIB7mxwFCtF3ElQKwCzrjKiJ9
	OImx7J5Iuqvjk0srDUDHo3RleSRv06g8suJb/l9n/AY4aqse6mEMMH5U9xkuHqS5b5SsrA0mdfpf5
	7f+u32SvPr2J3pMuk42M2kzhZc78jMoRWY4oVeLdfDd55Fh9bqFtggSUIEH8DOk3/ej6Rnbs4yzav
	loGlqV86Y/xpAYTtWGhpnSiIrS4qFeCrOrHcCKjw0wg7eL/f7aFJqyNNuDv+YwYpGhyRry8OYVy4o
	TYIVFZUIxOfHcAQTRKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4rr-007nnc-E0; Wed, 20 Apr 2022 07:35:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4rm-007nlH-Vr
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 07:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650440110; x=1681976110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5C8gaV48LulcdqvLFNaiPVDbN4Cr66FvXHrJ+FYBw8g=;
 b=Hg2nLj8e2wmxfYSZxsluOtwS44R18Xz264Pm/IsT2IvRNyOxsKGrewsh
 ZevhquWAsSqmTI1auXlisVXpfPhWinOLpBozC461Wk6YqrP+Cz3ZrNaiv
 a1tIWNAPa3541qGw33PcNli2CMmQrJ0dwA5pQX/i8EOUwTPsMlwz9Hs8e
 KW+5PYYQiH2LUipzQCfG1rRU9gGJcAEda/ooVUSCD3PuP4DalsVF6Mmj9
 h2fLpbY/4gfmwtvX8ChBNgHnyQaECNo6pj/hdWtt/fWquMnx7sbEGxEDs
 pcFafExzn85OiLblQBTTbMSEdJ80WGpgUOj9CWEkkCeIRPoWRgDJ0NyXJ Q==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="156120298"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 00:35:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 00:35:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 20 Apr 2022 00:35:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmlH5DFcmAr/rWgS/xfpmDmdZreJzGduSlMpRjI5NxX64VXTSBO7tFUK8aJZfa4PX0Q5G+u1/EKPFcP4RTjuqkGqbl2heWDGT27AsFUCNhxQIKL6iK1qC7un8aXNvPBthBvwv+FAG9zhPX6Zt8zHxhoXZXZZScfrLVGEQNuQMjVkclHsCfbMMOzT0rC9Or19JVcyPVSbWoGIacK4S+Z/YL6xUVDOFCQEPI4zQ7M7Q9EHAAczUj3lQmTKL/XA2RyeJVnjb2XRDuXIUgFFKtIXwR4rHgoHKS/bmYU0VZI/eW47HwYib/LsKbljpo0OoqZ6X72rwsWP9fGgM91eP2+h+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C8gaV48LulcdqvLFNaiPVDbN4Cr66FvXHrJ+FYBw8g=;
 b=NRIs/sfbuKw8M9TgRLvrQVwNZJLYCZiyok5OvsDM2WvtDWZaIk94awKkzmez+4xVI26V9t4M/WNe4Z3cW6x+aU8WQhrttkz+URTikJ41nDzPWlEIJp9GDpRCr3fDN4wJVHwJ9dmW/SH13q0ud5r7FdKO0w/8bZwgnTI6NiX/UUrxgtDSLr0x5yeYh2BT/anAY92zxVMqcjdGHaCFn5KH1oljcb9sMIsH1RirQ176L3qp9bxDBnN4qz1XJRxBJ9MXgqmTObLKdZ3uc7CeDs1O7c/emnoCto43pSvHa+reaBW+B53ILsq8frGJ99PQRD5HokR4rwy69KOO2MgE5+9TAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C8gaV48LulcdqvLFNaiPVDbN4Cr66FvXHrJ+FYBw8g=;
 b=izdr4+o4cWG3tohXjo47nFYOSvrvBBYbiBUvv1q23BcwrkAHPbqeBjk2vzr4X0Jllc9lDP28W5i5MTxTALU8LZBMIH4hl2x8pfCi7TJASKC3TyB4JI+LmKG01V0oq9f6ex8/0DaeUMbQHz++u500i5GruWX3xP60hMaDsf1MaHI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 07:35:03 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 07:35:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38g==
Date: Wed, 20 Apr 2022 07:35:02 +0000
Message-ID: <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
In-Reply-To: <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9b01c02-9b32-46c2-e0b7-08da22a04854
x-ms-traffictypediagnostic: BY5PR11MB4370:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4370AD126C881A06FD39CB23F0F59@BY5PR11MB4370.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WJ1fOAHcbdhc6auI7AW+ro3bFRGuRKYHqlgCuGpCCAD8rqj8Xcvw++OAwgORU8Z16AsmAstzphz5gZ+mY52mL+oi75xwhkSULrPgk/dkNmuVMgoBSDJd3vKUioPeWJDuTFwile5hlrACb/2F0ipfpQ2P0dtZPAF1zgTRRRtWJRnSXhrkAKx5AB1DCRQCIkqYWVNG1nQPGfKwcvIF7X7Lpy+Khm0qznySTd6V2subXVKn/p8ofiy02l7/76Vh7PTgu9tMT5qbR1bKGU2ynkRhmojczaHU4IbmEjHgDTE5VW0HAWWVwAGLSEYJM03zOqr5LNtapubtSgq44EOKWpavrVI73XP7rWqneZlqZZYz4iHxP3j3jj4NlMqmmKo/QhL1785wD4aAJc9USSJBiEuDYSm/veH9VVh0tgH5zr27gCgnZggb/DHMwezeBdqtSutBqf19LovPvIicnotR6C9Wl0/JR5BlH5gZ7qCQn89JrLNXP6Nvid2MDnsDFMam+LQZZqJLZySbsiOL3ToCmlPyEN44upAzdpcA5knM6rYuUKg26IEvkHKExk2mWJKv4AFzaksiqXP95Q8fsenNVrgj68/xZ57y/VYSO1MwY5apZXAiDvDPS3aiPR/0wRGi4XUgDThuOb+NlBFGwYrO8E5uEao2wopxcgpUd2gKG8Se9fjZIjXHLi1kv33ss4JSRwH6+D5SECdHlaj5QSXKFliZJk+d30QTQi5UvYJNTtGrQA34jaINnz6GeQWKFeINR1yi5jffP6QBZLsw7XvIJ0Dv20++/s4jpwv5oUVcTlDNAc18gu4mxffadgt++oSsHFU/HJsmTxfIRQVWDY+cZX04Ogecj3qNhd4bsooVUViu2y0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(53546011)(38070700005)(38100700002)(6512007)(36756003)(122000001)(76116006)(6506007)(66446008)(4326008)(186003)(31686004)(66476007)(8676002)(91956017)(66556008)(8936002)(64756008)(316002)(66946007)(2616005)(54906003)(86362001)(31696002)(83380400001)(5660300002)(110136005)(508600001)(966005)(6486002)(71200400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3c4YitDVlJFTUFLamp2ZEhrcC9IbFo5bkF3NjMvbGNuYUlFSnVVaU1qaXph?=
 =?utf-8?B?MWNwOERrTmR2TzlTMTVocUswVnRIQmtHVys1RUpHWVBIQlVlNlZPb0hpVFRt?=
 =?utf-8?B?blR3M0lmUDNXdTJEeW9jSFUxK0dIY2xPUUZoMjJ4dHRaYWVDTG9yOTlvc0lr?=
 =?utf-8?B?eFVKVVlEbzRhcCtRSlE2SWhxdjNvenpMRDVmNGw3SjdqaWx2RmZQWlgrWVpn?=
 =?utf-8?B?cFBQRWpKaHZveDcra2NVbktWYkZadWwvSkNBbVlBdnQyMFMvWVFOMHcxTjE5?=
 =?utf-8?B?d1JWeUpUK05pWWR6UlBwQU91V3NxYnVWQStuZnJyL1NabUlyVys2VVBvNXZH?=
 =?utf-8?B?anlERnczUWE5aHpxU0UySU9VYUhEaXM4RWowT2RxYWZsRVRSVUJXWUExOGhx?=
 =?utf-8?B?bmUwZXhqbmRTTDFrL09pSUgwU1c5RktILysxcFVaK1BLNmxLeHZqK3VUdHNa?=
 =?utf-8?B?OXFmRjd2NG02bkRSdWxtWTRWYmpBNHhuUnZrZCs5WFRHNkd6SjV2MTMyT3hh?=
 =?utf-8?B?OVVyYmpqUkc4eThMZ1A3SEpISnMvcEd4OFJFSlp5enk1ZWRTcDMyWkdMNU85?=
 =?utf-8?B?a0hZTGxZS1oxOXo5cFRHdXVFYm96U0lEU2thQmd1MitpMkVaUHV5WkhLL3J1?=
 =?utf-8?B?YnZmWGZrTVk1dDRjZFZNYUNUWTl0MXZTZzdDZ0RsT2E0TzcvRWUrZEJGUlR1?=
 =?utf-8?B?RS9NWEllcnNybzBiaEVrZG16NWhsQWFvcnhqVHBCWUl3MEExVllzTW80R283?=
 =?utf-8?B?QVM0WjhTTktaUFNMNVJFc3hReTRjdVo5R045QitNelM0UW1NUlJPR0RZSVIr?=
 =?utf-8?B?Qk1TRkEraER0M29XTE5vV3dzZkFscnJBeWh5NVF0cjloNCtFbU1UN21icXp6?=
 =?utf-8?B?cXkrRFJwNE5YQ3J2Tm1kNlIycnZBM1RoMmtMYUpjQ1B2bTFaNWRlZ3E3NFZy?=
 =?utf-8?B?ek84a2o0aHVFbThZREp6N2ZGc2FVU1VOcGpvdU1lUjNLRXhwandIVG1CNkdF?=
 =?utf-8?B?KzlaYlpSeTR5Tm5WL3lzSVpoTFZmLzByL2tCVTRBM0M3dXA5dVArZEgxS3Ru?=
 =?utf-8?B?d0VJR3pLRWdnK2NFcXZhVVpRZldtYXRUNDE5am5mSHduYTV1OEdDQlZ4ektR?=
 =?utf-8?B?bWhmcHd0bjN0bEZjb0E5blM1VG8wTlgzdWpyaGpkSzM0U1Z3aTZ3ZzdrWERn?=
 =?utf-8?B?V29lQUN0UVRqaHVZWEFpQlFpSWxkbW9uRzBiSGM2UDF4d1piYTBndGxob1Yx?=
 =?utf-8?B?UDQrUHNiczRwM0pTMExwV2QyNWxDN01YUGt4aXVXandjdjBtd0xWTk15bGx4?=
 =?utf-8?B?ZkRZMVdBb1RscVZFbW9TdFdoQmFXVlJidmVWRjZxY0QyNFN1UzU1alpFOXpt?=
 =?utf-8?B?ZnA5WWR4MXdVOHNIQmx2TFVLbHVpbzJoZnVIYkIvTk1Bb21JZFI4VHFEV00x?=
 =?utf-8?B?alFqWkM0RE9TRlFKdmJnUGZMM2owOVAvS3R4eVBLbnZZd1BTdm9PRkovbW14?=
 =?utf-8?B?TjZyOGtON28rN1MrOGxKMTlrUFFSNEdQRTRkL1lZUzBTQTdJbG5sOWphc1U3?=
 =?utf-8?B?YWNDT2JxcExjT0JZUXV1cHI0cGE2RkFKcXBBMEs5QXIxVDZ3NTNla3JaaEFp?=
 =?utf-8?B?Rktxam9vOEVOcXNsNk1WTFY2S3FrY1d5ejMwQXZQeTd0R1M4Q09XSkNEWCtD?=
 =?utf-8?B?S2NwMjRzNkJnbjgxNVZQZ1N1eXVDcmhIS2hsN3pSdlV5c1Iwc1BlN0FGUlV4?=
 =?utf-8?B?REdNdjZGZGpJTFkwM3RqTW1aTnZqZ0I0a1hZRVZqQnhrczVPMGtlTGZPakp3?=
 =?utf-8?B?TGZnSnJ1dTRaS1Bza0ZqdStlQUw3US9CSjhXRHVCTWtOcXUvM2tHUWcrak1B?=
 =?utf-8?B?NXVseHhpZ0ZTdis2YlFNbXhBZ2s1THFhSHRkWFQ5ZGRIOG16YWFQNnVVYWNJ?=
 =?utf-8?B?S0J3dTJ1SnhUWXB4RDR6ZDFoUmpSSElKTGQ5eUNhdnRQbEtJbU83N0hGVENK?=
 =?utf-8?B?dzJVaGdxa2I1Z0h2WjAvTUtNU3ltK2xPOCs3bXN5WW5YMzU1bWJaeWh5T3JL?=
 =?utf-8?B?Z0FPZTdIVVU2T01ybkZBVHFxMEFEbGVMTXR6RmQ1L0JqL21QNVVhZG9TL2ll?=
 =?utf-8?B?TmpHNVlreXdrVm1LZ3laS3RrK0x2OU9LNk1oY0l5ekNSNXgxN1pzc1R5dTlM?=
 =?utf-8?B?OWswZ2hKZmk3dXlRTVdxQ2JZdXNxUG5HNi84NnN5T0d3T2psakxOU3pYWStl?=
 =?utf-8?B?bWVxaDk0aDA3QnBvaUhvbWF1bFpyMG52ZWljUkFtanBITkZJZmVlME9IZ0lX?=
 =?utf-8?B?Z1UrbjRFQlRYR1Z0VnhZM3I5U0pxaUIxVDVCMExCak1rbThva0tCUWJING1I?=
 =?utf-8?Q?69CpglNb7ef1b+YY=3D?=
Content-ID: <A3AAD9BB0BFB04418D2AAC6CC7FD38E8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b01c02-9b32-46c2-e0b7-08da22a04854
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 07:35:02.9355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A35ijPjOn7e6Rgsq4r+FL5lx256pxyZ6/vRDp3Pp+C23rxWjuxl8d6vISUMz8FISk3SHvAVFwT3gOj8fsKWkzyvXiSpx/0/bWP8qrd6nSRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_003511_389503_65E3FDC2 
X-CRM114-Status: GOOD (  15.71  )
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

On 4/20/22 09:58, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/20/2022 3:11 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/20/22 08:34, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi Tudor,
>>>
>>> Thank you for your feedback.
>>>
>>> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>
>>>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>>>
>>>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>>>> uniform sector sizes are supported. This is due to missing or incorrect
>>>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>>>> followed up as needed.
>>>>>
>>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>>>
>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>> ---
>>>>> Changes in v11:
>>>>>   - Cleanup fixups based on other patches in this series
>>>>>
>>>>> Changes in v10:
>>>>>   - Cleanup fixups and ID table based on other patches in this series
>>>>>
>>>>> Changes in v9:
>>>>>   - Use late_init() hook to fix mode clocks and writesize
>>>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>>>   - Use MFR_FLAGS for USE_CLSR
>>>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>>>
>>>>> Changes in v8:
>>>>>   - Call write_disable in error case only
>>>>>   - Use spi_nor_read_reg() helper
>>>>>   - Use nor->bouncebuf instead of variable on stack
>>>>>   - Update ID table to use FLAGS macro
>>>>>
>>>>> Changes in v7:
>>>>>   - Add missing device info table in v6
>>>>>
>>>>> Changes in v6:
>>>>>   - Remove 2Gb multi die pacakge support
>>>>>
>>>>> Changes in v5:
>>>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>>>
>>>>> Changes in v4:
>>>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>>>
>>>>> Changes in v3:
>>>>>   - Remove S25HL256T and S25HS256T
>>>>>   - Add S25HL02GT and S25HS02GT
>>>>>   - Add support for multi-die package parts support
>>>>>   - Remove erase_map fix for top/split sector layout
>>>>>   - Set ECC data unit size (16B) to writesize
>>>>>
>>>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 54 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>> index 493240ebfd70..dd37b829efbc 100644
>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>>>         return 0;
>>>>>  }
>>>>>
>>>>> +static int
>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>> +                        const struct sfdp_bfpt *bfpt)
>>>>> +{
>>>>> +       int ret;
>>>>> +
>>>>> +       /*
>>>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>>>
>>>> Hi, Takahiro,
>>>>
>>>> I would like some details, please.
>>>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>>>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>>>
>>> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
>>> for reading CFR3V. However, the Flash's address mode may be changed prior to
>>> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
>>> address mode. We need to set the Flash's address mode in known state and update
>>
>> addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
>> you'll be sure that the flash is in its default state.
>>
> Resetting the Flash to revert back to default state should work for this. However,

good, let's do this.

> we still have SMPT issue below.
> 
>>> nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
>>> choice.
>>>
>>>> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
>>>> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
>>>>
>>> In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
>>> The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to
>>
>> ok
>>
>>> SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the
>>> spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg
>>
>> if 4bait is parsed before SMPT and nor->addr_width is already set to 4 in parse_4bait,
>> then you don't have to do anything for SMPT, right?
>>
> Currently 4bait is parsed before SMPT. So, if we are sure the Flash is in 4-byte address
> mode (by u-boot, for example), we don't have to do anything. If the Flash is in 3-byte
> address mode (default), SMPT parse does not work correctly.
> 
> Please see this about 4BAIT and SMPT issue.
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
> 
> I introduced another workaround for SMPT issue in my previous series.
> https://patchwork.ozlabs.org/project/linux-mtd/patch/9a2d323b2c18485d13f271e3bb213b96fea0e7e1.1649641729.git.Takahiro.Kuwano@infineon.com/
> I withdrew this because this does not work if Flash address mode is not default state.
> But if we can reset the Flash at probe, this should work.

Hmm. How about issuing spi_nor_set_4byte_addr_mode after parsing 4bait table,
to solve this dependency?

> 
> 
>>> with 4-byte address. We need to set the Flash into 4-byte address mode in advance.
>>>
>>>>
>>>>> +        * Flash's addr mode and nor->addr_width here.
>>>>> +        */
>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>> +       if (ret)
>>>>> +               return ret;
>>>>> +       nor->addr_width = 4;
>>>>> +
>>>>> +       /* Replace Quad Enable with volatile version */
>>>>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>>>> +
>>>>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>>>>> +}
>>>>> +
>>>>> +void s25hx_t_late_init(struct spi_nor *nor)
>>>>> +{
>>>>> +       /* Fast Read 4B requires mode cycles */
>>>>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>>>
>>>> Isn't this info already handled in BFPT? What value of num_mode_clocks
>>>> do you obtain from BFPT for the non-4B opcode?
>>>>
>>> There is no parameter in BFPT that describes about Fast Read 1-1-1 op
>>> (as we can see 'struct sfdp_bfpt_read' in sfdp.c).
>>> The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
>>> spi_nor_init_default_params().
>>>
>>
>> I see, thanks!
> 
> Thanks,
> Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
