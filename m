Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB86C982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+J8dZsbiDesJJgCnIB6ZKQNnllxa6pfuSpNIY+OH9m8=; b=dHzdyxZ3q2ZTUCN9/5OQIxExsz
	0mxdDO8ierCBbzymLIOf0FuqcMvxgywnsDCpp+gXXv/QfuyQbfM8QwPqI8mUG1o9eoL4faUMqsQsc
	xGMhdNOBI0Pn1pO2RWUf87SBWUee+yhEgv9CnulefQNxH2Dj97TMtwJyFXz9Si4TRDMUjEmfAPe5L
	N5/K7kHLVYvzoePA6dIekTPm+KR5Az3WMnZeuvjD2HAvHedT5ZxzRZ4qt8OxZEugAUnCVJ53GzJM7
	QZH2mmNmiydooQAwxQox691yfK54uShtoiuzJ6kdVfb76MXbuII8fq3X3FE5UISUBG/tQx0HSmH3I
	JK5awwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xcx-000000012UG-2wd7;
	Mon, 21 Sep 2026 06:35:47 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xct-000000012Rn-1Sx1
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Smb9zi/OfhlKDyX4H1HzBJqSciSuJgTu/EjWVLEKZB2+EeZVDAhowt8lJj/Xb25NiRoJFme6n64OWaG5QEG0alzLEe355OvxuglxES/lu+4Z31f3CZ4ynwKosgsSw6k5KdpfiUPNwjEgwhABANmQxl8FcLmZcPxkn7lsvmuousvqs7mpngT/po8SeLyuKa/wtUZmAwIz3oNE4srIbahxd3x7RbiPNTY31hxYJby2lUqDOiiTSP+cjXoN+IvyfAnbGn1reXT9lCD0nJyl2X7Z2z20TREExRK6YKda6iWjDrxMVv2ZHcSmmctkOR1eru4FsIIA9GSTyJxUb4BHImNo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUD4/oo5UwlpqChX/wtB0Dan/x/HuYeCpxESzZSvfoU=;
 b=mvSw2bdo34nNh9cssLWkCTCrsTfAYY729TEeWpCGbc3PhEiJMB81UDMW8doCvld1ZQnMAnDqi9xCBdLrpPCL2edgCThiR1651kS07n+xvQhxbwYEoD+y4YJj37Fas2c9XDhNi5cDKYFeA3Rszhv59QqXWLOLoUY2fuoWjdt7Xt1D3Q1B1HUqnWNiYxnKx95i7314+nB209j+O7WWledSLFNtQrRJr7ZQSfomuzO5QuJv03lbbgEBmpw5ppTfETOZvne1xFAG8s4jJMnA3Hl8NoeTNQsARUKbeJSJHh3DqNEra/W83/5iyTFRXpKYBaLi99gDNE0lso2YAC3S/hgyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUD4/oo5UwlpqChX/wtB0Dan/x/HuYeCpxESzZSvfoU=;
 b=jJsLTc/4F26A08mnFBUFxcXfQhy295BkXLOgPJHjO/RnFHqKLmnftJXgzq056m4w32rox0xGO9xkc1Z8dtC41+CI3dNzUeEtcvetp5Hdn8Gcsd9cD1BfsHWLc4/MFqVLhVcgJy6bl0uNdg33LX2szkcXRElHpS/C5vd+WkxzFW+pUwqaqDmMYLp5OJ9+1dSyD7S5bNXK5MyaIjar9ayF2q6ruWF5ya1eqdHZBczvcbePQOAFWg1TzWCdvWAoRDQ/1QSHCwOCaKGLdWJfyU5NORP+4oFS6vkWuuq/Tv7aSCeB7UU0VG7lVGujO7BrPYdG8xOlHj9HZ9ryh3SxjTxwjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS7PR03MB5381.namprd03.prod.outlook.com (2603:10b6:5:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:35:30 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:35:30 +0000
Message-ID: <da7eb086-1a4b-4631-bacc-f3badb075f6b@altera.com>
Date: Mon, 21 Sep 2026 14:35:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH 0/2] mtd: spi-nor: Fix unbind deadlock and
 use-after-free
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <SJ0PR03MB5950909EBD8335469678D0A2A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <SJ0PR03MB5950909EBD8335469678D0A2A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS7PR03MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: 014493c6-fd53-4201-5555-08df17aa8819
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|10067099003|4143699003|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IAkNGHOnHBayLaOVJSAaqQnURUD6d/MaoWGJu++gfabOSx4Ge9OgsW2n85pEF32KV6hOYVTvBqn+dUtC8jBvAJgS5aKFPZoJsDauNfvBkTDT6eotAW6zaJ831trflnCLUl28EBO+fpz7G2NPsuJxtZhDsEG/dVA2r5JnLvIQdMfPgPHgk16+UQbZV9ANIbMNpMPyJR1aDjw/SkfNTZmrBYxggxusjcnX2AhMZp1styaEP8MyLrOh1T5sb4v23+j5MuM6GjJeHSYGPsq939am4pAeQcYX8FXQNH5fVt4ib+AFlcHACwVH4WkvdAZ/923tRWPUt6BjBSGQtzzenC2wETlq+/DxZZ63GJOCs7qlVs4JnBt4M6/vu2ka67KfYJvCP3E1D/SEuwu5lSrXz6NdshFOcCljYHJjtltyYtkWN4SxMnKVV1lkYn2CVc6EmkgmP6O95Gxg2NISc8XDLwEcAkPG5VwCzB99BDdEj6bVXTdToeWSz/oOM/zSJSux99pfp4PyRFXBOYkbC7yAoG/Ld3U+cYZOIv9ugGOr74ZKx4qhx6d5RNlZ8xGnS7vqO4lyyDWnIx9DX3yD8ZDP5rb8AAzRsTryL/HtQEXJc3HFcUhA2sLkcZB0SaD2n9bGufhKTz2JIS4/uQUNmTNZ7kL8I54GzULWKCnloEbWDTu8z5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTA2cnc4NkRYUEZmanE1dW1WRThEclRFaSs0YXg2enAvaXFZWXVOMmhOd3hs?=
 =?utf-8?B?cG9Ka0hwL2ZsK0pmUG5wT085WjhmOVprdmxnK0Z2RW5ETXg1SCtiZ2FMTTFi?=
 =?utf-8?B?WWM3SnFHT1B2RkhzSjJ5cE1EYmcyR0k1NG9WTFBhOCtkVkw1RFMwcCszRWRo?=
 =?utf-8?B?SEIySXhEazhycUhLa0FDSnUzcGo5UWdoVDcwdHlvUmZEVlYwdTZGSWJKM0FX?=
 =?utf-8?B?bjZhWTBRNEpObmFTVXNMYkFjRU9maU9WWWo2STdDQ3hqcmlsT1lIZFhwMjl4?=
 =?utf-8?B?VmU2N1Izem1JRGlGMk1tMm9zNVNuSjIwR01hU25WakNTdldnT3hJYWxuOUJ5?=
 =?utf-8?B?R2haZWROOU4xRERXc2xWSWZLVThNdzNFS2tiMjBDQVhqZjVhMXJmbVp1KzJJ?=
 =?utf-8?B?elJ4RVFWNGRodm5MVUFyYm81SjQyZnY2K1NQS0FLOTByZGV1TUNSNXVGSlVS?=
 =?utf-8?B?VE5PVFpzUWF4OWRZZHBncFB6RzlkWGEwWExmYm0wN0xJTEtLRXFpdmhrN0dx?=
 =?utf-8?B?cGowcFEyYWNsb0RxZ0s5cDdrQTlvSmxXT0ZMUkJoalpzRjJBb2lYYXVhR0lU?=
 =?utf-8?B?MFpXa2tCYTlEZzJTaGNvS3ZrMG1wdTBLdFRublNCRk5jbk5LUVIzTlQzZWln?=
 =?utf-8?B?eUdzN3R4M2RBckhUd2k4b24rY3RwMTZTbHdvL2dwN2luc3FaU2ZDbVlDcHd4?=
 =?utf-8?B?dnZSdWVheXVoZ2VldnlDNDBVOWdveVp0bGNSM0ZCdnJGUndFdE0rUWUybmpI?=
 =?utf-8?B?eWkwYm5TMEJvcHJ5d1BhdVdrZU91ZmJaWGlxdGUySzE5YlE2VEx0L1h5eUhE?=
 =?utf-8?B?a3FqNHgvZWh1RlEzWHpYcFh1d29JbEhWZEpYalVVeUdpQjd4Vi9YUGZDeDlm?=
 =?utf-8?B?S2pQTjVsczBiNW9xWXI5YWcralZsNmRXbmJrNTlLSHdvMTZ0V0ZHaGVjMUlq?=
 =?utf-8?B?eUd3SmlONExPaENLcXZ5NTJUVVcrNktIQ2F1Vk5YczZ1bkczWmx6dkFtd0o3?=
 =?utf-8?B?MDBxMlphZTB6VTJwMEMrd3I3bm9hNlorLy9CaHhzbDVSb3NydmVTNlNLaG54?=
 =?utf-8?B?Wk9WMmFETEp4R1JaemlLd1NRYnpqdldVZ3dZMTJBL3g5M0hDUGpDZjhoUkVY?=
 =?utf-8?B?MXlsQk1OU0lmQlJ2a0g0NVZmNjFkQTVVWmFWeldHM1p6blRKQktJaDhmbTVJ?=
 =?utf-8?B?YWduN1VyNTRQUVB2VFpkNzJzWFRZU0dYeldVdG1jeEdIUERvY1pHRXRhRWdY?=
 =?utf-8?B?Y1dYc3pLNE9OVFEyWldLK1VmbjF0dS85SVdUQlZKdSsrZFJmNnc1QW42b3Zq?=
 =?utf-8?B?TU93ZDJPUjB4SjdvNzBDUUtoR1h3TmRJRWluNnFNT0NUS0JnVnJxOUJlVkpF?=
 =?utf-8?B?TUwzaXp3M0tjK3FiN2M2T3J3MmJzWFIrV2xsNkdQcGtHYmFOUmd4YlBPRWUy?=
 =?utf-8?B?Qkh3RU1lNW1PdXVLVFNFelcxS2JGbVgxOFBDTVpyNXlmNUI0aXlEQjBVZVNC?=
 =?utf-8?B?aHBSQks2dmdyOWxZTTFlSzNXZTBxY3JOZWh6SGlMTEE3ZDFpc2Z3cUkzN2Zo?=
 =?utf-8?B?SS90TENNNWNOWWlpTFIySldxTzc3MFV3Lzg2WXliWWNvSVlPZ3VPYWttU3Zn?=
 =?utf-8?B?VWlZck4zSGk3elVBd29Ncmp4U3hiemIyOWxIMHFHRHJVQ0x1eEtSVUo4K1B3?=
 =?utf-8?B?V2tqdk1rcDYzUzlQaWVLNjB4dmZNQXJTVS9Zc0VLU2Myek5udEpIdjIweklZ?=
 =?utf-8?B?cXdUYThWdm9nWmoxTmVPRzZJd3ZTWlFEY0k1ck1EdkZyVEdIQ0NIclFSS05x?=
 =?utf-8?B?YWRZQzF0TzFjR1A2ellTRktCMEE3dW4rUE9heDFmMjRVUXF6VGRtYmFZT3ox?=
 =?utf-8?B?aXp6dnBNSGo4cWJNTk1QeFRQUU1mSS9ZM3RtS0NnS3F0WG1FZERvdUlJQ2ov?=
 =?utf-8?B?RFU3b1lwYWd5QW9GTkRlRCtQbkxwZFE0T1k4Z2owZitHOXNBMVg1ckhvcFFV?=
 =?utf-8?B?VEtDKzRoRVZ1dFBDZzlrdkJxalB0aWdESnp6eVpPSWlYcGJDQi9GeHE2ZExh?=
 =?utf-8?B?Q0F6Yk93R2lEY213Nnd1NXNsbzUzRzFuYXNDelBNYVdzZE45eFlXeTluWWtw?=
 =?utf-8?B?Z1FpcWNLMElIczlVekNaV1M2U21oTUozTExEbzcxU2JydHRVUElDT1M5MzhU?=
 =?utf-8?B?SW5LSmErQkRwSTl1eEx2Wi8rYzZBVExGQnBCR0I4c3NKeVRraDk4VFRqMXlV?=
 =?utf-8?B?VTBMTlJzVDhTcjRqR3VGR29iTWM1Ny9ycjE3S0NZQ0k1MHk1UVpVd244UDZR?=
 =?utf-8?B?QSttNmkvM3VkdjBERUVaMkdBeFpiaWxRWFc1R3VHaG1mVlFVYkJhdz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014493c6-fd53-4201-5555-08df17aa8819
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:30.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouh5gcF9WlKRFvprK0HsCm4meAfGcseL2OfGN/0oUXIy1RmUCRYtWadE4AsjjMNPMGgG3ZL9tryeb3vgTNk7gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233543_417757_B0F8C362 
X-CRM114-Status: GOOD (  10.93  )
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

