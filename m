Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEB6D49235
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5c9ytjFhxSwRP810zcTy5+OGSrGvR9cGkf5hL/MjKk=; b=0zfgXlXecjuz+j9PSs4y47RUMW
	PyeUrVUXTaNyTQ814PNzo2KZv8nn2Z32TFUG09pF7W8Gvj4qdADu8cIbyvZQ0cce3blnS7XPXWjm0
	+F6/doe1kuq0E385H03J8/ZC3XpItJFGC2MC5jrob5YGOw+FsGFq67R3+OI1NLYD859DETCh6Gm3Y
	pExNU/I1VgaoBNbISe2diqlXlD2UnTy7uYXSsGcNpsLWg2OtHcCu1U7ALRqikpKVdD13yZdFzFRn1
	ihA8gAJsEwto4QfYMMbppwo3i61cXPPyagpqpI42fplxW2mQXqiB3a09RFZaI4ipjpucHKqqRHgn+
	hjVDVp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4Ww-00000000dd5-2XfQ;
	Fri, 12 Dec 2025 14:54:02 +0000
Received: from mail-japaneastazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d405::3] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4Wu-00000000dcR-1b4r
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 14:54:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jE62l5WRNW/FiI10qeoNybKsLQTon+LOHtg9Bo2s+zRZY8VtCGJgeos+fy1doif2eagzJEoppby+zuGGQrJZG232KifQk6XpDOKJIjSwFJqECWrK4Ecp31K9b82qakZRufFECBZH8P2vA0lRHTLhPFGC9gSCFf6+ucWnhnV+8tabLS9dPdttqR/3ZzY2U8IZ538QTnkU78LNSH5R8YQuvp6OwA/Y7P7KRaWg8BeE4QKolcM3RiWUZa/sYCjJzFCnF2QLfBQo79Sanw7j9ncNOMS4aWPg9Tw63oB8xeTGK7gtcgbT4zajdHUIHr21ZTrMX7dsbixBnev1fNVFZ7Du9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq/JQBxTPlAMb7chw2KNzq3MtMItUN924wO9P41KhQ4=;
 b=nOJoi0cYAXmd43aPwKclzD/jq/VUQmv09mZDY5CSMw3AfG5zTFB33OdDxqlTzobp78V8zyuUfnzVsb3ZSpDKwR3Bg/GVP53Muv+35K0QGr0zICkPruTsxSIUwj4m4kq9CwE//ZsCn8RZvNNJYyoajeGyVbKOnuRFS1O2I/8XIyqRukU8tVDNKmUdOkFOl6/qIeY6lTpMYCZ9TI+ZqcPg6n2CrT10qxanvmV2hlj7/8+8lPSgyxyz0fx5BEn81UHhA+p/7scv/9o0h/YbtxAdSZVvO30rYUvt7j1UO54ubk8GAZUW1IekzAqJkH2pIYE8H3+07S4L/peLPj0zqLdHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq/JQBxTPlAMb7chw2KNzq3MtMItUN924wO9P41KhQ4=;
 b=j+pPyqdvrQuK9NZ3RZqBSuYCNASjnkpWkq2JM3PWA1ob5G1Her3Vk/qP6eMfleKaFKjM368h7ZVm2ySkGdrKOIUlEUgdvQ4B3xnM36Od21Rk6EmF0eimfUh0qdma1V4q++ezmKl5Ia8Bd4M4vzCN+RxveBgTg0rQPg290ni2ozGfa02UMp0M/MDaKg0E5xiNdZSwsNPH7OGehHhs7xPZtdhG7oNYxe9z9U8Q5cLYQVe18KmVaOs7nzV3pgxQwqgqLqEWO1EDrH3rwFLc8cPgDPLZ1vV+F41JKBAWoEIJXJS+hDCQfI5Ts/Y/SsefzijeXMfFmI2EcHQKZJs9+w1OgA==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by TY0PR01MB5443.apcprd01.prod.exchangelabs.com
 (2603:1096:400:32c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 14:53:45 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:53:45 +0000
Message-ID: <TYZPR01MB55568ED405DCABFB5A4BD503C9AEA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Fri, 12 Dec 2025 22:53:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: spinand: esmt: fix id code for F50D1G41LB"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org,
 mmkurbanov@salutedevices.com, george.moussalem@outlook.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <87wm2x74pz.fsf@bootlin.com>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <87wm2x74pz.fsf@bootlin.com>
X-ClientProxiedBy: TY4PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::9) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <8a8cb349-0362-4c47-9b6c-7a2e99eb18e9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|TY0PR01MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: 947c2134-022b-456a-39cc-08de398e3d01
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|8022599003|5072599009|461199028|19110799012|23021999003|8060799015|15080799012|440099028|3412199025|26104999006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDNpTDJpYncwTVhySnZhS3pRdnVoRE1LRUZ2ZTFNbWRJSkZqc0ZBTEVEYmlZ?=
 =?utf-8?B?ell1dmpYQVlTeUtBK0V6YWczaE9pUDNZNE42V0Rhbm40VlZRNHFPeXJnQmhi?=
 =?utf-8?B?N0pKWjBpVml3TDcxNlNVYnF1NE11dE5IZGtLSjd1S1F2eVRvUENhM3h6aUVH?=
 =?utf-8?B?QWVZY1VoVlYyQ0Z3aDJMMjMyS3NsQkVHM09icEZtV1BjUFpON0l1R3ZleWpD?=
 =?utf-8?B?Ry9NZUdGMG5VWjNhWDd1MlVPcTN3S0xzczJObmJzWUtxNUxoMWMyUXMyalFD?=
 =?utf-8?B?V01rSHpua1pJWlVCM1NCOWZLVlRpR3BtYVArMkpGUWp4cm1YMlFZblNpU0tH?=
 =?utf-8?B?VVFhOThtekNuR29hZkxtaVhJUnR2aUp1c3BmaG01SU5oaG50TW9KdVBTMVJz?=
 =?utf-8?B?ajRGK3pSajdFNTdJOGxHWmZZMUxDMG55RzR1dTR3NXdEMnY1K3FDUWxkbjM1?=
 =?utf-8?B?QkxPTXhublpOek00eTZ3eDkrUzlBb1RvaXNsVjhFV2dFWjRudlNmV2RWcjFY?=
 =?utf-8?B?VUZSVVdIS2Q3QVcyNXk0NzlMcUFJdTBRMGJudWhrZnNVaVBXTkdWRVh3V05q?=
 =?utf-8?B?TDJwNy8rdUdwdlJXUHVwaWw0V1JCVmpvNmJneTJlQzNaSjNNRTNpYnRwRFhB?=
 =?utf-8?B?b1oxZyt6ZzNmcUozbTBYbWRKS2d2T3dqZWltQVluV21GOENsdkxaOVZBUFlv?=
 =?utf-8?B?UFJNK3dUTXR2ZjN0QndlamQwTGdZdTRSZ0d5bE1lSVMrRmhaQ0dLd2FSY0Er?=
 =?utf-8?B?VUlUREx3N2NtRmdMZlVGTkpRK1FoQ0xHSWFna2kwYU5sY3VnV0JBeW45cGsv?=
 =?utf-8?B?Y251QW1wWXVLbkFBKzFMSG5HVzVPK0JWVWhXTVg1U2pxZkFlWWVjWW1PY212?=
 =?utf-8?B?QlZpd3FrYXl2K1Noa2FXYytUdkhtWWhxUFpxbnRvMCt0YTVlaVRreUx1U0pG?=
 =?utf-8?B?emxuY081T3pxMlpHMmtxRy9sdGRpbTlqaXZzUlFUNkx4Z0NnWlZQcDltZmdv?=
 =?utf-8?B?ek8rdDlCTDh5WGJQM0tLd0dKNFBSV1BWTUhkejBSMnRJQ3VxNVBUZExoZ1Vk?=
 =?utf-8?B?MVo0VU5zb29OUmNidlR2aWNDR1p1V21KV2RoSG00NkZxdXdwdjZJS1dZOEJt?=
 =?utf-8?B?eFNvd295SG9VM0s4dHc2TWViZTJyU1FWdStLQ1VlcHVLMnV0OTNnZFVPbmRs?=
 =?utf-8?B?aWxPUER1K2xFeWRIS1VxY3FJclUwcEw5b1hoeG9JV0k0Wm9Ha2hjU1AxOTU4?=
 =?utf-8?B?aW9ZL0wwTmxocjlqNDVZTnQ2ZTUwL080Mnd4eGF6T2ZIYkNsT2FoN09YdzdL?=
 =?utf-8?B?M2ZPN1dqTGhIUWc4MjNNRGdkbkdhbk1iS0pPVHB3OXYydDczK2pNa0IrS2FN?=
 =?utf-8?B?b2t1dVU4YXBjcXRmdzBkMGMvbVJ5MkJDTVQzNVVYWVZVZXRyZzhhNHFEQnR3?=
 =?utf-8?B?UjMxanU1cUV1VEl2QjVWN0dyZy9vRVoyeUpwRC9wdWFLVTl3cmxLS0tmZ1pE?=
 =?utf-8?B?ZU5TSHk1eG1DRWxXbFpGbWVVd3g5Q2NVWkpsUlpZSFRRV1poNU9SaGxhODlz?=
 =?utf-8?B?MGFKMWcxQlY5UmNkOHRhTmV6cDQ2UWtLbC95b29yemNOaW5zcklNVTFDR0cr?=
 =?utf-8?B?Z3V1Nklha0g4b1pOWVFNN3dnTVA2OGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRxc0J4SFRFWDRhTFVlRktJUUhOekxBeW1FeDV1VWxzYkZvQ0RqRitZU1h1?=
 =?utf-8?B?ZnE5SFl3WEJHT2xqeExOcU5ZSjFUaWFZU0EvVjk2L3FWWTY4bTV1MDR3Rmta?=
 =?utf-8?B?dHhjTXorZDNLMndUY1FhbCt3VVhnR3pFeS8raHdGWXE3UkdBZ1VTV2pqcU12?=
 =?utf-8?B?bGRhUUMrckh5VUdRR2FJQ0crcHZLWEE5MGcvbGsrRGJnZXdrWHhwdFR0ZkpJ?=
 =?utf-8?B?bkltSHNsbk9adWhhdG9ON3I4cVlRclFUTE9UdnBkbUhQMkFIK0VVcDc1QU5J?=
 =?utf-8?B?Qk9uVHFjRlJRdkx6YWZpRERWOURvcXArV1RLSS91QlpvRk5sNGp2STQyRDhR?=
 =?utf-8?B?QlhQSEUydUduTTNJZ0diWHpYUjZBbms4Vldjd1VzazRtc1d0bHlWanlkZDlB?=
 =?utf-8?B?ZnpSR01qZmdqNGJTNmpUTjg2QlVhU0c5YWhNY0ZRaHpqTENPOXFFNFhUMExa?=
 =?utf-8?B?Q3dGbzRvVWpMaGV5Sk9EYWEwZmJSZTE0dzhXR3FNVGVxbkkraCtPYkxFS3FU?=
 =?utf-8?B?aWJWUTRCcXZORU9lalZtMDhtY0pzQ251N0E0bzRkTE55VUh5a3lIOXFDcnZo?=
 =?utf-8?B?blR2a3RDVUwycTRMeGFURDdXcVdyNllDNkwwSVBPVXhlbnQ4U05abGFIcFN5?=
 =?utf-8?B?NDRISGNyT1ZVa1RaaFdHTjcyYkpiZTdMYktjai9lT2V0SHduWUhicGgvSEFP?=
 =?utf-8?B?RElDYUYxQUVoYVQ1cVFNczhSRUxQZ0loV29qVW8xdHFlWUt1OU83MDFYQ1hm?=
 =?utf-8?B?Ryt5djJKVHFDZXdBdnIxaXhwS2Q3WlRlZkN0Skd0RlhWQ0tpK2s4SDFaemFj?=
 =?utf-8?B?bmZXOEo2VW5zRDR4ck5KN2NrSnpGdUExUWozR0lUOG5QcUY5QlFkalFwOXBX?=
 =?utf-8?B?YW9LWUxQVXJWN1J0dW9YSEFLdnpjSHo5czVhM3MzUmZodU0rZUZEdnRadXNm?=
 =?utf-8?B?SktXSHNTSmhMYzZrNDdBMW1JU3VJOSsrajlWTEl4alhRNGNydXhqdFNDdk5R?=
 =?utf-8?B?Wk1FdjlkazZ2TGNFVVdEUUU1TC9uZWcwek5RbUgyUGVZY3padW5FNUpDR0xq?=
 =?utf-8?B?U0svdnN3dklqQ2trd2FXazZFQUEyMk9RRkY1UkF6NUg3Vnlab3l2cEllM25j?=
 =?utf-8?B?cTdHV1JhOSs2MkZMUVNVSTZueGx5dzJqN1NmMEpxMXI0NlJRM0NITVJGdmhr?=
 =?utf-8?B?UG1WTUxMeno4WlZNTGw5RllyOENCT2ZjS2UzcGlZa3JWYWVXQmxTSEU2UTNO?=
 =?utf-8?B?NkNhRGgvbjZwOVFoSFhrM2xzNmFXWTFlV09oZFlKQWQ2SzZFTzV3VDBFUW5m?=
 =?utf-8?B?WEU3MWxTVi9pMmdKQmZSMngxWno1ZEpRSHlvcEl5RWJlcHNnTG0vSHd0SktT?=
 =?utf-8?B?MExUTm1OalQya2VJV1oyUktiU3FTeXFlRkFkLzZZRDlvTzFRTTZKQ0VHZzJL?=
 =?utf-8?B?d2ZSQVk3MkFCV1QwdnZ0eWQvUGZ0Rk9Zam5jUWZuaE43OWZ6TlZUcFg2dkow?=
 =?utf-8?B?dWhnN3p0WEMrS1lRSWVuUUtiOEhKZkZsdmV6RmNUZUM5aWRjZDhWYmxick5K?=
 =?utf-8?B?ckJpUXZOWWdzcFNXTjU4Ti96SU9DVzROVWVLOFUyMisxckMxa0ZZaGNjaGJm?=
 =?utf-8?B?NmxFYnpEbG9mU21iU2NtOWdHZzJMTjZadWdVV1VRdTJ2cTFhQXBGKzJ5OFpT?=
 =?utf-8?B?cHIxOHNrcEdON2hjWXUvVHoxRVVrY0VCY2Q1WFFJNGJWU0V4amczQVM0VXJQ?=
 =?utf-8?Q?e8cKhx+KKymELI8t/g=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947c2134-022b-456a-39cc-08de398e3d01
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 14:53:42.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR01MB5443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_065400_451137_F7B37377 
X-CRM114-Status: GOOD (  12.27  )
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

