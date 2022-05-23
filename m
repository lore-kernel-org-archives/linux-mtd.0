Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F718C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:In-Reply-To:Subject:From:References:Cc:To:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/VRi6AaU7eeF1tjeng4EbFKzn0kbnq/zHlw1Y8Smy8=; b=citZS9mThPJ1ujQvl2M93TvciO
	0+p8yv4yueCuaoVvXtg22HRqlpb6F5rxCggXRFNxflJSPjRxT9jgTcFe3ycgbFYQQaF0TffDmjoT+
	g7TND0AkT96Ek43UeWpwTYonTAsiEEJurexvwsZ1js7k/eoN3A+w2G/HOr89RU8JEGqEIE4ofG89p
	U85ApwnejTZrjgSYmORb+CwokqDrH6NZOiKVRrBQcKTjKI9Sp0dsL6yjokwl8iNT6TNnDfOTfCsHo
	SweoPkHOPd1oOGiwwfc2iK8llQFmrwDwkhuSbEc0ecaCzBpMEW764vO+3G6ffrrptoXflwjq/bkm2
	5rDRfu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5rp-003Wq6-N0; Mon, 23 May 2022 11:04:54 +0000
Received: from mail-lo2gbr01on0722.outbound.protection.outlook.com
 ([2a01:111:f400:fe15::722]
 helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4tx-0034RT-FD
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 10:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCxOvjAzGGKIg8vy+ohEw+DDypTtln7w5CQwJ5U9OG3ib9AKp3OQnKTzImaoPOg0sUAQEDaUipOswOKO2tRTlr69rodOcZp7v3rO0nzLkfyRxkU5mqFDHm9hMB8yXC2Pa6HYHL4Fng1DwmBv8Drj18uhksQ4j6Um8b7vd+QZbyTk3k7Lwwkyya6QNbCkyIRXaCqHkpsaUeJz8rgoGca2QAAe9t2wThCbS8lwJMnwQ1cQ1eriv8VaLZoU9dk3iIfkkkeLtdx/E3muoyhwIgJZqSPalOTbgrx+jLisfd//TA760KtR4XkKWf2XPerFkMXMmByNl6SeQeUSnp3dzeag4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjHZ0I7OsMsYW7TvY4W4gkpcAUt5Fd0UaS6QepF0UMg=;
 b=WdgEVkmezXHHo7eInis9Z2V31Kf2bmusPwbGt0S/4vp+P4m8QUKnmoL+MH72wxGyggb0lU/IrmqM0PSUbUJ53HQgibFF1MfiJ6HhUfqFyJa7wZUkjz5lYZhgzHlUUnM2/R9MJg5rflZxvKakHzcyjOtlEoGSc3sX9vXKnzDcaVPU6DQI1M4i/YbjyyRSntxksLfjwF1GOAh2lBWZhBXx3FXQ5rTryZgH7cNG70sqr0k6b+lkisyJ8knw5X2TkoJAaQtqNHK/QqlyFgbTEpypEOm0iD7RRvIQiDDZE5GWN/Z41O8hOIAqPVunvb+mB3SKKwczKu8S6CHS3DaATZ9Sow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjHZ0I7OsMsYW7TvY4W4gkpcAUt5Fd0UaS6QepF0UMg=;
 b=EZAiFqqn02NyomwMi8lWMyUl3nvhRAiyOpThrjYB++I4mcI1QrK8S4R4cxUZv/1R6rLBmoH2mYhI61eT4WA2RhkCxJZwaOAQNsL6fo9GkfIw5B2UaeXQC1/CXpuTXABAjDSHOXDCVnb5Xqt1XBDhRXi4s97ua4OOnLVydIEbs60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LO2P123MB4077.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:167::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 10:02:53 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::6514:8bae:5874:5bc9]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::6514:8bae:5874:5bc9%4]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 10:02:53 +0000
Message-ID: <821b7140-abb0-17d2-4aab-07247a250e9c@sancloud.com>
Date: Mon, 23 May 2022 11:02:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Stuart Rubin <stuart.rubin@trustiphi.com>
References: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
 <418e465f5156adb340976bac209539f8@walle.cc>
