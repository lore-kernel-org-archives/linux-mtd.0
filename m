Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6E3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4VpeT9+97Ifo5BkXPdrohR1LBKi6wZUechPbRyl2Bc=; b=3ZvEmi9a5MIHRx
	M6rI0zyl2NmunL6NaBY6Zh3eDAEgaM6IGt61fAtybPsa7CZV96bHSBeeT9uGV9m28OZu8mHdRmkem
	/ZI1Z+6LrdjhqIGhaLICKkJFtEe7m5TU8obOmumGjLtvNnZD4KI0PVyTnhpe/yEVieTLEhi6lCm8r
	oEAvkC7zlnCst4TUeMiEN+RRtTEkpCWB3/7iKijH3BqAfHNJ81IZYz3j4MTA+5AF54SzZvIubv7nN
	oEUjl3hwi/A12byfzrmGcUPgqsyzHnthS3SPr7IobLYuBjryDxL75aLyEMbIF8hw4Zltl78o+kfpb
	bL1zuzBqRN51Tjp4xjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEnm1-00BNbe-FG; Tue, 01 Feb 2022 07:40:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEnlx-00BNaT-Ga
 for linux-mtd@lists.infradead.org; Tue, 01 Feb 2022 07:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643701217; x=1675237217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lkFhf+amaVVXP6uv0Xa0pJE1fJIpezZGCkGrYLq7zj4=;
 b=sw+zNN60nqEaVZdQAdXoKjzB6unPiqsgV2Yw/4BKVM6FZrsHVCUFU53H
 O1vEGfZQqtWT1flyp/15/aE6gYvXNuC6bDH4vh+7d2Qb2rYcGUy3Y+EbO
 HV6LE1OrzlkH0/oJS5bM4ri1pbNMfHqBGk+fijmRM4mz6dnSa/yL3VPLs
 gy7dnPzZsO17KVZsBWdMBgMxeKnZWMGc4BC0XqPgpwkEN6Oj7f0jjbsIf
 xPrGL3Qva82dtwMwz1m+Hgt8nmTbMntYnrfV5pTmxVWwkyB38DuWaQN1d
 15C8VAD4Os3MybDTLSLv9FZwVq7OcPGZ2qm2bXMoqur3dZElbflyTEyhJ g==;
IronPort-SDR: G1VtsMZACoZ/HecLq/x3XpoJAtItA7LdV+8ZzyNOwdzrB3VBgQJzX9KWUVUY3sp2C3AghdJMJZ
 W5HGB6hIKz5kJi17uJn1788e9U49xvXODVn65297Bl9Gr5Az7hWOijub87byNEvpb/nzZO1r5g
 zIsZ3n/KJ28eSPF9uuEmCBQ9S8sZHooBiCdzqHB9cJrVFs4G1s10OAxTIFwWAyGo7dZIV1ONI1
 qAgPriwWIHSF2Ls5e1fl9ymCNtUnPgxgrakJEYGpm4WRzZa61w6Z5qbsU8UMCd2WrdmViv2k2R
 j/UfT8owZxjl5TodRSP7VE0Y
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="147225996"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Feb 2022 00:40:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Feb 2022 00:40:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Feb 2022 00:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdUzmXOCPP64vmH0rhXdIdGOoQuGdWWyUaPA62IoIvRqbsNi/Ivb9ub9ENXtmJu48AClh7WyZOIcC50Ke7PeGQ0zw16HwTqCXKl2FFAU1bZPZmh+zdFmQuGcR3/TTKcPdQ79AhMXfqYa05gv0w1/aC7C5hyPxHxfyPaxnxio43qzDDkVBfQfpuDleJuzjl9j0+WIdmMjMBs3plnClpIMzjOBmUHvPpQGlGMqfLsCv3pHceor1Fr0MU3VhrGa75JN7NX/zz0/oYMYm7lkGoaoI2GBok2IWPUpRWwsd7Brm3YWph3Keta6p2p5RdOFh/ubydMBBMsCgbCv6KwS2CCJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkFhf+amaVVXP6uv0Xa0pJE1fJIpezZGCkGrYLq7zj4=;
 b=IYq/R7QOIUvEKqBQEXMbc0Z5MiFVnFR5eLaGTsw5fijRw5DHH9MSrohVGPCdD++fna2oQjENTEFXz2i80V8b+ZXmuQIFhhGZLiE3p9FJuR80d5pJdRYmHFoR4spNTCpEa/5vqdaBXYDNUW7PFS7pKjb9MF8tMVAHMUMNXp3k+H5Fy71akj1QfHotdN46v0g2w5ed2426zObYdlHqboxo1X8nzLxfpvMu/zi8F73p/gsRk1pPBGBGYV3smrLDqm4QaMOP0aPYTCJK7gqY/ucLSLHtqGbh447r0BrWAGKdo+bSX8fAS5E4oPuhKQWIE3YxvVclsohnNKqrjL71r161uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkFhf+amaVVXP6uv0Xa0pJE1fJIpezZGCkGrYLq7zj4=;
 b=ox8Dv/r7Gzpcw6l6Nc0/ApTj59cQ7hqAW1tfUhilFunfoL9BItluYYmw1eqFXIxAC3EzuZUcL6b7fnOaVdjxo61vxGjF2RE5z9GClt30Adh5TkrYB0VPRbWAlFTEC5/rFrcZR64f0AYIhmBVAMTauvYxBdBUPaSArLdS7Q2eOEM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 07:40:14 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:40:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
