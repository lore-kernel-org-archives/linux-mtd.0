Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F6FC624A5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bbN17ThJ4N/RjVS10sKXZ5P5qrcwnGktBqu589pO+Q8=; b=40BuLq3Bv4+Sb4XZxBM2uH8HlQ
	3lvTVwJLnVd0/BL0ljCOghrrIUEf3atn8LCwGq+wsy7dVuKMIV0Y1CRNJFEx8Gx6fuAOgBX/8QX3e
	n3FLUZSW80hGcriPStLUcFyr/juM615v7jiIp7RXKqd1j5w2tFqVeg1TfIDkXwuHIN1tSGbfMaUkl
	OyZ86Oh3htWpXGN5tkMRTQ7IqDrX8siKRTJ0zw50igENjQHpmAGz1WMTOG0Wydq9l3bNhxvF1rZ+u
	bTVT4b3EhAPT3yi+RaO5oOueERzX0ebr3MTu9C5o/vj1dPi2yTcKUMmcLdfb85+SFZ5TH2tu9fBeB
	2dBoss7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13ae-00000009nce-1yvl;
	Mon, 31 Aug 2026 15:06:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13ad-00000009nbr-1j1d
	for linux-mtd@bombadil.infradead.org;
	Mon, 31 Aug 2026 15:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ib4PE4EjexcdnxfgiSyAK4wibIBbzY4hGKIBXM+ZZBA=; b=VhMIRX8OGhcaVYIZmJ6y8IWlEU
	IPMk5mvwvzWm5dilzLwpserS03b7WXNAd49Eyk40JiGYlMhcTvHevEwaVoF5l9s6VeRcXHS6WkS4D
	qulfmB35nf7jCd9mNMnjtPlBJ7eZXuBoDm4GN0rXdlNkD5xFdOt01/Pve2Dwuve9nVtHLO72eHbwu
	uApgW1cH1joWoMcGGPlTgZaK+2qf8VhhbD/OfF2a+0YOApZZjd1q/ot93/epkZ4PJXFR7upg22ucV
	hnMZmYpTSP4SIJPyPLqhLZirujeKa17xgtd0YKBCWs2FruQmtBUdP5cecnaD+WC0uMVyIi2nuuYYU
	kpPj1ZFA==;
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x13aa-00000009yMO-0Yzi
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 15:06:26 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEVDoM889044;
	Mon, 31 Aug 2026 11:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ib4PE
	4EjexcdnxfgiSyAK4wibIBbzY4hGKIBXM+ZZBA=; b=WOznDQhh5XRsevtaeuLPd
	OlRPPBvr/l5voYLgbBrGwltzrUb7JlozhtpiQTRNKLQZqdBJ7sDvfERvNZ1nHg6r
	kbXtQhGpsJNvtmRmZgeSkxkzBYM7+I0lFHAdM3GGEAe5Zhjej+6bDyU4lFKjyOgX
	UleiNr5fXZh5eVdovXkv+1jpoIM2ie50j7uIEdFALlIKE2Ed5sgCWXkhVbR4jKgO
	K/dblR24/eHjyyagKMmz/0jnII6No/Va2UkNZ2f/R0FsfmedccfodEBYC5PwQ/62
	S3nuszH8E01ycssEwjqWyCeMYIO0OEtRiJrzt+syhEWb2zV68IoDG8gKMMbcv7zh
	w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gcdrdn6ck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 11:06:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUTrg639SY6M2hMrM0tpM8f93bDsKFQj5xAHWkc0Qv17XOWvOvFKFlYMaywKDvy1GV2GRQns6LikI++z15pcadhvzRD7bTbvUzfBxai2pKqae+FXhKr6CZHdOIqk1+VteM7p3krp0w/5iH0vs60VHLwjRHioB0qTT+OJ24fVr7TtKuLLoSgjdFAuIM+Lf5xE4m8cmoVTF4FdhPvA6wUQ3/VVMymYrh797sjnnG5L8bBZx4Gy1G7uML7lRyTQhsiEqGPW4bFerK488PLJfB6ozXEo6tqL4GauIy1nD2Vx/LOLZ6WO7rJjaGqSRLKS2ZW/8Sfn0QrxgF+7HbGK83H43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib4PE4EjexcdnxfgiSyAK4wibIBbzY4hGKIBXM+ZZBA=;
 b=Rx6Ps4m6hKrfxNOWFfB01HxIwkQp/G4s1FmdPExqFSzkIkXNq52sWJuUizuRDnpJO5NrRinXN4+84yAbL/iK3ZfBawhCXlsh28oqNjOa1yUGEzdw5cdqm9B2G9Uy4raiMSXsojPJPBVgcnXdO+MUHVkkJjSO/2lDGs34zwqRZXK6yckGKL7GqxczzhBWq3jr882CgBtHIgJ3lCEPCUDxuxTA3KSYJlGzgvSnqxWzwNMqrcrcVO3CTFo72Zm4nAV3JcB2Z+Gi52ATCaL4757pNwPBAza6bNEsASis1TFig4ZhpA1eOp7h3QmdoHRSA6NdPdi0VJbzCSU6B8iHvGJzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by PH9PR03MB767167.namprd03.prod.outlook.com (2603:10b6:510:3e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:06:14 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:06:14 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 31 Aug 2026 16:07:18 +0100
Subject: [PATCH 2/2] mtd: spinand: fix zero oobavail when no ECC engine is
 used
Message-Id: <20260831-mtd-nand-no-ecc-fixes-v1-2-c2ec46641b90@analog.com>
References: <20260831-mtd-nand-no-ecc-fixes-v1-0-c2ec46641b90@analog.com>
In-Reply-To: <20260831-mtd-nand-no-ecc-fixes-v1-0-c2ec46641b90@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788188838; l=1923;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=x/xUDRpfeDTQcKn/6BxmOYSGaD0JwJ0aby3dCb6r6I4=;
 b=omOmYhLc8HqaHrQlBp6welGuSr8MtTp9c4Vg8alaooRXBF2Upwp/GeJKblQuuNcg4yP25BHHP
 qaQXOzytBeoB6A6aTLnkCndKB8jCfGw1TLrrZxJD86/eriqzO8OBlTn
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MA3P292CA0061.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::14) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|PH9PR03MB767167:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f706f5-a8b8-4789-2fe4-08df07716678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: SiyWDOHB7Dut7UbsrJG4e10T+A2IeSnu3uzTH42NI963sr9TVQ0BDiIJ5JATP+aHOoeKfkXavLnGrcR5QlocciqyXfY8ZvnO0Hn/GYDN2z79LRqEeWUEvAECmwBM9MeUy594OsCht+2AtI15VcE4DfULFBRALkRWMe3G+FeXJZtXrd6AFJIn5pWPtNmeTxOaTZre5YdvkmNsK2z1z4Hixtd8+VHZQqSOgFZ4ggcaXaAVlF9vWOiolE/RCBpQ0gQfuNQ6r1lkQ4WgBjCqLiDSVdniqydL5FlolbR1RBXO8Le3QImES1ZWTZrv/AUS/6wf73G6/QizQB7Po4Tdpy/r2/uW55dUmteuXsmuJ825wPGsaWahl4dKhL0nzy1WpHGaVikT3JWLzGK0oMync3Dh68/9GXk7WI/3v+4sflY55VOPoACi3gLxVW4kj96H82T+lAHNIKgOdbWKm/4qwntrDqZgyrMsDbxKqy58IiaY46oR6IFtKw3ShYV9LK/PZEJkFzRIXTKvRYkgOGvqp978twhhCG0gJjM2y9KqZnYNgECoefYcbS1/rl+CqzE7e8d493kmNGc6p6CRc9OiHS2mBMEleGSDmhlmhmOQisbQF6cYM1iwnoXiyw8XJI7kd2YSLoH7gtVRcK9IX0SBW4TM1guxvufcywdC6jzWUKgpWNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1QyYUVsRG14RTBtWldBbVY4cHp0cW5VVEpNaWdQTlIyRWowd0dFMWRibXNV?=
 =?utf-8?B?bnIrUzZhc05IMldWYTFDOVlyOUxxcTJJQWc0K2tBbk5zZGVTeW1uZ2RsVFo2?=
 =?utf-8?B?aHg2M1VQa2VpWmloSmdZN2kyN2dodGxCZS9RVjBYaVltOTZpTnUvOWJDbkU0?=
 =?utf-8?B?TXU4YXhIbStRekRDTEpKd0I2N0p6dDNUMkRuVlhmK1M0RVllMzV1ZjRwMDd5?=
 =?utf-8?B?eURycGpEbWk1Y0FjTjE3U3EzOXFEL3FybXArYnpyNU5jM3BGUUpRRCtaTnY0?=
 =?utf-8?B?clkzdityVFpwL0hhYS9BYk5FRWFUZVZBd2dxUVgyYU9GSndrVm51TmQwZEts?=
 =?utf-8?B?Y01EbDFpK3V4Y1h1V1o5ayt4SVNWQXljSXVsUmVNL21DU1RkU3VuU0hXVzND?=
 =?utf-8?B?TlIxTjVTLzd0cXZsNWVTdXlBTXRZMGdHVDhVNnhqYnh3K2xlekxQdWJ2RTdp?=
 =?utf-8?B?WjU5Znc4LzhXdmk2SHhBbER5cElJa204QVpTOEFLOUZ4cGZSa1hlcXZqcUpL?=
 =?utf-8?B?S2hLL3NJQWlzc2g0V1hCQ2tlUUZ3b2Z6ditlYTd1dzNPM0Z4TGRIYjRLanYw?=
 =?utf-8?B?czJoN1NnRFNJNlhzeXZpZXJUUy8rMVdsbEs4WlBOYkxVNE9kVzF4ZmtGWHlM?=
 =?utf-8?B?d3FiWGlEdS9wVVp3MlJuMm0wa2JOSXI5emlYMjBsdFJ1UHBFSzJpbDlDS2FU?=
 =?utf-8?B?bVIvbEd0WEVhNExwQzN5Rml2VHFUd3YyWlhrSFExaXRWV0JjbiszQkRXdnkv?=
 =?utf-8?B?SXk4UmhzSGxxMDN1TDNvbU04SjBGNXVlTTdyU3pjbC8xd3dIYWVGU0lDQVpD?=
 =?utf-8?B?dVVmcStYMGJXd2JnNzAwTkFnL0VQbk9OYUJwQTkyU2JPOURBZ01zdmZGMFlK?=
 =?utf-8?B?UTZXbzI2d3pOQ1JiZDNmaG9TRE02NVp6ajlIamxLNTk1Wk40R24wRThjT1Yw?=
 =?utf-8?B?VzNyeGNoaUxwVkhXRGRxWVlEa3JyNitTSkVtWUNRTDVPcmlYbGZTUEMycGtp?=
 =?utf-8?B?VHA2bzFtN0tNVGJnUEVCZkpwSGxYVnZBUEY3Uy9iU3FzOUlVWWM4WDJzUkxW?=
 =?utf-8?B?QXMwZEFJcSs3ckVYdkRiaDFzR29lZW9TNG52Rzh4NzNMcmhVeWJ2UXYxbklm?=
 =?utf-8?B?QzBObFZYNW1kSmtNbmE3ZXR2N1hHbHBwK3pmU2FSTmdsYW03UHNvSzEvK3Jy?=
 =?utf-8?B?bk56MnAvN0NJc1F5UXhwYmVtTmNjdm9XcjFaSUE2T2FLYWpMNXB6cmdxWG9F?=
 =?utf-8?B?NFl3elo2clJFeC82Y3J6cDdMbnNBcDFGdmdYZWVTbUNnclo3VW5ORExPNzdZ?=
 =?utf-8?B?amZGNTZMSWZlc0k0WDUrN01VcG9uUGFHemluOS9wSG00cUQ3cEhFUmRJdWlw?=
 =?utf-8?B?ZGxMcklaK1BOOWFYbnY0STFRVjVINDY1Q0M1cytBWjZiRUVPcVlENFRFeDJJ?=
 =?utf-8?B?RnNYY3V1aUhwbHo1Z1lhUXJvM3NUTnlzWEtRc0g3YXhBTG5aazM4NTdvNHNu?=
 =?utf-8?B?TEtNTE54bThQSFhsWWpIVUhsOSthSkVseDRvaTlmQmRuQ1FNbHc4OEJJZmFB?=
 =?utf-8?B?RE82UkxZdVdIZk8wZTFiRmJJa09ZSTIzSW9wbXkvcTdZdmszWWNDNllwMmFU?=
 =?utf-8?B?TnpWSjRWajFXc0FXMnROSDlCTFF5Ym5CL3ZQRHlhbGVDeXpEbmZ4clBtZ3c1?=
 =?utf-8?B?Q2VOZ2NKNW53SlpRNENEbmwyZzY2TU4rUHpwZWJ4ZzlZUWNtbGNYOUkxdWNn?=
 =?utf-8?B?ZTcvS2RRbjFRdnlsU3p3Qng0bW5MeFMwNlRRK0NVLzExekVlM3ZZblhYT3Vx?=
 =?utf-8?B?ZXNCd2NlV0hIUEtqUjBESWpGL0RIRmNjMXZHcm1lS2VrWUcwa0gxWCtGV3Z4?=
 =?utf-8?B?bkV6d0l1bnZoc0RIMHpBbENJQVRVR3NXZUpzMHJjbERhNHhIUVh5amJCNThm?=
 =?utf-8?B?dm1kQXdkV0QyQVppSlV2RzhyYzgvdWM5UW9xYVFUbXFPSmhDRHdrT1V5RStJ?=
 =?utf-8?B?aXJwVXZpeVZZaUkwWjdiM2FQSkV2cG9wYXdxZHBLZHJUWTFDdEViNElDVm1m?=
 =?utf-8?B?anJ2aG50QTZ3RGViMnNZang2dG5ZU21tMzI0YkI0SjFrdjk4RzFKTGZDU1lU?=
 =?utf-8?B?aFNIZ1EzaGs3Yk9VSHFaNS9FODVwOWhRUEdMbmdoL2tvVHpoYzllamtMVE4x?=
 =?utf-8?B?ZFVobFVkT1Zzd3FKZ0wwWVYyazZWZ0tJamMzNVJPNnF2amtIRGphNVpRcTBk?=
 =?utf-8?B?UTJMTDNPWkIrM0pqalViR1BoalF1bU9XQ2NJdEVjWTkrTWVqSUhDaDlmNGI4?=
 =?utf-8?B?RkZIdThFbkZlajJuUndqZk9RVlZ3MTR1dm1qK2krOEJXa0RQUzV6Zz09?=