From: Paul Barker <paul.barker@sancloud.com>
Subject: Re: Sending vendor specific commands to spi-nor flash
In-Reply-To: <418e465f5156adb340976bac209539f8@walle.cc>
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1514b30c-cbfa-4ea1-8638-08da3ca3673a
X-MS-TrafficTypeDiagnostic: LO2P123MB4077:EE_
X-Microsoft-Antispam-PRVS: <LO2P123MB4077A338397325E83A04162293D49@LO2P123MB4077.GBRP123.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5Oqzvx2OBZICckOfj8OUj4jDcCvllFLIL4N+rl8vp4AthySDFazlxnyd67s+N+JFtvuBgMFU09ItLJCXdIvFNw4PDWJhOZiCGlij8kb0xT1Hc6vTRj9fAoKjaLk0ynWT7fQniGYhLG0pAVmBhykyrrUPsvZxfNPdwNCOW8Gi+9KQ5g7CG51ckFEFOmNAKepJQdCZ6oYio3KAl9Kb3amXkpgi1ehCimdlZKm+LeL0YpP12Bdjb6afeiRAfxIR97liqcOBYPN27dJb+QRr8939bA+U1+fKlgZ7cJ8P9Qc85vk6qHUJt5Zhiq3zbCp0NEtc6+NsWWiIPcKpCxpo6BNegWq/0I2pRWKCZYee9NtBI9ZboQVow09XFY6beh/jnVQmiFuacws6tKahDE9vUf3i9ATLIq0VV7J2aLUIc6GiVKLo6oWXURalW2Uv9PIo5LctaZIAjVrfdu2AaL04dn+n0mw5rJj0vVTeyptgyVXdtYsSUlcczv6ecCorAjPNuU8uoZEr5wJoUYqpvbgE9orSYTJ+oGSUgHfsj6eX4zP1UjQoA8l2hSd48t1hNzFk07+dMkk8DU8QMja1OmyFS9fIuv0UD5ynEvPX3P5SzyUnU3aDLylpxq0/yX19jHAYc8cjKp9IUmmDvmzDEbCtIWEtbCNQUVMnruMa9ev92uDuAv5on/uJNaKsoEBc52U80DclPlH3WEC7FX954bAbKGVFbxYMzhulVcFPf9cRtZfqww0oEWxavw/ykRU6GOqRqxuLIXRDwercqWWUKiMxb8/w8KnTQGpmUUdI0AA+PLxTtbaoaCNpL6Kgr5OtnJwYAxzRqOpciM338JFlYAmZ8RwAnSFVt07AAoHXqyfTmsZ8Ww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(366004)(396003)(136003)(346002)(376002)(26005)(6512007)(6486002)(508600001)(966005)(31686004)(2906002)(36756003)(5660300002)(44832011)(235185007)(41300700001)(6506007)(8936002)(53546011)(33964004)(52116002)(54906003)(6916009)(38350700002)(8676002)(4326008)(21480400003)(38100700002)(316002)(83380400001)(186003)(66946007)(66556008)(66476007)(31696002)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFYNEZRclZmZnpnbVNaTnExYjRwL1JxRDFWS3NkWGlYR3p2djRMVlZFTzAx?=
 =?utf-8?B?N1R4QlE0cXRGMkJLd2hoVWhXeTJQTms5Ulg2WldSYlpsQTk1RjhzUFlURHBt?=
 =?utf-8?B?bFk4YS8ybmR3dWJvcEZpMEgxb0ZuS3k2WklXcGprQ2QwN09qNzdCaW5vQllp?=
 =?utf-8?B?Y1JzUU1zNlZXQ3RMKzhZNW9VU1ZMWFZ2T1BZVDlSNkNTVFRiNHY3MDNOcWl4?=
 =?utf-8?B?WHp3SjdNMC9hRVV3SnBPanFjNmdWeDFXRTlmUG45R0krWnNBdTJ3OUJxZDBx?=
 =?utf-8?B?UzNGQ3JLODZzM2VvQlR0dVRmY3ByTzMwVFZ3Y0E2OHJaSE5DYkh4UWt5cXFC?=
 =?utf-8?B?ZnREUkQzM3BPTDdpb1RrSHlGdlZwWUtVQjV3VElTdVI3VFlNT2c1djFycVJy?=
 =?utf-8?B?eDNqTk9GNlUvYjFiZk9tWjR5VnRMMlljQ28yUjRYcW0yN0VRYlhBNGZxZDF1?=
 =?utf-8?B?dFkwZXBHVWFXdzZRRlZOQ3VhbzM1K3BhV3RQQ1JHQ25qMVFQWEhXdGNNOWFz?=
 =?utf-8?B?M0p3TGFTSEIwOWsxZHVLb1hVL3hCSnhIYVdUR1VNQUpoM2FHNHZZQWY3a3lv?=
 =?utf-8?B?c2g0dTBnVm02c3k5OVhnSnZYa3pkbncwOXBqK05lNmZzZVNMT0RmSU41V2o0?=
 =?utf-8?B?YXVEN1Rtd25FSHJWNkRaQzBkKzdkU3NkRy92cUt1enRBU2wrbFlYSWJ6L09R?=
 =?utf-8?B?YXVwakZjVUV5blU4MEtjWnhZVUxlZXRtMW9GS2NPV3NYMTVVODloM1M1WXcw?=
 =?utf-8?B?YTA0clRQRmVDV0FXWlYyTGJMeDdlNXVUTUlCL1VIU0JqcVZhSVMxL1RseW04?=
 =?utf-8?B?aUUxbU9rS0kwYjZxcG9adlc3aUk5V1ltRHhIOHpjSXJSOVNBM1FiWW1ma0xG?=
 =?utf-8?B?VUtBNmxLOHVRYm40NGxoM3QwM0ZEYW9KVnBHb3hmNzVILzJ5YnFjREp3UGo1?=
 =?utf-8?B?MFZlZ1VCY0tHL3dSSXB5OVRwWnZJRmRTQ3dadCtRWUhEcEY4enVZMVY0T2U1?=
 =?utf-8?B?dTdmZ2lsOFJLOVd3ZzBEaGdJRE0rS0VzK2s1QVBRZkZleFVjUnNmSVRKWlB1?=
 =?utf-8?B?N1dURTNmc0ZXSXhpVHY3VVB4MzhqTE5zSDVIc284VmdicDMxcEs2ekxPQWZF?=
 =?utf-8?B?NFZjYThUT3hSeWVPYXFrTGxsQzAwWUxTMzFOM3BTN2UxSE92cHlyWXhzY28v?=
 =?utf-8?B?cjdJVU5ZNEh1ekJnbHdzLy8rek04M25JMStFTHhrekNwSGgxcXp4WEdicmpV?=
 =?utf-8?B?UmdZRHlpRGY2YkszdzNMY25NdWpIbHRLS3lDREFCYUd6UkVteVNCZjBza1hx?=
 =?utf-8?B?TTZ0SDhCZVNZVXRhcW0ycDN6bnlNNnR2bHpPc1kxOGwvcngrcTIyenNjbGVD?=
 =?utf-8?B?amlDd2tGc3BMZHc2dWpqZ3duVTlzUktGbXdZR2VUd05NMFhVcjdJaFJidjYw?=
 =?utf-8?B?MVQwN2RPNkliNENMczl5d3B1MnNtd0lwbld2T1VYT1ZKdGR6UE9zRlZ5aHlL?=
 =?utf-8?B?S2ptYnl5Rm95UXpwWmFuc2NPZUYwNU5xZWpyYTQ0MGFEdzRMS04yY1ZXeFAv?=
 =?utf-8?B?Z2VTaVovbXRuQ3RMVEIvQVdSV0tKcmh4QzVRcys1bzNJaW0xSjZ0OHpYV1dR?=
 =?utf-8?B?UHN2SWxBWmV5WGNvYW1wbWxCaUdzTi8xcjFRL0grV3dINzJMUkVMSURyNFVZ?=
 =?utf-8?B?enZ2R0dTWUZ2VWpZR25INzdqUFNydTZoNnpxZVJMbnozQjNpeENkVzI3alRy?=
 =?utf-8?B?YnJrUkF4MnZHQmRiODNiNTRtemZmdjI4dzB0MzBrU3BBcm1nMUpGdGR2K2Nz?=
 =?utf-8?B?eEwyZHNaaTA4TDNVdXhZR05VbnlBSUp5SUlNSEVmYTlkSklmQW1BTW9BKzRu?=
 =?utf-8?B?TDV0R3lPNCtTbzNKTHlMc1JycWJTQktoa3lYa0ZmeVc3V3JCd05TRmhRRitY?=
 =?utf-8?B?TVMzTThFaFJocDdVVGFkVWxLSDE3UVhmRDA3S2ZEWVlIb0J0UzE1ZlR3MHpS?=
 =?utf-8?B?WkNsenRXbm1aU1E4TXFJMnhDc2ROZmRKK0hVWEpWMnRoRHhGaGxWeVBpRDN1?=
 =?utf-8?B?eGFKNnZkeWVQMENmYmNvSldMMzhsajEwbTROc1NwdzFhdWFmU0pUd3YrRksw?=
 =?utf-8?B?eDZSWmhCcWlXYXhQckk0b1NRWDhqcVBjdE5XZTVlYVpIbU0yRzBXN3VFMGUy?=
 =?utf-8?B?czVQK0EvYXEwV2hnZytIdlpsUjhmYVZINkdSQVowUGRCN2VzYkZYNW80emhW?=
 =?utf-8?B?Y1NaTDdsN2M2cENhZmt4RGhTWlhnSzI1MGVSYUFRYUU2RURlb0ovdE9lQk9G?=
 =?utf-8?B?djFObmE3ZUtlamZxNzdIR2ZlalFwTko5TWZvc1FHNFkxY1U2S3lzUVhka3Vx?=
 =?utf-8?Q?jKdr+GSjxE3uxH28=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1514b30c-cbfa-4ea1-8638-08da3ca3673a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 10:02:53.6977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6ALxcVabrDL4HPgrSY9zgrFzjyVmch9JEz+va+0zMeGikgUV8fvIBwsR7JYIJHyCXFIGXJCh8limhGRC+FiSkpuW9D3y1NSABklFeUhlp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB4077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030301_913119_DD6B9E86 