Thread-Topic: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Thread-Index: AQHYFCuR+A5oVBDUhUqz+UBnUsWCgKx+VY4A
Date: Tue, 1 Feb 2022 07:40:14 +0000
Message-ID: <f057b134-cf1a-747f-d750-f12d6872f56b@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
 <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
 <20220128162056.vwxhlz5psdxzz3tf@ti.com>
 <57909d3f-64fd-a9f3-ef13-55a5e571d853@microchip.com>
 <a3ee02b7-370a-db90-bc1d-49c988cf21d3@gmail.com>
 <9acd8baf-9dba-40ac-992d-2f5cf62203b8@microchip.com>
In-Reply-To: <9acd8baf-9dba-40ac-992d-2f5cf62203b8@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c393a6f5-ada5-45c3-c58e-08d9e55615f6
x-ms-traffictypediagnostic: DM8PR11MB5669:EE_
x-microsoft-antispam-prvs: <DM8PR11MB566978190FE73AC104AD6965F0269@DM8PR11MB5669.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G3vR+mMEU7LmnmtrOpbVZZlJGFdDUi/g+l0n0p3IbOjg5hvkTZ/VesWY5XBrFDW+1fSknkL6XGy0m+QmxeYx/6AG08MZAns9jF5bdRe1uUE3RpfO122r/DzZjta6t42wAQfvAPOah+ufx50BUNenkDp4kTmFAlIGf7PlE88PCd0mMnp1OLqG7+GojbQcefsePp6sTzjDaKRLE7N6NuPn5jYXk0rRVZTi07WNoEH+qpfxvTu9mXEkBzL17usL4kY1jYLkv9Z6PyP+xiKKd1hAc2X5OztcNpmBndsjczYQAe16OI6cg2ZhcUVJPNdOVu1vuZ7oldBw1jDyELCUPxx3uO+a6a4UrypqVBANgbkE4RRUWLjKyVXu2w6uMi/Wn3FmWbNI0XZ51+F4WoDJC5sHh7OsjjI1hQGuvIwOtiOWZzgkszG6Gm/wW5pqIvhae4OdFAj/v8CVAb6W+FU2MRQk4ZF84NiB2DjfNjssxfO3QJg7BhSOX0M6+2blgqi3WyRyGPaNM0VSJOegG8ujQoVQgoaKAdd0MI8gIUCJJiI6rChdp05MP86dYcCMbdJbevPvyoKX9RodNkvfmdPYF0imnk/hZbOCfxSi4xHGiMF6oPwu0qqrXDlfHekQ9TNu6qwjcKIRfM6/QzGto75/7ppH0WumIZdxrak+1AKWyQDyrf/2yTKxYctlGmEsh50V2DQK8GEVHP1SQrY7CHNXYxWx4y/d1NUXBTo6WYUFu591wk/L+T8wvNcZwd/pFysaXClG+/uxlP+Kk3uxbwn6KtfhiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(5660300002)(66476007)(26005)(31696002)(508600001)(38070700005)(66946007)(66556008)(86362001)(122000001)(186003)(8676002)(8936002)(6486002)(36756003)(6506007)(6512007)(66446008)(64756008)(53546011)(2616005)(38100700002)(110136005)(54906003)(71200400001)(31686004)(91956017)(2906002)(316002)(76116006)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHNTQTIwYVF0RlA2ZDNDZlNSZDVqcTVuVUtPdGVpZytOR20wOVpSTzFQcFVG?=
 =?utf-8?B?VDE4SWF5WGc0RnR1V1VTUGQ0K2tKa2piN3hTazdOa0tWU2M5REdiRXNSd2tS?=
 =?utf-8?B?bVRMT0ppNVUzZzUzNEY0ZFA0QytGUEJFdHlrbzU1Y3dSRnBGVis5cnBSNnVq?=
 =?utf-8?B?TFVhMjBOalJqanAyWXN2UFVpMGZaOXlvNzFVTS9YYzg0WkwxbXhtK01TYTdw?=
 =?utf-8?B?bFJtbmczVlZsQWhoV1RicldIQ0d4MXpTd1M1S0NEZ0VFTVhqRnhxRUsvSjBt?=
 =?utf-8?B?YmovVlVjZVNVTGpqdSsvZVpCdWNmRG51d1RrR29Qd1YxSS9nbE1Rbm1KMUJD?=
 =?utf-8?B?UmpYN3NEL0Z6VndRM0ppdnp3enpwR3E5QjRwNFlydnhXSXEwdEJPanBEdDdE?=
 =?utf-8?B?RlhpRVNNNGZ3bVlueFdMeFllbyt5dDhIdHRuQkZsMFNBUEZ3MDJuOUtKajg0?=
 =?utf-8?B?dWpibkk5SDlOWG8zaEhtNXBVTWFUS1NlOTJyMnpyN0phZTU1MEN1cDRBaDZm?=
 =?utf-8?B?Uy8yNXNHREkwZW5WNlpNeGx5M3diR2R4RHRzSUFZSGEvck1CQ1FlVUg5d2Fx?=
 =?utf-8?B?aFBLOUlxWmFlRG5ieU04YzFPSHZxSFkrejVoVHdJTzU4c3RuaWkzUmdYNnZm?=
 =?utf-8?B?cmVQbWZremtVRHZWWGt2YVdIa0ZqaEkrN0Q4NjJYWXREMzBsWTRmZUltSkQv?=
 =?utf-8?B?bGdlY2dMNDE1SFVsaksvMS9jUXl3bTdPV2Q5Vjkvc3ArSEQ3bWhaVjVnSTFE?=
 =?utf-8?B?c0VrZzdGWThwU3Nweit4NHFTWjhNMmxWYm5VZGo1Ymt1VnJXV1NIa09EbW1y?=
 =?utf-8?B?S1BZeENwOWNZcElRNlB3bDdIb2NrVS9tSVNPU3BvM0lJY2p3ekI3VnNUZi9F?=
 =?utf-8?B?NHV2eE9DSVBDSGxqRWx4N2g4cjJhN2I5alJVS2d0b1VSWS9EdzAvY0FleFJs?=
 =?utf-8?B?MjNFcEVZY3k5R2t4UFhRVFJKUUpWSDZaMWpZaVFpQVdNVXpWa0JiT0pmK0ln?=
 =?utf-8?B?Vm56bnN5ZkMvV251N25RamFxL1E5QjY5b24rcWkvd015KzgvTGt1RnFoOWFG?=
 =?utf-8?B?cmVCeDVxRFJCUWhONisvQ3o1QjZCTG9mVDhEQmozT3gvUGhxcWtjNDUxWHpE?=
 =?utf-8?B?NVkyZ3h0YkxwdjdaUklwRVljVzJ5MEdiN1RTR2pCdXVQeEtlRDQ3TnZPUHd6?=
 =?utf-8?B?TlZJNk90YXhhOTIrL0dxVDhaSkcvTlU4MDVJZS9XWjErRW5QN0NibVZaOWov?=
 =?utf-8?B?Tm1zdnhmUmU3eTJNV0p6SFBTdzBRMGdsMW1Vc2dDN0ZURWZsV3ZJZFhiQ2lR?=
 =?utf-8?B?UHQ4YUtYRTB5b2ptbjhTa1NZcnZObWNVa3VQN1E5Qk9vUFNWVDllWDhQdkwx?=
 =?utf-8?B?U1A3SVFDN2tISmRWVk40RDlBUUQ4QWVZOEdxNEMxeHVJZk95Q3dpcWVQdXRD?=
 =?utf-8?B?MkE1RU9MeVNUNWYxaW9MUmRlN2swMnJHNmZJYTVnZi9ZOXRicllGQmk4Tjkv?=
 =?utf-8?B?MFdOdVBtZGFoYU54eU5YMjVSY1pLaHB1ZldQemJvaFRuaTlYOVBuOHZkT3ZO?=
 =?utf-8?B?dEpQNnJwV2pXUHZhWEFuN2phZWpwQ3BGTGQ2MzZ2M2pOeTVRZlZ1a1V3RXZa?=
 =?utf-8?B?VllGdkIzRjQ0ZFp2aExlVDVlbWlSYnJoY01WTXFDVEZmUW5mcGV5QUFMUDFZ?=
 =?utf-8?B?RVJVc2pGM3pWRzYrVkhjc3J4cUVnM09udGRGOXZhWlNBdFJKSzR2WGJ4UjFQ?=
 =?utf-8?B?eVIyd3dTTUp2aDJIRklJNUp3eVhUK1V4cVg0MDlSUGhPWk9vUjN6SXJFR3pi?=
 =?utf-8?B?NDhLSEZTZ3J5M0RraEZieTM0VkQ2aUFGNS91MGk5V21VelZ5NTQ5a29RaTJi?=
 =?utf-8?B?MjNJUHBjQ3BETkRrdkZHRjhETjNLQ0JlbE5FV013blByd0xxSnltK3ZNamxy?=
 =?utf-8?B?NmF5KzZVWVBRTThYbnllNm91M1NqeXNLUlV1bkhGTUwyeE9jR1VSbGs5cjV1?=
 =?utf-8?B?WmtVNHplME1pTFhpYVoxbzVRMkw2aHJralh2YnJKWlZyMXlVcDFuVldzOS9z?=
 =?utf-8?B?MGgrL2ZQTVd6QnozeGJoR1Z2ZFBLRFZ6UGFTMHJhWkdKTlhEMTRubHZzVDhp?=
 =?utf-8?B?SVJuN3puRVVGU1dVU0hNQlZBeGdmRUJGY3B5dzd2WS9WbVA2bVBEc1ZabnU3?=
 =?utf-8?B?QmxoUmtZTDZITkNMQmpJbmgvTU9lV084Y3ViZ3ZHZDNDd29sYVhHUk8wbFV2?=
 =?utf-8?B?U1drSGJ6ZENuQzg4YmVuQXdaM1lnPT0=?=