X-Exchange-RoutingPolicyChecked: Nkvju3YUodzkJIBnXMmon36BS0yQkOcrMnH8tjsopl2df04kNVAIox7AqhhxRDUXKBzlSxzi6Z34VhPREbSTXfI66JkomT82/PvQFBdwaJ21P3JwFQNnti2wlK+zIB0z3Qy8FHdE2S/rKPx61jng27UObBSZ7lxJ2So0GIoXjYGurNqZ8OsGZc4jaIBOaiu4oRbA/buAxdlugNm7fV+ce4BOVIVHu9EUzf4dwmxaxKc7vo4tl+8qjkat1F0mDy9RwUOsyEUEuVwbhoxU/TX3rtQl6VrCe88A+P0OONC1+acUF8k4rBf8UyJ4JhB5pQ1NJuYgy/ONcJvgd3Do/OI21A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f706f5-a8b8-4789-2fe4-08df07716678
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:06:14.2470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf6kFjGXfeeytWhXo1Mf514W7xqX5Qqo7irqJXuJy2O15XStBwPFLzyAdlxhpIilo1ww8YNZLwhCwwJPuvymOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB767167
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzMCBTYWx0ZWRfX2trGV+GR3SaS
 /PfrEIKq97vaicnKqVhR4v49B3GTzV8XFtE/i+i5YyPSTY55UPx/jkTJhOjQzFbiHIm2LbYHSDb
 LoOSGH5NGNOzALXYf3jVQt3y6ZWqIwuZhPDaP9daQIT1MYcTkduq
