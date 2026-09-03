Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E38C624A4
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxM3xFMocEbxnPMp9gx2NwLN17bxh+KgsSAA+5GJKXM=; b=JIwfHWiLn/9WUc
	bV3RqZEObgxGSWvAzA6LSRMe2aSCP8fNgquGsRw+NxkyB/nD8y+1i58I5DrHjfJM5pd69tHM4eovi
	fu5qmkOZ0edG2C+ohlIb+RSpjvXAEhvY9uug81v3sWfns9xwHYXvJne4f4cORWIM5ggaliT83Mupd
	qFQI/CZvWRu8CfhGVgE+ALQ4hRiL7NDEo+PpQGPsKLYPymVhxdQPx+g6HmMIPwk4MDEm9l5epz08p
	5fntllO1wR6+7RRdhjGnEtCI+FUt59K8jWzSoCVKJfxcTZszVfsBZL2qHIZc2gNFD8YbK7Q395qRc
	Z7JPNypG4YMhlEDVfrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26jA-0000000HJvB-1sBN;
	Thu, 03 Sep 2026 12:39:36 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26j7-0000000HJuf-3o6i
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 12:39:35 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AFS82851052;
	Thu, 3 Sep 2026 08:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+C/8l
	DC6LCOTk3Gwy6DIh8WoPH3szjMLYujc7yAd0GU=; b=fcy9dlNIpkBI5M/lUXvEA
	SrEhQZUFB8I5UPpB6GtaeQxPYK/QMO+3/tWutkoMloV0FI4UeF4LoQSxV71hojsb
	lRdse/sH/tPUZSDb6QWKBtmMTifbLIs8Qmm4EYO3Uf8Eq+6lUDeZ1kM9sWtJeH3x
	PWpBV9HYLXlhgBr5bQ4wUjWsARnSsE6wMa4hpU8huUOeCrAiuTk3iAvwzWGASzro
	+pN8svKqdi5/6dFdSu7OODetVHM3D5GcrgfJ1icb5TVHoosyJ1Gvzs9W/vdhJF4h
	TtQYCXUnr47/moRk3vmsPYc7wFJQIsT0cClfoVsmvU7d+Wba7Y4UkcGWtus1JqmW
	g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012055.outbound.protection.outlook.com [40.107.200.55])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gea7ufpp4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:39:25 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V42qEi/CbHAUzh8NlHVpzMWKM6X8ita64YuAlsBiV3E9MePf5q35GjAc4IR+JO6nrbcSaAV+sX/hE2SPB7XvkGi9VMVn9RZljrDYdKPzRVm93urKn2StHrAe2RXzkZMk0PoSqgW+dXdvhEk4rEDaTFKscPrNmrp87T3LdaO3qdfqBk4LiOI19Eh47CeYTesxto8CE1soQx6tRbF+/CdgSwgLGbIv6VoGT59eDAFlVfXbj+yzaZ73KuvoOTtQD5n1w0beVRoMzFTgNfJppALbeAphGNObQ7NRlb06DMoF4kU1RKziSXVVpTAWW9Lwhy/lcpoBsugy96c4rEZhO3kTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C/8lDC6LCOTk3Gwy6DIh8WoPH3szjMLYujc7yAd0GU=;
 b=yKr6qhLhIXn4kb6yDVI9z0CdmjIHMrZS/Q2pKQq5LACOYQNrtsHolGLi/h9jJiSRBYLCzLqcNpPWZETy6ST3oRsgfuL1hW8v0EnmE/gsFUQWitRl5shXAwfxhcPly44bI1hM4fuPwqAs8S2zewThGLUouI2LPZ1vO7fnLi17XuK5YLO50irn+wSbz2lA7BEd/a5XkjMpUoz8dBUPHwmFOjbTmHLdAjVvNzBxc34gFQ8lVP4O0wxM7B4EP0fOUXmcV2wpMX0Yp2AW/KfgtlYjSpVRC9DAqcqX5JLxRNm31DAjnSA2AUAWc2afvX+Vmddy/+ZtRSKD8I9qMisyFJhCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SJ2PR03MB7476.namprd03.prod.outlook.com (2603:10b6:a03:55d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 12:39:18 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 12:39:18 +0000
Date: Thu, 3 Sep 2026 13:40:22 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N08LW
Message-ID: <aplqm-84OXtDF4oV@nsa>
References: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
 <87h5k64pa8.fsf@bootlin.com>
Content-Disposition: inline
In-Reply-To: <87h5k64pa8.fsf@bootlin.com>
X-ClientProxiedBy: MR1P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::19) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SJ2PR03MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 0181fbe5-df0e-4c6d-eea5-08df09b85eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: EgD0uUraQ9ZexGuRXV27vwKlRloFo4przkHXS80nYyzMaVFCmI7Bwq47jEC5UnRlRjEJhT5CH2BV7u2qD+2JYPmjeodSlxQOgo8WkonP/1umWTyYMPd5NSqq8weqpb13PrnfENyzYyj7HNlCQBg3L1gXwI307G6DHcw98VFyfnmZQMDDteFkR7qnU3R271w/DMLfzN/B1TtvUGJKlY2CeYwGY7gR7yWHiYctsNTv6XMPY1JA/ZUk9nY71A+l3yqH4y3RzjJycI89fmKwEGLsgVA/nVHiFrhk/G6whLgFT7u2/HoI6TjpQWJC6LIPtY8AsTN5MwB+09i5kwNFGG6cTYyD0OVOn6OFtaCoUdPfgyK7JTDFhLTvpUxvNfB0egpIczg1sUjVzdZTqYsnB4+e0e5Sy+bcERCITxqgkTSE+4tNb5lmtpjSSel52lpoDz0j9brKGLzuoBjdHITW6tFpb8IUbldvqDCT4ntFoyXEAGDtgFxBjwhtyOnTDGkrbKvj8Rp7pUowSGF1BeuqYr+cV0XfEZX+PI1OnzWZBD1/Qpa03CBEuPqYTEhkBvy/ve81iVkoQwDnJQI0VL8rrhmkbnlOuXU7beni3PHkrIMg0Uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkUrZDVOZDJCeHhxeDlYOWUyYWVSK1dPNkdkWVNzVW1DRnV3TDE2MWJwWFdy?=
 =?utf-8?B?WkI1bzVRNHI4KzdFTjgvNENDZW9WT0pnQVMwbE5jamdPU0x4WTVlb0x1a3J5?=
 =?utf-8?B?MFpjcU1NSDhoSzlhNXA0R1NieVhHUHJwYnJ0ODNMQU9sNXdKUVZuOTZURkdF?=
 =?utf-8?B?UHpzZHYvb2pYeG9ubkdkcEFvdHJ0cEVSTjhQdzVGRi9Lc04xNnJkOFpQelNM?=
 =?utf-8?B?S1VqZDdHbDhGR0JnYVVyQWhWV3BEeFMxckNOY3pubWpXc044Y3pVMWVva0M3?=
 =?utf-8?B?VVNYVVpXVVV6cHc0Nzd3VWErSEw4V3NVRVJBK01xcmpyY0IwbS9OOTRnbHhL?=
 =?utf-8?B?M05mZ1RMNlVzVUhpcHNVbXhERlZubWFyWWtjbmE0V09PcDB5QTZoUVFGcmVG?=
 =?utf-8?B?RERwRVFhaDI0M0lqRElwMnlRK2NXblFPWmRUL1VrNXBtRnNvRUxDVkFINTdE?=
 =?utf-8?B?Wk1oV1gvZlNhakNndElmdjRzcHUvOTRjYkYraFN5V3FXTm5RNlZySFVNcVRE?=
 =?utf-8?B?MWl4T3BVeDI5WEs3b3p6YmVOQmphWk11Y28rWDRnS3V5MEpkaytobzZ4VlQz?=
 =?utf-8?B?cVB4Q1NPZ09veE0vSUxzTXJPd05LUS9WUExvUllFZHlUa0Nwd0lEYVh3NjlG?=
 =?utf-8?B?bnRhN2Y0dzJqRmtTSVgyeEJxUTJpZTBkbHRDaDY1MFFpWTd5alFGM1pmaWlZ?=
 =?utf-8?B?cmtsVzIyTjdzQ3kyTFE0Tmk5STdvNk1raXBnSnRPS0UzbnhXbXlWYzFrUjNl?=
 =?utf-8?B?VWhLVThsdkxTa25YV3Vyd0plbUUyR1lqVjZLT3JrSkJGWmhjY2tVVkNyd250?=
 =?utf-8?B?aGN0aXhsSkN4bE5Za3N2L3hiNVJXendZZ2xFNi85ak5CeEc2YmZkTG5Od1Rp?=
 =?utf-8?B?d3VRVjFXbHJXNkxRd1QxK1VudUVpRkF4dEhEU3RQVUhLSFd3SmJUTE1KUDVE?=
 =?utf-8?B?eW1sVDdmS0xNWHdqQzJhREIySm44bms3ek1rUEgxL1hkbXpabm8zM3dXOXlu?=
 =?utf-8?B?ZXplSGlKSURNY1NzUnBMWktkWUNYanoxTEZ2allKME0vVmFadmt3YkNFcHUy?=
 =?utf-8?B?c1J1Mmp4TGkxYSswd1kvOEZkWS9pKytwVHZtWjc3dmNMOUdCakZyS2VWaXpt?=
 =?utf-8?B?dy9yamsyRmU0bjdpVnJCQ2lrUU9JMmQ5bThkWU02UmFRUFV3QUJUUTV6aUFB?=
 =?utf-8?B?ekZtMVhQZXNTd3JJdU11c04xbDZjalVTZXVvNlJPV0NmUk1SOEpJSVRTU1B5?=
 =?utf-8?B?UVVpOEc4eUZpbWlIMnZNd1k0Zy9HaFhhUW5RRjh5NlpmcWdwZjFWcFJKak0z?=
 =?utf-8?B?Ni9LQTVHbUpaNWVmVzBZS2M1bUxVZ2dTby9KR3NJSWo2S0hIeGsrNVoyNi9G?=
 =?utf-8?B?VlVsWkNpRTlFNHE1NmJpbUQvUUU0VzBjQjc4YlloRVZaQWtPazZNNWdqVjZE?=
 =?utf-8?B?ZGptUnhpUkpQbnZhSXB0S3A5TFVFQmN4YUMyU3F2bXhpTE5oQTdzaUxMWlY2?=
 =?utf-8?B?bkE3YWVieHRWRHhJOGFiT0xjYnBXbmY3N203ZnUwNUhoejN4b3BLRVJ3T3Ex?=
 =?utf-8?B?a0tRWGtoSWc4bXJsNkxhZVV2MWxabXN1M3l5ZTk3MU9uWUk4NTV3RzVMTXVr?=
 =?utf-8?B?YlVnMnBrcVZiSm5tQWx3MndmRDdOREZ3TXRnTkkvRGV6aGdCZ3NLbVN4cURM?=
 =?utf-8?B?S0hkRjNOTjhJYmNQR0lrNDR3cHRQWHNFVHhOOUZmNnRpdm1lK2dWMmxRTDhS?=
 =?utf-8?B?eVZSdHpZeHlKK0ZsWlk4YytIMHpBWnEwTFRrVHpxT1NqVk9kcjZScDU2dEVZ?=
 =?utf-8?B?YVMzdmhmV0dPelhKSW9MenlFc09tYTJHbENaanJGSml0cUhZNDdWTHRzWEFU?=
 =?utf-8?B?dXkrUTVPWXUySkxjSWxXbHRtbFlWNmpEL0Zpc0ZrODRuRUhUVG1WMkVneVRI?=
 =?utf-8?B?NGgwRHQwSmZxcEhHemsyTkU1cTRqSk1tMHZxVytVWVVKSGtYYUZYbXJKVXFw?=
 =?utf-8?B?Rkd2U2FJQ2xBZkNNL2FZbHlVZTBHVUVtRjhndHZlcE5jRnpKZDUzU3BZelNG?=
 =?utf-8?B?cHE4cDJFM00xS0xtMUp6a1FVZ3B2Y0FXeVpxNHBWUkx2RTNRWDdMMW5KWVJQ?=
 =?utf-8?B?bzc4WkM4cmo2SHhJb1JSeUoyZFpHbzg2WHJIUE5NbXFmSmg5SWdJenJudzlL?=
 =?utf-8?B?Qy95Q2ZReTFZRVVWeGFkMVZjSkdsdjBQcGQyS1RwU01nWUpnUW5haEdaTTFO?=
 =?utf-8?B?ODBuZzNxM2IzRHpKbk1VTm42ZkR3Yk5UZlVneUt4c2JVZ280MWlEWGVaeWFw?=
 =?utf-8?B?VnN5QUkvK0ZHT1ZTbElFaXZYeUtMY3JicjBMbFdBdGZHaDBXODRJQT09?=
