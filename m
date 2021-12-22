Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA64C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PR972ArnH2YzVAL9tIdTIv6l5kcidtWeVXDpC2B9Dw=; b=g/6j3hIY2mM5ze
	4Fn2a0uNDgITtJf0cOMOrYFzZ709MyVaCbFY93fdtzS7tG0iP1zs8z7pfrnLriCFnke1unk7FfH5I
	NMcduapgW1RTXJNbmSeHYs7e4UKigz1VjP+f3SNnJKBTnEstp7RqmfdsKJFVfXxCGcJKh4zXcyVfx
	o0c9KOsijYYVEzRNEAhw4CPv4DINfMCdscBo135hAc5VhuqZffeYTWPqvP2qKWcP6dRaCgKXZSxKP
	CrVQBWMrFtN0efLEVTqWyQLTdf4tXglke0H6GBQLtbGx+jVvUQrL5zJQpqeTmza/9oCkmj/hLGeMj
	UFqxjSPBsSuIEw/7lAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzwQp-009YQN-Fb; Wed, 22 Dec 2021 07:53:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzwQm-009YPD-Qd
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 07:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640159580; x=1671695580;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5em8G3Wi84UcKn2mkEW3S3FBNw+gDAL/Jcq4YYjyP34=;
 b=xQMx0TU+eMJ4PWqX+sR55W99T+laJ3vmwP8wQmmF5TCZswrO+5r7UMV8
 mYEF6NIWP92FJQl8iEnzq91rXwRsUlgUa1CcO81Ce4aAJ3h+/snL9Sc/s
 yuxcu+JwUt8zD+yChdqaH30LfB12TX0DDXsOCUm3swNw1wh2zGG3F0Z8l
 95xD4nsMe8jxl9x+zs0NmzqWE9umQyBkKlX8c5N7ex3Yj9iv5JtSUzKuH
 taSpaRfbIfHSb2zsMAZ9sEQJd20UCaZoy49a/2JLUEI7fKh8vF/vJWNiR
 xNrheKn4tt82gMtVmQb8Zg4MibfLelxZZ8nhVy+2hsLbDucBSnz/9AgkI A==;