X-Authority-Analysis: v=2.4 cv=feSdDUQF c=1 sm=1 tr=0 ts=6a959867 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=pgLpeqkCuYE-37Z2sHMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 79b-lh6TnrFjR1wkjJTlGERIdVcr3VE2
X-Proofpoint-GUID: 79b-lh6TnrFjR1wkjJTlGERIdVcr3VE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzMCBTYWx0ZWRfX2n3jvtJGUYJW
 Ndp7DrygOoklEcXWM/qw8fzrsXixQFLN6SZ9IApTgOxF0PbST34D1H69TZAvyRsbYgMyjpkcwA7
 mR9FXIqdLb5cDPBf+nDaTRf/7u2XrVbm345doyggfojLLTAMezlXWQ7/Cii63IjXV+zLd3TOokj
 U6j5Am2IVDLqtvQt1u0rheb4tnkJ6GFZ0SCpJx/5abcMvRiTwrS7CKaD7eIOauYjvNWP3lqQUwm
 Ew+h+NyH1AHC6VgoLW9J7GsEb/TWEM/ol2KNsOBXXC5Kq59Q7/uqMCP5aOLy/auzdD6ydycUmjf
 lu6UnqK5F6eXG3mHeZ4dAzPrmv7NOjMjuqCBO6Sx1g1SSXvEmBdBKq3xMRnxb9QwVH8g/N4w6Cw
 rdIMUiyxMkmGxTHq8XE1teVwOT3ENtQcHochO00qpDYoMh8DCQH5HAzNvPaxOSI+A1WZJgrjVrl
 7m9CcccPppoTarDTtIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_160624_606657_3B67A83A 
