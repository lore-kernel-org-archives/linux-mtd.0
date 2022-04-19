Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95A8C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iOEnrP0MCKdoSGyZDcd426ZP/q8VxaIuWIYjyB29Xk=; b=LIAERGOuqU3BaX
	MSuoBJJJBoTFlULSPwdx35kWUa7zU0ALT8jQiE36q1iskpnp+TBSoBd+0B9c8i3FFjLoS6MrCDEUB
	1+UIm+EBdNXccfsNFAyurOOl+Mci4QOb5NLkEpDH9FFSX9Fso8zweGexf9r54pGGnYFK55TkivbCv
	W/kXTr6dUthjb3WIOArjfAeu4DGJqA3+etgK5Eq07px2hlPPg3wYM46BcS0mq0HQ2/8iVRXZn/4XU
	VfhCcN3qhDLWC8AXfiJXcgmHN6yG1CDax/EPdHT7Lk3j+4hLlpybCFfpylTZhQQzeibQoC73r/iSl
	oLjj54ZYEgRs1fpkjOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngkDz-002ZNt-TU; Tue, 19 Apr 2022 09:32:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngkDu-002ZMA-1g
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 09:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650360757; x=1681896757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MOu3T3EiSgVxSjrS+XDp8GicYoHwkmSncQ6n5XsnoAk=;
 b=pEAhpizdwNSStmsfGGGVirKUJRnbb1cPiijxdeCLc/6KcNKxWmIfgybV
 gUDmwgvZV0uHy0OXSrdLTwWcKcm3p8ndBuyyOelemk35/5YQlgwx0enzA
 9dx8mgg5FdYQUPnqE1lfPNwvm2bqwCEnE/cKomSaDwX3GUgJgK1589UX5
 Ibho1zbcfr2fdE0+fVOUh68KJ5G3PctEXVtPyUROqNoQmOlDygKD1hHYW
 ogWllJSX4/+LB9u0cdx22VkHNdQppYz/04rnySXLDw7D4o8A50TUIRCJx
 IKIi5c7f3Z7vGWtAV5q9TDeUBoqvRPEPS0UptyzG+ZIRdWhBc0l9f4vDX g==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="155975434"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 02:32:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 02:32:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 19 Apr 2022 02:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkhYQod0AO6tmG0Vm9c9HDQ65tS2Ub5FyayHhEU6g5HcbkeQyL5ISYxEgJpgkJah3+rmc+0xR7L88D7G97Lkfv3FslnFHzo6FeMls1O4KcFVolJ2MRCfBhjEwxscr3VjtRPH23lAbavZ2EpVZ9fgp33ZkpwXFaMxWhgEnGkY3qK6y/5m1LHImjT16GzEesNdaBVUSSASeN9oLN+NwPIPCpo9cEAMgUT0K+ogObiruruDrt89KTOSTtC964UfkIXokVMldDgbu2gpcw/ye/wRcRRJfmy5baO0WGcSbY38dNcU8h/4Z1e+FJtUsladF5xZN4YfWjgZ0Z1DfpWF/H8wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOu3T3EiSgVxSjrS+XDp8GicYoHwkmSncQ6n5XsnoAk=;
 b=k6ZIoJGs/e3Eytf8vazz3lAJ+RwovN+APMWFd9vpnsy1B4/GQKatNvN2mE8LzUehLHWHUOWQERq8sjHVhJuGglQ9w/Z8flwXfvXTcU5zWtIeNCsMhabxzFkoPoiS1d0rhe5dJKFoNG8Kr2dn4Y8P2BPhVMVckJjZb3cFwcLgXm3CYA5/XyiHGCyNg5QIbmrLmeEcyvb1GG7JCtV72Jwhi0JVocchQAPHVlwFlFzEbWja/uj0g8V1tO+wzLDSz6IMVYZKwsKmkm7szMyWoN3DPrTFTL+paP2z6wlRrEc7z7mF1H5PwfZjAaBbwvP4Ag6vd8f/52ult4RC9XWCogd5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOu3T3EiSgVxSjrS+XDp8GicYoHwkmSncQ6n5XsnoAk=;
 b=OnRjrWb8kULuOMpwkVB1gRWwhETzNaBSdiPyZpZqDpl3XQrRhu7Ih/i1+XRQ2QhJLTJFDJE9SwERd30E4dOGhhJrbi8azDt592Tf2jaTtEuZNj/+RVZUwKrbjilYx5PNBM20Nxzmh6VBFxV7Cfq6JasBkLRFCEUIChm5+Dszqqc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB1854.namprd11.prod.outlook.com (2603:10b6:300:10c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:32:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:32:24 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38g==
Date: Tue, 19 Apr 2022 09:32:24 +0000
Message-ID: <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33b15dcd-053c-4c6a-a76f-08da21e78339
x-ms-traffictypediagnostic: MWHPR11MB1854:EE_
x-microsoft-antispam-prvs: <MWHPR11MB18548952D3F21A9C843A29DEF0F29@MWHPR11MB1854.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r56STNfW60WaSL6Q1DdROtLsjKeSqwrzE3ieBt3Bua2KZksP26NC54o4ODMzBVZK3Nq14AZdwjIAU6liQravDgoe0uF7EbVvWUBux23J0XL1MXkFJFWNCL9sWqTSxyy9bbsRDBNF1GKdlhi7f7dKVmmH2KTnA2ogCxsG0Bm1JMhcZNfZCJ29qTGk2K6F5/2Xj5A+aL2qUW9FDvSBNhXquwm5aK6PkGdlzMoVbQyAPgKxkmQk6ihrzDbJPI9uTzZ+GMw64Au2ZLO8Gac3mT4/Uerpyh0G3HUtS4tFVHn7XMuCYt0QpFv6A9wOqbVyNcRV+PrPqQf5P05l8g2eJuXB8NcacYknz69RSBttyOXQzc2DpHQmQJICCwrpNZys5Tz0Z9mHi5faTgPEchQeDoG+D98/gO4GqQGdVkwp+PAn8t79Jv0pfReX6UFHdRbJmsGezKoNStesdH1ilWnX7UKO1IjlNB1Vck+IOZ9DTVYkf++wuYgrtFUWUZUnsQJkEFZSbirLIzfYeV9YvL1FVLF6Mnthx63Bl7sU2h2MbuF9xqm1nLu70afJ/mMqASWSQfyQhO/wc+T7I8WDL8PU2W8sRrS/KBnHpXlsqF0mLYCM2TNuO2hJtBAj51LmKz9gF5dq29gNn/6xTvjEoZLCxrWj0j4hA1lLjd/Hyq7vQMEW8zB5uolGwHLVeFoFwIkm2mBCEcat0u2hlViwYt9jVsv1VB+AvZobW8pRP7ckh2EC6JeOEaT/OlISno+OA4/T2wQSzhsZvCH37AXaUDeN6eu3RTMmnf3qG/UqgdOvuJ+0csAMNNWOvIVZmBlvzpfqEldsZitDCOvCqUXsy2yKTX4lYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(508600001)(38100700002)(38070700005)(122000001)(71200400001)(8936002)(2616005)(6486002)(83380400001)(186003)(2906002)(6506007)(26005)(31696002)(86362001)(53546011)(6512007)(316002)(66556008)(66446008)(66946007)(66476007)(91956017)(76116006)(36756003)(64756008)(110136005)(54906003)(8676002)(4326008)(31686004)(45980500001)(43740500002)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amVLNXBZT0ZNS29ZV3luZjhyRFg0aHoxZ1VldTJYbW5hcW1SSFB6UWVMTCs2?=
 =?utf-8?B?Q1pnOUI0NkxzR3V2TENGOFFEZmtJeWNVKzVZV0xiSndiTkdzNDRwQnhtQjZ2?=
 =?utf-8?B?dTZQZ2JoaW9pZ2ZETU1KbFNodUN1bWZiRzNuRm9DL0tpMEM3dlJqdFVEZkZ4?=
 =?utf-8?B?ZGFsZTRaZ1dsMWFYM3R1dzRpR0RyNkYvcDZVZ3FzKzhycmdiOFk0eEk2bmFj?=
 =?utf-8?B?NGdOdVlVZVJWVyszdW1rakJkanVPdnRUemc3eUYyeFZBSXlrSStFdFI0RmlQ?=
 =?utf-8?B?dm1pV2JiVy9ocWpUalFUd09sMmFUQ2tFYzhyUGRpWGcrMFIrZVNhbk9yQlk5?=
 =?utf-8?B?OXdMWkxWSlBHNUN6NDhLUml4amk2dFlSaFZwa3FCK0hSZ1pLbTI4K1dtYzVr?=
 =?utf-8?B?MmZSeVBnaXlOcmFHWkxkeWt5aDViejBwYlJ2NlhLZFBQK0tPS1V0MCt6UW1B?=
 =?utf-8?B?RUtCTlRNNkt6d0VadVNnbXY1d3pQanQyOEY5VE1WSW9TeGZ2eHlLc0xKQVA1?=
 =?utf-8?B?N2pFZG0vTndpQnlpbDlGZU16TjdOdG5SeTllRXN5MTN1d2Y2Q1hLNTJLc0l2?=
 =?utf-8?B?eEVBekdXaENydS9GaEk0Y2NvKytpM1R0RTJFemJNL28vNk5WY0VtMEVUYWlO?=
 =?utf-8?B?VEFxcjBHZVdubGhETm1pTElVV0phWWV1OFdPUkVpR0kvNUtDZ3J1TTV6ajd5?=
 =?utf-8?B?V3J5Wkx1M21wUmJuMnMzRUlPQ3BYQVJoeTBreFJISkZLTHpoaXdPNEhqeWli?=
 =?utf-8?B?VTl3a1ZQS2RBNC9xMjNLNGxHMHRlS3h3WWJmc2hGZHlyekUwNHlWdjNUWW1l?=
 =?utf-8?B?RXozUUtjVDRzY2o4eUV3RUNWdkRMbG4rS2tmbW90NDc4ME94a1BnYjdtZmtO?=
 =?utf-8?B?TlNLVFdkOEFxZDQrQ1l2a1lUSWZwWUE2dmRWY1dsV0lLRlJxTmkzQ2NEOTA0?=
 =?utf-8?B?SDAvQTY3cm80dkxFaVJuOGFjUEMwNjRBS1RuY1ZCaVBWUVBaRFlRSTlqWWdl?=
 =?utf-8?B?VFpEZ25oRnd2WTErYnFnQXdPekFsWnJsT3hYT1JOQTYrMGRFYnE1Z3ZrTmNP?=
 =?utf-8?B?NnFzMFRzRStERjlkSGxDSjJ3anpPVkNkQjRtRnNDbUk4T1hvaEN4bnE4NUdG?=
 =?utf-8?B?aGtNcW1IakcwcTRqR3UvRmFPSnZoSWFoR0VROVRqR0d2K25RNCsxRmkzOVFv?=
 =?utf-8?B?WnBDSXpvQk51K0JQb3hCeDAvclR4RG1wSlhUY29tLzc3QnB6dlRYbWpyck5j?=
 =?utf-8?B?ZGpIRUIvWXd0NUdhbE5Eb0lVckYwRms1Wlc3SE51M0l2WlBjdmw1eFhCM3M1?=
 =?utf-8?B?UUhGMXRCUGl0UmNmNTNVNnZZY2J6M25pZjlUeG9TSHB6NnlVTzdyVmtVRGVn?=
 =?utf-8?B?V29BUFprWjVYbjVMM0V5dmpFTm5oT2lPNDFoS29kcktUVytrK2tXMzJvaDNX?=
 =?utf-8?B?OWF1S25kTFIyQytoNHZCN0k4alhOSnZzWE5DbndJczIvVkFRQ3creEYzcloz?=
 =?utf-8?B?bDBheE9jNHBPSGZ5NWxVdUpBQTRyVzZaQzZwNnpzYldWK0RiMHhIc2VMWXpC?=
 =?utf-8?B?WUZLZ3FlTThNanEvcGVxZlJ4ZjI3bDI2TVdjbXRJRXJLbHFVbzJtUVJ6UDAx?=
 =?utf-8?B?ZXF5UktlUlNPaU5vNzJCSUFoOGRvWC8wRkxGK29Cc3FJNEFTSnlKT2czMHFl?=
 =?utf-8?B?aE1hMnMzZ0ZqTnJFeFg4M056TWpWZklwekx2a2xVcmtKWjlVZVhpWlJXR1pD?=
 =?utf-8?B?Z0I1UEF3MWhOZFh0UXpmTWIydGNLUDNHeTlqQjFsSmRIS2U3Vm11VXRxK3c1?=
 =?utf-8?B?ajdnakIvKzk4T0t0bEdGVE1KQmtLSzF0NUhMRTRYeEE3Z1JkUXVDcjlZeFlP?=
 =?utf-8?B?TnJHQ1hXOG1DQ0ZaYU9rUDA1eVJNZTgxdzdsTlphYmZ6OTBxczg4aGlTSlc1?=
 =?utf-8?B?aFJhcHJBNFpZWUlvUUhPMnE0OEpSOWRYM2RscG9OYnhRYk1TNVFXM0ZCRFJG?=
 =?utf-8?B?aXgwK055Y1kybE5WQmN4MXFLVS9YWWZXZnFpRGRseWhJd1dlNk9xcGtraVc0?=
 =?utf-8?B?dnN3Y0NFVkF1RDErUURHNmdWTGJ0YmY1SkF1TTVrVjBBRVlzSDN4dHhCV0pp?=
 =?utf-8?B?Y0dvbW9tcG90a3poRnZKSHQ1V1p5cUwxOVpZNVVQZkRMbWdScW40TldDQWc4?=
 =?utf-8?B?Z3JYM2h3RnVQVWh0TElPRzd2clBSdjJtTkdpak5BNlVwbjc1b3RRckhQT1pn?=
 =?utf-8?B?ZXB6UXEzSmZucmNDY0FlZ3BpbDNOM3lZTDVjUmcvdnRHRDJ4YWhYU0xIWDNY?=
 =?utf-8?B?ZXBETmlhZG1wVG5tdGlhS0dzZmNNQjhPQm5vZW1UMUhjY3lkZjhrNG1PYlVT?=
 =?utf-8?Q?sOwvi+vZ4d92uwTU=3D?=
Content-ID: <056DE887F8A854488A119FC520DAA386@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b15dcd-053c-4c6a-a76f-08da21e78339
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 09:32:24.8477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ne1qv9UOmIM3CGD9sAbxvxVJ478ihdSwa/yO++RsO0X0fw5kOKBHuVe82crFEXs1/d43IoDONXlzpf60N17F8zWLA4IV6tLF57+Eol4p7Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_023238_359760_3A3179CE 
X-CRM114-Status: GOOD (  28.20  )
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

On 4/18/22 08:41, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v11:
>   - Cleanup fixups based on other patches in this series
> 
> Changes in v10:
>   - Cleanup fixups and ID table based on other patches in this series
> 
> Changes in v9:
>   - Use late_init() hook to fix mode clocks and writesize
>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>   - Use MFR_FLAGS for USE_CLSR
>   - Add comment block to explain about addr mode in post_bfpt_fixups()
> 
> Changes in v8:
>   - Call write_disable in error case only
>   - Use spi_nor_read_reg() helper
>   - Use nor->bouncebuf instead of variable on stack
>   - Update ID table to use FLAGS macro
> 
> Changes in v7:
>   - Add missing device info table in v6
> 
> Changes in v6:
>   - Remove 2Gb multi die pacakge support
> 
> Changes in v5:
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize
> 
>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 493240ebfd70..dd37b829efbc 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>         return 0;
>  }
> 
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +                        const struct sfdp_parameter_header *bfpt_header,
> +                        const struct sfdp_bfpt *bfpt)
> +{
> +       int ret;
> +
> +       /*
> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync

Hi, Takahiro,

I would like some details, please.
1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?

2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
Reg op used. Why do you need an addr_width of value 4 in SMPT parse?


> +        * Flash's addr mode and nor->addr_width here.
> +        */
> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
> +       if (ret)
> +               return ret;
> +       nor->addr_width = 4;
> +
> +       /* Replace Quad Enable with volatile version */
> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
> +
> +       return cypress_nor_set_page_size(nor, nor->addr_width);
> +}
> +
> +void s25hx_t_late_init(struct spi_nor *nor)
> +{
> +       /* Fast Read 4B requires mode cycles */
> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;

Isn't this info already handled in BFPT? What value of num_mode_clocks
do you obtain from BFPT for the non-4B opcode?

> +
> +       /* The writesize should be ECC data unit size */
> +       nor->params->writesize = 16;
> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +       .post_bfpt = s25hx_t_post_bfpt_fixups,
> +       .late_init = s25hx_t_late_init,
> +};
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -384,6 +422,22 @@ static const struct flash_info spansion_nor_parts[] = {
>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +       { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
> +               PARSE_SFDP
> +               MFR_FLAGS(USE_CLSR)
> +               .fixups = &s25hx_t_fixups },

After we establish the details from above, would you please run this test_qspi.sh
script for all the flashes?

#!/bin/sh 
dd if=/dev/urandom of=./qspi_test bs=1M count=6 
mtd_debug write /dev/mtd0 0 6291456 qspi_test 
mtd_debug erase /dev/mtd0 0 6291456 
mtd_debug read /dev/mtd0 0 6291456 qspi_read 
hexdump qspi_read 
mtd_debug write /dev/mtd0 0 6291456 qspi_test 
mtd_debug read /dev/mtd0 0 6291456 qspi_read 
sha1sum qspi_test qspi_read 

The two SHA-1 sums must be the same to pass this test. Send us the output,
please.

thanks,
ta

>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>                 FLAGS(SPI_NOR_NO_ERASE) },
>         { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
