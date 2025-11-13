Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C390ECD4F57
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Nov 2025 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:Cc:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C86gnq4117HQ16iQzkSwkciEcwBaos0l1xOxgDJQC9Q=; b=I+tZxflwRPUwpI
	txFGqsq5ylA5LszX4LhQOWu/dD+wZD9Y/P8MUyWzl1E4gV53g+BSsTB1fVdgTssU9/D/3VIBcfx3m
	tRwCjx7l1SdkF1Io3zTlsUqEb5yub0owpNkJRb1Cmr/LdcOl4xyHpGhCHYtxfPTJcVuaqUw+DF945
	mcLADtFeDtyJVHNBH9afDSwq3nHu5ZhSOCai0wPZvmETF6q65+k60BjQDdflYdhVpZtSzQZaU7d/Q
	4KNsgS92sOGgfiX17GlkbkRvU0BiEUobrStDNGzAT50XaqiO8LrU7THfEq5lAneYZmoNpquyc7KDN
	CRo16ZvPICZN4AXzbQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJShz-0000000A6Kg-3SAa;
	Thu, 13 Nov 2025 08:29:35 +0000
Received: from mail-japanwestazon11020114.outbound.protection.outlook.com ([52.101.228.114] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJShv-0000000A6KA-3szu
	for linux-mtd@lists.infradead.org;
	Thu, 13 Nov 2025 08:29:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vw8T43pQfqYErVzG0YmNI1Eu8vmpAgxukgZ+3oAWR7DCxXeiIl5CQeuktDGAFbw4yABrq1QkTj6lOcQp9yVacBYMP9w//IEGlNDWOdM5ZXez+SOo41sbM7yFu/EiGPaz5nb7WRbZELgTsU13O2FeZnBtYDXmMUJFEN5iEJ2DcS4Hn161+adhPSAXvQxUnJJ5XReRBaj0EL3vRjKFU3fzVU88bPtrrGk4s3IfCQ10jUu0h4IA3+OJXPBnOoGjjVzGS+++T13rDIi6qbwlClmC3c4pNio1ux4NgAr1zPWdbfPVzrunlKYAVb698vYL5CGBQWRYmuS1RDKIqXun46olgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47dcaO1FbOQ7arW2XIfB0UaeL2DG02KHlph2wzqNtnI=;
 b=Mne+V/a9iDPdD2ZRx3jSOYB0zpGuj09oD/lL3fe3u+tH9bG25S2fWwFx0rEWASkH2BJbeLPjuR5zcmWnU60xvRPWzabeFPDSkbkDTvtatiXeTwtbKIv3HLyMFXTzFoRHzEp12PH3F0+FjpEF1uEXP4UUTZ/sa8fSqHSovQnSNK+Vzly7XuiC5Vrri09Qk5Ln052jdEWK2Jn7EFzoPnNPppby+jOluPfQ55nuEKhK9xUIdhyrkHZhM5q8B0UEa+QbUraZqM7igc0YvrAWO7dLIYrV4ZSDVCa1BsCsNHSq+tSe73LjgIyYhJIqQxhG/nF0cgiLnFnwL967iysY61C2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47dcaO1FbOQ7arW2XIfB0UaeL2DG02KHlph2wzqNtnI=;
 b=gJBxzDxxP4GVHBUJn+OBFlgCUoNvdW+wXVhOGj/IeKSkP5K1RtP4wqtLBT+sqL/azsYAyr9oZvvvEiAXfM9KeGIt7nsuk60C3sthWITs3ftUo1eLZ5d7TiTE5q9gfPi6OYz8/xWnIwmj2YVmlc8G3Qt9OGEhWYNZN1C2QblOWbWAGU1UUzUM6j2FWyQdjaT7C8MuXjtovPn9VshilsZb6BWrD7C1MTX+M4feug+dbxr4+gLNv930BE8rD8QFeCFrjHeZPUwAluDnDhZ4wWz35qB5OwmId0VWo/4c8YjwMDg5HBe5Lh6A6ZXZJR4qHSywg9bAo0jun9Ap8FXkRd1K/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TYRPR01MB15417.jpnprd01.prod.outlook.com
 (2603:1096:405:286::14) by TY7PR01MB13682.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:29:18 +0000
Received: from TYRPR01MB15417.jpnprd01.prod.outlook.com
 ([fe80::1186:b5a0:9df9:a9ee]) by TYRPR01MB15417.jpnprd01.prod.outlook.com
 ([fe80::1186:b5a0:9df9:a9ee%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:29:18 +0000
Message-ID: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
Date: Thu, 13 Nov 2025 17:29:17 +0900
User-Agent: Mozilla Thunderbird
From: Yuta Hayama <hayama@lineo.co.jp>
Content-Language: en-US
Cc: Yuta Hayama <hayama@lineo.co.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils 0/2] mtd-utils: fsck.ubifs: fixes several undefined
 behaviors
X-ClientProxiedBy: TY4P301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::17) To TYRPR01MB15417.jpnprd01.prod.outlook.com
 (2603:1096:405:286::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB15417:EE_|TY7PR01MB13682:EE_
X-MS-Office365-Filtering-Correlation-Id: 8338e83d-396f-4821-81b9-08de228ebd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkxvSlFiVGxPSG0xT0hFZTcvYkJxb1dHeGF2bzFHNFdTNHN0bVFhb0pjODhB?=
 =?utf-8?B?RGRRcnVudDI4TFBMRXM4eXZ4YlBoSDIzbEpscUwxaG1UYU53V3ZYbk9RMnBR?=
 =?utf-8?B?RnpBdDNmTm5zbXV3YmNXVGc1OUpPSzhDVjdqYVNWSHpLWGhORzdsQ0lCSzVu?=
 =?utf-8?B?RnAvQlBvRzJIOUY1K1F0eHI5d0VwdFBhTVVIMGJpN1hDa3V3dm9QZmdpV3BX?=
 =?utf-8?B?enV4K0Z6cTRDZVEzYk9mQnJtclh6SEtab3Zyek8wTEdBOEx1ZDdNRjFjclN4?=
 =?utf-8?B?ZE9KMmxnRzFvaUlPaW1QT3cxbFJQZHVlSEVDeTl4WEZpV1dXaEwxQ2srRmZI?=
 =?utf-8?B?eHdqaUZoUDYxYU12SHBxV3hzenMxakpMWGNYdEY4TjlrdXZodXdBclRuWjdX?=
 =?utf-8?B?M1VucmdmTWNmWXdpSmFVTVpCY2dJNFVneXJwanpxVHFaOW83cjdWdDRZMWUw?=
 =?utf-8?B?QjF5UVhiV1dJbWVhMHliNFBEdlRYR2tSVGxjM3pzaml1MFhyTmZSZWVjT1pa?=
 =?utf-8?B?dG1ZTGhMUUxNMlZFK0hmMUhmMVdNaGd4MXo3SXE2Z1Y5RUNsaVRxblZEcFZI?=
 =?utf-8?B?YzROSkZKaGo5ZktyeEJzOS9oc1hQejJYeGhMK2RCZXhObDljdU91bTd3eUZr?=
 =?utf-8?B?OTFHMjdFS2ptZzg1c0dJdGhaT2ordzZhRWNjYzdvS0JHQVJqWUhqZldrMml0?=
 =?utf-8?B?UTJwcFRQZ3JkdWVWTzE3Yk5vSnJJMHhJTTFTRHNjNDJlL1E3OWYxVW5xU2JO?=
 =?utf-8?B?V3dZTDRZT0Ridm02SGN3NDJ3VUUrSk9zSmNqOWUyYSs3U0QxbDN5SlBOQklD?=
 =?utf-8?B?NGo1cmpKSU9sc0tOSlVFVkduOWlCcFVyMnV6ODBRS2o3K2wzZDJNNDR2dnA3?=
 =?utf-8?B?NWRvMEhqalZrRnFnUFd5OGhhTk5PU2tmVTQvZ01CeDdzcVBXY00zdGdmYUtE?=
 =?utf-8?B?bFI4S2xiVm5Ndmhja2x2aVBFYmxkRWY2cEhuY1V5UXJnb1BuOVVrVXl6b05W?=
 =?utf-8?B?WmlOV2phSi9La1pZZGE2UDlHYzRTTHBydFNPdVVyYTdHZTl6Ri9YWkZsQlpj?=
 =?utf-8?B?aEtWdzdWMTVvYUpOWndRNTI2ZDRuNXMveC9ZUE1YbDB2MG5udFBYY21NU0NN?=
 =?utf-8?B?ZVlNTWsyVWRBNDFCRzJDYVowaktOME90RmFzYndFYzNsSlJIWDlDM1Q4b3Zm?=
 =?utf-8?B?bTZpTzZ2SXdRRWVUUjVlaUhTUUxmekFLZkFFam5wVVJmcVM3OW5Odm5HOStY?=
 =?utf-8?B?eVM4L2RjNzdUcWNhY3ZnenNSSHE1REdKY1FoTnQ1KzI0bnNTejF1eGkrL3Zu?=
 =?utf-8?B?TTQ2R3ZqdG4wTmVmYnRsRFczSjEyZ2NEeVpFNWhucUNUNFhtTW9YTi9UdXlT?=
 =?utf-8?B?bDkzSFNvTnhHcFdFYU1vT2NuTzZyU2JXbFU1SUhOaEtwYjFZMHZTd1NuTXVD?=
 =?utf-8?B?c2d5bkt4RlFZdUtZSmlPb1dsTDRrQkxQc1VCRjhnZ1pmVlY5eXBHaGVHQmlM?=
 =?utf-8?B?S1BzQnEvL2c2STV4Zm0rNGY1MFNQNDZrNXc2cTF5SUJ5a0x2S1Rydy9Da2lY?=
 =?utf-8?B?aUNRTHc1eFk1ZHM0dFVSNkFOd3dRNEgzMWhjTmdWVzM5SlYrd0JXN3IvL0pD?=
 =?utf-8?B?cVdBbHZyZmtMVXdsTXZLakxKclN4d3BqcTBaUHl5R0FlS3RQK1pNYWRvYS9m?=
 =?utf-8?B?R0dCekF4QmV6QVB5TGU1bStxblhXQ1lvc1hmaWkyWmZ3Y1V1elNnN3FUcmxQ?=
 =?utf-8?B?a25tN3dEd291dXJ1Ry9jdDNHUHlJcVZLTWJRcXRKTTRRT1BGWU91cVZiMVJv?=
 =?utf-8?B?VlducXYyUk9VT3pJVVhwMThlQ2FxVVl1N0tTNGxiWlNRN3VuK1VqbzFYa3ZW?=
 =?utf-8?B?K2kyVGh4UGp5UHZ1YWdBYnpuckM1WHhVMVBobTE2Vmd0Snc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15417.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVN0bWJscGVlZjJlczU4dU92bzVtMU9qelJvY21kRGFIZDJSak00VlgvVTlI?=
 =?utf-8?B?UVlWVjZwbHZUcVlXREFHb1pHRjh3WFlhOUJ1bXFUWUg1Sy9xdHI2anZ1VEhF?=
 =?utf-8?B?cXJiQmY1czVaUWR5UW1aaXNTVVl5bExmR0xyNUlmaWNMQzRLMUk5VUpRb1dV?=
 =?utf-8?B?VVprZzRrVFB1SEZWbG5NR1pZNW9jTzdSb091dVlNMGcyTGdqSXJReHM5NkFZ?=
 =?utf-8?B?aUFkeFYwaTBzS3JzVkZYdWU0UzBpcmV4UG9jWDU2TW1JanFVeGptRWs1L1A1?=
 =?utf-8?B?UkovdDdHcWsxSUUzd1lsc0N2RmRCTWg2ZCtFM244aVIzZjhFNnJ0dGlPWkgy?=
 =?utf-8?B?VnpMa3Rjb0lFYkYxbjd0V3FlUlorZ1Fva3c3TXNsTTI4Njd4REJkQ1paTDVN?=
 =?utf-8?B?bGx1ZTVnM2NaWTBGNFdsMTFyT28zRHIxY25XUUtxQXdldVFtdlgrQXQwd1A4?=
 =?utf-8?B?NGhaeTM1MjZyR0FaZ2JnRG1INE5OcW1iMEhhcXlvUmpiS3BEMWN1NXI5V1NP?=
 =?utf-8?B?NnNYRXUvUzNVVi95dUZYYkZZSVFkblF6TDBOdVFjc1R2NDZjWGtQNW16RW02?=
 =?utf-8?B?UUZvYTNOdFpaL0tqWGRiSlh0ODBNcHM2b0R6WjZEZFJCaEc1RGQzQWwwQTM3?=
 =?utf-8?B?NlVlVFUxNWJHVlgrT2kyRmYyYyt3d2NiYWlsM1FRNGZ1QXdGOXBLNWp4djFV?=
 =?utf-8?B?eHJXZ0kyQUcyMXU4QWhZUzhCUmhFaXg2TzlyMytHTlRueTZvS1hHYTRwYkVz?=
 =?utf-8?B?TFJjU2ptMkxBbm1HUTgwSnhtOTQ5TTNudk5YcTFFaU50amlrbXFmV0tpbXdu?=
 =?utf-8?B?SFBOMDdXckI2Y0xIMGhKaE82WXJqVlUyeC9LS05JZkh3KzFKQzhNa2RtNVda?=
 =?utf-8?B?L1BCUTRSVEpaWlFrTnhrUHFFSUZDN0dUakZ4UHYxMHVSY3dvb25tWGt6K0RK?=
 =?utf-8?B?bnZFbjdjRWF5THk5L2ZYenhqU1ZacVUrbFp1REQ5Z3NWeW0xd0dwdHlISnpF?=
 =?utf-8?B?cVgvZ1o4U3JyL1IyTW9LZ3Bvc1BzbTZ6dVltY1BhWW53YnoxMHJ1K2VYSEMz?=
 =?utf-8?B?SVRyTGxTY2JlS0NVODJpQUhVelJtNVNQRDFqdTgvUGoxb0pzUjErZDgrL1J0?=
 =?utf-8?B?M2s3TFA5OWQzR1h2U3Z2UGY4ekVmbTB1NEtGZkVRN0NoSllqelZYeHM0MEpp?=
 =?utf-8?B?TGdEeDFyUEJ4dytBdHB0ZGh4N0M2MnV5aDlJOGZqakl4cU9FZDR3UnN3Vklw?=
 =?utf-8?B?aFVGODhlM2RpNzBVcHV5R0puaW4zM3JEc2UxckJVZUVMTFZqQm1uVUhZeWpa?=
 =?utf-8?B?S3BrM3dJZml3UHhmMzlWMW9pMXBxVXZSdnFaUCtTRWhFZ3RlMWlNNHQyZmRL?=
 =?utf-8?B?OGxrUnd2MzhNek5hdlFySjNmZHJ6b3NSWUJ5ZVErRmN6MHlsQzkyQzlRcTZI?=
 =?utf-8?B?MDArVVRlSGd1dUdtYUtuc2ZISzA0YmVBNE1tVkRxNFJnSmZYa0ZST2FBZWJG?=
 =?utf-8?B?Q1F5RWc0dXJTTE96a1c5R0FXVlFpeUowcDlBdXFlV01RQUEvZWxCUXhybGx1?=
 =?utf-8?B?Y2NEODlIS2tQamJIaVpkWXVkZ3NjbHdtZmI2VUVRc3hEbTFzQzUvTHRrd252?=
 =?utf-8?B?ZzMzMDlsekRlK0pueXZvaDkzc0RVWitKRlJMOGVLOEtJZDlteHFCWGlVUHU0?=
 =?utf-8?B?c1pDQnUxVmJXR2ZKV3lsREswWDEyR0oxZ0tKbG5DcCtLTzA1NURmd1NKN3pJ?=
 =?utf-8?B?RWxIRW9yRFBqMDVSZERjalh3am5oMXZtRmJjaVRmRGdBa2d3NHBqNThLLzZu?=
 =?utf-8?B?NzBYMUlobEZjVDVvb0VJQk42dFBYUnBVQm0wYkdsNFdZcnFla2xLb1k2V2Zx?=
 =?utf-8?B?a29uMXJ2VUFURStodHBOek56Wk1XdGFqQUlQZ1ZiKzJkVkQ5Zk96SWJ4Rmhk?=
 =?utf-8?B?RWxhV3VibElJbVZUK285dGw5SVdvS2NEWUI2VkJXclFwd0VNdFVycVN4a2dX?=
 =?utf-8?B?bmh3T1M4S25ocFY3dXZNY2tBQ3RXbGZqZklsN2RROFdHR05EZmdMWFVPOGhR?=
 =?utf-8?B?Y1hRU1ZZaW00TVk3b2VneTYvT1BOTHhHWGZldlJnRkJ4QWpIYlpzWmg1L0hp?=
 =?utf-8?Q?sft9CwfPRAJD2UBI8OF884fL+?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8338e83d-396f-4821-81b9-08de228ebd04
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15417.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:29:18.6179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V81DVvdimfzSCFxVdyTZquiBx6WbjyEyb0ZnzcLq3ZwJSByBaux/DuaKWzVNjBIVIVKBfB7J3uP6DCt1hJpiBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_002932_466894_4A611611 
X-CRM114-Status: UNSURE (   7.01  )
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

The first patch fixes the use of pointers to out-of-scope local variables.
The second patch fixes an issue where printf reads variables from the wrong
address due to an incorrect printf format length specifier. Note that the
former issue was detected by the cppcheck tool.

  $ cppcheck fsck.ubifs/
  Checking fsck.ubifs/check_files.c ...
  fsck.ubifs/check_files.c:104:48: error: Using pointer to local variable 'ino_node' that is out of scope. [invalidLifetime]
     inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
                                                 ^
  fsck.ubifs/check_files.c:71:31: note: Address of variable taken here.
    sn = (struct scanned_node *)&ino_node;
                                ^
  fsck.ubifs/check_files.c:64:27: note: Variable created here.
    struct scanned_ino_node ino_node;
                            ^
  fsck.ubifs/check_files.c:104:48: note: Using pointer to local variable 'ino_node' that is out of scope.
     inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
                                                 ^
  fsck.ubifs/check_files.c:104:48: error: Using pointer to local variable 'dent_node' that is out of scope. [invalidLifetime]
     inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
                                                 ^
  fsck.ubifs/check_files.c:84:31: note: Address of variable taken here.
    sn = (struct scanned_node *)&dent_node;
                                ^
  fsck.ubifs/check_files.c:77:28: note: Variable created here.
    struct scanned_dent_node dent_node;
                             ^
  fsck.ubifs/check_files.c:104:48: note: Using pointer to local variable 'dent_node' that is out of scope.
     inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
                                                 ^
  fsck.ubifs/check_files.c:104:48: error: Using pointer to local variable 'data_node' that is out of scope. [invalidLifetime]
     inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
                                                 ^
  fsck.ubifs/check_files.c:96:31: note: Address of variable taken here.
    sn = (struct scanned_node *)&data_node;
                                ^
  fsck.ubifs/check_files.c:89:28: note: Variable created here.
    struct scanned_data_node data_node;
                             ^
  fsck.ubifs/check_files.c:104:48: note: Using pointer to local variable 'data_node' that is out of scope.
     inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
                                                 ^
  fsck.ubifs/check_files.c:106:40: error: Using pointer to local variable 'ino_node' that is out of scope. [invalidLifetime]
   return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
                                         ^
  fsck.ubifs/check_files.c:71:31: note: Address of variable taken here.
    sn = (struct scanned_node *)&ino_node;
                                ^
  fsck.ubifs/check_files.c:64:27: note: Variable created here.
    struct scanned_ino_node ino_node;
                            ^
  fsck.ubifs/check_files.c:106:40: note: Using pointer to local variable 'ino_node' that is out of scope.
   return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
                                         ^
  fsck.ubifs/check_files.c:106:40: error: Using pointer to local variable 'dent_node' that is out of scope. [invalidLifetime]
   return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
                                         ^
  fsck.ubifs/check_files.c:84:31: note: Address of variable taken here.
    sn = (struct scanned_node *)&dent_node;
                                ^
  fsck.ubifs/check_files.c:77:28: note: Variable created here.
    struct scanned_dent_node dent_node;
                             ^
  fsck.ubifs/check_files.c:106:40: note: Using pointer to local variable 'dent_node' that is out of scope.
   return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
                                         ^
  fsck.ubifs/check_files.c:106:40: error: Using pointer to local variable 'data_node' that is out of scope. [invalidLifetime]
   return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
                                         ^
  fsck.ubifs/check_files.c:96:31: note: Address of variable taken here.
    sn = (struct scanned_node *)&data_node;
                                ^
  fsck.ubifs/check_files.c:89:28: note: Variable created here.
    struct scanned_data_node data_node;
                             ^
  fsck.ubifs/check_files.c:106:40: note: Using pointer to local variable 'data_node' that is out of scope.
   return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
                                         ^

Yuta Hayama (2):
  fsck.ubifs: don't use pointers that reference out-of-scope variables
  fsck.ubifs: use the appropriate format specifiers for ino_t and loff_t

 ubifs-utils/fsck.ubifs/check_files.c         |  20 +--
 ubifs-utils/fsck.ubifs/extract_files.c       | 179 ++++++++++---------
 ubifs-utils/fsck.ubifs/handle_disconnected.c |  10 +-
 ubifs-utils/fsck.ubifs/problem.c             |  36 ++--
 ubifs-utils/fsck.ubifs/rebuild_fs.c          |   8 +-
 ubifs-utils/libubifs/dir.c                   |   8 +-
 6 files changed, 130 insertions(+), 131 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