T24gMjEvOS8yMDI2IDI6MjcgcG0sIE5HLCBUWkUgWUVFIHdyb3RlOgo+IAo+ICpGcm9tOiogTkcs
IFRaRSBZRUUKPiAqU2VudDoqIFRodXJzZGF5LCBTZXB0ZW1iZXIgMywgMjAyNiAxMToxNCBBTQo+
ICpUbzoqIFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPjsgTWljaGFlbCBXYWxs
ZSAKPiA8bXdhbGxlQGtlcm5lbC5vcmc+OyBUYWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1d2Fu
b0BpbmZpbmVvbi5jb20+OyAKPiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5v
cmc+OyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyAKPiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC0gCj4ga2Vy
bmVsQHZnZXIua2VybmVsLm9yZz4KPiAqU3ViamVjdDoqIFtQQVRDSCAwLzJdIG10ZDogc3BpLW5v
cjogRml4IHVuYmluZCBkZWFkbG9jayBhbmQgdXNlLWFmdGVyLWZyZWUKPiBGcm9tOiBUemUgWWVl
IE5nIDx0emUueWVlLm5nQGFsdGVyYS5jb20+Cj4gCj4gVHdvIGZpeGVzIGluIHRoZSBzcGktbm9y
IGNvcmUgYXJvdW5kIGxvY2tpbmcgYW5kIGRyaXZlciB1bmJpbmQ6Cj4gCj4gUGF0Y2ggMSBmaXhl
cyBhIHNlbGYtZGVhZGxvY2sgaW4gc3BpX25vcl9yd3dfc3RhcnRfZXhjbHVzaXZlKCksIHdoaWNo
Cj4gdG9vayBub3ItPmxvY2sgd2hpbGUgaXRzIGVuZCBoZWxwZXIgcmUtYWNxdWlyZWQgaXQgdmlh
IGd1YXJkKG11dGV4KS4KPiAKPiBQYXRjaCAyIGZpeGVzIGEgdXNlLWFmdGVyLWZyZWUgd2hlcmUg
YSBzeXNmcyB1bmJpbmQgZnJlZXMgdGhlCj4gZGV2bS1hbGxvY2F0ZWQgc3BpX25vciB3aGlsZSAv
ZGV2L210ZFggaXMgc3RpbGwgb3Blbi4gR2l2ZSBpdCBhIGtyZWYKPiBsaWZldGltZSBvbiB0aGUg
c3BpLW1lbSBwcm9iZSBwYXRoIGFuZCBmYWlsIG9wZXJhdGlvbnMgd2l0aCAtRU5PREVWCj4gYWZ0
ZXIgdW5iaW5kLiBMZWdhY3kgY29udHJvbGxlcnMgYXJlIHVuY2hhbmdlZC4KPiAKPiBUemUgWWVl
IE5nICgyKToKPiAgwqAgbXRkOiBzcGktbm9yOiBGaXggZGVhZGxvY2sgaW4gc3BpX25vcl9yd3df
c3RhcnRfZXhjbHVzaXZlKCkKPiAgwqAgbXRkOiBzcGktbm9yOiBjb3JlOiBGaXggdXNlLWFmdGVy
LWZyZWUgb2Ygc3BpX25vciBvbiB1bmJpbmQgd2l0aCBvcGVuCj4gIMKgwqDCoCBoYW5kbGVzCj4g
Cj4gIMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmPCoCB8IDExMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0KPiAgwqBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggfMKg
IDE3ICsrKysrKwo+ICDCoDIgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuNDMuNwo+IAoKSGksCgpHZW50bGUgcGluZyBvbiB0aGlz
IHBhdGNoLiBJdCBoYXMgYmVlbiBvdmVyIDIgd2Vla3Mgd2l0aCBubyBmZWVkYmFjay4KCkhhcHB5
IHRvIGFkZHJlc3MgYW55IHJldmlldyBjb21tZW50cy4KClRoYW5rcywKVHplIFllZQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
