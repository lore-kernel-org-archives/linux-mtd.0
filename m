Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCF2C27C44
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opo2ntWHDX0oMKAcCCLWFQfqaUGlTzaC6v34tKgbJNo=; b=j3PHpvQu3FkO2ehxd+j8jQkrDQ
	TSsoIoFfjqUKUbdV7QJW05BBTiwcZmo94yhOW1Ixo0ndOkevBXnyLq4W/eCMoa60r/8XhKJMyJ20V
	KYsT1z9MO4zggOOpf5+aMBFzS6Wm3xbbz0fvGKzh9QP+Z+9d9YAaPG0vKLCZuPc9yDTzI/+izyJoJ
	mlm8Rh6zGcegx8h9ujC8MVa0wOIYSpaNwlwbK/CdBhK6+q7jXGQiSzaZUbdz7dKesxf+LXUyzQn6a
	uv0t3PW03hJlFgsC/IV4r5cIsF9Wsa4Tv43E9rkt7/RQhqTbrDJboP2jLcrU4xHK5qzGX5aq7FZRZ
	A/H78xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3U4-0000000G6wa-35Ey;
	Mon, 03 Jun 2024 08:56:04 +0000
Received: from mail-vi1eur05on20600.outbound.protection.outlook.com ([2a01:111:f403:2613::600] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3U0-0000000G6t8-1143
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 08:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRVYqoFKG6XTkMpO+aYDA3gWcbVVXZmY1RElEucyif0JH2hnEZj0MqjxGhBqJ3xVm+TpMtwfsgXfyCl2Q2rZ6KDUpH1UhDHsZQjr/WV+jMr8EE3WOu/Ru55zqkZdlm7cuLxazEmTOygEZzTYEzOU1ryKqUU27AmG/DGAdj/DtE56Xacmy4ZL6b4MFH7UxflkTTMD5zToB/h90D9APXCEoYL5UgxbJYkxhBFHASCJFiuEIoC+s7OyEhlLex2x3Fl49r3PPr6ytTGo9I40ncJJPBRUdBw01nwJEMrjZo5HAyTmKV3v+Xbd4iKNt8P3fzqwd7Y7KxugVSacsLqwhF2mhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwmDclRjsIBxb9Oi9WH+CCZzNz0CB6GncOGeCn3WPYw=;
 b=Z0Eg5HmNWxoy3QTrkFeA99Ug5/vMnpPQ6oJbNQOBo1DxXCMTH/YaOQol1Xcxe/6M2M9eX8YMvQa103jo85Zxe+zPAezMVe7MczrQJvs1dpIvFeysTjmBZ78K5y4PeOw2lGlKnB2BwWuxHbXB2BJrFkLN90RxhHNtQsruv2XkX4ji/icJ3vvyojXWUQ0Az0FgRdlL7aVH2f/3on8sY3p8QEiLX7lM9EEbhtgZMx8noI73DILLZhN1BJK08S2ODJJVnl2AzwYv89XMYuj2Q83FSHzSXVS5gGvYn7WfgbrVfup5BQGfjSALuM8aY+M4KqroSe2RL6r0WEKXOYXCzOFtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwmDclRjsIBxb9Oi9WH+CCZzNz0CB6GncOGeCn3WPYw=;
 b=OpnlvhkUVCNvWYG52UU7jyWgbcOkMVzGclpVGa8ebDE5X2o7Worew6Azq8GjfGPHSf+bujVna3wYh3FgVRmceXMbbpJzbtRMbyIHlf1HEWaPS58NQ5fmTymNKOqeW6ecTuz3EqdiDOX7AHqq2+tDg9H6v/b8xHJsAIf1BI+c+Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by DU0PR02MB9295.eurprd02.prod.outlook.com (2603:10a6:10:470::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 08:55:53 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 08:55:52 +0000
Message-ID: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
Date: Mon, 3 Jun 2024 10:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: richard@nod.at, linux-mtd@lists.infradead.org
Cc: rickard314.andersson@gmail.com
From: Rickard x Andersson <rickaran@axis.com>
Subject: Lots of fastmap writes
X-ClientProxiedBy: MM0P280CA0080.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::22) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|DU0PR02MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e34d6d3-662b-455a-5c24-08dc83aaf91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkVBUVgyTm0vSzFqQXhBVWpCdFc0NTZTYWk1OVk1SEd4OGd6QkowaUlUN2py?=
 =?utf-8?B?T0FoY2dvZ0RMOWxQV25sR1BpOE1mZzIrSFNLRnNnOE5qQ2EzbUVHUVB1WHBu?=
 =?utf-8?B?b3V6UEw5SmE1L2JDa0pqbjBEY2I2dDZIeWZRaGMwT0NKcExrMXRDaGVnTHpI?=
 =?utf-8?B?cUplMUtmT3hJYVZja2tEdW1lV0tKNjZZUHJaUEtZRzJzbnNkSlByU0ZxRGVa?=
 =?utf-8?B?bWFDUkZ3WnhTeDFlWU85aVNtRlFmRWRDZkYrOWlHV21pMVdFTjY2ZjZuSHpi?=
 =?utf-8?B?L0VsZ1ZmRS9ONHJGbzdNSmFId1llVXV1ZDFQSHV1d0FaaEh1a3JEcVEvd0NJ?=
 =?utf-8?B?QnJkY0prN25tS05IZCtlZXRrNnpJbWxRdEFyUEJ6TXZNSGJlY0VQd3BQTGRV?=
 =?utf-8?B?QVN6VUU2Si9KQ1E4RG9vUHBYS0UzYy9RbCtsdWxmV294WmptaXhXcElkUjVI?=
 =?utf-8?B?Sy9wOE8vYnkrOGkySGMwZkxHMW9YN0tvOVZsKzlWb1dVSVhkbDM5MG5vKzNF?=
 =?utf-8?B?TUYrbnZLczdFYm1CcE1CR0tzbXMzSHUyV3dsaDNBTkhaZXNtQXRpbFp2NDBv?=
 =?utf-8?B?aTdIZ2thNjgwOGdCVHVkcjEvNkNPcVdRb2Erd0w0OW5rQ01DcDVKVlZ2N08y?=
 =?utf-8?B?cUFNVUZDdis0cEFjdDVnNStoc0o4ZWljUlhFZTc2QThsZC9UUHV4NVhZcVFw?=
 =?utf-8?B?QlhEVmkzTDFMZHpJUXFIVlFuOHRERWVOaUJETFEzcmJtNDQ5MFZBbHYwMTlO?=
 =?utf-8?B?NkQ2QjhmMnhNd1hTMnNUWWw0bDFZTjVISnByM2JBWm15OWl4SHBUdW9ReFM4?=
 =?utf-8?B?clJxblZ4TUZsSVVndXoyM3B6TjlKTnREcGVxMzBvQlNJMDNQcUtidEZoYkdv?=
 =?utf-8?B?RTE3elFWUnN3QnhqU1JiaWpIVStpVFJTR2RSWTllY2U2SkRTeGptTDFKV05U?=
 =?utf-8?B?VFNaQ0xQZVl1Tm4xWUJZZWM0SkxwazFSVzNvOVlyU2pMQTQ0MG9FVXpwUmdn?=
 =?utf-8?B?dlQydDVYbjZET1BtVmhpbkdkUytDNWhJVXdzT1pUc3FkQmc2OWdMdHNFcVN3?=
 =?utf-8?B?R2d5RjZ1bk1haW5BNnJxdE52UVV6ck11ZExXNlJnVTVBbHZIQ3NjYko2TExR?=
 =?utf-8?B?UXMvYkU4N0E2MXp6U1gyNXM3dExjOGtGNHVxYVUxb1VHRjdraHlYelY4QnZQ?=
 =?utf-8?B?OG1Ia21ZZlQ1RVBhMm5IRFRLdjlSMFdEMjJhWjVHWDVzZk55dGdlbEYzTXZj?=
 =?utf-8?B?cktaV1ZnTWdWaHZTSktnbC8zWWJLVDhnY0U0L1pxbkpQMTVQKzFhTERWVVRv?=
 =?utf-8?B?WlQ1TUxnV0FRR2tvL2FFa1ZzZ0xqckZ6eXdUa2tjTFRhZFkySjFvYVNUcTFh?=
 =?utf-8?B?ekg2TDhVblNUY0YybjFnaGJFMmFwT055VG1UWUdGdU5mM3F3eFVFZGl3emo1?=
 =?utf-8?B?OHZIOGFsK29DbStGMHNDc2hCMEpKUHY1Y0l5QVlnR0oybSt2Q3llNElVQnZs?=
 =?utf-8?B?dXRpSXhuaDN3aWJOMlpXR0dsak5aM00yUHVEVFM3bk9TZmNjbDBhM1Fwd29x?=
 =?utf-8?B?aWc0aFBuekZHeVhUcWREbXhPcTNSMjk1eXM1bWROUHdWS1FvNzNkNEV6RXVS?=
 =?utf-8?B?M2JZMVArc1JuRmtJUGlDRnI4ZzF5aFl2TzFTK2R6Vm5GTWo5OElOWEU0NEd0?=
 =?utf-8?B?bExtaHZCdnZzL2UxdlI5M0tpSGNTcFFIMk9JK291WUcyWDk5ZDdLUmpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZMaVk5N0dCd1puUHNWTytWV0wzd1R3RDQvUG41STBjY3k4ZDJFSHc0R3Qw?=
 =?utf-8?B?cHI2Z3RLdDErVy95QSttcGpubVpIVjA1NXEwOE84TFpuUW5ZdncwVE5ZQmE5?=
 =?utf-8?B?S0Q2Uy9aZUFHYXJwQ3pDVGRlRkNsaTRVZXgyWFJpbXV4T1Mrc1IzUnU0a3RM?=
 =?utf-8?B?eVRPZUJsMVFjSWVoOWdDSVNCL093Ui9sZDhjQ2t6R0dvYnN4Z1l4ekdSUE8x?=
 =?utf-8?B?QWhzSTRaUFozRDR5MkF2cDhBNHUvYVovOVpHLzZsNFU2VlVhSTg1ZHJoN2tV?=
 =?utf-8?B?R1BrQS9mUzU5SHVRUStFbU1jNFM5dmtvTWNLcDFBazN5NFRyUm5QVkhQeG41?=
 =?utf-8?B?cmp1YksrbkcvWmViZEJzV3J3V014NW5wbm1FZndMM2JwdTRzQktQS0lEVEdp?=
 =?utf-8?B?bkRPa3FPcVB1WlBlUHFsL1UxR2FoZ2NmeVVmcjA5QjM0ODB5eDJIL05BT0kx?=
 =?utf-8?B?UmM0V1RJcTNYQTJRdC8yUmJlNjdQV2FnUEc0YTBpOVNJSStPL0g4dUhBaWdJ?=
 =?utf-8?B?Z3lhUXovREdQREliaDVmcGFaV0NOMXVMbVF2Q2ZwMXR0SUVPK2xCWllrVlMz?=
 =?utf-8?B?L3BiUmJzVkpkaEhNMVN1cnJlazZrVGNtTGRaOURrUlJ0OUZjd21MN0dyMFVV?=
 =?utf-8?B?MjRhM29iMzF0Z2todWs2Q2U1R0lMRFB3NFR1ellybnc1Mmk2TDJuOVdoVFBC?=
 =?utf-8?B?MGFCV2VnR3h3emFBODBEWFV5d05ObmdlY3Rpakl0UjdlMHpZY2drT2RpWWFy?=
 =?utf-8?B?OVhTUEZMeDR4Q0E3MVZNbDh1ejRQZi9WM3VUbVU4VXZITG5pc3hPSXJFTGZQ?=
 =?utf-8?B?YW1SQU5mRUhtWFp0bU5LKzlNSTN3RkhtUHk2U2t0MS93OUxpN005L3hRa3BQ?=
 =?utf-8?B?akcvZ1FGdUFuZk9HS0o2bXdqWTdaTWRldUFKbEgyVUszS1MxeVd6VGQzN3U1?=
 =?utf-8?B?QUc1TTV6KzEwMUFoZklxS0ZaRkZjaEM0aVA2NTdQb0FoeE00dVlySERnZ0pk?=
 =?utf-8?B?MzlLa2pjM2JpSnFJQS9Haml3S0xBZDgydkJXaGVZSEVMckpkRWRTQUNZRGo5?=
 =?utf-8?B?djNhZHJDVXJwbDYzZ3JBZGQyWG5MRFVRY2l4NENKcVNiVzd3T3Zza3dzZGhO?=
 =?utf-8?B?b1FvL2RRdjF6NXcxaHo0NXp6YStKT0s0ZkFYYWVrY3RNQkdJcVpmeVo1NDdR?=
 =?utf-8?B?WEs1b0VsYk1pNEhLV3ROSUFoOGo1eWJBQzdsU0JBRWVDa0tRaE9meGU3eVF0?=
 =?utf-8?B?M3VLelVIdEEwVWtBQ3oydXVYK2UrVzMvbUZxUCtRUS9KRjZyQ09WS0ZoWDZ5?=
 =?utf-8?B?ZGo3MlYyK3lJdFN2elVWTHVYRCt2SjZiY2YzV3ZtUEVQTHBwWFdleXJiOVhI?=
 =?utf-8?B?bGFnV1loQlJ1eTFJWEdNdzRSeFk2d0NpT251MUZOZ09UbUR5N2hISzA3bHRh?=
 =?utf-8?B?MHZ2NWdveDZTaG1wVm1xcWlwL203MG1YcUVDVll3SlFVRG5nYkw0TndLQkl4?=
 =?utf-8?B?TmhFQ3c1ZFFJT1dKNC9aOXFKVHhLVDRkNDZXOGJqOER5THF6VjZqOG42akVP?=
 =?utf-8?B?MFNCbmlKYVVnQWVZZ2xSaEV2dUpZWStyVEJoWXpMSUJqZCtrWEZ3ZGRTZlZr?=
 =?utf-8?B?eDM0S2U1SUhkZU91Mjg2cnorRmZyVG8xMStZUWt2R2xSOHhndWNqYkEyemlm?=
 =?utf-8?B?TEwyQkt5SlQxVCtidWkvUG9GVXZSZXVoNjJXamhaWTE4WFdsenREaUN2bGdx?=
 =?utf-8?B?a01Pd0dwQXV3a1JQYWl0dE8zNWxxd24xQndQWlpQRmNPMkIzaU1JK2w4Zyt1?=
 =?utf-8?B?SSs4WFVuR1h0UEo5UzgwWTdoZ25JdUVhZlBrMEpBeDFBVW03dnJRbEtXMW1J?=
 =?utf-8?B?a3FLT2VoOFhiemlHWkFod2hwNHBabzRQTS9HOUlJZHFQQU5WU25Qb2NiRFF4?=
 =?utf-8?B?Qy9ROE5pZnRXaFd6UjNEbjQzWnNpNUwvQm9zNDByZVR0ZzM0R3lad3VsYnRh?=
 =?utf-8?B?V3Qwd2JubmRwcTF1WFhwUDFxVkZZR3NrOWRNUFZBVG5DbXdndHdqTkhYYkV0?=
 =?utf-8?B?ZHBFdnlMdHFNdUdrMzNVeEk2NTA2dVZld0xZS09pWW9TUVdtbWd1ZE5pMWU3?=
 =?utf-8?Q?j4KHM3glW8vONxDsy0TgZThx4?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e34d6d3-662b-455a-5c24-08dc83aaf91e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 08:55:52.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkiuwgFmm5k8qwbKBq8pf8nSIZq4F0CObp7EvrYBxQLs0qxVNbskUxGuGhpqrTYLeLIYV4ZyJM9XBpLKUaHhaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_015601_419970_313EFDBD 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I have a system running Linux 5.10 which logs quite a lot to a database. 
The system has been running OK since before Christmas but now it usually 
fails after a few hours with errors like these:

May  6 22:29:58 172.26.203.90   warning ubi2 warning: ubi_io_read: error 
-74 (ECC error) while reading 58 bytes from PEB 1:230872, read only 58 
bytes, retry
May  7 00:11:08 172.26.203.90   warning ubi2 warning: ubi_io_read: error 
-74 (ECC error) while reading 58 bytes from PEB 40:239752, read only 58 
bytes, retry
May  7 00:11:08 172.26.203.90   err     ubi2 error: ubi_io_read: error 
-74 (ECC error) while reading 58 bytes from PEB 40:239752, read 58 bytes

Fastmap is used on this system. The ECC errors are usually in the 
fastmap area, erase blocks 0- 63.

When looking more closely at the erase counters they look something like 
this:

0 - 63: 29600
64 - 2043: 2200

It seems like 30 % of the writes are writes to the fastmap area. Any 
ideas of what can cause this many writes to the fastmap area? Heavy load?

Any ideas are welcome.

nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
nand: Toshiba TC58NVG2S0H 4G 3.3V 8-bit
nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 256
nand: 2 chips detected

UBIFS (ubi2:0): Mounting in authenticated mode
UBIFS (ubi2:0): background thread "ubifs_bgt2_0" started, PID 187
UBIFS (ubi2:0): UBIFS: mounted UBI device 2, volume 0, name "data_volume"
UBIFS (ubi2:0): LEB size: 253952 bytes (248 KiB), min./max. I/O unit 
sizes: 4096 bytes/4096 bytes
UBIFS (ubi2:0): FS size: 505110528 bytes (481 MiB, 1989 LEBs), journal 
size 25395200 bytes (24 MiB, 100 LEBs)
UBIFS (ubi2:0): reserved for root: 4676575 bytes (4566 KiB)
UBIFS (ubi2:0): media format: w5/r0 (latest is w5/r0), UUID 
990A460D-A55E-4B58-ACAD-01FEBC7AF839, small LPT model

ubi2: default fastmap pool size: 100
ubi2: default fastmap WL pool size: 50
ubi2: attaching mtd5
ubi2: attached by fastmap
ubi2: fastmap pool size: 100
ubi2: fastmap WL pool size: 50
ubi2: attached mtd5 (name "data", size 512 MiB)
ubi2: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
ubi2: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
ubi2: VID header offset: 4096 (aligned 4096), data offset: 8192
ubi2: good PEBs: 2040, bad PEBs: 8, corrupted PEBs: 0
ubi2: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi2: max/mean erase counter: 29685/3107, WL threshold: 4096, image 
sequence number: 4060280209
ubi2: available PEBs: 0, total reserved PEBs: 2040, PEBs reserved for 
bad PEB handling: 32
ubi2: background thread "ubi_bgt2d" started, PID 186

Best regards,
Rickard Andersson

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