X-CRM114-Status: GOOD (  34.09  )
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
Content-Type: multipart/mixed; boundary="===============7666321797429628800=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7666321797429628800==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p9aZVt3SBxXkUtgTwXisyKNK"

--------------p9aZVt3SBxXkUtgTwXisyKNK
Content-Type: multipart/mixed; boundary="------------tiPSJ7gqHtm61SjYEmT76iKi";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Stuart Rubin <stuart.rubin@trustiphi.com>
Message-ID: <821b7140-abb0-17d2-4aab-07247a250e9c@sancloud.com>
Subject: Re: Sending vendor specific commands to spi-nor flash
References: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
 <418e465f5156adb340976bac209539f8@walle.cc>
In-Reply-To: <418e465f5156adb340976bac209539f8@walle.cc>

--------------tiPSJ7gqHtm61SjYEmT76iKi
Content-Type: multipart/mixed; boundary="------------VvH4BnxNJARAS18ZEBbKn16l"

--------------VvH4BnxNJARAS18ZEBbKn16l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMvMDUvMjAyMiAwOTozMSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gSGksDQo+IA0K
PiBBbSAyMDIyLTA1LTE4IDE0OjMyLCBzY2hyaWViIFBhdWwgQmFya2VyOg0KPj4gV2UncmUg
bG9va2luZyB0byBhZGQgc3VwcG9ydCBmb3Igc2VuZGluZyB2ZW5kb3Igc3BlY2lmaWMgY29t
bWFuZHMgdG8NCj4+IE1pY3JvbiBBdXRoZW50YSBmbGFzaCBkZXZpY2VzIG92ZXIgdGhlIFNQ
SSBidXMuDQo+IA0KPiBQbGVhc2UgZWxhYm9yYXRlIGEgYml0IG1vcmUgb24gdGhlIHVzZSBj
YXNlLiBJcyB0aGlzIHNvbWV0aGluZyBzcGVjaWZpYw0KPiB0byB0aGUgZmxhc2ggb3IgaXMg
aXQgbW9yZSBvZiBhIGdlbmVyYWwgZmVhdHVyZT8NCg0KVGhlIEF1dGhlbnRhIGZsYXNoIGRl
dmljZXMgc3VwcG9ydCB0d28gZ3JvdXBzIG9mIHZlbmRvci1zcGVjaWZpYyBjb21tYW5kczoN
Cg0KMSkgIkFkdmFuY2VkIFNlY3RvciBQcm90ZWN0aW9uIiBjb21tYW5kcywgY29tbW9uIHRv
IHNldmVyYWwgTWljcm9uIA0KcGFydHMuIFRoZXNlIGluY2x1ZGUgdm9sYXRpbGUgJiBub24t
dm9sYXRpbGUgbG9jayBiaXRzLCBwYXNzd29yZCANCnByb3RlY3Rpb24gYW5kIGEgZ2xvYmFs
IGZyZWV6ZSBiaXQuDQoNCjIpICJBdXRoZW50aWNhdGVkIENvcmUgUm9vdCBvZiBUcnVzdCBm
b3IgTWVhc3VyZW1lbnQgKEEtQ1JUTSkiIGNvbW1hbmRzLCANCnNwZWNpZmljIHRvIEF1dGhl
bnRhIGZsYXNoIGRldmljZXMuIFRoZXNlIGluY2x1ZGUgYXV0aGVudGljYXRlZCB3cml0ZSAN
Cm9wZXJhdGlvbnMgd2hlcmUgdGhlIGRhdGEgdG8gYmUgd3JpdHRlbiBtdXN0IGJlIHNpZ25l
ZCB3aXRoIGEgDQpjcnlwdG9ncmFwaGljIGtleSBhbmQgbWVhc3VyZW1lbnQgb3BlcmF0aW9u
cyB3aGljaCBhbGxvdyByZW1vdGUgDQphdHRlc3RhdGlvbiBvZiB0aGUgY29udGVudHMgb2Yg
dGhlIGZsYXNoLiBUaGVzZSBmZWF0dXJlcyBpbnRlcmFjdCB3aXRoIA0KdGhlIGNsb3VkLWJh
c2VkIEF1dGhlbnRhIEtleSBNYW5hZ2VtZW50IFNlcnZpY2UgKEtNUykgcHJvdmlkZWQgYnkg
TWljcm9uIA0KYW5kIHVzZXItY29udHJvbGxlZCBjcnlwdG9ncmFwaGljIGtleXMgY2FuIGFs
c28gYmUgc3VwcG9ydGVkIGZvciB0aGVzZSANCmRldmljZXMuDQoNClRvIG1ha2UgdXNlIG9m
IHRoZXNlIGZlYXR1cmVzIHZlbmRvci1zcGVjaWZpYyBjb21tYW5kcyBhcmUgc2VudCB0byB0
aGUgDQpmbGFzaCBkZXZpY2UuIFdlIGV4cGVjdCB0byBzZW5kIHRoZXNlIGNvbW1hbmRzIGR1
cmluZyB0aGUgYm9vdCBwcm9jZXNzIA0KYW5kIGR1cmluZyB0aGUgcHJvY2VzcyBvZiBzZWN1
cmVseSBkZXBsb3lpbmcgYSBuZXcgc29mdHdhcmUgaW1hZ2UgdG8gdGhlIA0KZmxhc2ggZGV2
aWNlLg0KDQpCcmllZiBpbmZvcm1hdGlvbiBvbiB0aGUgQXV0aGVudGEgZmVhdHVyZXMgaXMg
YXZhaWxhYmxlIGFzIGEgUERGIFsxXS4NCg0KWzFdOiANCmh0dHBzOi8vbWVkaWEtd3d3Lm1p
Y3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRh
LXNoZWV0L25vci1mbGFzaC9zZXJpYWwtbm9yL210MjVxL210MjVxX2FfY3J0bV9ycG1jX2Fk
ZGVuZHVtX3Jldl8xXzZfYnJpZWYucGRmIA0KDQoNCj4gDQo+PiBTaW5jZSB3ZSdyZSB1c2lu
ZyB0aGUNCj4+IE1URCBibG9jayBpbnRlcmZhY2UgdG8gc3VwcG9ydCBhIGZpbGVzeXN0ZW0g
b24gdGhlIFNQSSBmbGFzaCB3ZSBuZWVkDQo+PiB0byBzZW5kIHRoZXNlIHZlbmRvciBzcGVj
aWZpYyBjb21tYW5kcyB2aWEgc29tZSBzb3J0IG9mIElPQ1RMLg0KPj4NCj4+IEkgY2FuIHNl
ZSBhIGNvdXBsZSBvZiB3YXlzIHRvIGFjaGlldmUgdGhpcyAoYXMgZm9sbG93cykgYW5kIHdv
dWxkIGxpa2UNCj4+IHRvIGdldCBzb21lIGZlZWRiYWNrIGZyb20gdGhlIE1URCAmIHNwaS1u
b3IgbWFpbnRhaW5lcnMgb24gd2hpY2gNCj4+IGFwcHJvYWNoIGlzIHByZWZlcnJlZDoNCj4+
DQo+PiAxKSBBZGQgbmV3IElPQ1RMcyB0byB0aGUgbXRkY2hhciBkZXZpY2UgdG8gc3VwcG9y
dCB0aGVzZSB2ZW5kb3INCj4+IHNwZWNpZmljIG9wZXJhdGlvbnMuIEFuIGluaXRpYWwgc2V0
IG9mIHBhdGNoZXMgd2FzIHNlbnQgYmFjayBpbg0KPj4gT2N0b2JlciAyMDIxIHdoaWNoIHRv
b2sgdGhpcyByb3V0ZSBbMV0sIGJ1dCBubyBmdXJ0aGVyIHByb2dyZXNzIHdhcw0KPj4gbWFk
ZS4gVGhlIG5ldyBJT0NUTHMgd291bGQgZXhpc3QgZm9yIGFsbCBtdGRjaGFyIGRldmljZXMg
KHJlZ2FyZGxlc3MNCj4+IG9mIHZlbmRvcikgaWYgd2UgZ28gdGhpcyByb3V0ZSBhbmQgd2Un
ZCBuZWVkIHRvIGVuc3VyZSAtRUlOVkFMIG9yDQo+PiAtRU5PVFNVUFAgaXMgcmV0dXJuZWQg
YXMgYXBwcm9wcmlhdGUgaWYgdGhlc2UgSU9DVExzIGFyZSBjYWxsZWQgb24gYQ0KPj4gZGV2
aWNlIHdoaWNoIGRvZXMgbm90IGltcGxlbWVudCB0aGVtLg0KPj4NCj4+IDIpIEFkZCBhIHZl
bmRvci1zcGVjaWZpYyBJT0NUTCBsYXllciB0byB0aGUgbXRkY2hhciBkZXZpY2UgaW50ZXJm
YWNlLg0KPj4gV2hlbiB0aGUgbXRkY2hhciBJT0NUTCBoYW5kbGVyIGlzIGNhbGxlZCB3aXRo
IGEgY29tbWFuZCBub3QgZGVmaW5lZCBpbg0KPj4gbXRkY2hhci5jLCBwYXNzIHRoZSBjYWxs
IG9uIHRvIGEgZGV2aWNlLXNwZWNpZmljIElPQ1RMIGhhbmRsZXIgd2hpY2gNCj4+IGNhbiBw
b3RlbnRpYWxseSBoYW5kbGUgdmVuZG9yIHNwZWNpZmljIGNvbW1hbmRzLg0KPj4NCj4+IDMp
IEFkZCBhIGdlbmVyaWMgU1BJIHRyYW5zZmVyIElPQ1RMIGZvciBzcGktbm9yIE1URCBkZXZp
Y2VzLiBUaGlzDQo+PiB3b3VsZCBhdm9pZCB0aGUgbmVlZCB0byBkZWZpbmUgSU9DVExzIGZv
ciBldmVyeSB2ZW5kb3Igc3BlY2lmaWMNCj4+IGNvbW1hbmQgc3VwcG9ydGVkIGJ5IFNQSSBm
bGFzaCBkZXZpY2VzLiBJbnN0ZWFkLCBrbm93bGVkZ2Ugb2YgdGhlDQo+PiB2ZW5kb3Igc3Bl
Y2lmaWMgY29tbWFuZHMgd291bGQgYmUga2VwdCBpbiB1c2Vyc3BhY2UgYW5kIHRoZSBrZXJu
ZWwNCj4+IHdvdWxkIHNpbXBseSBwcm92aWRlIGFuIEFQSSBmb3Igc2VuZGluZyAmIHJlY2Vp
dmluZyBhcmJpdHJhcnkgYnl0ZXMNCj4+IG92ZXIgdGhlIFNQSSBidXMuIFRoaXMgaXMgc2lt
aWxhciB0byB0aGUgTU1DX0lPQ19DTUQgSU9DVEwgc3VwcG9ydGVkDQo+PiBieSB0aGUgTU1D
IGRyaXZlci4NCj4+DQo+PiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIGZvciBvcHRpb24gKDMp
IHNpbmNlIGl0IG1pbmltaXplcyB0aGUgc2NvcGUgb2YNCj4+IHRoZSBjaGFuZ2VzIHdlIG5l
ZWQgdG8gbWFrZSBpbiB0aGUga2VybmVsLiBXZSdyZSBub3QgdGllZCB0byB0aGlzDQo+PiB0
aG91Z2gsIHNvIGxldCB1cyBrbm93IGlmIGEgZGlmZmVyZW50IG9wdGlvbiBpcyBwcmVmZXJy
ZWQuDQo+IA0KPiBJJ20gbm90IHN1cmUgd2Ugc2hvdWxkIGFsbG93IGEgZ2VuZXJpYyAiaXNz
dWUgYW55dGhpbmcgdG8gdGhlIHNwaQ0KPiBmbGFzaCIuIEl0IGl0IGlzIGp1c3QgYSBvbmUg
dGltZSB0aGluZywgbGlrZSBmb3IgZXhhbXBsZSwgcHJvZ3JhbQ0KPiBhIHBhc3N3b3JkIGR1
cmluZyBwcm9kdWN0aW9uLCBvciBwcm9ncmFtIG5vbi12b2xhdGlsZSBtZW1vcnkgZHVyaW5n
DQo+IHByb2R1Y3Rpb24gb2YgdGhlIGJvYXJkLCBJJ20gZmluZSB3aXRoIGl0LiBNb3N0IHBy
b2JhYmx5LCBjYWxsaW5nDQo+IHRoYXQgaW9jdGwgd2lsbCBhbHNvIGNhbGwgYWRkX3RhaW50
KCkuIFRoaXMgd2lsbCBhbHNvIG5lZWQgdG8gZ28NCj4gd2l0aCBwcm9wZXIgdXNlcnNwYWNl
IHV0aWwgc3VwcG9ydC4NCj4gDQo+IEJ1dCBpZiBpdCBpcyBzb21ldGhpbmcgZm9yIGdlbmVy
YWwgdXNlLCBwbGVhc2UgcHJvdmlkZSBhIHByb3BlciBBUEkNCj4gYW5kIGRvbid0IHdyaXRl
IHVzZXJzcGFjZSBkcml2ZXJzLg0KDQpJJ3ZlIGJlZW4gbG9va2luZyBhdCBob3cgdGhlIGVN
TUMvU0QgYW5kIE5WTWUgZHJpdmVycyBzdXBwb3J0IHBhc3NpbmcgDQp0aHJvdWdoIHZlbmRv
ciBzcGVjaWZpYyBjb21tYW5kcyB1c2luZyBNTUNfSU9DX0NNRCBmb3IgZU1NQy9TRCBhbmQg
DQpOVk1FX0lPQ1RMX0FETUlOX0NNRC9OVk1FX0lPQ1RMX0lPX0NNRCBmb3IgTlZNZS4gTmVp
dGhlciBvZiB0aGVzZSBpb2N0bCANCmhhbmRsZXJzIGFwcGVhciB0byBjYWxsIGFkZF90YWlu
dCgpLg0KDQpGb3IgQS1DUlRNIG9wZXJhdGlvbnMsIGluIG91ciBjdXJyZW50IHVzZSBjYXNl
IHRoZSBjb21tYW5kIGJ5dGVzIHRvIGJlIA0Kc2VudCBvdmVyIHRoZSBTUEkgYnVzIHRvIHRo
ZSBmbGFzaCBkZXZpY2UgYXJlIHNlbnQgZnJvbSBhIGNsb3VkLWJhc2VkIA0Kc2VydmljZSB0
byBhIHVzZXJzcGFjZSBhZ2VudCBvbiB0aGUgZGV2aWNlLiBUaGUgYWdlbnQgc2ltcGx5IG5l
ZWRzIGEgd2F5IA0KdG8gcGFzcyB0aGVzZSBjb21tYW5kIGJ5dGVzIG92ZXIgdGhlIFNQSSBi
dXMgdG8gdGhlIGRldmljZSBhbmQgcmV0cmlldmUgDQp0aGUgc2VxdWVuY2Ugb2YgcmVzcG9u
c2UgYnl0ZXMgdG8gc2VuZCBiYWNrIHRvIHRoZSBjbG91ZC1iYXNlZCBzZXJ2aWNlLiANCkZv
ciB0aGlzIHdlIGNvdWxkIHVzZSBlaXRoZXIgYSBnZW5lcmljIFNQSSB0cmFuc2ZlciBJT0NU
TCBvciBhIE1pY3JvbiANCnNwZWNpZmljIEEtQ1JUTSBjb21tYW5kIElPQ1RMLg0KDQpGb3Ig
dGhlIEFkdmFuY2VkIFNlY3RvciBQcm90ZWN0aW9uIGNvbW1hbmRzIHdlIGNhbiBhZGQgSU9D
VExzIGZvciBlYWNoIA0KY29tbWFuZCBpZiB0aGF0J3MgdGhlIHByZWZlcnJlZCBhcHByb2Fj
aC4gVGhlIGNvbW1hbmQgbGlzdCBjYW4gYmUgc2VlbiANCm9uIHBhZ2UgMzUgb2YgdGhlIGRh
dGFzaGVldCBmb3IgdGhlIE1UMjVRTDAyR0NCQiBzcGktbm9yIGZsYXNoIGRldmljZSANClsy
XSBhbmQgb24gb3RoZXIgTWljcm9uIGZsYXNoIGRldmljZSBkYXRhc2hlZXRzLg0KDQpbMl06
IA0KaHR0cHM6Ly9tZWRpYS13d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwv
ZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbm9yLWZsYXNoL3NlcmlhbC1ub3IvbXQy
NXEvZGllLXJldi1iL210MjVxX3Fsa3RfbF8wMmdfY2JiXzAucGRmDQoNCldlJ3JlIGhhcHB5
IHRvIGxvb2sgYXQgZXh0ZW5kaW5nIGxpYm10ZCBhbmQvb3IgbXRkLXV0aWxzIHRvIHdyYXAg
YW55IA0KSU9DVExzIGFkZGVkIHRvIHRoZSBkcml2ZXJzLiBXb3VsZCB0aGF0IHByb3ZpZGUg
dGhlIHByb3BlciBBUEkgeW91J3JlIA0KbG9va2luZyBmb3I/DQoNClRoYW5rcywNCg0KLS0g
DQpQYXVsIEJhcmtlcg0KUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyDQpTYW5DbG91ZCBM
dGQNCg0KZTogcGF1bC5iYXJrZXJAc2FuY2xvdWQuY29tDQp3OiBodHRwczovL3NhbmNsb3Vk
LmNvbS8NCg==
--------------VvH4BnxNJARAS18ZEBbKn16l
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGCyYogBEADoyTDRt8FP0wNMj4uFpD1PhFmg3Bk6fphfTBXte9YRwP3q+XMD
bAZuEHLxCIseSKPHFPmnt09mSm5QUV6YBnicqpCGtsYl/vvjoQc090aybJKB4G9g
dRxXuTXw2eRCItNDnr7+TPlC/fHC+tRmrlOEkAo2X2cWKPQgV8U4wjp2xjudGg8B
2mlq+0gUbQoPYXQ3wBeycGG+9BFF6DsRQF+mk82CBMDFU/7/bW0zkH1sM+dZRUo0
q8uhNSrszXWqrSho+ASWAmJPBd4OCBIsb4HdKnIQ70JWQJc9Alv6PbVmBgR/hy1P
zEnXTbZww+hjoFhZyjnqebvYRt2JRVVeH99Ah85K+hiDt4cVZe+JbAuKf3nOjpeM
BWNZTIpZ9fOQ0v+7AsU8tNKEOxhgqYg3Bjc0s1Uyz1/swBUCMX5QtDYwu8aCajFT
NyqXmPqMfyyiE9xi2U/YI1nU2ZAQnBHkki6JvsVf4BJpacLpcFdPSPYvKQRoPpUg
wM/PuMbXP74ynyZ0fmoi+1i3GGzgNhCh+3Xeh581KAPaAKrRDCv11UkyRK28412C
81C9aGxb5JFvlbAO0dkQH+l/HV+Y4mDUIDkz8U3NgiB2X03vKTkqUVBzzN2eBp2Q
Qs6KBNoaU/0j1+O8Ch05ZzwipNGHME/QetccgqIdwX59PtIJTu+Y55eZ5wARAQAB
zSZQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXJAc2FuY2xvdWQuY29tPsLBlAQTAQgA
PhYhBNLd/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmXIAhsBBQkDwmcABQsJCAcCBhUK
CQgLAgQWAgMBAh4BAheAAAoJEKZyVd/M5i7NUtIQAJuhVQHLOchPYGop2NmHTdV+
xpEb40+UagAohD03CUtSvWoJ6Wk+Q3awJxDOD4k4fpwphsEjmyJJxpHtS3WWHP9J
yXGERdIJM4N2l0Dz7C6MwMhaQSMmccwQnBmSBYUCdFgjfB9j9ftMTxYyIXtTnZ+p
3WUG1ulwdgughhZMK06AMM+d+throF37DoLK0EMd+TxuHy9L8T9Lg/zNY6Tn32EH
z0Tv1u7dXw4f0Jgy4uD/JCavJVc/dqKub8JpVuabyzf4m19doByE9Wnaa0I7iJUb
U6m9LVA6q/1V9GJt2AIKu/3YoBlqEEA6O+4MHGnrnMOq6QiWPygTWR0Xl204Scej
x5JSNoKeoF2UjgDUoi++g4QBxWiY5F6gPK1tKeCeNmgPjyDKgEbuN3Wqbk+FaZWh
kR6b6sfTGYMOAVeFACAwbhnaSBmnViVnvSvIYiLcC0akjL7N1vrhYzg21pqCPa0z
lgWJ+G+3QMAd0j4Gsc0TW3u33vs7q4thisQtCk6w8HF3NziVVsRHcSKvSWWx+fq9
QyyvDgt2fr4snHARYxTCigWAYs4x92zSaNxlr98Rqq6YOaOD+tQkv6DR4r6xYUfD
uSlEySFsPvLT4fmGtZZEMNGM+6jyxQM5RV3Ry/u1kMJxEFyKQ3SPpaPAlKzWtT8u
gKkg+n/8z/yrm3RuWGdmwsFzBBABCAAdFiEEmLKqwQCsP4K7XVRndJdcgbfma6wF
AmDkq40ACgkQdJdcgbfma6xH9BAAqqapUlz92HNy4iOjy/V+9baFexzJSms9ukG4
zkv9Ba0bO1CFtwh8xi8D4Z6tZwKZH2IbyWmId0lklZwaPP3MSqA19SsV+Np/8Iux
3OKfLz/PoaxQC6+MQzbnUOsFhKi2tcOmkeJ/Mls07o3qafye8TQOqjSlkderTBab
DSQdF+Y1L/kx1bQZnK7B7Vlhaq6W6EGLsBd0YtDMBR9JWauhAPxluyBMz05QVqEF
G4h2q8x6b4RmcX8VqIfIQCuTuPEjdQk7I2n9c6CPGujWiTofo5bZ4kfMfZpuMv1e
vjLYehw5zXWbH3XfC7E9aNSmUGIFoHjWLSGvBgdLZ38dXEKaqueOVCcU+2eESRPf
k6L56MKqHcep7tOJgjJPCrhqhZQf8Px3MR+MIEQUd/oMy4SvU839DfcVF9HWHDL2
LTgltvr+bqe/n/Tc9jhHZAQR+v8oPpyS5qrO/C1ED25DsoDi2eZ+RTosEca5Essf
gpKbK6EOO7GGAnF0hy9V8KQyiPIQ1YnMwI+gwSqMbfhVmBAd3vuj9s9ghHpHFDoX
QY4a0Wo8ZAjmrPkx1H5cUF5OGsH34U7NkHl55on9zjxNtHXnQB7Wo/o4x7vX2Wyc
NNzTSREeLVpx3XWdiGHODayH+bKFy5jiw9YEmfYY9UgdqdTQ/fy4nQAsIQfNmt25
oFwrppvNHlBhdWwgQmFya2VyIDxwYXVsQHBiYXJrZXIuZGV2PsLBlwQTAQgAQQIb
AQUJA8JnAAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBNLd/a4wAXr0y2KqlqZy
Vd/M5i7NBQJgsmXqAhkBAAoJEKZyVd/M5i7NEeQP/RoRN85DRcoud66oIwiugsEv
8JFaKucsiI+4bM2NEkW583a1mwkHb27AILS+XEK+WRZ4m/krdwRhWx/7cAUrvIyf
YqqBZMHyXs+k5S/iZR6+Y1yzOWlDVDZGjCikBld0TOwo6fmO3XyksnFvgH2XDnwH
nnH3h7lYuEgIJ+lSA6bB2zQ6uqkaW5wjB3ekn0eiB0iPWU8suNjeiUo9NrY1V7H/
V57YTNPAQK8Oky2t7oACVwJGlS4+l2cxutsWVuyos2d/l/0ePeHdj7kvr3xU8jMd
McD5G6RL6Kj7c46Q0qjqqeBoSRZX7oJx0zTjyAFDsBOrnV5c4KkVN3FQ9BlA5XfA
FQTqfSiYIItMi/OCC0IyMDR/iZpHRjFKWVVozcfWkPTMaJJHIocxp7WsoV4KqvI9
DG2HYxrnBm1Txrour5E8bYQnuX8ZUeEU5SHSkOuI1z0hYfXDMjKMTZ5/9TA4LAS7
7ZzEx27wZFZciNx4blAh84YkStssra4UDQVkGPkv8+etkrPMiai7Y657isg4vXne
fQs/3fvX3sT6lUp6ttXSWJ+LtKGXaG0GEeRTfj1xJiEfLwqT34GUkfoAdectW0R2
+MClmHY06QnPM26nMzYkhL1GDDUpGCGwBQwW0SJXH0lJT566RrfZ0xtD01UNsqGp
zVQyVeKF0hFACsz3MOs7wsF2BDABCAAgFiEE0t39rjABevTLYqqWpnJV38zmLs0F
AmC74VMCHSAACgkQpnJV38zmLs213hAA49GhQzh23+V5T08h8FacC4qkdtcSi44e
TAeGcch1B/8j03UJFt9fHZqdJfmQGscKDSV1/2IqYOQ1j1jPjAYFhtrf68qXNbQn
01rR9+E1LV243uizAHDUSC3/exkxfx5FKNDPoJnfxPn/EEjyDFMC3QBueJfy+0ZM
U+Mq82syI4QFc1AYUMQt2Fh11X4MmbbHQYzLzwpT0p3w3vUd+g//iLW6WwEBvbV1
JQTq9ZtYqoCVZ5umlAhRi4X5T/cp3XQRzOYr+RzNCHmJS48WP9/Nr6AzjHpcpZZZ
luhIfym7aLYOuL/dPoz2uAWtuhAOmQZcnF409Wsi+WOYCA3cSTzbLJZnB3KMV+oy
neH1vBO36KYQNvBPOsh/KoKPlEjrnxRuYz+XLBPT7S6wIe7G3C2Hkt66Qt/UUSBa
np21RThJFKj3kSKvFkr96g92E4uEjKSrwMWvnyo4bNPtvy6ShFN1mQcfghsCrk8W
uwEFAa8XdLkya+ClaV9iqZZn+k9OoRfvvfhUKyDnR/HOpw4SECTsHkGuU5yhkUhh
RCia9fY84Gd6yH4qgjPiavr9wGkMgXgVKqUvNy2yfXVyc07aKaXlBxi9yfhnxsDX
caR6DWQZCs8ufKEjTwWInoW+v17hHu64bKNqfh+his8GVYpDgKqtBvlX3/g6coOl
G+cuSzm3q2TNGHBhdWwuYmFya2VyQHNhbmNsb3VkLmNvbcLBdgQwAQgAIBYhBNLd
/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmW5Ah0gAAoJEKZyVd/M5i7NmN0P/24XTQ9k
CREqlFDZ/ZID1olgYGdcr5QdfLa3o7s+h1uYp+mTpnbXbE0zmjdftE4F7afQsgDQ
zqJSfvRjjqAk/SkvyvA6rAOudWcGXVfoPOslqnJAXUgCmUHbbkDT2gO3hAXdj2Ro
+CR1xyyX9GLVg6XlxW+uw6wWAQK8MMfQqmDEDWBZd4z9YQ6RRXsWbcxYPBICq1+M
6WxYWErfqzZ7TmlTihpgQdrBZ6dPpU9oz5T3mr0TC8q0zUj5xwO360PamqFtP6uh
E/TGZNvJoBnOpBVZHDWZiOcIPOmQKGph0MGyIEZXxSlOWkYbnOcqHjagFC2QU7+e
ITnTfdZi5Es9fmhRNatb/URnir4nemxDNk9gkaOKBjRoCVFrhGj/XoJoQ2xljTLf
G9D3+KlxuR49BkRVw05T7SdVpxuFsiN7Onnx4zX4HPFhBvfbqmxmaERjtQKE+D7c
7spqXUcEdyFTY7S5UyVZMEwvfL+0qD5uU3XJwjhozsgaalGq+PBXPnukpp7sw8UA
owxmMp2LKqTejZpZ0kJ0/qd78dPfxMyjanmuQfqCBOVfK/3HWHDQT3VETMCikd6c
sBur1mWBsX7Cm54iMBzQhN18AcYFXqP1wyX7HYLMAkkNJbbCUfEQr++Gjbz18XI4
xSCZ2OMjdWdT+xBAXyZc111acRal4II6NhVSwsGUBBMBCAA+FiEE0t39rjABevTL
YqqWpnJV38zmLs0FAmCyZX8CGwEFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
F4AACgkQpnJV38zmLs0K+hAAxAeKJDFxA64ab0KPf0uOUX5/sim/uOq/TRuSdLZU
IsUOGCloY00rNy1uhO54M0wsTyOplocja2FwVvMMurd0/FL9x2vdo56i6NWxRAWd
MYnT4DcrA0wV0IKbosx6qHpv38XdROMH7ooYWUxdly2f6wcGAFe4Ws6Eea80I4J2
d00oZt+/rIpFH+ne+0Ofzvb7+KFU3oXYpzfr9XRMtcruKRrKwi0+4RfC5olcKRMW
ikLt5gLbt8HCu1eEaeMCbRX/VIyPkXn7CPzqpCeGqRxtcUDq05AkaqtauUqvfFmi
ve1YU2MKBMftE1WyvSUyGEn8ViR3Ylr1JNudd7MoywfjE9t456a8c87oIlkclULQ
YyMxykIs9kijqdSg38gSXwjJBvmnZVCb1tcJ3LEotMovf0vFHne8XBWn9eek4s7E
dgx3ekFtljbpwuBfuXfdCUHAsvT1DWSMR/gNTH+WWK5pdm4ozP45WAhopxyWQJee
oj3KCwHXDDDRsEaMRbFUFw7IWQcfKaE69WP92BaS4zNC1mM39eVfJ4Nk2U+AOmWW
e31BHSJ8BnlDAye+IrLRD+014ev4KqatTyF1eBREXbdAI4SwHdQoBI0nxWryjCBQ
MoCtkMayz8/GbHHlE1VZfndXzh+zEC7r3Q80yWum+jGJiXC6uFxThqIlZgrEejtQ
e+XOOARgsmYxEgorBgEEAZdVAQUBAQdAIGR9ZNGucO3EnJvvM3s/QA5SbyTuL8O2
kA65Ib1BREcDAQgHwsF2BBgBCAAgFiEE0t39rjABevTLYqqWpnJV38zmLs0FAmCy
ZjECGwwACgkQpnJV38zmLs0aUxAAkXWG78kNhHWqze8DNAvsizC5HRKW25HO3CgR
oivPCInrs3hsQDDbL3+p5DZKPg5ZxSyhuKVNxMNvPF6/ct1gLVYlJ7+IYWr3pshr
4ge0k8RqMfm+sG5ZLtoUxHc5qa58jozlbwCJbqZ+zeXjZSXpH4DENaXrLf0+m4g3
YPDyWoRNlzZ0MQaRB1XvHOb7xd2iq3NNdKYUmbrIqkumAaXzqsh15OBbevojlXdf
xJhl0xSqbjJdHoOQWzFQT7fXUs7uzyuIOvrCbDGdtow2S4RevXlWq6hf00w8ptjJ
wUfbs2NzVo6MNTLHlLvtQkWV8ZFyDBsg7xKGaffdH1Pco1cHnRB1t8Z37hEf2S31
8IytaiQa/V+TfuajfPOwKeoevTSekd9Gp5j6t4nLXWEG0qhtnbz+NPjjc6b6hlXb
/xG5Yo4KI/vwe4kVUOR3l5/XlvukpDN+OqlRD+S2FNUvjFPnyPisXDsJik2mWfNx
+k1cKWjcJHSaUp3d6eUlfIT36TKixgSx0MgW3rEgoZHBB3txNeAKRfc9liZkW+qO
GQ8e3Cznwy6p081kVR92lKmsCtOIsHyC/O/EXYKVVR+AHPXhwl2jhiirzMXnTcze
tP6O9tJcYNQZ4maJR+ElR7ZSz7JEZ6RyiE8GBwdXLVOTcworwEvXTtrvMW7yEQrC
hQEIrdTOMwRgsmZGFgkrBgEEAdpHDwEBB0DFtU+bJPyTiZBFzc1HNtuozkmNELiq
N9Yx1/REkKN0SMLB7QQYAQgAIBYhBNLd/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmZG
AhsCAIEJEKZyVd/M5i7NdiAEGRYIAB0WIQS7m7rT1+CktY3YG1PYN3IfEvob6gUC
YLJmRgAKCRDYN3IfEvob6sRwAQCrSFuC8N/mdyYob/G+Dqf4oymdJ6eBUuDPLGpP
LssnSQD/WvcInL0evKb7NK71sJESll9WvCWqztOjqkqh6PF16A423Q/+IX0y7UoI
/5YgYA2OVB6QPMCPvPAbHLJCqA0bqS74FuC+WnKaA25m2ykO/uoTVj3R3ACq3XpM
C01UUvCLqzDn+mt//gGZ+Pt8rNHkw11AQH8UmdEjzmzg+QelJNtD6hGwwUwWwtOV
hvRDEY81ibTtyEkUnGeflFr5dLFEx48iAU3P5Gm28/vDYbq1VZqhY/FPnxz8qYjz
cVdQ/mkhu1RKuU98DY0s00v0d347MGzFyrwwmuz0M9OnXyQ8sprADns4ZCVAAJE0
EJXIsGRWSyctMEaehM+TPOSCFo7ErxKNZ7/rpgWb8Pv/tJbniWW7LhcXmj7+GIhm
mMI3nVWziiLfjzFDTYbVyTlx4NQpHxy9MGWp6yKO1hCDNLBOHj+s6lMN/y2uL6l3
OujVYroBJn7bvLgdE06CFZAa8J+s0nOOg466zTCtgiQeLR6V16RzqmrHuzvWNODn
mEMNU0BcIl9vwPAr/43qyYVrFjxk1yOdexO+s+1SxAI0L13SD9AMhSdJhniwN8i7
AuICpuOW1ZsuerDwCP7f9U1t5Lt5cKeplTmgDd8Gv3SNNg0KECvW/P0b5YDBa0gk
FEt2KaMtlRVdKF7FEZw0Ou9aB6LkL5Z90NWdlCzfyWDUFOnFCz/gVHOcGlT4PUjz
4yvD5AdHy8s8HYtBP5oowjSllz6aOtP0BiQ=3D
=3Duult
-----END PGP PUBLIC KEY BLOCK-----

--------------VvH4BnxNJARAS18ZEBbKn16l--

--------------tiPSJ7gqHtm61SjYEmT76iKi--

--------------p9aZVt3SBxXkUtgTwXisyKNK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYotbywUDAAAAAAAKCRDYN3IfEvob6tO5
AP9EUGCv0I8OEdA5w5+3PT58Wu5LHqlc8UUAroFQo3o1OgD+MPn9i6Je7w7P7gTbv1Vs01LLYOk/
IEiJtBx3abOCTQE=
=a8k+
-----END PGP SIGNATURE-----

--------------p9aZVt3SBxXkUtgTwXisyKNK--


--===============7666321797429628800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7666321797429628800==--