X-CRM114-Status: GOOD (  16.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q29tbWl0IDAwYzE1Yjc4YjRiNCAoIm10ZDogc3BpbmFuZDogQWxsb3cgdGhlIGNhc2Ugd2hlcmUg
dGhlcmUgaXMgbm8KRUNDIGVuZ2luZSIpIG1hZGUgdGhlIE9PQiBmcmVlIGJ5dGVzIGNvdW50IGNv
bmRpdGlvbmFsIG9uIGhhdmluZyBhbgpFQ0MgZW5naW5lIHNvIHRoYXQgcHJvYmluZyB3b3VsZCBu
b3QgZmFpbCB3aGVuIG5vbmUgaXMgcmVxdWVzdGVkLgpIb3dldmVyIG10ZC0+b29iYXZhaWwgaXMg
c3RpbGwgYXNzaWduZWQgZnJvbSByZXQganVzdCBhZnRlciB0aGF0CmJsb2NrLCBhbmQgcmV0IGlz
IDAgdGhlcmUsIHNvIHRoZSBkZXZpY2UgZW5kcyB1cCBhZHZlcnRpc2luZyBubwphdmFpbGFibGUg
T09CIGJ5dGVzIGF0IGFsbC4KCm10ZF9vb2JhdmFpbCgpIHJldHVybnMgbXRkLT5vb2JhdmFpbCBm
b3IgTVREX09QU19BVVRPX09PQiwgc28gYSB6ZXJvCnZhbHVlIG1ha2VzIGV2ZXJ5IGF1dG9tYXRp
YyBPT0IgYWNjZXNzIGZhaWwgd2l0aCAtRUlOVkFMLiBKRkZTMiBmYXJlcwp3b3JzZTogaXQga2Vl
cHMgaXRzIGNsZWFubWFya2VyIGluIHRoZSBPT0IgYXJlYSBvbiBOQU5EIGFuZCByZWZ1c2VzIHRv
Cm1vdW50IG91dHJpZ2h0LCByZXBvcnRpbmcgImluY29uc2lzdGVudCBkZXZpY2UgZGVzY3JpcHRp
b24iLgoKTm8gRUNDIGVuZ2luZSBhbHNvIG1lYW5zIG5vIG9vYmxheW91dCB3YXMgZXZlciBpbnN0
YWxsZWQsIHdoaWNoIHdvdWxkCm1ha2UgdGhlIGNvdW50IHJldHVybiAtRU5PVFNVUFAsIHNvIGlu
c3RhbGwgdGhlIHNhbWUgZmFsbGJhY2sgbGF5b3V0CnRoZSBvbi1kaWUgcGF0aCBhbHJlYWR5IHVz
ZXMgYmVmb3JlIGNvdW50aW5nIHVuY29uZGl0aW9uYWxseS4KCkZpeGVzOiAwMGMxNWI3OGI0YjQg
KCJtdGQ6IHNwaW5hbmQ6IEFsbG93IHRoZSBjYXNlIHdoZXJlIHRoZXJlIGlzIG5vIEVDQyBlbmdp
bmUiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8
bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDEz
ICsrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCmluZGV4IDAzZmY0MzQ0NTY5My4uOGYzZDEyYzVkZDkwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jCkBAIC0xOTc4LDEyICsxOTc4LDE3IEBAIHN0YXRpYyBpbnQgc3BpbmFu
ZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKIAkJCWdvdG8gZXJyX2NsZWFu
dXBfZWNjX2VuZ2luZTsKIAl9CiAKLQlpZiAobmFuZC0+ZWNjLmVuZ2luZSkgewotCQlyZXQgPSBt
dGRfb29ibGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwotCQlpZiAocmV0IDwgMCkKLQkJCWdv
dG8gZXJyX2NsZWFudXBfZWNjX2VuZ2luZTsKKwlpZiAoIW5hbmQtPmVjYy5lbmdpbmUpIHsKKwkJ
aWYgKHNwaW5hbmQtPmVjY2luZm8ub29ibGF5b3V0KQorCQkJbXRkX3NldF9vb2JsYXlvdXQobXRk
LCBzcGluYW5kLT5lY2NpbmZvLm9vYmxheW91dCk7CisJCWVsc2UKKwkJCW10ZF9zZXRfb29ibGF5
b3V0KG10ZCwgJnNwaW5hbmRfbm9lY2Nfb29ibGF5b3V0KTsKIAl9CiAKKwlyZXQgPSBtdGRfb29i
bGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOworCWlmIChyZXQgPCAwKQorCQlnb3RvIGVycl9j
bGVhbnVwX2VjY19lbmdpbmU7CisKIAltdGQtPm9vYmF2YWlsID0gcmV0OwogCiAJLyogUHJvcGFn
YXRlIEVDQyBpbmZvcm1hdGlvbiB0byBtdGRfaW5mbyAqLwoKLS0gCjIuNTUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