X-Exchange-RoutingPolicyChecked: wZE8w0fCV9kDzAa848y7p4pvpDopquRFtuXMXZLW4KDH+9gMmp7agg23D5RQDxd1z0+1i+ngVDshW3/hyGGv6ICo2uzDZFcqEeX5B49XRoDlIkAxK6mzAwfjECXaiR4XjY6VL/kd8dEJjSFa1mW8LTd1z9Rki42FZp32PI5K6oPagHS09szWiA1rN31VoFkt+CCtydeNX0ZOXZOhHyarrNIwKro2aNYvyDkXXZRrKDjvHhJMASYaDo3JD3WhUOJyqHSfXVkNokzBbzAGNoVQ/U8K8eMezkgG95qTTgGIQJ3mATqHW9ivbPhw2kmCOD9U6bD0IaxcxbVLJsKNd8sx8g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0181fbe5-df0e-4c6d-eea5-08df09b85eaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:39:18.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGQ6KuT0GCZjD4Ly0b7UXPfVonIEXBlYy+pX9yfXNWn/uc3FtqiZOpjUH8P6nssCq/nIwzht3066O9mP7/FTNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7476
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMCBTYWx0ZWRfXw1r5TQywBFtp
 W4xH9KnBJJjpBSKf0CxKn6XloRZBrTUrFl6je4TWdaobQpYhTQz6Kc9l1OwHWa4hqhVBYSEH0yn
 yp7pb7a1LAasjlQutNrGghSeI5ks0UQf8YlJHD+JjIUJMpFSdV8HwZ8tn2V8aKAKQNXW4b8cxuD
 cuBNEmbAcrhB8Mrnm0i0abTjSzWPWhuvoT9erhrPkIAEoNcOtcrOEy8VwZu+BNQQlj0DlcCfdwt
 2xYp4JnLzeGqW+3oTIJbsGcTVmqBkiz10CHuv3qVn+kJuQGrpK0tIwSdxOPi9TC+yzczL/H0G3S
 FjZd3dz2Ku9T/J3Y4mYjgmxOXFAn91q4XdlLShTI942YVwTFWf/f70o6kyCd8jZhSuXqY1yTkE2
 Fh6IusHUvFFi0VxteWcbVXwWZeOyZZtZTnyyJhRfKGq1iA/9MMjGgSpZwwYNZnSvfs0G9UbFjns
 Q0Pqfb7hL30Ur3bisyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMCBTYWx0ZWRfX3FQPw37nSs/a
 2S1rd4/T+ZeVDIwXrC6TBd5zHNcSKvH2Zq9/B4rOcPsr1cJiagTY7oIMXiB5BT9jCrnMaVBEa/7
 UharQ1Co+uhvEbco7hdBjTfMuNt2OlGho01Xs2TgSVnOW8OOp1cA