Content-ID: <81B4DC797C02A641AA87AA8607EDD690@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c393a6f5-ada5-45c3-c58e-08d9e55615f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 07:40:14.7453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SA726+jNq1yCPQU+/KBx41XUH7cv92JaftugFXFh+X/J2ScffUIx8mYNHGHdsDK3MnAXy+Bsp1G4sREV8ossA+nks2IacROVt77JX967a6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_234017_716165_F76E5B7B 
X-CRM114-Status: GOOD (  14.73  )
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

On 2/1/22 09:37, Tudor Ambarus - M18064 wrote:
> On 1/31/22 13:10, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 1/31/2022 4:50 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 1/28/22 18:20, Pratyush Yadav wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 28/01/22 09:43AM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>
>>>>>> Some of Spansion/Cypress chips support Read/Write Any Register commands.
>>>>>> These commands are mainly used to write volatile registers.
>>>>>>
>>>>>> The Read Any Register instruction (65h) is followed by register address
>>>>>> and dummy cycles, then the selected register byte is returned.
>>>>>>
>>>>>> The Write Any Register instruction (71h) is followed by register address
>>>>>> and register byte to write.
>>>>>>
>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>> ---
>>>>>> Changes in v7:
>>>>>>   - No change
>>>>>>
>>>>>> Changes in v6:
>>>>>>   - Add helper functions for controller_ops
>>>>>>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>>>>>>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>>>>>>     function header comment
>>>>>>
>>>>>> Changes in v5:
>>>>>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>>>>>
>>>>>> Changes in v4:
>>>>>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>>>>>   - Modify comment for spansion_write_any_reg()
>>>>>>
>>>>>> Changes in v3:
>>>>>>   - Cleanup implementation
>>>>>>
>>>>>>  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 142 insertions(+)
>>>>>>
>>>>>> +/**
>>>>>> + * spansion_read_any_reg() - Read Any Register.
>>>>>> + * @nor:               pointer to a 'struct spi_nor'
>>>>>> + * @reg_addr:          register address
>>>>>> + * @reg_addr_width:    number of address bytes
>>>>>> + * @reg_dummy:         number of dummy cycles for register read
>>>>>> + * @reg_val:           pointer to a buffer where the register value is copied
>>>>>> + *
>>>>>> + * Return: 0 on success, -errno otherwise.
>>>>>> + */
>>>>>> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
>>>>>> +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
>>>>>
>>>>> how about making this a generic core method? I'm sure there are other SPI NOR
>>>>> vendors that use registers indexed by address. How about introducing:
>>>>>
>>>>> struct spi_nor_reg {
>>>>>       u32 addr;
>>>>>       u8 addr_width;
>>>>>       u8 dummy;
>>>>>       u8 opcode;
>>>>>       u8 val;
>>>>> };
>>>>>
>>>>> and passing a pointer to this struct as argument.
>>>>
>>>> Wouldn't it be simpler if they fill it in a struct spi_mem_op, and then
>>>> just pass that in as a "template"?
>>>>
>>> sure, sounds fine. I would like a generic method with less function parameters,
>>> if possible. Let's see what Takahiro will propose.
>>
>> So, I would propose...
>> In core, spi_nor_spimem_{read,write}_reg(struct spi_nor *, struct spi_mem_op *)
>> that calls spi_nor_spimem_setup() and spi_mem_exec_op().
>> In vendor specific, spi_mem_op is filled and passed to the core method.
>>
> 
> how about the following?
> 
> static ssize_t spi_nor_spimem_read_reg(struct spi_nor *nor, struct spi_mem_op *op)                    
> {                                                                                  
>         bool usebouncebuf;                                                      
>         ssize_t nbytes;                                                         
>         int error;      
s/error/ret
                                                        
>                                                                                 
>         spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
s/&op/op
                    
>                                                                                 
>         /* convert the dummy cycles to the number of bytes */                   
>         op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;   

op->dummy.nbytes and op->dummy.buswidth
         
>         if (spi_nor_protocol_is_dtr(nor->read_proto))                           
>                 op.dummy.nbytes *= 2;   
op->dummy.nbytes
                                        
>                                                                                 
>         usebouncebuf = spi_nor_spimem_bounce(nor, &op); 
s/&op/op
                        
>                                                                                                                                           
>         ret = spi_nor_spimem_exec_op(nor, &op);    
s/&op/op
                   
>         if (ret)                                                      
>                return ret;                                           
>         nbytes = op.data.nbytes;
op->data.nbytes
                                                                                                
>                                                                                
>         if (usebouncebuf && nbytes > 0)                                         
>                 memcpy(buf, op.data.buf.in, nbytes);    
op->data.buf.in
                        
>                                                                                 
>         return nbytes;                                                          
> }  
> 
> ssize_t spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op)
> {                                                                               
>         if (nor->spimem)                                                        
>                 return spi_nor_spimem_read_reg(nor, from, len, buf);           
>                                                                                 
>         return -EOPNOTSUPP;                  
> } 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
