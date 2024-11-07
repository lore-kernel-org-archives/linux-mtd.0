Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77917D43359
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjP0D2sNB3KerQYUIdhpONmn8hjNdLkoYqVAnQcIgX8=; b=nvv3TW1x4I0KQdfvg2Y5Xc5yl0
	SWSGcPbtVtp4sp/YulCM/ConZZ8iNZeTxOWJz8sZ5mImoeXeSl6NH36b/8Z1RGImnlyHyKBhpDJtx
	DVNaNaaFe/FlGzcQdvSNV4E8EJ7yPsEGvK/xUXR5RXTk2QQ00/Gr2t52RjFrwryaASC+2yrqw80xi
	qY6SVlgZUuramFvP2auTXcbslSTemXl/ymXhOJAh4nPRLZ+jXg6eSyOeQm0DrVfhQ5xUTgpj8jZXe
	QBkXXeSIyHrCIurMTKzQE3oKfESHa2Lbu5Rx5i7Jrhw+JR8hhLhedTgOvM1mpuONw+1W8HiHD5mol
	YMpkYErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Vz-00000006uGZ-3CR0;
	Thu, 07 Nov 2024 12:21:31 +0000
Received: from mail-db5eur02on2062a.outbound.protection.outlook.com ([2a01:111:f403:2608::62a] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91NR-00000006sxn-1u0c
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 12:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWlo9bZ+I78EHsdd7AHd4j8vYDDuR93De+XLgT2+lzO3NnIuAquvR0nnSzEeudrJj9j/MIbwwrjelNv0kiNZDo0Lh2zaES4wfHZUswn78/EkRYYC4Tcja4tKZM7pSAyzxTgEvCcEAbfnbyGP/q/TfEE3ZuzVlyBhN2t4Yy2kqglGEHxoHzOGuvwxTmSS3PfAPhjfYJh5JDouJPuYiRhzh9JoyxawFNQp+wR9BgWepBq/GnOhM+cUAWudGhJRoQ+qTDvXPd7ULnTVBFYZZniSrlisGi5ejuRaHCbCTacGwfd9iu79v6bQg8EPySZ8RvC9eUlNBJy1C4gwpSL4vjHSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Veasjt5DENnmrlonrNknhyswAwJp9pZqCALHV1Q0SzQ=;
 b=Hici4f7dtAyFiYjKnDnFcm4D2zKKBwSzXO+wOUvxkttzjQxYTzcXJF1xxZExL/VdHTGN7gtcJvhNdixgQfUJOn48zSx4a1AzcJfY55kgW+KZWQsn44o0cstqJsoNve0kdflNuaRyhU1IfDzYU1qhnjFNWJuwYeOKXf7WGBE9t6mmwH8rcsFPphZBy0ynumo2CyoosNM6cQpnWBVR0qPD5Xel2wxjh8DmX3IsCjut8PIScgF3PWpk+6ilg8whErG6ONs5DDwFK+kqPNH+WPnhhw13iO+ZKM3eJpPbfZij+kJxc+D5gL/kig7evYfVEihQl/0TWsnLtpVQDoWEhEFWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Veasjt5DENnmrlonrNknhyswAwJp9pZqCALHV1Q0SzQ=;
 b=BuEJy37u2pI1txhWvnn6958ZqeZCItD04C5xZ4n7uWsSVuFA7/3s2Web9pjfv32sXPyc3phK9ArbbVjjk23z8bA6KRxUmrhqvBRjx2UGD12Bq1OalxMHxqYC49d4u+FS++fLU/tOSMe3H7NBmWp0MTgD3bbfGLpVYss/u0xa3II=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by DB3PR0202MB9273.eurprd02.prod.outlook.com (2603:10a6:10:429::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 12:12:36 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%2]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 12:12:36 +0000
Message-ID: <33dc0246-b308-8b4c-addb-7f6791821461@axis.com>
Date: Thu, 7 Nov 2024 13:12:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 02/10] ubi: Expose mean erase counter for fastmap in
 sysfs
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>
Cc: Rickard X Andersson <rickard.andersson@axis.com>,
 chengzhihao1 <chengzhihao1@huawei.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 rickard314 andersson <rickard314.andersson@gmail.com>,
 kernel <kernel@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
 <20241011125904.2915983-2-rickard.andersson@axis.com>
 <2095423248.201132.1730924426363.JavaMail.zimbra@nod.at>
 <d8891124-1391-5642-bfd6-3bfd4f636e2c@axis.com>
 <1446825408.208073.1730979115998.JavaMail.zimbra@nod.at>