X-Proofpoint-GUID: 0uqxgkIFZKcjph7YH9e0JN6CzovOBGy2
X-Authority-Analysis: v=2.4 cv=a6EAM0SF c=1 sm=1 tr=0 ts=6a996a7d cx=c_pps
 a=JQIjQaBRt2POjw1IEeT7Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=JfrnYn6hAAAA:8 a=gAnH3GRIAAAA:8 a=LETaAwOYFzcmk1KyIxkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 0uqxgkIFZKcjph7YH9e0JN6CzovOBGy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_053933_955504_B9A1DEA8 
X-CRM114-Status: GOOD (  31.49  )
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

T24gVGh1LCBTZXAgMDMsIDIwMjYgYXQgMTI6MTI6MTVQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBPbiAzMS8wOC8yMDI2IGF0IDE2OjM4OjEwICswMSwgTnVubyBTw6EgPG51bm8uc2FA
YW5hbG9nLmNvbT4gd3JvdGU6Cj4gCj4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIFcyNU4wOExXLCBh
IDEuOFYgOEdiaXQgU1BJLU5BTkQgbWFkZSBvZiB0d28KPiA+IDRHYml0IExVTnMsIHdpdGggNDA5
Ni1ieXRlIHBhZ2VzIGFuZCAyNTYgYnl0ZXMgb2Ygc3BhcmUgYXJlYS4KPiA+Cj4gPiBUaGUgY2hp
cCByZXVzZXMgdGhlIEtWIEVDQyBzdGF0dXMgaGVscGVyLCBidXQgbmVlZHMgaXRzIG93biBPT0IK
PiA+IGxheW91dCBiZWNhdXNlIHRoZSBnZW9tZXRyeSBvZiBpdHMgc3BhcmUgYXJlYSBkaWZmZXJz
IGZyb20gdGhlCj4gPiBleGlzdGluZyBXaW5ib25kIHBhcnRzLiBPbmx5IGhhbGYgb2YgaXQgaXMg
dmlzaWJsZSB3aGlsZSB0aGUKPiA+IGludGVybmFsIEVDQyBpcyBlbmFibGVkLCBzbyB0aGUgRUND
IHJlZ2lvbiBpcyByZXBvcnRlZCBhcwo+ID4gaW5hY2Nlc3NpYmxlIGFuZCBqdXN0IHRoZSBmcmVl
IGJ5dGVzIGFyZSBleHBvc2VkLgo+ID4KPiA+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6T3B1cy01Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwgNDUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4gPiBpbmRleCA5Yjc4YzFlNmNiYzku
LmMyYzRjYzMwNmYwNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJv
bmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4gPiBAQCAtMzQ1
LDYgKzM0NSw0MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9vb2JsYXlvdXRfb3BzIHcyNW4w
Mmt2X29vYmxheW91dCA9IHsKPiA+ICAJLmZyZWUgPSB3MjVuMDJrdl9vb2JsYXlvdXRfZnJlZSwK
PiA+ICB9Owo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgdzI1bjA4bHdfb29ibGF5b3V0X2VjYyhzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gPiArCQkJCSAgc3RydWN0IG10ZF9vb2Jf
cmVnaW9uICpyZWdpb24pCj4gPiArewo+ID4gKwkvKgo+ID4gKwkgKiBXaXRoIGVjYyBlbmFibGVk
IHRoZSBwYXJpdHkgYml0cyBhcmUgbm90IGFjY2Vzc2libGUuIFNvIHdlIGNhbgo+ID4gKwkgKiBv
bmx5IHNlZSBwYWdlICsgMTI4LiBXaXRob3V0IGVjYyB0aGUgZnVsbCBwYWdlICsgMjU2IGlzIGFj
Y2Vzc2libGUuCj4gPiArCSAqIFRvIG1ha2UgaXQgc2ltcGxlIGp1c3QgcmV0dXJuIHRoZSBhcmVh
IGFzIG5vdCBhY2Nlc3NpYmxlLgo+ID4gKwkgKi8KPiA+ICsJcmV0dXJuIC1FUkFOR0U7Cj4gPiAr
fQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgdzI1bjA4bHdfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10
ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ID4gKwkJCQkgICBzdHJ1Y3QgbXRkX29vYl9yZWdp
b24gKnJlZ2lvbikKPiA+ICt7Cj4gPiArCWlmIChzZWN0aW9uID4gNykKPiA+ICsJCXJldHVybiAt
RVJBTkdFOwo+ID4gKwo+ID4gKwlyZWdpb24tPm9mZnNldCA9ICgxNiAqIHNlY3Rpb24pOwo+ID4g
KwkvKiBOb3RlIHRoYXQgd2UgaW5jbHVkZSBVc2VyIERhdGEgMiB3aGljaCBpcyBub3QgcHJvdGVj
dGVkIGJ5IEVDQyAqLwo+IAo+IFRoZSBtb3JlIEkgdGhpbmsgYWJvdXQgdGhlc2UgZnJlZSBieXRl
cywgdGhlIG1vcmUgSSBnZXQgY29udmluY2VkIHRoYXQKPiB3ZSBzaG91bGQgb25seSBleHBvc2Ug
RUNDIHByb3RlY3RlZCBieXRlcy4gSSBob25lc3RseSBkbyBub3QgcmVtZW1iZXIKPiBhbnkgZ3Vh
cmFudGVlIHJlZ2FyZGluZyB0aGVzZSBvZmZpY2lhbGx5IHN0YXRlZCwgdGhlIGNvbW1vbiBjYXNl
Cj4gKGVnLiBVQkkpIHRoZXJlIGlzIG5vIGltcGFjdCwgYnV0IG1heWJlIGl0IGlzIGJlc3QgdG8g
b25seSBleHBvc2UgdGhlCj4gYnl0ZXMgdGhhdCBhcmUgYWN0dWFsbHkgcHJvdGVjdGVkLCBzaW5j
ZSB0aGUgdGhyZXNob2xkcyBhcmUgZ2V0dGluZwo+IGxvd2VyIGFuZCBsb3dlciAoYW5kIGNoYW5j
ZXMgdG8gZ2V0IGJpdGZsaXBzIHRoZXJlIGluY3JlYXNlIHdpdGggdGhlCj4gb3B0aW1pemF0aW9u
cyBvZiB0aGUgdGVjaG5vbG9neSkuCj4gCj4gRG8geW91IG1pbmQgb25seSBleHBvc2luZyBVc2Vy
IERhdGEgMT8KCk5vdCBhdCBhbGwhIFdpbGwgcmUtc3BpbiB3aXRoIHRoYXQgaW4gbWluZCEKClRo
eCEKLSBOdW5vIFPDoQoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
