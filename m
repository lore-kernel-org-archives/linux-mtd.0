Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32644C77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWTCwVXKiN/5hgjwi9L5k9bpPnmtK1C02eSJEc2loXI=; b=yHlAasNBEmq6MfiP9688FIGhZ8
	KxJzajs82sd3Ma1+oo8i7e8N7qhEVSY3TQddUvUNdxcimsGyo62fICYiya8ob9+K4FK9b6ZkxqXlg
	CtveRaIIQ28quCMgSfFpJ7SACQO8rCGv2sdzy5skZX4xNAn05wxHuiJio/TKYrla7+BVuh7BXw6ZZ
	Z3ddsmPttVWRmVRzmx//lg9H4Cqm46GFLZIOe5S+0BGFbaoq9mAUNgNG8AG9UK93SVrTRyercwvZz
	SuPwjhrqY1Sh5FNZxclk//pefvZQvVCfSBK+4k5nE0qOe4BzbTwXmFTBgvd49oCDhWyJ22C3vciAm
	H8i/6rUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmb5a-003Qfa-2I;
	Wed, 12 Apr 2023 14:04:46 +0000
Received: from mail-psaapc01on20700.outbound.protection.outlook.com ([2a01:111:f400:feae::700] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmb5X-003QeU-2N;
	Wed, 12 Apr 2023 14:04:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyNOTUaheUaWkGUz3S7hBzIu9GUgMx6kMHfOtO5ltbYGS/9/MATHoRQa03/6v3XpPaxzUlP0CyyLEl+BasPmtmrhHDUa3C2t7vbjToG73rHuZWSRf7LgCHc9U8iTTVsI4MU0dVtoZrmniNUx9sKldG2ugDOhgqazpgESDV33k0+QNpBX66TJCG5AhCEvpsk573vTMDXfu94FjlgAWxZMKwaXzrT3WLD5nda3G5dUoKmIS9HDK/vS6+uDRXqQcBgdYLtomlHx4/Y9Jw/ZhCqZrRXDEHv5Lr5y28SWRsQxVNw5nak09XFcNRrUYuULatg31RN0n5aVtjHBjZZ7gX6FeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6r2HEJq0gzHwdiOCgT31WaPPnlwIsGzUzzGdV5Vu8U=;
 b=GCm6SHxRFm1fIPrpoD0Plo/x6qdl7Y0vIxBHgkg00oFmk66eLCCEFJ6yc/xqWtnBCU/Ahxvl4EikKlTg5LpD4icwsPUO7L06Fh6YYKBZUVRKsm92g7PUeMW3EISz0bO+OdeM8DhdAeG+llbgDrcALW3+4Sslic976PwMAoqy0++++9kbhO23SYLkd2oEf9QpWQ8MF3Ikpaj2iMOMYjcWvQ2BXL9QJ+0gxgpZBG9cLYuodhWSNTQi9G87PIgGm75hfZHSTgTedgyIAwTmbZc5N9qViWl/NtYhXD6glEdJP0HDb8PztQPASP854AVap7I5CVdmslZtwEZ7J/H0oDX8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by SI2PR03MB5942.apcprd03.prod.outlook.com (2603:1096:4:146::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.41; Wed, 12 Apr
 2023 14:04:36 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 14:04:36 +0000
Message-ID: <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
Date: Wed, 12 Apr 2023 22:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230412145715.58c2be4a@xps-13>
X-ClientProxiedBy: TY2PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:404:a::24) To PS1PR03MB5034.apcprd03.prod.outlook.com
 (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|SI2PR03MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d6b345-60e9-4f19-0fb4-08db3b5ed8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rXWTrw8Xx8FQ8lRz8uo0OsmgZiCvReFiQxtNVZbDsh/dU1y27Pz/1m+WyM/39tzxnz1IEZHf0zGxrGkRAOqyRmADxxCQ825m9C6xaVVWaAfHFYQv/7IXbPjRBSjdC234yAx8wJ2ZIkiHu8OBwbpuT9L7IgD9BNEBP30XicmIMM5EalP6MwqqE06jMHIVsjiXW3it0/u69Nihm9sZjUjkX/1f8w9wnV2306qZTd+nnDfbHw0w2dXS9D0vOtxUDyAfdBYgt8M8tj05N2RBRsSlx56pn/I2KQcuMWC6gAYq/1eV8dG+H2QCuvWvk863mVFSBsYfoKm5sNvmjsTGYW73shW71lldUEemTzuSOjeQpVqHiiRQjIKt+7Hwo2llnKGqX1Huk2IB7TDC/d9WTeGbaxBCQAHK/Oo2X1jTlOz3zMZ6T1hHGbUrhqn46EClngBiX9WEhASr6D7Gm586RLlYjvWV6xpKUDiYRHLK+dUhe+1OioCI4gt4TBPxXR88tJt5jpuj7Gfgk1dcxZVzOOwngpYcgZHI4pAxK4wblBvV43OyoIb9VO5qnZq0enIhaXIgWTi9lpKN8XmTJF5wg/cYzZ/Jrm8ARjss+mZ2pxy/20awGtLnjvU7eOQ2zXpQQs9awCaP8+9QTn6FP8o0WBiaCEGkX74bf2Bwm1xnGkFvvktGSTLpY4JbbAne5lYFmR8dN4OLav5wQRRqqdEpwXmI2FAMtOVGlnyvrwTsknCcw9c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39850400004)(366004)(346002)(451199021)(2616005)(66574015)(83380400001)(478600001)(52116002)(6486002)(6666004)(316002)(110136005)(54906003)(26005)(186003)(53546011)(6512007)(6506007)(44832011)(7416002)(2906002)(36756003)(5660300002)(38350700002)(38100700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MWVrSUZENjdKd2E3aDA0dXFkZC9WcWsycHJObm9tL0xQVW9TS3o5SDhtcUs0?=
 =?utf-8?B?OTdPc1RxWkJKVDlUc1EveFQrSkI5WVhtRGpscy96TGQrRkJobk9CVDNIQ01r?=
 =?utf-8?B?RkxzYzBZelhPTUYvTStLeTJ2WmZrV0pFVjhJWktZZkM5S01aanJ1NEg1Smln?=
 =?utf-8?B?NXVVS0NCRkpmd1VNcWFYUEFaWCtVTzRYZm4rRVlmZ3crTE5aYUczYkxxMmF3?=
 =?utf-8?B?cVZKUThOWG9STzFKVEFuczhmUkNaWDZITjFXVThPVlVNOXVaZUEzR1lxVlBu?=
 =?utf-8?B?TU1PeUFnelNTRHZMYUNBNlhtMmp5U2N6bE0xaGI5bS84REkxRDZDSUEzKzlI?=
 =?utf-8?B?YmNiOWdNcitxUU52WUpmQTR3ZExaSzNwdytKTkpyRGFnNlpycFlPVlQ0QkUw?=
 =?utf-8?B?RzhjRWJQSFBXZVJ2SFlLMmgrdzRXbDBZbVYvaDl4NXRmMGFVNGVMUGVCdytW?=
 =?utf-8?B?N3lxbE5XZ1Z3a1hPUFVOem1pdHRxK0hCUyswejNDVWR3aFgraWVPWFY5T0hR?=
 =?utf-8?B?SDduU3JsQXVKdXZ6Y2F2VVg1ZEFnVnVvWnBjekhieTFKOXh1aTM5WVJXUWhm?=
 =?utf-8?B?U1NGbENsZktxUHlweUw0dU9HOU8wdEJ1VURySU9ESTRVTzk1bFFyNFJhMGNB?=
 =?utf-8?B?S1lwZ3lkaERVOXRWcDk3eUhPNlhodjJvN3pWSzQxS3BybG93TVNETjFWb0ZY?=
 =?utf-8?B?bnlzNSs0TUZsVnh5Y0VCSVdiN0dveVlsdXJxcUtBUmVzVmNxU2ZjbCt3MS92?=
 =?utf-8?B?dWlZTk4xOStRVGVNaTdwTnFtZlFYa1N1RUdlbTZMcXRYZU42bVhuU1Zqb3NN?=
 =?utf-8?B?QTdyNVlVZkhnTktFVUNBeXBsQi8vVVMyQWpyLzU5YkJWQUVXR0hYUjFnaFI5?=
 =?utf-8?B?MjQvN2o0RnQ5Vm5qZnJwMitsTzlYakFIL2pDc2RQNXhlVnFKMkFRVWxSaFpI?=
 =?utf-8?B?VkhrelEvVldwRUJtbFZ2Wnh0YmlVTU4xMUV5WW93NVZ3MVFYaDlmeWFyOUFP?=
 =?utf-8?B?RCtIY0F5YkFxM2V3L0I0L3NLVW1jMDBaZmVTOVJXSmxRR1U4dkhqdGREekFN?=
 =?utf-8?B?aDh1RW1vN2FTQnF1MWE2NXhxMXBiUUN1Uy9aeW91ck5xbURIWlEvRVRkRnRG?=
 =?utf-8?B?b2NVcmJqMFZFMU56Y1h0OXkrTCtKcVRZdTZkS01yOWxvYmRLSmZSRVRlMXhC?=
 =?utf-8?B?R2dQaEZWb3hTZUJFejlraEZhSVpPTDdCNStYYU1TRHZLWm5RUTVYS3Z5TzND?=
 =?utf-8?B?SnVzYXpmQlQwM0xYcXhmUi91NkZ6alBQbEtYbmRLWitnWVNqTFg2UVBySDRo?=
 =?utf-8?B?c3NnQjE3ZTRQNmxybkZOVzNiTFpENEUvRWRncy9GMml0cjBBWHVaVWM5ejlB?=
 =?utf-8?B?dDBpaGlaREVVZk5kdGk1U0RYTm0zTzNOVGFMa2ZPdkx1VXBQS3Y0bTdpbTE0?=
 =?utf-8?B?bjNqVWtaRU13eFc1V2dKMWE1dDJMZVg2dzZtVWlwUzFOUkVjMm0zQ2tpVnV6?=
 =?utf-8?B?VFVQV09pbDNtSWYvMjg2RkZtbzBTNXVTTjVQNzZyWGczTkR4bWY5bVIrQmpY?=
 =?utf-8?B?OHRJcWNzb0J3bnpFK2d2YlZsdHpwUkUrWFRHbEgrMm9zUzZLekNkS210S3Bq?=
 =?utf-8?B?Y2l0MXMwL0ZpeVpjQWY1T083MmY0UEhHNTlNeUIxT1gzVGN5QnNxL3dwU242?=
 =?utf-8?B?S0Ywc0hma2xDSW9EbDBVd2tQNU0weVkvZjArcG9PdVlKYUFscVhPL0U5WXBF?=
 =?utf-8?B?cnM1OE9iRCtQb1V4Ty94WGNXM2cyTFVxZXEzR3dPL2drMFFRVStWcjdKWDBj?=
 =?utf-8?B?YlNTSEZVelk3OCszakY1N1F5U0g4ZGdhWVBUK0g2WHRwYkpEV0MyZlYwdGk3?=
 =?utf-8?B?YlFxYWpJZjJiemNrMUhvQ3ZibDhTNzltc3J5OVYxMkhGeE5ZLzh5N3lyNVdo?=
 =?utf-8?B?bS96VHNkZVI0MzdEcWRBNjlKVzB4SG5JV3dEdWdlRE9FUEEyVk5QV2hvY3ZU?=
 =?utf-8?B?VkhNVmRMcnh6UnF1RnZ5V3lRb01sTmJMaStWaVVtWXFjT0RSMUZ2OHJJUVFi?=
 =?utf-8?B?Y0kxTlRSNDM4SnhCbjYrSTltbDFPN2ZMd0Q4cTBUakRIbDVJYzVqUnZGRDRW?=
 =?utf-8?B?bWh5NkF3Q1VTa3dBcmhPczM2blNwVkxWVnRSWkU4WVByM0ZDenF5dVJXSThR?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d6b345-60e9-4f19-0fb4-08db3b5ed8e8
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 14:04:35.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhWzlQRAPTOhLjf0BboEqt8h+nE2qI0c9tF3Lgmak7XbonZc/5jW6p83oGDfxZWufrMVZZbf9CaHh5tXnIvw3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_070443_785550_F8784638 
X-CRM114-Status: GOOD (  28.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsIGFuZCBBcnNlbml5LAoKT24gMjAyMy80LzEyIDIwOjU3LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpIEFyc2VuaXksCj4gCj4gYXZrcmFz
bm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTU6MjI6MjYgKzAz
MDA6Cj4gCj4+IE9uIDEyLjA0LjIwMjMgMTU6MTgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBI
aSBBcnNlbml5LAo+Pj4KPj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQs
IDEyIEFwciAyMDIzIDEzOjE0OjUyICswMzAwOgo+Pj4gICAgCj4+Pj4gT24gMTIuMDQuMjAyMyAx
MjozNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGkgQXJzZW5peSwKPj4+Pj4KPj4+Pj4g
YXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTI6MjA6
NTUgKzAzMDA6Cj4+Pj4+ICAgICAgCj4+Pj4+PiBPbiAxMi4wNC4yMDIzIDEwOjQ0LCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+Pj4+Pj4+IEhpIEFyc2VuaXksCj4+Pj4+Pj4KPj4+Pj4+PiBBVktyYXNu
b3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAxMiBBcHIgMjAyMyAwOToxNjo1OCArMDMw
MDoKPj4+Pj4+PiAgICAgICAgCj4+Pj4+Pj4+IFRoaXMgTkFORCByZWFkcyBvbmx5IGZldyB1c2Vy
J3MgYnl0ZXMgaW4gRUNDIG1vZGUgKG5vdCBmdWxsIE9PQiksIHNvCj4+Pj4+Pj4KPj4+Pj4+PiAi
VGhpcyBOQU5EIHJlYWRzIiBkb2VzIG5vdCBsb29rIHJpZ2h0LCBkbyB5b3UgbWVhbiAiU3VicGFn
ZSByZWFkcyBkbwo+Pj4+Pj4+IG5vdCByZXRyaWV2ZSBhbGwgdGhlIE9PQiBieXRlcywiPwo+Pj4+
Pj4+ICAgICAgICAKPj4+Pj4+Pj4gZmlsbCBPT0IgYnVmZmVyIHdpdGggemVyb2VzIHRvIG5vdCBy
ZXR1cm4gZ2FyYmFnZSBmcm9tIHByZXZpb3VzIHJlYWRzCj4+Pj4+Pj4+IHRvIHVzZXIuCj4+Pj4+
Pj4+IE90aGVyd2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRo
aXMgZm9yIGp1c3QgZXJhc2VkCj4+Pj4+Pj4+IHBhZ2U6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC4uLgo+
Pj4+Pj4+PiAweDAwMDAwN2YwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZgo+Pj4+Pj4+PiAgICBPT0IgRGF0YTogZmYgZmYgZmYgZmYgMDAgMDAgZmYgZmYg
ODAgY2YgMjIgOTkgY2IgYWQgZDMgYmUKPj4+Pj4+Pj4gICAgT09CIERhdGE6IDYzIDI3IGFlIDA2
IDE2IDBhIDJmIGViIGJiIGRkIDQ2IDc0IDQxIDhlIDg4IDZlCj4+Pj4+Pj4+ICAgIE9PQiBEYXRh
OiAzOCBhMSAyZCBlNiA3NyBkNCAwNSAwNiBmMiBhNSA3ZSAyNSBlYiAzNCA3YyBmZgo+Pj4+Pj4+
PiAgICBPT0IgRGF0YTogMzggZWEgZGUgMTQgMTAgZGUgOWIgNDAgMzMgMTYgNmEgY2MgOWQgYWEg
MmYgNWUKPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxB
VktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgIGRyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDUgKysrKysKPj4+Pj4+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMKPj4+Pj4+Pj4gaW5kZXggZjg0YTEwMjM4ZTRkLi5mMmYyNDcyY2I1MTEgMTAwNjQ0
Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+Pj4+
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+Pj4gQEAgLTg1
OCw5ICs4NTgsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihzdHJ1Y3Qg
bmFuZF9jaGlwICpuYW5kLAo+Pj4+Pj4+PiAgIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFn
ZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwKPj4+Pj4+Pj4gICAJCQkJICAg
aW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4+Pj4+Pj4+ICAgewo+Pj4+Pj4+PiArCXN0cnVj
dCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4+Pj4+Pj4+ICAgCXU4ICpvb2Jf
YnVmID0gbmFuZC0+b29iX3BvaTsKPj4+Pj4+Pj4gICAJaW50IHJldDsKPj4+Pj4+Pj4gICAKPj4+
Pj4+Pj4gKwltZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsKPj4+Pj4+Pgo+Pj4+Pj4+
IEknbSBzdXJwcmlzZWQgcmF3IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPwo+Pj4+
Pj4KPj4+Pj4+IFllcyEgU2VlbXMgaW4gY2FzZSBvZiByYXcgYWNjZXNzICh3aGF0IGkgc2VlIGlu
IHRoaXMgZHJpdmVyKSBudW1iZXIgb2YgT09CIGJ5dGVzIHJlYWQKPj4+Pj4+IHN0aWxsIGRlcGVu
ZHMgb24gRUNDIHBhcmFtZXRlcnM6IGZvciBlYWNoIHBvcnRpb24gb2YgZGF0YSBjb3ZlcmVkIHdp
dGggRUNDIGNvZGUgd2UgY2FuCj4+Pj4+PiByZWFkIGl0J3MgRUNDIGNvZGUgYW5kICJ1c2VyIGJ5
dGVzIiBmcm9tIE9PQiAtIGl0IGlzIHdoYXQgaSBzZWUgYnkgZHVtcGluZyBETUEgYnVmZmVyIGJ5
Cj4+Pj4+PiBwcmludGsoKS4gRm9yIGV4YW1wbGUgSSdtIHdvcmtpbmcgd2l0aCAySyBOQU5EIHBh
Z2VzLCBlYWNoIHBhZ2UgaGFzIDIgeCAxSyBFQ0MgYmxvY2tzLgo+Pj4+Pj4gRm9yIGVhY2ggRUND
IGJsb2NrIEkgaGF2ZSAxNiBPT0IgYnl0ZXMgd2hpY2ggSSBjYW4gYWNjZXNzIGJ5IHJlYWQvd3Jp
dGUuIEVhY2ggMTYgYnl0ZXMKPj4+Pj4+IGNvbnRhaW5zIDIgYnl0ZXMgb2YgdXNlcidzIGRhdGEg
YW5kIDE0IGJ5dGVzIEVDQyBjb2Rlcy4gU28gd2hlbiBJIHJlYWQgcGFnZSBpbiByYXcgbW9kZQo+
Pj4+Pj4gY29udHJvbGxlciByZXR1cm5zIDMyIGJ5dGVzICgyIHggKDIgKyAxNCkpIG9mIE9PQi4g
V2hpbGUgT09CIGlzIHJlcG9ydGVkIGFzIDY0IGJ5dGVzLgo+Pj4+Pgo+Pj4+PiBJbiBhbGwgbW9k
ZXMsIHdoZW4geW91IHJlYWQgT09CLCB5b3Ugc2hvdWxkIGdldCB0aGUgZnVsbCBPT0IuIFRoZSBm
YWN0Cj4+Pj4+IHRoYXQgRUNDIGNvcnJlY3Rpb24gaXMgZW5hYmxlZCBvciBkaXNhYmxlZCBkb2Vz
IG5vdCBtYXR0ZXIuIElmIHRoZSBOQU5ECj4+Pj4+IGZlYXR1cmVzIE9PQiBzZWN0aW9ucyBvZiA2
NCBieXRlcywgeW91IHNob3VsZCBnZXQgdGhlIDY0IGJ5dGVzLgo+Pj4+Pgo+Pj4+PiBXaGF0IGhh
cHBlbnMgc29tZXRpbWVzLCBpcyB0aGF0IHNvbWUgb2YgdGhlIGJ5dGVzIGFyZSBub3QgcHJvdGVj
dGVkCj4+Pj4+IGFnYWluc3QgYml0ZmxpcHMsIGJ1dCB0aGUgcG9saWN5IGlzIHRvIHJldHVybiB0
aGUgZnVsbCBidWZmZXIuCj4+Pj4KPj4+PiBPaywgc28gdG8gY2xhcmlmeSBjYXNlIGZvciB0aGlz
IE5BTkQgY29udHJvbGxlcjoKPj4+PiAxKSBJbiBib3RoIEVDQyBhbmQgcmF3IG1vZGVzIGkgbmVl
ZCB0byByZXR1cm4gdGhlIHNhbWUgcmF3IE9PQiBkYXRhIChlLmcuIHVzZXIgYnl0ZXMKPj4+PiAg
ICAgKyBFQ0MgY29kZXMpPwo+Pj4KPj4+IFdlbGwsIHlvdSBuZWVkIHRvIGNvdmVyIHRoZSBzYW1l
IGFtb3VudCBvZiBkYXRhLCB5ZXMuIEJ1dCBpbiB0aGUgRUNDCj4+PiBjYXNlIHRoZSBkYXRhIHdv
bid0IGJlIHJhdyAoYXQgbGVhc3Qgbm90IGFsbCBvZiBpdCkuCj4+Cj4+IFNvICJzYW1lIGFtb3Vu
dCBvZiBkYXRhIiwgaW4gRUNDIG1vZGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiByZXR1cm5zIG9u
bHkgdXNlciBPT0IgYnl0ZXMgKGUuZy4KPj4gT09CIGRhdGEgZXhjbHVkaW5nIEVDQyBjb2Rlcyks
IGluIHJhdyBpdCByZXR1cm5zIHVzZXIgYnl0ZXMgKyBFQ0MgY29kZXMuIElJVUMgY29ycmVjdAo+
PiBiZWhhdmlvdXIgaXMgdG8gYWx3YXlzIHJldHVybiB1c2VyIGJ5dGVzICsgRUNDIGNvZGVzIGFz
IE9PQiBkYXRhIGV2ZW4gaW4gRUNDIG1vZGUgPwo+IAo+IElmIHRoZSBwYWdlIGFyZSAyays2NEIg
eW91IHNob3VsZCByZWFkIDJrKzY0QiB3aGVuIE9PQiBhcmUgcmVxdWVzdGVkLgo+IAo+IElmIHRo
ZSBjb250cm9sbGVyIG9ubHkgcmV0dXJucyAyayszMkIsIHRoZW4gcGVyZm9ybSBhIHJhbmRvbSBy
ZWFkIHRvCj4ganVzdCBtb3ZlIHRoZSByZWFkIHBvaW50ZXIgdG8gbXRkLT5zaXplICsgbXRkLT5v
b2JzaXplIC0gMzIgYW5kCj4gcmV0cmlldmUgdGhlIG1pc3NpbmcgMzIgYnl0ZXM/CgoxKSByYXcg
cmVhZCBjYW4gcmVhZCBvdXQgdGhlIHdob2xlIHBhZ2UgZGF0YSAyays2NEIsIGRlY2lkZWQgYnkg
dGhlIGxlbiAKaW4gdGhlIGNvbnRyb2xsZXIgcmF3IHJlYWQgY29tbWFuZDoKCWNtZCA9IChsZW4g
JiBHRU5NQVNLKDUsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKYWZ0ZXIgdGhhdCwg
dGhlIG1pc3Npbmcgb29iIGJ5dGVzKG5vdCB1c2VkKSBjYW4gYmUgY29waWVkIGZyb20gCm1lc29u
X2NoaXAtPmRhdGFfYnVmLiBzbyB0aGUgaW1wbGVtZW50YXRpb24gb2YgbWVzb25fbmZjX3JlYWRf
cGFnZV9yYXcoKSAKaXMgbGlrZSB0aGlzIGlmIG5lZWQuCgl7CgkJLi4uLi4uCgkJbWVzb25fbmZj
X3JlYWRfcGFnZV9zdWIobmFuZCwgcGFnZSwgMSk7CgkJbWVzb25fbmZjX2dldF9kYXRhX29vYihu
YW5kLCBidWYsIG9vYl9idWYpOwoJCW9vYl9sZW4gPSAobmFuZC0+ZWNjLmJ5dGVzICsgMikgKiBu
YW5kLT5lY2Muc3RlcHM7CgkJbWVtY3B5KG9vYl9idWYgKyBvb2JfbGVuLCBtZXNvbl9jaGlwLT5k
YXRhX2J1ZiArIG9vYl9sZW4sIG10ZC0+b29ic2l6ZSAKLSBvb2JfbGVuKTsKCgl9CjIpIEluIEVD
QyBtb2RlLCB0aGUgY29udHJvbGxlciBjYW4ndCBicmluZyBiYWNrIHRoZSBtaXNzaW5nIE9PQiBi
eXRlcy4gCml0IGNhbiByZWFkIG91dCB0aGUgdXNlciBieXRlcyBhbmQgZWNjIGJ5dGVzIHBlciBt
ZXNvbl9vb2JsYXlvdXRfb3BzIGRlZmluZS4KCj4gCj4gVGhpcyBhcHBsaWVzIHRvIHRoZSB0d28g
bW9kZXMsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXM6Cj4gLSB3aXRoIGNvcnJlY3Rpb24gKGNvbW1v
bmx5IG5hbWVkICJFQ0MgbW9kZSIpOiB0aGUgdXNlciBieXRlcyBhbmQgRUNDCj4gICAgYnl0ZXMg
c2hvdWxkIGJlIGZpeGVkIGlmIHRoZXJlIGFyZSBhbnkgYml0ZmxpcHMKPiAtIHdpdGhvdXQgY29y
cmVjdGlvbiAoY29tbW9ubHkgcmVmZXJyZWQgYXMgInJhdyBtb2RlIik6IG5vIGNvcnJlY3Rpb24K
PiAgICBhcHBsaWVzLCBpZiB0aGVyZSBhcmUgYml0ZmxpcHMsIGdpdmUgdGhlbQo+IAo+IFBsZWFz
ZSBtaW5kIHRoZSByYXcgbW9kZSBjYW4gYmUgc2xvdywgaXQncyBtZWFudCBmb3IgZGVidWdnaW5n
IGFuZAo+IHRlc3RpbmcsIG1haW5seS4gUGFnZSByZWFkcyBob3dldmVyIHNob3VsZCBiZSBmYXN0
LCBzbyBpZiBqdXN0IG1vdmluZwo+IHRoZSBjb2x1bW4gcG9pbnRlciB3b3JrcywgdGhlbiBkbyBp
dCwgb3RoZXJ3aXNlIHdlJ2xsIGNvbnNpZGVyCj4gcmV0dXJuaW5nIEZGcy4KPiAKPiBUaGFua3Ms
Cj4gTWlxdcOobAo+IAoKLS0gClRoYW5rcywKTGlhbmcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