From: Rickard x Andersson <rickaran@axis.com>
In-Reply-To: <1446825408.208073.1730979115998.JavaMail.zimbra@nod.at>
X-ClientProxiedBy: MM0P280CA0053.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::32) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|DB3PR0202MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fd2fc0-2d47-4ada-e1dd-08dcff25779e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXdsMUhSNk1VVUdXaFE5ZitqeUV0ZWgzb0xNM2h3VzRYY0hML0pGVTBzQkdQ?=
 =?utf-8?B?bTRvNkZ6OXdXZkZpYnkrT2xxL0V6NEEyVGhtRkREdWY4Y0hzdTFLb1FOWTk4?=
 =?utf-8?B?TG9sL0UxeXJ4YWJtTUp0clc2dThYejYyZElnU3VoUmpuTGRRVElOM0V3eFdM?=
 =?utf-8?B?Y0FUMCtBbEl5cFBoQTRQUDVFUHpTM2FLUlg1bzl4MDFQVHlIeE1uYTY0cldY?=
 =?utf-8?B?QXREVGZ4bUpMdmVhOXVNYWJoUGcybVdWS3l0b2ljMHhOei9SNFZKZU9PbDVx?=
 =?utf-8?B?MEVKUmpiZWhsRzlod2d1dDVkMjFRNlVaQU1KYjkwbzkxeEZuVVdud0FxYllk?=
 =?utf-8?B?bVB4Z3FLRHY1dlJZUExOZ1ZJVzd6NTBnRFFvYS85L1JnaC90bWVpVTFxL2sx?=
 =?utf-8?B?RXFMN2hqWWtDbndVRVR6OHE0bkEvc3BCQ1h4dW8zUXMrRUpKQmlkTHM3Z2oy?=
 =?utf-8?B?MXRkRDF4cTJhdVYrV3Y3bHNaY2FkYjRsRmJ3cmcvSjExVEtLbURBTlVLNXZ5?=
 =?utf-8?B?dVoxbXU5VStuelAvQjhhQkIzVFczRFpQNmREZ2R1OG5tWlNZTWNYaCt0b2ZP?=
 =?utf-8?B?NHRvZ2MwN21uQk9jaFU5WWo4cVdkbzNQUFUyNGNPSjNFZnhza3pQaFl1MlJQ?=
 =?utf-8?B?cVlGQTJOellzM1l3akN4U096eGJNNkJrUE94Vk44cEFVci90SG51Q1lna1Y2?=
 =?utf-8?B?Y0xxMlZzY1ZSWmpqVmFXTG9HaGcxa3hHQWZVUjlKNWtZdTY5S0NOK0dJNVU4?=
 =?utf-8?B?cXVRUlRhK3NJbWJvR1J1VWJsY2lGeTBQWVR3V090T2NoY0VIRDZVQ1pkaWZB?=
 =?utf-8?B?S3FmT3BEbVp1QTQxWXNnOWVrTGhJaTZ6RzhnaHZueHBqcG93cVlGSU5pSXhW?=
 =?utf-8?B?eE1DU1hRZlJMbGZLV3ZTblp6a3o2Z2xVeWNaMlN6TzVucjIwVkp4RWNub1Zz?=
 =?utf-8?B?a3RNa0ZLaDRYeitxK3UvWXNzNkpwK25iQ1Q5L0hRRXBqam9Pd1Vqc3FVdThh?=
 =?utf-8?B?Y0NTNmN3d1MxNHFlalRaV3JRZzJBd0FNZmFRZVA2U1B1ZzlRWGQ4anhCemsz?=
 =?utf-8?B?eGZoeEVKcnJxMXBZWjZuNkdzZlFUdERvRUg1bCtQN3RwajE1QTdQYllKbGQ2?=
 =?utf-8?B?Tm5XSkdSQjZqYVFTSHR6NWh2VG9xR0c3QW8rSkhFS0hldTREcFhUUVIyNHNQ?=
 =?utf-8?B?VngvbDdJZGhIcEQrVFZxQ25FeTJBM09xU0R0UjYyS05LMXJUL1IwUkpZQW15?=
 =?utf-8?B?YlFMMnFiUGc5dzdUQkRTSDEzTC90NmlCbkpoZFlXaVNMMU41Znh3dTFlcGRG?=
 =?utf-8?B?S0NpY1A2Y1hSczVCRFBNeVNhbHlkUU5pUmE5NmxYdGVBNVZ6VWZERS9WMGdK?=
 =?utf-8?B?c0l2aEIydHJRWHZrVllMSUJVRjUxL1R1V0NiRFJSTXhpUlZtbVF0Q2JMS2lE?=
 =?utf-8?B?RHU0YkNROHdGbGJza25CcnkycHlYdnN5aGZvWXVESTlMUHcrOXpJR1pNb0lJ?=
 =?utf-8?B?Q29jR3pRVVBIdHpCYnJHdnh1MzhoOUczQi83eTh4eThmK2FpQXd1ZjBzbFNJ?=
 =?utf-8?B?eGtuUzBMSmZvMmVEZFlLbFZOMnpCT2VlRnFqZ1ZYN3JmalMxNVlNZmxqcXZq?=
 =?utf-8?B?WTJNaGxNT0dMMEloejkvUzhjTCt1SHFYaSs1YkUybkJVcFFsQjhsN1Fud3RD?=
 =?utf-8?B?VG9DRW1BNHpQTzR1ZmJaL1U4UHRoa2srWHljV1FzY3pxRDJTQi84ZE1sMUk2?=
 =?utf-8?Q?p03sznxmgCKtsGfynZnEFGxpJQZYi6qXL62GmxK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXYxZSsyZVlOWVpVSnVFbTVzZXU4V3dwTGZUcjFZUUh3Unl0Q3NtR0hJaDdo?=
 =?utf-8?B?OUpiVkJHaWhQUkRmVnIvR014MEFaMzRndUlZa1Y4dVNqMXFYZjZSZEhiQ2pC?=
 =?utf-8?B?dUx2ckNmWmM3SXE0TGJnNkZaN3c2WDNRQmcrUWxWT3NqeEsySmVqaUZuQnFw?=
 =?utf-8?B?RlJvQWsrOHRrOFBYbm41b2RuT21TYkVkY283eDFIM1BFSjhrZHVHSWpLUC9W?=
 =?utf-8?B?WGIvV1FoMDZidCs3enZjbk1DdC84N3BpcmlnalU2SktEL0xqRzB6WjJrZkI2?=
 =?utf-8?B?SU9rS3l1ODJJV09XZDczZXptbmxRTDVmbDdpOFZPaEMvc1k5a3ZDTkdoRm05?=
 =?utf-8?B?L2xRSFRQSjJEZ2E5RHYwTk45cVdtMGlDM2NwcVJzQ3BRTVJCckZvZHV1ckdU?=
 =?utf-8?B?LzFmU0NZSmFEZTRvbVh0MnJITStiTk1tVzZURzZsUW5ndHg3MHQvYyszcDdk?=
 =?utf-8?B?bFVrQ0pqWFNWNkVRcU1ncnlUZDN3S3p6SW9KR2pkcE1URDVpSzY0VG8zTkVu?=
 =?utf-8?B?TW9iMHh4RVA5RGF3blpqNjU5V25sSEtUbmlGdUhuYWZFd2lpYm9RelBycy8z?=
 =?utf-8?B?akprMlRuUGlsem5DUlFtUnNkMmFZSXVlYUhKMFVOeHZCYjV6Q1I1SEp4bU5C?=
 =?utf-8?B?NnJTWWd6aGJucWhIeWlCQjl1bHNnOGRxTnJlTGhRMG96emFhV1lQcEovcE90?=
 =?utf-8?B?NmxTZDNpM2d1YS9nQ3owU21XeU8ySlhCTDZrQXppaUpmUlFxejNVWVNtdFF1?=
 =?utf-8?B?OFpPT01DRHRCVzliVDdWbUdNb3NLRUswZzlhRXBwbkJZYUpWQXhLUGVJT1Za?=
 =?utf-8?B?ajhhZVFQdWtXOUp1TWpRdzBFZGdidlk1cnYrWXRXNkhuSGZSU0JLN2JWVHJm?=
 =?utf-8?B?a3JQdHQ3RXJVQnZUeVhGcFY5VUJvL1U2Z0l4Vml2czYzY29VTEprcXhhVG5m?=
 =?utf-8?B?RUQyUFhJVlV4ZnlXZVA1bGVGRzBocytvazhLOFZjTzZQTWQ5Ym9zb0s2TElh?=
 =?utf-8?B?eEtyeGI0VFNCTDI1NWFyNGJ1dW9qdHpzYlU1anlCK3hXZkkzY25pTmo0WHhs?=
 =?utf-8?B?SS9qT1VhUWI3UFFRSkUyRjZ1ZHdTN1Z6eUZJSE1DRGEwcFRVVDduS25FelBx?=
 =?utf-8?B?WDJIVCs0eHBrelRrdGJ4Sm9aN0NVSTBiK0dLMWd5ekE5bnIzSVFCZTl4ZGhM?=
 =?utf-8?B?Y2Njdk1XdWtVUmtQcmh2WWJvUzd4VXdBZVhmcmVYTGJ1cVdUZmtVQlNWcEFj?=
 =?utf-8?B?bkJGMHBaQ1VkNUdGZWdGc3dLRWZ0L1ZORTA1bUh1M29KMWVLUC90dEdyTVNz?=
 =?utf-8?B?bzRoaHFpbFFVa1RrK3hFMnpSVGd4eW1ZNkJkWkFWSFFxbFpsQ2VwRG44Y2x3?=
 =?utf-8?B?S0VUMWk3ZXU4M2NZeWsxa21lbVN1enlVSDhZeUVUaVZlYi9lT3lWaGhSK2lh?=
 =?utf-8?B?WWY0VXcxWWk1UjE2VGtWYXRBVnBzV3lLZnF4WjhxZDNpWEZ4czlidWlQdDR5?=
 =?utf-8?B?Y1FvTE0zRDMzSUFMaEIzZWIzY05hcERKaEx1YWU1MjlSUmxpaGFHL3Z6WXIy?=
 =?utf-8?B?YTNiQmprN2FJeGNkV003Wkc5VlM1S1NJYkkwdmRSRWFEQXVMMWJ4WmhUZVRo?=
 =?utf-8?B?Qm5yekRYNjVjZFVkOWY1cU5GUE1BOXNVZlE5SGtSK21USm9DU2tSSW9iZjdO?=
 =?utf-8?B?TjBZZklEcVJqd3U4T0xBY1lJM01IT011QW9ValdjWjZKUVpYK1U5K2c3Mlpj?=
 =?utf-8?B?L0xCVDV4bzV6aHVWTXFLZ3o5eUM1TjU5dkVGMFlUYklwUUJHaGREN3JNM1BK?=
 =?utf-8?B?UTg0bmhIN0ptNXlLNVdkN0dub1dwZGMwZ0VuSTlpa1luSHB2YTdCL1lnOFpk?=
 =?utf-8?B?czRTWHBWa1pNQ2ljVktYei9ENzdKRkdsUVZ0WEF4MlNHeXBSTXl4dXNyVHh4?=
 =?utf-8?B?ckpuNWkzY0JxSTJ5b2hiYWFTRWlLMGNvb1F4RlBpZFdNZ1RXVXFpejVNWklQ?=
 =?utf-8?B?L3UyTGZvZkNLbHUwWnFlNklRQ2REZGp3YVAzR3ZjaEtNMUQ4TzI3aTducjNC?=
 =?utf-8?B?VlZYRmI5SmFQeGszTG1LQW5PL2xCdVkxMEQ1L2lidDRieTZQSzJsNWJ0UzY1?=
 =?utf-8?Q?J5Fw6iFHYySgZEgUEvb03aED4?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fd2fc0-2d47-4ada-e1dd-08dcff25779e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 12:12:36.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axTqfRz9gWZESboylJJYOiT58in4Sj9o3XyS0Ebgt3ptfj+cXfrM1iQO9ZrrfHqsyW9jBvY24IZLplgV5J8iLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_041241_695217_492C60D3 
