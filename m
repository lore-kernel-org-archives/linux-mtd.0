Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4B1E7716A
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Dec 2024 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lEIGs6dkN8SkAj4nfhc3+N9t8anjVWeWLYR3Wb84to=; b=NPH2yZ8Hakw9PrxD2yCkeBJSPT
	cdTHqmg8AWu+eLcs/xnCIMkWeyuJXJX0IGUPjbHGCdyAHRnBAgN4Y+6G5a6HQ2+50DPqM9gnAdwU1
	w6W1V97ClLrQehDVL3dHaFHM6SKV9D/Jh+pMkttqlPC1NzQRnHeRep5M/UObTjiAxchiMD7xaOrsG
	L6RaO7hcshd7sxynum3ppkopYQp2vbwCPrazKh/NC2f200/bjcEJD06hYrIKCoGNycNnRQszu3y/C
	r/kfql6o8FRUi7G1PM8keVxRbjJ88oJNqTMzLvyUQQxxO0ur3d4H0KCz8CPyYppfa6EJEjMWxLdgy
	xmDqD7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMr8q-000000088xz-2uWq;
	Sun, 15 Dec 2024 16:06:48 +0000
Received: from mail-vi1eur05on20626.outbound.protection.outlook.com ([2a01:111:f403:2613::626] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMr8k-000000088xD-2LXR
	for linux-mtd@lists.infradead.org;
	Sun, 15 Dec 2024 16:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9jHsQFz1okmZiITj0zVS4TFsthfHa28v398Q7QYZlMJfdmEdat1zNLFMX/zhW5kFdtrHP93/hUC6AiS/V1gA/FdT7s5zL3v0x1JCJ4y5WpxHznWGsAWklVIfVW3FetuWNJWcBAEGBslvUtDqzCFOjQu27+i0uqeqxuholHNL1iG8YlLwdBOsNBMMyOAvJM/I8+Oo0XrTUCdJolHU26zu6mjCLQS5tgr0Go0DPOHUscksGUYShrjhi+lyp6qvh1fxs+17IaetM491naOKnGkcsAqjfCXOKfEACFXEu+Q44e367YnxT56y8CaARo3wLjFFrkUbo8nNWoFAAFEr23bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghPZ9mdS3x5sreIhLP6yMTEwx4au47nbQCIupbQBJVU=;
 b=g1prKd4VXgH5B3BRPrNI18UkcPICs4KAurxYvyvfAWhaIdD0v5SfAhwp2IGK2TstdY7KmtAkmLfWWza6ybgGhCfzLMfWmAKaPe4XQdQ/lC0O9V3lC+MPE952H6kvrkmS7KjKbRYX9g5Um3HFGR4sZnZcwtoL2sfVUkBFBcwVV1P2rK1lhymlB0lv6gZSoHd5wRenmDLdaXsyb/3z54Y1FD06RO0SIL4h5iXi2abCUw8M+hwG5QYqCgs5tLOkzRDWvcb0A5eC+RIuiUWBE5NY45ZpIj19Lhpfo2xZlMw83kLkjWD9XNR05OG16NcmgcuRxgLSHuk6DNWqCLnLf0YDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghPZ9mdS3x5sreIhLP6yMTEwx4au47nbQCIupbQBJVU=;
 b=a42n1UiGFVt4UMCy0BXO3+YX0SMrxPE6mNzSYrkVlOkLm5Y4ci3bHaHPO4KWnLtCgdkknjTxuLW8goGqEx+kS/dKScMJit42SQB61dhn1/So1814pJOgC6NXMO6JFjYsR5TML4/6VcPzmztWRkY9EYXoyn/gI/S5kzHR8zo1FkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9529.eurprd02.prod.outlook.com (2603:10a6:20b:5a5::16)
 by PAXPR02MB7912.eurprd02.prod.outlook.com (2603:10a6:102:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Sun, 15 Dec
 2024 16:06:29 +0000
Received: from AS8PR02MB9529.eurprd02.prod.outlook.com
 ([fe80::8927:53fe:9d2:cc22]) by AS8PR02MB9529.eurprd02.prod.outlook.com
 ([fe80::8927:53fe:9d2:cc22%4]) with mapi id 15.20.8251.015; Sun, 15 Dec 2024
 16:06:29 +0000
Message-ID: <e157669a-0ffa-4d43-b282-e14651c269b9@axis.com>
Date: Sun, 15 Dec 2024 17:05:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubi: Revert "ubi: wl: Close down wear-leveling before
 nand is suspended"
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
 dennis.lamerice@gmail.com, vigneshr@ti.com, marten.lindahl@axis.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
References: <20241214110153.684919-1-chengzhihao1@huawei.com>
Content-Language: en-US
From: Marten Lindahl <martenli@axis.com>
In-Reply-To: <20241214110153.684919-1-chengzhihao1@huawei.com>
X-ClientProxiedBy: MM0P280CA0099.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::12) To AS8PR02MB9529.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9529:EE_|PAXPR02MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a92f28-5ac5-4875-6127-08dd1d226f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXpsL2p2MDJJQllJeER1Z3cycWxqWU41ZDFxMFJzaEVrZHRSYnVOd1RYbFJu?=
 =?utf-8?B?bll4Q3c1U2Nic1huSlBuUmxaaXR3Z2p4K3pOU2N1YmZDVXNJVWU4YzJQeU1y?=
 =?utf-8?B?Yk50aG1KQkkxM0JCam9NeUxKVHVHQ2RlREIyZUpxWGdvYnNQYXFNQUpKZjNa?=
 =?utf-8?B?T251d1dueHZPQUppbS9HcjAwVUJjaFNKNldSUjBVS1l6eHFRNVIxald2MUUx?=
 =?utf-8?B?a1dhNW5LRzRJcHpyZUtCUXlkVFluZTQ5eGdZR3ZUOUhyL0pqWm5tcnV5WWlO?=
 =?utf-8?B?ZUh4OGFRTWh6NlEzaEFkNi9JV01YeG5scys1b2dIMmxLRzZrMktUYTJRcStw?=
 =?utf-8?B?ZTRXc21pdno3SU13VU5NNEN6T1hPdEovd1EyVExLWHJ3K3hZRExlUlQyaTg1?=
 =?utf-8?B?c3JLUTNta0R1TUV6UlJVYXpIZXRjYUNEVVVic2Z4SnRhTTdlYWZoVnF1R3lH?=
 =?utf-8?B?d2tyNEoyU3E2U0xVM244K0tlZnBXdjhTU052Z0RTcjVrUklHaGpnZExRUUNl?=
 =?utf-8?B?WGtzZzZXc0NUL0JoUjJUQzFBSVVkMnVBcDkwcldEZUN5dFc0V2lZN0VZa1Fn?=
 =?utf-8?B?a05Lc0RYWitIQmpQRFpxYVM2bGJGT3FRc1NFU05tYnJwSkwvRmdKbW53MEE5?=
 =?utf-8?B?ZGJKNUl2SXZRaEM3U3JHbXNtcU1peUg1UkQyU0QyMWUxUFp1bVFFUDRyZ3lm?=
 =?utf-8?B?MUc2ODV4dUk0K1p5aHJ0Mlh0WWk3UEdrYU8wNHh2MUNmZURmUVl1NDdScTRO?=
 =?utf-8?B?NGpncjcxU2p4bWRjOWxVbUNHVGR6NFM1ZFpPYkRUUjI4eEIyREhFbjNQTm9q?=
 =?utf-8?B?cG5aVHFuVEduU1RYRE9IMXVJZlBCVk5DaTU1MmhpeWEraHF2UXRUV2Y2dzE1?=
 =?utf-8?B?MDdSbjNxblh0MTNmdmIza1ZycHF6ZTJsODRZTVd4MkxtbXNBTG5CU1o5L1dZ?=
 =?utf-8?B?QWw1ZFdaSU1CamZiL2JwYzFPcE05RENjMjQzVllHU1VkSDh4dmk5M05qdTVH?=
 =?utf-8?B?SEhOeU1BdTI2RHl5MkR1TXUwcjFVWGxlblBDeHExSWtnVExXNE1hOG5YQm5J?=
 =?utf-8?B?bHBTeDJXUlVKNDhoT3dRUHh4SHptaDZuSVprMk0zdUlyaThhUUhMSFR4ejYr?=
 =?utf-8?B?OENISWpRY2FDRVNPMSsrRWt3V0twb051S0dmdjV4Yk12QkE1WUpLdVI2TFZu?=
 =?utf-8?B?ZlBrY3UyMjZYMHYwUW1lV25TZ2NXd3R6K3VIK0N5VnR6RVFvN0ExZVF3S2hH?=
 =?utf-8?B?bjZ1UzI2aEs1VXRaSEMvenIzbUdUTWlzSWhIemhzRWo2MngvSmVGQXBBaUNK?=
 =?utf-8?B?SHJmMWxmTDZ3cVpwc1ZOQnY3bUw2ZHhVU1VMU0YxamNVZW9lZC85UVNWTEtj?=
 =?utf-8?B?aldJbTZySWRVMm5yNnJEcnZ1MEtMRXc0ZFNqT2dERDBlV2VQSDlML1dJdG04?=
 =?utf-8?B?V2o5UHlQaUZLaFdHMnd6ZnhCSkNhaVMrRFJDaXNWK3htK2h2R3M3NE9jdmpG?=
 =?utf-8?B?YmpBcXY4VFp4NkFyS3ZrMXl3U2FhWWVpVG1VL0hIalNEZmtaT3U4ancrY3A5?=
 =?utf-8?B?b3M3MzhxV01hM2xTaFJsdDMyK2M0NG5QZkMzQVZONjRVMkJBYVBBRjJ0clJI?=
 =?utf-8?B?cmtJblB6bE1SSElISSs0ZEFBVEhERTVMNzhTU2V2SDRFZkk3NWNRTktRdUtC?=
 =?utf-8?B?ZDNqSXlNcGZpWG1nQlNHNFUydXcrMFJSazk5TGo4MUU2aXlENG9IRUxmNTZs?=
 =?utf-8?B?R1Z1R01Wa1h6bE1JSTlmTVluY0hNcm9SSlNtdUFMbmZaMFFjM3E1QXgwVlB4?=
 =?utf-8?B?QkY0K1Blck1QeUVNUEVRdmIvbjhUSDZORFp2OFAyMW04alJkTGpzYzVmUFpS?=
 =?utf-8?Q?2pyCbDEf/VZlR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9529.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlQ2MFNBaDZkTTZBVHlaZjJkeVpXQzFvWGJrcHFSZnBjdmRqV0Q4cEFvNHE4?=
 =?utf-8?B?T2tQUE9WSVlYL3hnV0NYMThPakdlT3BSeTJ2U1BJdy9SU2JQVzZPZ0YxRlhL?=
 =?utf-8?B?VzVQMWZBd0N6Y3d5U0phZi9BcWFSTENxYS9NT25vYmVkWmdaaHFJMjNaZXQ3?=
 =?utf-8?B?dHorOWF4ZFl6VkI2Z3ZUVGhUWUM1U3hqMlZ5VFJzdjdWUnFRWVlpVE9XZFph?=
 =?utf-8?B?dnlpMG9UVEhhampTRWRIREw4eEZVcXEvUHVqL1loczRScmN5S2hQYjlUL2VW?=
 =?utf-8?B?ZWl6cXZ6aXlMeExxdEFJM1o5blV5eVA3R3QyNUZsa3U5VHp5NDlXakcyd2Ns?=
 =?utf-8?B?Mkx3SU93cm9wRVdiRHRoejhibW4vZWN4ZXM4SzRFc1VRZzVQRTJmTnVERVpL?=
 =?utf-8?B?WmtYeHRKUmhzT0pWL0p0TUJUZDZJOWtnWXFLTEljMTljc21JczY3OEpZbVJM?=
 =?utf-8?B?bUlxYm54TkdoZDg1Skc5ZXh6ZWVZWml2RWpHZmtkK0lqbStncktOM1U2ZC9P?=
 =?utf-8?B?aHl4UzBWNFN2dGVCSy9oejFsRUN5M25Fa05vc1kvY1JDRk9WU0hFa2RKcEFO?=
 =?utf-8?B?RXFVeVdsRlhRZG1nYzdoMzFjaUhqT3JzOUw5UjNCK1UyejR3TU5pS2Q3VUwx?=
 =?utf-8?B?cU1HaW1LbkNjRFQ3eGtNclJOdTIrT2I3WG9zSk5acTM1NmVwczZvcEp4Y1NY?=
 =?utf-8?B?UWhITUhXTndjZWxmb0QrZ1I0Y0VWZWNmZHJrZHFZZUl2OERqdE5nOFJpdVJF?=
 =?utf-8?B?bFBrYTJTMlFFaVZhc3Z2c2x3OVdqam1WSnVZR3pMOTY2aFFHOFYzL2JYUkti?=
 =?utf-8?B?VjJmTG5RdjBvd2xXRzZLRFlpc2hCYitaQjNDcWNvRHhxVXVrdUZhdjQ0a3k5?=
 =?utf-8?B?a0VpWjdEQjA1WFc0Wjc0Y3d6OGlEcEJjWHUwNWo5WG5kQnlYZ2wrK0ZPenpI?=
 =?utf-8?B?Nlh1ejd3aDJNSzBMejBodlpTMUdhRnpzUytIK2p6T0tTaE9ta0tFU3Q0UndY?=
 =?utf-8?B?Vk1mSThiVEQxMmo2cVhuVjVoVXpMY1B3SW1lK0ZoZXI5Qklybm9LeXJvNXdS?=
 =?utf-8?B?UEdRWjBZZU4wRkNzTzExNFpROEhUYkp2TTYyZnp3clVhSTFTTm4vWVcyZ3hC?=
 =?utf-8?B?U3lyOXJKdnU0VmpuTnppT29wSENSc0pQQzBRR1dEeS8vYmRXcVdERTZYaXFQ?=
 =?utf-8?B?bmxyUTJEdzBxNEJzWmptSjV6UFVoRCtVcStZQjNsTXNLMWhPMDRwQUxqemNz?=
 =?utf-8?B?RFNGMTlpdkJna0luWXo2alZHa2V0RDFCa053N2Q4SkRRT0Y1YUxpQ2VkTUUz?=
 =?utf-8?B?aUxMejFFL0lWNzVZU1c2N0NkQ3gzVVJhMjVjdS9QeWhacFhKaWx5b2FWeHFs?=
 =?utf-8?B?by9wbnJ2THZMOCtUR2VJUUdLVW5IU3dQUzlsTFdrY05uYlZaUU4zOU9MTG5F?=
 =?utf-8?B?R0h4Q1ZBS0FlOU5vV21JSVB6dTFnaW5OeFdtM0RFZVVaaThIK1d6V1RCVWJQ?=
 =?utf-8?B?N09xQmdRcEFvRytIZWZpckNOUmplK3pQZU9ldkFVQnJJcUpCQjIrTXJiaEZp?=
 =?utf-8?B?ZnNOVjAwMXhnalBuc1hNaUZNYUFuRUYySGFIN3Q0TVByaXNzWUFoYWc5Sm05?=
 =?utf-8?B?UjVER051dzJFMUYwbkRGTFU4ekU4VWdvOUpSL1orM1gvTURKd3QyYkZQOFQx?=
 =?utf-8?B?RkMveUVERDM5bDlOT2Nqd3ZyVHo4VVF3T0tjTEZITlVHQWlhVEJPYk9icG5i?=
 =?utf-8?B?bkk2elcxaitGRXdVcGxaU0dNK0xFWmE3S1VuRDBaQnBDMXBCeGdmMm5mQjRp?=
 =?utf-8?B?ZDZUYjJlRTlpN2dYcEhIaEFSRzFEN2p4dEpUQmFyKzVibERkc1dsdDNCNjF6?=
 =?utf-8?B?R0hLYmU5Qm10eGprSEo4ZUpMNlFVazdiZVVQYytTajRuQjJwN08yME9waWxL?=
 =?utf-8?B?TzBXa1hUVy9neTRIMUNxMTVxSVdoY1JRdG5yeWJaUUVKMm0yWFdzTEdxWXRP?=
 =?utf-8?B?QVo2M1ZUOC9JdjIyeUVFbDNWeXFKaWFkU2FjRzVuVnptNE1POHNOeEtNR29X?=
 =?utf-8?B?ZDhpRDNIUTlzV0JxaTNIcWh5OWwxdndVR3l1RXNrNDUwRlEzaEFQQ2xZa0xl?=
 =?utf-8?B?RW5aaUtlYUxtTkZvTXZhaTk5ZjN0aklvU3lwZXlwNFhaVkhrc3g5emoyM21U?=
 =?utf-8?Q?JGGXdsyyxsdfILsGv6vr/YPqStfGMZq45m4bWNKYAQrm?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a92f28-5ac5-4875-6127-08dd1d226f5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2024 16:06:29.2417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZZx+h0xGdgKGHXKNO1BU3h9u0UWfge3u3whNv96FEOCzfmux7DlqvANSxNhX9lANSQ8O7aOHXcgLZPCvbmRSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_080643_158645_303B94C6 
X-CRM114-Status: GOOD (  20.41  )
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

SGkgWmhpaGFvIENoZW5nIQoKWWVzLCB3ZSBkaXNjdXNzZWQgdGhpcyBpc3N1ZSBpbiBbMl0sIGFu
ZCBJIHRob3VnaHQgNTU4MGNkYWUwNWFlICgidWJpOiAKd2w6IENsb3NlIGRvd24gd2Vhci1sZXZl
bGluZyBiZWZvcmUgbmFuZCBpcyBzdXNwZW5kZWQiKSB3YXMgZHJvcHBlZCwgYnV0IApJIHNlZSBu
b3cgaXQgZ290IG1lcmdlZC4KCkkgYWdyZWUgaXQgc2hvdWxkIGJlIHJldmVydGVkLgoKQWNrZWQt
Ynk6IE3DpXJ0ZW4gTGluZGFobCA8bWFydGVuLmxpbmRhaGxAYXhpcy5jb20+CgpLaW5kIHJlZ2Fy
ZHMKCk3DpXJ0ZW4KCk9uIDEyLzE0LzI0IDEyOjAxLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4gQ29t
bWl0IDU1ODBjZGFlMDVhZSAoInViaTogd2w6IENsb3NlIGRvd24gd2Vhci1sZXZlbGluZyBiZWZv
cmUgbmFuZCBpcwo+IHN1c3BlbmRlZCIpIGFkZGVkIGEgcmVib290IG5vdGlmaWNhdGlvbiBpbiBV
QkkgbGF5ZXIgdG8gc2h1dGRvd24gdGhlCj4gd2Vhci1sZXZlbGluZyBzdWJzeXN0ZW0sIHdoaWNo
IGltcG9ydGVkIGFuIFVBRiBwcm9ibGVtWzFdLiBCZXNpZGVzIHRoYXQsCj4gdGhlIG1ldGhvZCBh
bHNvIGJyaW5ncyBvdGhlciBwb3RlbnRpYWwgVUFGIHByb2JsZW1zLCBmb3IgZXhhbXBsZToKPiAg
ICAgICAgIHJlYm9vdCAgICAgICAgICAgICBrd29ya2VyCj4gICB1Ymlfd2xfcmVib290X25vdGlm
aWVyCj4gICAgdWJpX3dsX2Nsb3NlCj4gICAgIHViaV9mYXN0bWFwX2Nsb3NlCj4gICAgICBrZnJl
ZSh1YmktPmZtKQo+ICAgICAgICAgICAgICAgICAgICAgICB1cGRhdGVfZmFzdG1hcF93b3JrX2Zu
Cj4gCQkgICAgICB1YmlfdXBkYXRlX2Zhc3RtYXAKPiAJCSAgICAgICBvbGRfZm0gPSB1YmktPmZt
Cj4gCQkgICAgICAgaWYgKG9sZF9mbSAmJiBvbGRfZm0tPmVbaV0pIC8vIFVBRiEKPgo+IEFjdHVh
bGx5LCB0aGUgcHJvYmxlbSBmaXhlZCBieSBjb21taXQgNTU4MGNkYWUwNWFlICgidWJpOiB3bDog
Q2xvc2UgZG93bgo+IHdlYXItbGV2ZWxpbmcgYmVmb3JlIG5hbmQgaXMgc3VzcGVuZGVkIikgaGFz
IGJlZW4gc29sdmVkIGJ5IGNvbW1pdAo+IDhjYmEzMjM0MzdhNCAoIm10ZDogcmF3bmFuZDogcHJv
dGVjdCBhY2Nlc3MgdG8gcmF3bmFuZCBkZXZpY2VzIHdoaWxlIGluCj4gc3VzcGVuZCIpLCB3aGlj
aCB3YXMgZGlzY3Vzc2VkIGluIFsyXS4gU28gd2UgY2FuIHJldmVydCB0aGUgY29tbWl0Cj4gNTU4
MGNkYWUwNWFlICgidWJpOiB3bDogQ2xvc2UgZG93biB3ZWFyLWxldmVsaW5nIGJlZm9yZSBuYW5k
IGlzCj4gc3VzcGVuZGVkIikgZGlyZWN0bHkuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjQxMjA4MTc1MjExLjk0MDYtMi1kZW5uaXMubGFtZXJpY2VAZ21haWwu
Y29tLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOWJmNzZmNWQtMTJhNC00NmZm
LTkwZDQtNGE3ZjBmNDdjMzgxQGF4aXMuY29tLwo+Cj4gRml4ZXM6IDU1ODBjZGFlMDVhZSAoInVi
aTogd2w6IENsb3NlIGRvd24gd2Vhci1sZXZlbGluZyBiZWZvcmUgbmFuZCBpcyBzdXNwZW5kZWQi
KQo+IFJlcG9ydGVkLWJ5OiBEZW5uaXMgTGFtIDxkZW5uaXMubGFtZXJpY2VAZ21haWwuY29tPgo+
IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjQxMjA4MTc1MjEx
Ljk0MDYtMi1kZW5uaXMubGFtZXJpY2VAZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91
YmkvdWJpLmggfCAgMiAtLQo+ICAgZHJpdmVycy9tdGQvdWJpL3dsLmMgIHwgMjEgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIzIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS91YmkuaCBiL2RyaXZlcnMvbXRkL3ViaS91YmkuaAo+
IGluZGV4IDI2Y2M1M2FkMzRlYy4uYzc5MmI5YmNhYjliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL3ViaS91YmkuaAo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS91YmkuaAo+IEBAIC01NDksNyAr
NTQ5LDYgQEAgc3RydWN0IHViaV9kZWJ1Z19pbmZvIHsKPiAgICAqIEBwZWJfYnVmOiBhIGJ1ZmZl
ciBvZiBQRUIgc2l6ZSB1c2VkIGZvciBkaWZmZXJlbnQgcHVycG9zZXMKPiAgICAqIEBidWZfbXV0
ZXg6IHByb3RlY3RzIEBwZWJfYnVmCj4gICAgKiBAY2t2b2xfbXV0ZXg6IHNlcmlhbGl6ZXMgc3Rh
dGljIHZvbHVtZSBjaGVja2luZyB3aGVuIG9wZW5pbmcKPiAtICogQHdsX3JlYm9vdF9ub3RpZmll
cjogY2xvc2UgYWxsIHdlYXItbGV2ZWxpbmcgd29yayBiZWZvcmUgcmVib290Cj4gICAgKgo+ICAg
ICogQGRiZzogZGVidWdnaW5nIGluZm9ybWF0aW9uIGZvciB0aGlzIFVCSSBkZXZpY2UKPiAgICAq
Lwo+IEBAIC02NTIsNyArNjUxLDYgQEAgc3RydWN0IHViaV9kZXZpY2Ugewo+ICAgCXZvaWQgKnBl
Yl9idWY7Cj4gICAJc3RydWN0IG11dGV4IGJ1Zl9tdXRleDsKPiAgIAlzdHJ1Y3QgbXV0ZXggY2t2
b2xfbXV0ZXg7Cj4gLQlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgd2xfcmVib290X25vdGlmaWVyOwo+
ICAgCj4gICAJc3RydWN0IHViaV9kZWJ1Z19pbmZvIGRiZzsKPiAgIH07Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3ViaS93bC5jIGIvZHJpdmVycy9tdGQvdWJpL3dsLmMKPiBpbmRleCA0ZjZm
MzM5ZDhmYjguLmZiZDM5OWNmNjUwMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91Ymkvd2wu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS93bC5jCj4gQEAgLTg5LDcgKzg5LDYgQEAKPiAgICNp
bmNsdWRlIDxsaW51eC9jcmMzMi5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2ZyZWV6ZXIuaD4KPiAg
ICNpbmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9yZWJvb3QuaD4K
PiAgICNpbmNsdWRlICJ1YmkuaCIKPiAgICNpbmNsdWRlICJ3bC5oIgo+ICAgCj4gQEAgLTEyOCw4
ICsxMjcsNiBAQCBzdGF0aWMgaW50IHNlbGZfY2hlY2tfaW5fd2xfdHJlZShjb25zdCBzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpLAo+ICAgCQkJCSBzdHJ1Y3QgdWJpX3dsX2VudHJ5ICplLCBzdHJ1Y3Qg
cmJfcm9vdCAqcm9vdCk7Cj4gICBzdGF0aWMgaW50IHNlbGZfY2hlY2tfaW5fcHEoY29uc3Qgc3Ry
dWN0IHViaV9kZXZpY2UgKnViaSwKPiAgIAkJCSAgICBzdHJ1Y3QgdWJpX3dsX2VudHJ5ICplKTsK
PiAtc3RhdGljIGludCB1Ymlfd2xfcmVib290X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbiwKPiAtCQkJCSAgdW5zaWduZWQgbG9uZyBzdGF0ZSwgdm9pZCAqY21kKTsKPiAgIAo+ICAg
LyoqCj4gICAgKiB3bF90cmVlX2FkZCAtIGFkZCBhIHdlYXItbGV2ZWxpbmcgZW50cnkgdG8gYSBX
TCBSQi10cmVlLgo+IEBAIC0xOTUzLDEzICsxOTUwLDYgQEAgaW50IHViaV93bF9pbml0KHN0cnVj
dCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gKmFpKQo+ICAgCWlmICgh
dWJpLT5yb19tb2RlICYmICF1YmktPmZtX2Rpc2FibGVkKQo+ICAgCQl1YmlfZW5zdXJlX2FuY2hv
cl9wZWJzKHViaSk7Cj4gICAjZW5kaWYKPiAtCj4gLQlpZiAoIXViaS0+d2xfcmVib290X25vdGlm
aWVyLm5vdGlmaWVyX2NhbGwpIHsKPiAtCQl1YmktPndsX3JlYm9vdF9ub3RpZmllci5ub3RpZmll
cl9jYWxsID0gdWJpX3dsX3JlYm9vdF9ub3RpZmllcjsKPiAtCQl1YmktPndsX3JlYm9vdF9ub3Rp
Zmllci5wcmlvcml0eSA9IDE7IC8qIEhpZ2hlciB0aGFuIE1URCAqLwo+IC0JCXJlZ2lzdGVyX3Jl
Ym9vdF9ub3RpZmllcigmdWJpLT53bF9yZWJvb3Rfbm90aWZpZXIpOwo+IC0JfQo+IC0KPiAgIAly
ZXR1cm4gMDsKPiAgIAo+ICAgb3V0X2ZyZWU6Cj4gQEAgLTIwMDUsMTcgKzE5OTUsNiBAQCB2b2lk
IHViaV93bF9jbG9zZShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQo+ICAgCWtmcmVlKHViaS0+bG9v
a3VwdGJsKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IHViaV93bF9yZWJvb3Rfbm90aWZpZXIo
c3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuLAo+IC0JCQkJICB1bnNpZ25lZCBsb25nIHN0YXRlLCB2
b2lkICpjbWQpCj4gLXsKPiAtCXN0cnVjdCB1YmlfZGV2aWNlICp1Ymk7Cj4gLQo+IC0JdWJpID0g
Y29udGFpbmVyX29mKG4sIHN0cnVjdCB1YmlfZGV2aWNlLCB3bF9yZWJvb3Rfbm90aWZpZXIpOwo+
IC0JdWJpX3dsX2Nsb3NlKHViaSk7Cj4gLQo+IC0JcmV0dXJuIE5PVElGWV9ET05FOwo+IC19Cj4g
LQo+ICAgLyoqCj4gICAgKiBzZWxmX2NoZWNrX2VjIC0gbWFrZSBzdXJlIHRoYXQgdGhlIGVyYXNl
IGNvdW50ZXIgb2YgYSBQRUIgaXMgY29ycmVjdC4KPiAgICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVz
Y3JpcHRpb24gb2JqZWN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