IronPort-SDR: JZfh+FuMTJG5Y4Ed0ZKCu8XMibNXSE3+x8aMLKbzD/KcyD7brbBsmNp2iQuUWjK7bXaYvAwjk0
 5307aVUi2HBFj7RF2zFrH1vWErA7PHZscPAkN5b7U455CZqZKP10is6KxY0FuUNrlabhVB3Mym
 Kzht9BAuZhxPXE94G3901DGdWlhOIpzci0kLh0/+qo10euElfpyYadIPEGWBnaPvNjgUuRuAva
 m8BGCOjPVyJYJt0m3qmR7Fvjo2BBlFms9/bUa85gmUNb1sbusneJ61MLgGvLWvIu5DKOAA0KT8
 C0UJrggYBGigW3gsRLO12Kb/
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; d="scan'208";a="140569935"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Dec 2021 00:52:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 00:52:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 22 Dec 2021 00:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaOCDuzdXYrD4L+u2YKRXvLKQvivgvNbTeAbnlKF9oMWWCASuKzaG0DihTBFwaeXi9kB9MDOCCaAyXkbtF5miJvJ+FLbyMDdtc+vD1S40bw+47o2u+7QUxkQDcvmPBCng+qEOHSNvOYBIe//U3ZOhlGsfhU+bE1v2zTVb78e0BYTqUHllvKK/uIUP11mwz0XSsKipavyxMqrFnCBR7BmHxKxXduRumGKP2ByxvlaojSFAaeXef9rPEu4fmBR5UNilzfrWKqxNTJkzzQlvBwudK3FeuL6UwZjgeEMXBjLVFqRFGPTIETzl8sHOgOilGg9hM3964Ud9kZxPtOzp6iMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5em8G3Wi84UcKn2mkEW3S3FBNw+gDAL/Jcq4YYjyP34=;
 b=ewePDwir6VXsxurS4THgx3GLy7OOqq+mUstk55wcTsLQfzUGfqGM68dCAklFgFZgcBywzngrFcTqanHNiHFDzT+FjSC9znxsWe8V8eFDI+4GgcrfSTTSdEvsbJhhyoTKm9uMnR5QC0mXYwOhcJ8SEWqLv7vj7ISQLEns6tRBy6JYDKaGeEvfc+/YRCswgQXiqY43r8Dg6duj6KlqxohRpPUgyV2JK2UdKZkOVlHnX1iN+WvIB3kYnueCdZ3wzFbYJKQkEAHASMjNtLQy0/WVAnEQqDz5OY04YVEAy/4Rbl42s1HferzWyz+3KIGj/XdyXG1vD4+QvLOaHJCKN2SHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5em8G3Wi84UcKn2mkEW3S3FBNw+gDAL/Jcq4YYjyP34=;
 b=HbSImin3HBIM+NDbFbN9YM3BfVBr27hEXByUkEdfQA1QGGNoD8ZozEgvvQgIILGRhN0IvMg9VhwW0PT7Hq2D16EWzZgrQ09jM7NBK2XyBRaLWnB79EuafYo6xxtqREJokrHRfKcfxWSrBz/uwrEmBgJDf0N9UY/s5SuoRqZhZIU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3423.namprd11.prod.outlook.com (2603:10b6:805:db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 07:52:44 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 07:52:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
CC: <monstr@monstr.eu>, <thomas.petazzoni@bootlin.com>, <broonie@kernel.org>, 
 <linux-spi@vger.kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v5 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Thread-Topic: [PATCH v5 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Thread-Index: AQHX9wjnQ3zfS7UookqMlT7vSJeh9A==
Date: Wed, 22 Dec 2021 07:52:44 +0000
Message-ID: <a11a0650-4624-0a9f-d0a5-c45393fead7c@microchip.com>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-3-miquel.raynal@bootlin.com>
In-Reply-To: <20211221170058.18333-3-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 697a06d8-a6ae-41c3-3baa-08d9c52009e1
x-ms-traffictypediagnostic: SN6PR11MB3423:EE_
x-microsoft-antispam-prvs: <SN6PR11MB342332B5D62CC1B037FF3728F07D9@SN6PR11MB3423.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: chPZMlvtnoGJL8BxDMCPUneKRpSCtmw5PgcnYxWyiXLgpbMFgER5Dwpi0zod4MFUjM/MROPb81euVAhcjdKh9HlO1FdQz6e9fPzRxRIei8t2X9Ro/9FzSRcmAg61rq9Ni6EJHNLGt//p2Xzl7T0f8qaQePB/Hsvnumn1ny1CrL+GezfC2Px8+etR0P+3k4LxULeZYTOV7Sx+R+7kRp2Yrv2aB6WDd7d0Cnvo8yaqdfeo89evakkQ+pYpBxbtCtltI0mVerYojKT7F4iHc/ACbVZIxpGzpHPwXs+KJVt2VY8x6tsJ6WOUk6CHjOi6DmbW96IqX/ZviPsaBHBXPJQGXIE0KnkqkvgeJFQr3KSfTnJsis5KU0WRu/KkwAheAcvJN+gYm9ca5egQQV0DwVLcdiHh0Fvh1od5Egh1cIOUOnS8Yn0Tm6LkeSKCEu4krbIyZkGmBMcvSOOujqS4p2kk3GBMoqHKpi4+caqisVoy9rCZSuPLzx4SezYjpdIxt0JPkRkIKhT9JyZXAKqDj5Chf0oyJ58PeIwReu9mLem5zQRigriWRgRTa+u7ef3nkMymiP1yZcCvh96vV0e2l2JiZ7oovZMO7XFLD5IthpC3/ipXNBiVr9+uQsrMBpQbZd8RLay/Exr53gOJINThMWDRXPjYSzJ35hW86/S9++IndDcbdInOcTmS0pQbWA7YDccO4Ae4C401pr7xcdKwO8tPHzgEt28tNIR1hD2EB3zNiqgJWDCjDD0TxUdmm+EMcyio6y7C89MiEuE5E2MoXkh0gQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(36756003)(71200400001)(91956017)(76116006)(5660300002)(31686004)(6512007)(38100700002)(6486002)(122000001)(38070700005)(31696002)(4326008)(8676002)(66476007)(83380400001)(26005)(7416002)(2906002)(8936002)(508600001)(316002)(54906003)(110136005)(2616005)(86362001)(66446008)(64756008)(66556008)(186003)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGs4c2ZQd0NpOUk4QllKNVhaWWQ5MFlaSmFEMnlYZlJ3ODkvNnhBSVRzcFp4?=
 =?utf-8?B?RW9mMlFteFN6ZGx3b1ZyYk80ZVhsZG9mcldSRlZrN1RpS2s3dU5uQmV4aEFh?=
 =?utf-8?B?YW5LbTRHYllCRHJyTTZOZUI3MHZSUE9zblkzNTNyNnpYTTJiK0Zud2xKUUFk?=
 =?utf-8?B?M29uOFN1ekNhY3hyN2pDRkY5RVVyUXZuTnhINlYwcEVWNkVPMm9uUy82bE95?=
 =?utf-8?B?dklSai9IRkFHUFpaWGwveUZ3NXVMc05BNTdxdDNYTVNLeEdOdVRYM2lzd09x?=
 =?utf-8?B?MEc3aEg5d3FTOHJLeTdac2NWQzNrUUtTdDhUNERaTGZURndaTlNPRnJvcW01?=
 =?utf-8?B?bHBCME9QQ3lwVVV5SDRtZlJ1MmlXTGY4ZWxPZjhtTkhvMUQ1NFB5ZjJka0FU?=
 =?utf-8?B?NmkwZVN5dGIxSjN2QnB3am5mSFpJVmZWejdJeXp6K3BEdW1EVVdacmI5VDhq?=
 =?utf-8?B?ZmxsYTRpS3hHY2RweUlCdm1HVWNJQmw3cWJTVkY2bHk3YlpRdCs2NWZNQ25C?=
 =?utf-8?B?dkg0by83cmR3MnRPNzBjWk1kZnZmZTh1RitNUTFmb0lIMFZiNTNGR3Q4QktS?=
 =?utf-8?B?NG52U3FMUk1HUjFFZGsrOVJybStiT2RtMVNtaDRWOG1xQzJjdUR2QWVSNndh?=
 =?utf-8?B?M1JvNmY1aHVIcHdvS1B5aHJzczVWSUM4djBHempTS05pckYvdXFJbUVJUmo1?=
 =?utf-8?B?R1ovQXZMMVRsZENrbUJpMm1KSGcyWThuV1BlV2xQNnU1S0Z5VSt2dWdNWldE?=
 =?utf-8?B?UEpSYzMwZkRQQ0czdkJ3b2x2bmYyQloxRzJmNlZGeDFncWpTcXZUUHkrRHlo?=
 =?utf-8?B?eTJPMzFObE1MUmhheFUzN1o3L3RUbUYwQktsM25SeW1TWnF0am85WUdSSWtI?=
 =?utf-8?B?RWlVOFFERi8xaGtJOWtsand3dktvKytHNTh3Sjd5QTNWZ3lrRElsMW9kNU1m?=
 =?utf-8?B?LzdSRDFBZDZwc3NpbVBDelZEZVNMZkJWWFZabWlhM0srazNacVlia2hvUlcx?=
 =?utf-8?B?OEZoMjZwakFkYWh3RmVWZ2FYdTZnNENFa2ZKU2J4dkRSM3U0YzhnSnFUZjNJ?=
 =?utf-8?B?NVZBbXZzTVRtSVJZdnUwNmJZR055THRKNVErMDdMMEREaWQvNHZ5Wmp1OGw1?=
 =?utf-8?B?TytSNnp4dTlUN1NGVnZVb2diUnVVYlNuNUxNUjRvRTJ0MVo1eVI0ZTBldzZD?=
 =?utf-8?B?aHRhN2JrS1l3eUt4S2RzcGFSTndtSzBCajdTR1ZROFloRWg2bFZMTmt4RGdw?=
 =?utf-8?B?MGx5bXVyY3J5NXdXWHkrdGZaQUhNc2Z6aE9iZ0JrMnNNeXRRdUNjOU9nNzRr?=
 =?utf-8?B?QVMwS21FY3VRRnhaTGN3MENaTWg1Q25IWXgxZEJseGxudURGNk1RZVZFOXRH?=
 =?utf-8?B?V2I3TGlHY283RmJUekFHUU5OR0h4Z0taT1R6T0x5UXphMjV1b0lvMndubWtr?=
 =?utf-8?B?ejBwVkMvL2hxbThCN25oYllrQnpERGtkZlhENzRhaFVucC8zQTQ4Z21wR2Y3?=
 =?utf-8?B?U21ZWWFyQ2JoQUNpNTdhMGRJOXVFaFFFb2Nyc0NXZnVCV2JXM1BISHM3QjBV?=
 =?utf-8?B?dlp6WjFEVzR0VGFBMWoyN3JrYWpFWHMwcUQ0L3owdkdaQ2RncGFWd2IzVGhX?=
 =?utf-8?B?YVRYbmQ0WkVQV1BzNjlwSzF1aUdkUHA2RHB1aHVYTEtBRHVIY04wUHMzeWJm?=
 =?utf-8?B?VEQrbjN4ZmFMRWJZU1VkZit0eVZNR0dWZEt6clk4ZEtVSTFtTGMrck1lV00r?=
 =?utf-8?B?aVpYNEtGU0ZKVXdIR3EraE9YNjdrd3pIVkJObzVXVXhQUDV5U2I3amFvRnRR?=
 =?utf-8?B?UnJkbnNnMXU2Z0Y4SnF5ZldoSkJKU1A3ZFZScFNMZ2UwaHJQSDI0c3U3ZWIr?=
 =?utf-8?B?bUdycmhuclZMMUhlOXNSeW9Ob2wyUUVGbXhmMzVKVjUvMHROdEZYWlVWMlF0?=
 =?utf-8?B?NzVNT0xEWVduTHdlbDRQNDFramQvRmZOU25FbjBDUFZjajVpTVQwYmFlajlW?=
 =?utf-8?B?V2VuR2MvM1ZJSS9zMnlPSWNWVVFMVDBwa1UwMjVNbmFkck1SRlNNVnphU09v?=
 =?utf-8?B?UTJHWjlYeWJ2S1NmbjZLSDV5N1JFZFFJSjEzZTFaRXFrN0lSbjRlSjZCNUpm?=
 =?utf-8?B?d3g3WHlGZ09RK1N6YWs5YnVaVEtGTi8rdXhCYzNKNW5XdUQ0Z2dXdlJtelZx?=
 =?utf-8?B?QmtYUCtsV2R1M3IvK1VFOE9WalVtL3dhTWhyRWY5dXlkUzM5c2pQcjNHSWhQ?=
 =?utf-8?B?TXZ0ZEdJMHUyZ0xwUzZUbitnVTV3PT0=?=
Content-ID: <302323580A4A7742A715D6D47FC6B30C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697a06d8-a6ae-41c3-3baa-08d9c52009e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 07:52:44.3752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBvlUO7HhPAffvFVUFRzKdCD/zGlNmXdMKOXYyJeAvL+qYbbITo6fq3LG8Z0rqSkS1759DSvD4QBVVqwZwSRIXRIsd23IPNuD3TWkpRGVdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_235301_009879_BE5E84D4 
X-CRM114-Status: GOOD (  23.82  )
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

On 12/21/21 7:00 PM, Miquel Raynal wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Hello Rob,
> 
> I know the below does not pass the tests (at least the example patch 3
> does not pass) but I believe the issue is probably on the tooling side
> because the exact same thing with uing32-array instead is accepted. The
> problem comes from the minItems/maxItems lines. Without them, this is
> okay. The maxItems btw matches the "good enough value for now" idea.
> 
> The errors I get are:
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/spi-controller.yaml
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>   DTEX    Documentation/devicetree/bindings/spi/spi-controller.example.dts
>   DTC     Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is too short
>         From schema: /src/Documentation/devicetree/bindings/spi/spi-controller.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is too short
>         From schema: /src/Documentation/devicetree/bindings/spi/mxs-spi.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'display@0', 'sensor@1', 'flash@2' were unexpected)
>         From schema: /src/Documentation/devicetree/bindings/spi/mxs-spi.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: flash@2: stacked-memories: [[268435456, 268435456]] is too short
>         From schema: /src/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> 
>  .../bindings/spi/spi-peripheral-props.yaml    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 5dd209206e88..fedb7ae98ff6 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -82,6 +82,31 @@ properties:
>      description:
>        Delay, in microseconds, after a write transfer.
> 
> +  stacked-memories:
> +    description: Several SPI memories can be wired in stacked mode.
> +      This basically means that either a device features several chip
> +      selects, or that different devices must be seen as a single
> +      bigger chip. This basically doubles (or more) the total address
> +      space with only a single additional wire, while still needing
> +      to repeat the commands when crossing a chip boundary. The size of
> +      each chip should be provided as members of the array.
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    minItems: 2
> +    maxItems: 4

Why do we define maxItems? Can't we remove this restriction?

> +
> +  parallel-memories:
> +    description: Several SPI memories can be wired in parallel mode.
> +      The devices are physically on a different buses but will always
> +      act synchronously as each data word is spread across the
> +      different memories (eg. even bits are stored in one memory, odd
> +      bits in the other). This basically doubles the address space and
> +      the throughput while greatly complexifying the wiring because as
> +      many busses as devices must be wired. The size of each chip should
> +      be provided as members of the array.
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    minItems: 2
> +    maxItems: 4
> +
>  # The controller specific properties go here.
>  allOf:
>    - $ref: cdns,qspi-nor-peripheral-props.yaml#
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