X-CRM114-Status: GOOD (  21.45  )
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

T24gMTEvNy8yNCAxMjozMSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVyc3By
w7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiUmlja2FyZCB4IEFuZGVyc3NvbiIgPHJpY2th
cmFuQGF4aXMuY29tPgo+PiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJSaWNrYXJk
IFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4+IE9uZSBvZiBteSBk
ZXZpY2VzIGhhdmUgdGhlIGZvbGxvd2luZyBzdGF0dXM6Cj4+Cj4+IC9zeXMvY2xhc3MvdWJpL3Vi
aTEgIyBjYXQgbWF4X2VjX2RhdGEKPj4gNDY3Mgo+PiAvc3lzL2NsYXNzL3ViaS91YmkxICMgY2F0
IG1lYW5fZWNfZmFzdG1hcAo+PiA4ODY5Cj4+Cj4+IElmIHlvdSBjb21iaW5lIHRoZSBtZWFuIEVD
IHZhbHVlcyB5b3Ugd2lsbCBub3QgYmUgYWJsZSB0byB0ZWxsIHRoYXQgdGhlCj4+IGZhc3RtYXAg
YXJlYSBpcyBtdWNoIG1vcmUgd29ybiBkb3duLiBGb3IgZXhhbXBsZSB0aGUgd2VhciBvZiB5b3Vy
Cj4+IGZhc3RtYXAgYXJlYSBjb3VsZCBiZSBvbiB0aGUgdmVyZ2Ugb2YgYnJlYWtpbmcgdGhlIGZs
YXNoIGJ1dCB0aGF0IHdpbGwKPj4gbm90IGJlIHNlZW4gb24gYSBtZWFuIHZhbHVlIHRoYXQgaW5j
bHVkZXMgYm90aCB0aGUgZmFzdG1hcCBhbmQgZGF0YSBhcmVhLgo+Pgo+PiBJZiBmYXN0bWFwIGlz
IG5vdCBlbmFibGVkIG9uIHlvdXIgc3lzdGVtIHRoZW4gbWVhbl9lY19mYXN0bWFwIHdpbGwgbm90
Cj4+IGJlIHZpc2libGUgaW4gc3lzZnMuCj4gCj4gQnV0IGRvZXMgdGhlIHVzZXIgYXBwbGljYXRp
b24gY2FyZT8KPiBMZXQgbWUgYXNrIGRpZmZlcmVudGx5LCB3aGF0IGlzIHRoZSBwdXJwb3NlIG9m
IGV4cG9zaW5nIHRoZXNlIG51bWJlcnM/Cj4gSWYgeW91IGp1c3Qgd2FudCB0byBrbm93IGhvdyBt
dWNoIHlvdXIgZmxhc2ggaXMgYWdlZCwgY29tYmluZWQgbWF4L21lYW4KPiBlYyBjb3VudGVycyB3
aWxsIGRvIGl0Lgo+IAo+IEZvciBkZWJ1Z2dpbmcgZmFzdG1hcCBzcGVjaWZpYyBpc3N1ZXMsIHRo
ZSBkZXRhaWxlZCBpbmZvIHZpYSBkZWJ1Z2ZzIHdpbGwgZG8gaXQuCj4gCj4gSSdtIHRvdGFsbHkg
ZmluZSB3aXRoIGV4cG9zaW5nIG1vcmUgY291bnRlcnMsIHdlIGp1c3QgbmVlZCB0byBiZSBjbGVh
cgo+IGFib3V0IHRoZWlyIG1lYW5pbmcgYW5kIHVzZSBjYXNlLiBFc3BlY2lhbGx5IGluIHN5c2Zz
IHdlIG11c3Qgbm90IG1ha2UgYSBtZXNzLgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKCkl0IGlz
IGZvciBkaWFnbm9zdGljcy4gRm9yIGV4YW1wbGUsIGlmIHlvdSBoYXZlIDEwMCBkZXZpY2VzIHJ1
bm5pbmcgeW91IAptaWdodCB3YW50IHRvIGtub3cgaWYgc29tZSBvZiB0aGVtIGFyZSBhYm91dCB0
byBiZSB3b3JuIGRvd24uIElmIHlvdSAKa25vdyB0aGF0IHlvdSBjYW4gdGFrZSBhY3Rpb24gYmVm
b3JlIHRoZXkgYWN0dWFsbHkgYnJlYWsgZG93bi4gT25lIAphY3Rpb24gY291bGQgYmUgdG8gZm9y
IGV4YW1wbGUgcmVwbGFjZSB0aGUgZGV2aWNlIGluIHRoYXQgY2FzZS4KU2luY2UgdGhlIGRldmlj
ZXMgYXJlIG9wZXJhdGUgaW4gdGhlICJmaWVsZCIgaXQgaXMgcmVjb21tZW5kZWQgYXZvaWQgCnVz
aW5nIGRlYnVnZnMgZHVlIHRvIHNlY3VyaXR5IGNvbmNlcm5zLgoKQSBkZXZpY2UgbWlnaHQgYnJl
YWsgZG93biBkdWUgdG8gaGVhdnkgd2VhciBvZiBqdXN0IHRoZSBmYXN0bWFwIGFyZWEuCgpUaGFu
a3MsClJpY2thcmQgQS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
