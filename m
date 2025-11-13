Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3299CD4F5B
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Nov 2025 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Cc:From:
	References:To:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XaIVmn+5SO4LwILrWmVD6Da0QMTaLtTgbSsOVvRlF8=; b=SFsRw2C5G4HtfW
	aK63Xu1hOVjGuj+T8txelGMOYRJ5T+ZM6SMMxJhk6cS3P/UPZMHraGWdnsUGJ/tjtqZ7gUgOZKXX9
	7z2cbKDRLEfkzlfVeNNr1B5thMiZBTOpMjX3FNs1TVAZXazD4ZL17SFoDYvQ3HV3xZDFQXPligGjy
	psTqNhLNaFJMrk5XDClGojCNRZagS2ebrrdMqpvPM90PBjDn77WHYp/dcLPSREGWT9r1SiXD4e+bP
	1Hbd87v8po2dop6aWga0Lkaln33cHsAntI2CISLjYspdu2OYI6JkGq66OVMqKT2T3Bb28Nx4VFArt
	aYshvZbxvtw5emHkUIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSk9-0000000A6Zf-2LWJ;
	Thu, 13 Nov 2025 08:31:49 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSk6-0000000A6ZI-1xHc
	for linux-mtd@lists.infradead.org;
	Thu, 13 Nov 2025 08:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLxwdF1/0xqOXJhV5zwHREp5/t8zLUK4oo1KO1U/Y15VHaZCy9VjKfBW1QMRXocuO1bPNxIThYv6a7VJXtwBQuTe4gLNRz/c73Q2SV1o/xs6YJ7sCgyXvSDjz9z3GSC5/fgAI58tHZHSidvfpVCctaD0OweO49hd0Z98RqUIMSa3VxOEgLvtX+BP5HBKzVeJKONZKuEe6La2k+FZly6tctvOt7ylUZA3KhPWiIXEvK1hd8lthKa5h4WieSeD/+2K4q9UKnqp0YiJOofmU5DKSVPwClqZOyD6MTNGhmiHt3f7yTiA3UjpXWvsNlcaPpMUdTOXpJSJcV95uI5McM/RRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TsGHPFIkpUMgMwUK1m7Dk2TaK3k/wOAy4BwyyhZcRk=;
 b=MhdZ0nh3uSk/pOv3GlDYBO9sFBPemVitjFqLKtrJR8jh3xV4EjbwimYHBthHmDy9eR+wYllFNBRvRLBISmxc0wyCG5fKUUbegzY4m/Pkd5iQpSHS4Cp0Vl/HFLOe/GgbLZVAG0BQX3eAqPrI6vQQTH8RE0YkrQ+TUfPNpy6UNFBOvNTIXJ6VDJv0y8VbK6O7hQKnbiAfU/QlcPPqn4BvGzVr3+2T/6ntzHySp5WZ7ltwBrOV+GfAWcHwECS8iX6qbAl9oiZwf5angsvyWYU383Ojk7gcUjs81dipWaOfU9fGJyhOonG+mn4W/7uoHMm2YVRxHQ4R5R761kEiSLhW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TsGHPFIkpUMgMwUK1m7Dk2TaK3k/wOAy4BwyyhZcRk=;
 b=lxB2LsTIU2gKrOIUOuVBemhHlwmGt1cw2/8oH8SElzYHUiKxKf++eiLCzbz1OhMZ7w/mbMuLXPBzJXaZqcSgiLlPdysnq2C122BvBY30cKkArsRPVYCoOg9sEfF+GdBBkXPE0Rj0QLwMwcdWgm+hZO1EMSWLM9wgMb3CKEUgjbbWTP+xM8f8VkWCLUh+TWK5jT3ZubrYz9xusnMeb7rZKkeajviD8mkx2p/AfmnOD4vKzv//DTtPpfbW3e3GM/TyUemLzeDXY7Q4nWfCBThJVapj/FGBgK+bSkvuoF4iXdIapmw0AANlioRuhJWnfiFICLxC3MvwqvwNZt/uq8Th4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TYRPR01MB15417.jpnprd01.prod.outlook.com
 (2603:1096:405:286::14) by TYRPR01MB12488.jpnprd01.prod.outlook.com
 (2603:1096:405:1a7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:31:33 +0000
Received: from TYRPR01MB15417.jpnprd01.prod.outlook.com
 ([fe80::1186:b5a0:9df9:a9ee]) by TYRPR01MB15417.jpnprd01.prod.outlook.com
 ([fe80::1186:b5a0:9df9:a9ee%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:31:33 +0000
Message-ID: <0828e7c7-c036-49ad-9019-8f94b6a87c27@lineo.co.jp>
Date: Thu, 13 Nov 2025 17:31:32 +0900
User-Agent: Mozilla Thunderbird
Subject: [PATCH mtd-utils 1/2] fsck.ubifs: don't use pointers that reference
 out-of-scope variables
To: linux-mtd@lists.infradead.org
References: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
From: Yuta Hayama <hayama@lineo.co.jp>
Content-Language: en-US
Cc: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To TYRPR01MB15417.jpnprd01.prod.outlook.com
 (2603:1096:405:286::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB15417:EE_|TYRPR01MB12488:EE_
X-MS-Office365-Filtering-Correlation-Id: ab717f6d-26ce-44f1-d8a5-08de228f0d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3VJdEl5VzVqa3hDU1FaZkZNRHA3QndlVHplT0pCM0JnRnFraXFKN1J3N3Av?=
 =?utf-8?B?RmhGa1JGRUlwQ0huUVkwUExGWTI1M2NDcGxQNXRVb2ZhR3JrWDRIWjFpYlI2?=
 =?utf-8?B?dDYwN0E1ek5sbzNpS0VtNFo5S2VpUmJyZ0hPSHo0b3ZvVmkzWC84bUxaaGFp?=
 =?utf-8?B?NWdGalVzcS96Q0prWkVyRXNDR0d2aG1ZQzYvZEdRcFFxZ00xK2dIMk96K2ZN?=
 =?utf-8?B?S0hEUkVLUHdsdm9mdUM2VzNMUng5YVhLSjlCQWMzdGpWNGRvMnJncmpuTk9m?=
 =?utf-8?B?RmVnQlRIMWw1YnpaUjliYUMvTDNkQ0ZsZjRLMXRCNW1SY21aTHF1U3ZiVklU?=
 =?utf-8?B?OFdhL29PYklMamJrNWN2NWd6N05OSU1FUVpPOVY0Zm9ENVVzeTNlQWV6Ymt5?=
 =?utf-8?B?T1NDNURJdTdCeDhQNkpBY1YxOGcvSEtTeHE1d0lzRE85a1JPWFJWUWFtY2RR?=
 =?utf-8?B?R3hxYnlsaUZZd215N1haT1AvdzFOWVhCeXYwYWJqWVpZeHJ1QUpyR01BRGc2?=
 =?utf-8?B?cWNhNm1lckxmWDgybGcxVURXUGJqcDlDT3BnOXowMnZyM0VubW9nTnlpYXln?=
 =?utf-8?B?dXdEek4zVVVGMHZBdkpZUjluR0l1cnFDUFR2R0FveDBheHMycmhlZzEySEVS?=
 =?utf-8?B?V2VJSW5kZUZMWXdySlVEcnppRHlrOHErWkpkdk11UVRZTDU3endMMTVPQ0hD?=
 =?utf-8?B?cWV0U0JQQWRvaHVDNGpXWTRUTlo4SGpFYUU2UzZ5WjFuemQxWjVkK3ZUOHlG?=
 =?utf-8?B?ZzdUWS9BK25tRzNIZkRTL2NYUDF5bnRZbVpOTTZIUytuZjZ0emJ4Q1Fid2hN?=
 =?utf-8?B?TnVlT0RjV1I0aU14bTVzUURLb3g1YTZpSjlhMFBuc2dMMnV5ak03TGhic1Bo?=
 =?utf-8?B?cVFFL2g4UVBaWkN1aGd3eHZYdG9uZXdvSkJpanFMOFJmSE5kNjlqamszc2lR?=
 =?utf-8?B?bDkwSmhuZ3prU294NUw2Mld5YklVSmpTMXF1UnpiZS9pa1l0UU4xNklaRjhs?=
 =?utf-8?B?RmRqd2FWRGdwcXcxUDlSNXpZMG9MQ2tiOGUwYlFBaGxSMXR5WTBWSHFyaEky?=
 =?utf-8?B?WVBud2g2blNsTFRBZjBGUmh2VE45UWNSZFZtUDJSREhVNkxmaG1rdFlaRjBY?=
 =?utf-8?B?eTRrWVBGRXR0QXU2Ky9jejA2eHpWYkh6VERRT0wvUzUyVld0UDhrd2w2UEhw?=
 =?utf-8?B?Sm80aTFXTGdZdmZxMWdQbHpVZ2R6QW1lMldCMi95MlR2cmtmYTFncm1mSWpx?=
 =?utf-8?B?anNEV0RMSmJ3UmxmWk9JVVVTejlzbUlhcEcvT0VscFV3SG1SVmVHK1ltL1lh?=
 =?utf-8?B?bHlhRG5hQS85dTlKNGhwZDhCN2dKREVsMFl6aWNYY0xaSkxLZzRxaldqcHFv?=
 =?utf-8?B?bHhsdUc3dlplSlZNZzBkeHlGUkljQm1rRGpSTW5paG91MFBKOUYxcnJwZzRG?=
 =?utf-8?B?UWZoN3NVSm5vREtXRTdYTWZNZ1l4RFpKdTJjZHEybVNKYXRvcnBjNWxRWW92?=
 =?utf-8?B?M2tjZXhJalM3YTVMaG0xMW1yd2c2QlhLajUvaTBHSXUxU3NvdjdlMXZKU3ZT?=
 =?utf-8?B?ZUZldmZoY2o4RkxZckxYN0RyMXRpZXZTbTU5U0xBZEVjVGVBZXFHYlF6VjVx?=
 =?utf-8?B?ZGhZNDJCa29qQlVmTEZKR2dzQ29RWkR1K3lZbVpqNW1veDFkdXNDeW9qUGtp?=
 =?utf-8?B?eTd0bDVxUGR6aTZkT0d0WHlnTjlySllVak1CL1Vndk5qV3JEa05BZmZRenZ4?=
 =?utf-8?B?cmpKMU9Vcnd1VmY3WVFtWERYN2tuY2RManA2YVdvTVNKVEoveGVZRW5BWmkx?=
 =?utf-8?B?ZCtqa0RlNTUzQnNtU3ozQnVlKzVhVnJiSmdQdnBBMHRYYU1ISzZSQjNwM2xL?=
 =?utf-8?B?VG5NUXk1VnUwVnJtUURvTm5xa3Y3d0VqQlpOcEt1dmo2YjFBNzg2MDJ4OTB6?=
 =?utf-8?Q?oTJf4acAflo6MJDmIy3Hq2zkzkrSx/qj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15417.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRjaTIyYlZCTDVKenArODliYnF3R3RrOS9ldENCY0NTMU1PUkNHYVpOU0lD?=
 =?utf-8?B?Vlk4dzRMdm1QdEtFNk1PYUNleXBheHJMYktZM3lUT2k2VlhHNDBoNXVlb1VL?=
 =?utf-8?B?TjhiSWxkZVFEL3hLNy95bTNLTkdZRXZueW1UNFZjOHJtYmF0TGtwaWZDczk3?=
 =?utf-8?B?UEdhOVNITnQxNFZNWWI0bDZJakhzb1hUZHVJdnpXMmZ0c0VuU1BCMXBpYnZZ?=
 =?utf-8?B?ZzRJK0NVeG1iRi9ENXE5SngrTHQwNDBBaVlJaitTRXJBdkJwdHhRK2hTWE91?=
 =?utf-8?B?bzVWcVR5Wm1Mb2JsWmRCNDVTYktWaDFnNnlGM2NBRjJEaWFLSjJYSVFYbzhM?=
 =?utf-8?B?aFh1TmhrT2Q4WXpPZ0wrL1hHNmFLQ2JTSzd4bHRDR3FndngveWN1U1RZeGhX?=
 =?utf-8?B?THRyYjZpcHE0bFA5VUZsbzVnVjNZaGxyVk5OQzZWZlRmVEVGbmN3cStMVmhB?=
 =?utf-8?B?b040ZXFyZitnZEFHK012SGRXRk1UUEZEYThLUTZ0SnUwMHcvTEJFYytGVTlJ?=
 =?utf-8?B?S0ZoVHdoYVYvbU1yWGJtVWdtL3UwbDNHWUlKeXdHdjRIZmIrMExjVmxSK29P?=
 =?utf-8?B?VXF1bzMzOElWSm1PLzgzREhDVTd4eXFiMGVrUE05dnB0RW5nK25FMldzdDEr?=
 =?utf-8?B?Y0N6MmxNakR6a0J4Q3Zya3dWNG8zYldpdmR5OEdTcXg2WVk2K1FkTUl0dWNu?=
 =?utf-8?B?MkZpRnRvWlZLUFdHUFB1RG5RZUkvL1hSU2VVNUZPOWg0dm5JZTR6VnV4alZ0?=
 =?utf-8?B?YUVhcXpFR0dPVjlMZHUycWx6bEVBMTVLZ2tlT0JGbVpFZGpkQXZZY2ZRNnJ5?=
 =?utf-8?B?MStxQ2w4S1ZzVWw4NWYwc3dHRnpDK2JIWStJdUMvTnkrRFNYbW4wZEpEUVhX?=
 =?utf-8?B?OWhZai8weExEamV6c2FLK2ltVTlYY240eDdwL3ltZG5kb1N5NDhMR0x5L3FS?=
 =?utf-8?B?bXlCK0VZOTd5Q2RYT2RNNXBveExkQitnZDMxTHV5SEtnWkpPT0VGS0NYWmJ3?=
 =?utf-8?B?L2JRanEvOXh6cG40MzNvdlhTZHBDV1F6TzJFV3Q0Mm92Y3dZUW9UUVlMemIw?=
 =?utf-8?B?STI1azk1dHU5cGVYU2tGWG15QXJ2dzFxdWYyeUlpRzdZNmxORDVTaUhyaHFO?=
 =?utf-8?B?amp3Ym5wWGtqQkU5N3RQdVM2UTlveEJ3aWc5Uk5xNngvUWlzcnVkc0NnSUt3?=
 =?utf-8?B?NlBlM3daZW8xajZoZDhrNUptcEFYaHN4R2wwSytpMUJ0SVpFMVQxR0ovNkFn?=
 =?utf-8?B?akZYQko1UC83b0Z2Z1NXdEQ4d3BDYWdUZTQxK203NEJrYUdoTC9ncXA4WHl5?=
 =?utf-8?B?bVp0YlV5RnJ6c1J4c09KVUQrbUJEOWpCU1VKWU5TdDNLdjBwWUFkZGZsSS96?=
 =?utf-8?B?OXlnbENaOGFaMnQ2M2gwaUdBUjRIbFFOdnVYTUtBOCsvaTlxbzRpUjdtUVp5?=
 =?utf-8?B?VUloaVdXMzJ5bUVOTHRldFRNWTNMRGpVQnRlNmlYSFJDYm1Sc2dmdjFRRnRW?=
 =?utf-8?B?djRHY3J2YXF6UW42TlM4a0pzYk9tUTZkV0g0cEFWU09IYzQ1UDR5cnl0M0s2?=
 =?utf-8?B?TE5sRkpISnRtaDNPQWlKNWJEL3VaZFRxOVRNV1NYODFRKzFGYzdnQUlFa3Zm?=
 =?utf-8?B?R24zK2dSZVMxMHh4RjRsMklyNGl6dUoyUFJmN0l2UXB2cVZta2ljRnRWZFE5?=
 =?utf-8?B?aGVWM3VzT1JuYjJ6ZFRpRXNaajhteXhmenJyRkM5OHJUMWs1Y3pzNUY4OEhl?=
 =?utf-8?B?QmZ4ell0ZE4rRTM0RmViN0ZPZjRGclV4UzFpa0VBeXdDY3hIK0t0aG5sRGVt?=
 =?utf-8?B?NGtWc0hTVlhGM1BBYzRwRStNSEMxSG82eXB0aVJ4RzFiNVFjR29wV1hDVHlv?=
 =?utf-8?B?OUV0QVUyTHFQa09idjRBK2IyeU5BTm94SXdKU3d1aUxiWUNjd213aml2N3Bk?=
 =?utf-8?B?a0RlSmhvejErTFIzWmRyUG9QVldVM2x2MnFRK2QzbThkZXZyM0NWeDByWVRr?=
 =?utf-8?B?ckwreU82aEpFQ0ozMTdiYW02OFFaRzVmSk5hY0FXRHA4emZLamgxWDI3OXQ1?=
 =?utf-8?B?U2RXcWFnLzkwQldFeFpIRmlKSHpaNjBvbmJkdDdENk5aaWpFSFoxeXFsVDdQ?=
 =?utf-8?Q?3ORsg5IigJtwgjR2D+L+4hkKM?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ab717f6d-26ce-44f1-d8a5-08de228f0d74
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15417.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:31:33.5283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/HrEsSjtMooI+V4uX1rQq+2tGpsvEZ05jEwEY5RCv8ApV29bE7LJfLZOjLXw9RkZTl9tcEvINkxULzaCQBWxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12488
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_003146_512998_5D30B4C9 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

sn is a reference to either an ino_node, dent_node, or data_node. When sn
is actually used in calls to dbg_fsck() or insert_or_update_file(), these
variables must not be out of scope.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
 ubifs-utils/fsck.ubifs/check_files.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index 1e1a77b..54300a3 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -57,12 +57,13 @@ static int construct_file(struct ubifs_info *c, union ubifs_key *key,
 	struct rb_root *tree = &FSCK(c)->scanned_files;
 	struct scanned_node *sn = NULL;
 	struct ubifs_ch *ch = (struct ubifs_ch *)node;
+	struct scanned_ino_node ino_node;
+	struct scanned_dent_node dent_node;
+	struct scanned_data_node data_node;
 
 	switch (ch->node_type) {
 	case UBIFS_INO_NODE:
 	{
-		struct scanned_ino_node ino_node;
-
 		if (!parse_ino_node(c, lnum, offs, node, key, &ino_node)) {
 			if (fix_problem(c, INVALID_INO_NODE, NULL))
 				return add_invalid_node(c, key, lnum, offs, iter);
@@ -74,8 +75,6 @@ static int construct_file(struct ubifs_info *c, union ubifs_key *key,
 	case UBIFS_DENT_NODE:
 	case UBIFS_XENT_NODE:
 	{
-		struct scanned_dent_node dent_node;
-
 		if (!parse_dent_node(c, lnum, offs, node, key, &dent_node)) {
 			if (fix_problem(c, INVALID_DENT_NODE, NULL))
 				return add_invalid_node(c, key, lnum, offs, iter);
@@ -86,8 +85,6 @@ static int construct_file(struct ubifs_info *c, union ubifs_key *key,
 	}
 	case UBIFS_DATA_NODE:
 	{
-		struct scanned_data_node data_node;
-
 		if (!parse_data_node(c, lnum, offs, node, key, &data_node)) {
 			if (fix_problem(c, INVALID_DATA_NODE, NULL))
 				return add_invalid_node(c, key, lnum, offs, iter);
-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