5ZyoIDIwMjUvMTIvOCAxNjozMywgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gT24gMDIvMTIvMjAy
NSBhdCAyMzowNTo1NiArMDgsIFppeWFuZyBIdWFuZyA8aHp5aXRjQG91dGxvb2suY29tPiB3cm90
ZToKPiAKPj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkZDI2NDAyNjQyYTA4OTlmZGU1OWVhNmIwODUy
ZmFkM2Q3OTliNGNjLgo+Pgo+PiBUaGUgaXNzdWUgR2VvcmdlIG1ldCBpcyBkdWUgdG8gdGhlIGxp
bWl0IG9mIFFQSUMsIG5vdCB0aGUgaXNzdWUgb2YgdGhlCj4+IGZsYXNoIGNoaXAuCj4+Cj4+IFFQ
SUMgb25seSBzdXBwb3J0cyA0IGJ5dGVzIElELiBTbyB0aGUgZmlmdGggYnl0ZSBpcyBhbHdheXMg
MC4KPj4KPj4gSWYgd2UgdXNlIHNwaS1ncGlvLCB0aGUgZmlmdGggYnl0ZSBjYW4gYmUgcmVhZCBj
b3JyZWN0bHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFppeWFuZyBIdWFuZyA8aHp5aXRjQG91dGxv
b2suY29tPgo+PiAtLS0KPiAKPiBTbyBob3cgZG8gd2Ugc29sdmUgdGhhdD8KPiAKPiBJcyB0aGVy
ZSBhbnl0aGluZyB0aGFuIGNhbiBiZSBkb25lIG9uIHRoZSBxcGljIHNpZGU/Cj4gCj4gVGhhbmtz
LAo+IE1pcXXDqGwKClVuZm9ydHVuYXRlbHksIFRoZXJlIGlzIG5vdCBhIGdvb2Qgd2F5IHRvIHNv
bHZlIGl0IG5vdy4KCkluIE9wZW53cnQsIEkgbWFkZSBhIGhhY2sgdG8gZm9yY2UgdGhlIG1heCBj
b21wYXJlIGJ5dGVzIHRvIDQuCgpJJ20gdHJ5aW5nIHRvIGZpbmQgYSB3YXkgdG8gbGV0IFFQSUMg
ZG8gYSByYXcgU1BJIG9wLiBCdXQgd2l0aG91dCAKZG9jdW1lbnRzLCBpdCdzIGhhcmQuCgpGb3Ig
cm91dGVyIGRldmljZXMsIGFuIG90aGVyIHR5cGljYWwgd2F5IGlzIHRvIHVzZSBwYXJhbWV0ZXIg
cGFnZS4gVGhpcyAKZmVhdHVyZSBpcyBzdXBwb3J0ZWQgaW4gYWxtb3N0IGFsbCBvZiB0aGUgaGln
aC1zcGVlZCBRU1BJIE5BTkRzIHRoZXkgdXNlZC4KCkJ1dCBmb3Igbm93LCA0IGJ5dGVzIGlzIGVu
b3VnaCBmb3IgdGhlIHJvdXRlciBkZXZpY2VzIHNpbmNlIG9ubHkgYSBmZXcgCmZsYXNoIG1vZGVs
cyB3aWxsIGJlIHVzZWQuIE1vcmUgdGhlIHRoYXQsIHNvbWUgdmVuZG9yIFNES3MgdXNlIDIgYnl0
ZXMuCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
