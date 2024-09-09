Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69900ECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rvQOQico1kM8E/TqdNwZ9cQmio/6mj5myXOK1GS05U=; b=CDw2YZWdf675hYVUbpckqmNaKc
	0MXF7aLgDRMaM6J5+2acWVr0kNBu4RU4NJtvIiCTxutBJ4y4VKqLveqLJgkPp1Q4sye6nhd0jnltK
	hFswMamNJQD83c3eog62FEPPw4mQ/Np36I/wTzTaIgZcYpc9VNao3ehJcsBaXyMJiKVdg8YvohNKp
	4VUHZ0qaCz9/Cc0NafFzlcdxmklVCdwrUQJXkZVJG/8jKba5KuJN8K2EhBcMJ78zNSWbbVhv+K5q3
	Avf+vnl13YNZTbs94SdsFLoahmfY6k4sN7XeizOB3TG4dQNWUfIK0oAyF1XqvchFcu50Pc4k1/k4N
	y77Ftr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndno-00000001uWK-2AWk;
	Mon, 09 Sep 2024 12:47:32 +0000
Received: from mail-am7eur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260e::601] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncbz-00000001gC0-2RTZ
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 11:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0S1BvRqTgy5o7OjpubofvDGxuboe8Uwq7lgekjn5wmV+Iw2AmvoAdIu+2hxe495beg01B/MH8GQWX7Rit+tWSY/8oaHTImPaoeDvUWPCJOjby2HGt8NAz6j2n2Dj8GdqZCE2Znsp5HgBmfGh8MIWMzlwnjzKJm1tr1dJ7V9ZUc5eDrg+8JqPFxxEQ3DDH4j5A8Eh0Czp2HVGeeqd+P/P9gouhzEaG3L5sW6/hdeGtu8W5ItXocOkG7Ix6al7EWvBOsELnIVOwa7xoaddCj1VaWFN6z1/Ki2qxljpoRm0+hHRyJEQfUIHEB1UBAEvevlAWas3oYM+71YNqsW5CdzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo0qjp63B2tBZp6cwVYzqKp/jHSLG7wSkz2hrYf6wxM=;
 b=GutqG8clzx3i5LDErid+yEbcKMQE2IbizAbZX899yo8eqjj11hUBenUJCWBAQZSpi3U8BSMQnXaEH0N4oW5qjM8OQ8NAHJRHbgZR0KMYwy1m5TM1gspEXwc7dG6EG2oc4ogAlHX4aH50Shr6+6gKiE/5IBNl/CaF6OoA/ootHcgTYf0xOqDwB0wwQWUGF+3lRbuzt3y7H+Aro7nHeMx47azYDMvXFPW6nAc6eYHtUHGhSVNWXnFmzQXps1B910qKjmI+zhLd3xwY2VNxCoIRWT0fMoioWPPQpzdr/NPl/4pIxMRSMPsGTNu9B2FHlloaEYRfYTFjW0GlP0tJP0+BJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo0qjp63B2tBZp6cwVYzqKp/jHSLG7wSkz2hrYf6wxM=;
 b=YFWZ1WLAEqQiz83iYQx7YZLMhd8uqZ0cqHg3N1blaqexQUaUT/WEw9PAtmKQECUXoTtco/7pwexg4FILnUiKBfE5Sf3Cc/srs0+dYErUNBFD8qxBo1wB/1h+zAcSLxpFktOGam7BgIa07TJYtOqIO5tGOLWOIM4/mrT8/GUVb3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9529.eurprd02.prod.outlook.com (2603:10a6:20b:5a5::16)
 by AM7PR02MB6339.eurprd02.prod.outlook.com (2603:10a6:20b:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 11:31:07 +0000
Received: from AS8PR02MB9529.eurprd02.prod.outlook.com
 ([fe80::8927:53fe:9d2:cc22]) by AS8PR02MB9529.eurprd02.prod.outlook.com
 ([fe80::8927:53fe:9d2:cc22%7]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 11:31:07 +0000
Message-ID: <9bf76f5d-12a4-46ff-90d4-4a7f0f47c381@axis.com>
Date: Mon, 9 Sep 2024 13:31:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubi: wl: Close down wear-leveling before nand is
 suspended
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 =?UTF-8?Q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@axis.com
References: <20240907-ubi-wl-race-v1-1-6f7f5e0aea7b@axis.com>
 <10beabdf-17e2-8232-0ce9-1b3d1136f6bb@huawei.com>
From: =?UTF-8?Q?M=C3=A5rten_Lindahl?= <martenli@axis.com>
In-Reply-To: <10beabdf-17e2-8232-0ce9-1b3d1136f6bb@huawei.com>
X-ClientProxiedBy: BE1P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::17) To AS8PR02MB9529.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9529:EE_|AM7PR02MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: aa69c170-5d03-41ec-4e61-08dcd0c2e543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjFaeERsMlBNU09aUUZuTjFRSUhoUldkK2ZaempZeklBL0VEam5Ia3ZleWR1?=
 =?utf-8?B?TFRuY1R5RHhoeEVTQWcramszMktzR0JHNTZWekcrK3FpTUZjZUlUd1dIT1Vt?=
 =?utf-8?B?R01aWlZsaHR1azhIYjYzc3FUdG5kOU5ub01IS1RXOE1xMGtMd0dWdzUrMHRS?=
 =?utf-8?B?cEFDVldodzVSRFVKc3FYRk42cE5xOVo3bWZzV01xRHc1RkNCYnJSY0VSZXp2?=
 =?utf-8?B?cXN6eVZlM2Y0Qkx5amk5Mlprb0Y0YXl5L2hUQlNPZmtUTDlHaHNwcVR1d1hY?=
 =?utf-8?B?S3pjUFIwaXpVUkRRQVhrUkVKZ2FsZzIyRHRhL1hYcEtzSnc3dk5HdXRkSlRk?=
 =?utf-8?B?SWtjLzJPZGhpUGxPNTV1c1lLQnVxb3hrRkhwaHJmTFZkTnZGZEdMRm52MHc0?=
 =?utf-8?B?QnhRNDY2ZGpzbjJsN0NDdzlPMXl2RjYyOG50NGQvd0lYUnRHdjIwNUtBWkd0?=
 =?utf-8?B?V2l5TEVUUTZUVWwzMlZiWmplamRONFhLMi9YaU0rMElQVnN5b3FKVndhd1JC?=
 =?utf-8?B?a050cFkyNnJlclNzdURkNDByYWZ0VTI3ZWMvVEx6MzdnUFdaOWw3eFJrekFF?=
 =?utf-8?B?am5XSDZpZFJrL21MRS9kd1FWdXc4VExTSzlESnZWZlk3d2V1VDRpdkpWbmM2?=
 =?utf-8?B?YUgyaHhEaDhBNFVhVXQ3VEptcEJ2UWcrZWgxMjRpWWRRRmRGL2xkT1NPNWcw?=
 =?utf-8?B?NjBCeWVmTTF2bWxDSk1vaFd2UzBwOWNUWnVxQTNBZWl2VUFOdEVCK1BSQnlq?=
 =?utf-8?B?Q1NBOXlQbGtySEI1T1p5bkFVRHlreUN6Qi9uUFF6NHhNVFBuV3RCZlZuRTFu?=
 =?utf-8?B?bWZIalhVb2VyWFVBeXI5UEpNQUgxdnlXc01RdzhFSm1KZkhtSXRMMFIzVzIx?=
 =?utf-8?B?MEUyQkxlVVRyemtQbUwrK29YeFlhN25BOHQwVjFBK2ZjOGxwcytFS2FSQjJX?=
 =?utf-8?B?aUcxKzZKVGl0MFV1UVNoWitUcnY0UnJkY0dNd3c4eUZKVGJ3OUcrNS9PUlNL?=
 =?utf-8?B?bWptdjhXQXVBSWcyMTNQMVNnYnlzVFI5dWRrOWtUUnNCdDI4ZmtXWXh5WUJM?=
 =?utf-8?B?ZzNyL1g0RzZNMVdxV2h1N2V5aHFwR1c1VGZTREVMNGNrdGNzQllwcWQvZW5m?=
 =?utf-8?B?MzM3NndKRjNiakp1MDE1THB4Ymkwd3FDR2hENlVTMHBrUGRETFVLV2czamJ1?=
 =?utf-8?B?cGVTYkwvUE05NE1xVWJ0VmF0dGtYQ0NlSENSWkhjYjVvMGpmTE9JUDMvVFJV?=
 =?utf-8?B?dU9RZTN5bjM1b1UySnk1aTRGZ01DZUlON3hML3M5ZGFieWlVYklTWW1TanBp?=
 =?utf-8?B?QXVjS2k4MDBaWlJEWXNDTTFweGdsZDlETnZkbFlQZm0xUVBSYzhFbzBkR0RZ?=
 =?utf-8?B?REM1d0d0cE9leTRodVZ5bDZQdlhicVp6cXpsV1NKdFhJQmhHdDlqVFUrWHRs?=
 =?utf-8?B?QUdoSFdkVnFIMkZMOHcveUZycUg1bVh4MWNhVEJUVi93WDNadDM0TDdydWFY?=
 =?utf-8?B?R3ZYRk90U2xjakZWY2hseTUvOFBCWWwwRDZDek91Y0xDV29PZ1lFR043dmg0?=
 =?utf-8?B?UFpoTVhkQTNHWm9jdDRWdHc0TDhRbHcxbE5JdG1TTEx2QzFycDVFK1lsV2NE?=
 =?utf-8?B?WDNPMGJ1SVpacTJGMGFGZEF6SDZVYWN1M0ZoMnQzZFdpS2ZRRDl6QkMrNHFP?=
 =?utf-8?B?LzZtYm8zZmtXRm11eEhyVEhEcll1SER5K3luREZDMXhsVUsxYzg3dVZOc2sw?=
 =?utf-8?B?SHExa1BOYi9Nd3dPRHpBWGxVQWtDNXliQXRTTklXQ2FFWWpacG5vVTNydjM3?=
 =?utf-8?B?VnArL2sxZnNRcHl6UmhXUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9529.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBydXRNNTZUY05nQVdNVWF6Uy8vQ1lyYXpJUit1SWREdTJXeTlqUk5kTnBj?=
 =?utf-8?B?QWVUc3ZqL0M3WG83MnE2OUYvSE9oMlRHZU5QSHFUbW5YNUN1N3h3UmZMZkU5?=
 =?utf-8?B?MllEZm1rQ3R3elhXT3lmeXM1S1JGUHNkM2FjbWFpZTZCWlgyRjF2TEFwM25n?=
 =?utf-8?B?WGg3Wnh3OTlGMDhLTFkxanFHK1FnTURzcEs1SFRlZUFEalR4OFU3R2Y0d1Vo?=
 =?utf-8?B?Z1pTYm9iVVBONGZFMXNrdkFybXZPREovQWxTUTM1TFV6M1duc1Y1ODRsSlRD?=
 =?utf-8?B?dGdJNE50VFdyc2NMVU9Zckc1Q3J2aHJjMTlnelVKOXRBZHF4WEtvN2QwM2xk?=
 =?utf-8?B?ci9WMElscHNmcVF4VlFrZVgyaW9yZmtmUHBWejhxY0tHZG9NSVNYamg1NlRj?=
 =?utf-8?B?NW9aK2lsUHd5cUZSNW1FUWNjOUVEYzAveGE2QS9mOEgyNy94Q2VZa01Ga2Ny?=
 =?utf-8?B?cDN4djVxb1FzUGo0WXRjcWFEOWo5aURpQVd0bDhlRVBSTkJHYXZ4MW9nbHV1?=
 =?utf-8?B?Q2l3Y25lRllWZkMzejhkd3pVTGMyek0rWmVqY2hNczhTZmJRRS9zWWpZUzls?=
 =?utf-8?B?UmNTZkY2ZHhnQlIrZk8rWTVkUHFTd0EzVVlTODFKZTB3bllLcmp1UXNsK242?=
 =?utf-8?B?a0dLakxDMHcydGtYMFJ2eU5Na09OYldJQTg0L3drY3R5OG94cS9UbnRzcGZW?=
 =?utf-8?B?WTdZQlN5TWdObmt0MXlnbHdzM3E1aEhFYTc2UVhIN0k3cGIrZWRzYjVuNk5n?=
 =?utf-8?B?czJVaE1CKzlRQ0VRN3haR2N2by8yZFROU21LVWtqdU9wMW5kcGNCTmQvTnVy?=
 =?utf-8?B?eEJQTGkzaTBYd1o1WnF4QWQwRTJzTVZDY3pTOHVIaUtaKzF3ZUVGNjZRZVRH?=
 =?utf-8?B?eEtyeWpYTm5xSWVrZElFYzdGSGVPU0tLK1ROSHExZFVFWDRPRnM4S0JoYWgr?=
 =?utf-8?B?MEp5eEpnUVZqUUo3QWNNZ0k0RTJ0dTVsQzZvWXNBMkh2UXEzMWFhMkQzTThP?=
 =?utf-8?B?Y3I3cVlOVm10ZWNyaHA2WmhjTXRsTy9GeDNRdGZ6N3dTb0tPb2ZsSTZKQlo5?=
 =?utf-8?B?Q05ycnBLOG9tNUEyQWtWejFmWGJUZ3dMcjQwWXFnOTY3UytZN3E0SmNOT2g1?=
 =?utf-8?B?Vk1nNUxmYjJZc21RYUJzS0FtV2dKWW5hcDJ6cjgrY2JQc21yRXRUczdIY0dH?=
 =?utf-8?B?UThPREpwam9BS3YwNFk4NlY1bFd4aUswMWY5UHp4eEJzUWRJUjdyQnJINWRP?=
 =?utf-8?B?UXo4T3RkVHhkU2UrcnlnY0s5VG1SOHdzMCtDc3I1VEZUM0pZblNuRmVMM08z?=
 =?utf-8?B?RksxYnZSaEtqcktUY0tjdWdlbnlzOTUxM2NWMC9EWnZPQytVYXdmOHpTQUZz?=
 =?utf-8?B?TUZ3RzhQamRMUVZWWVFublBua0JXZGdJRGRIWnF5bmFzN1JPOHFETUZhQjZm?=
 =?utf-8?B?a2RCYkNJaEpZdUpmbExCWjBKQmFTeWp2alF4T0dhNXM0UmlyRGZORUI5OEU1?=
 =?utf-8?B?RUhzeHUvcFJTZ2NQeVkzL2JZYksvMDl6Z1BRc0ZkUVZZZjlXaEZaRWtDbzha?=
 =?utf-8?B?RDJuRmpzRjZRRkg1NnZmeStKY1ZXaFYwQzZ0TXJ3aDczMkhmTmVBMDBOd28x?=
 =?utf-8?B?cEdOWUFRNFNZRlZqcUNUN0FTbEliTTh4NUNHbFpJZ3VvUG1ldmhBS0dnOUNq?=
 =?utf-8?B?REVDZDVvaW4zR05CL1JUTm0wOE4wWEFTUGZOalVEVHZnYjVma2ZFdmpmRnhX?=
 =?utf-8?B?aWM1OFZOdnNLbjgxN3NOdmNGa0lwWFhVQk1GakZXWkVSZmFaclhvcVNWRTdv?=
 =?utf-8?B?K1RmbE50WVdWdHRBeW0vTno3NUhSNElKMU9vYVFSVHVZZzhoamkrQmRNOFVQ?=
 =?utf-8?B?RzJZU2Eyb1M0ZGJKRjdOK2dYOEd1VytVOWw1MXJvaDd6MDl2bDdDNzkrM0N0?=
 =?utf-8?B?REhSUmtxbTZ2cjcwMHpwYjNQaHUzQTcxYkhERG1kQWE5UUFlc1Z0M1NYQzIz?=
 =?utf-8?B?OTJzdVlDM1FwaGQza3ZzcW5JVS83N3N0SUF2MlZvbjZxc2x5Z0lmeEJDVzRY?=
 =?utf-8?B?UDdjUUc1VUxIeHRWRGFFMXUzRUVhZllFLzN2YWRmQmRGSllKR2h1Sk1IaHNj?=
 =?utf-8?Q?qQ/vUX6kcbWkpRTrZp3PofoF7?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa69c170-5d03-41ec-4e61-08dcd0c2e543
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 11:31:07.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfkohwkNNkR0wgDrRAFvLV1c2Isx2kuAUWU7CrYZ0U+tJET+zd8HflFcZlOHrY76Gg4Qu7toHLq2N3vrGN82sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_043115_928846_E9FBA314 
X-CRM114-Status: GOOD (  18.56  )
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

Ck9uIDkvOS8yNCAwNToyMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+IOWcqCAyMDI0LzkvOCAzOjI4
LCBNw6VydGVuIExpbmRhaGwg5YaZ6YGTOgo+PiBJZiBhIHJlYm9vdC9zaHV0ZG93biBzaWduYWwg
d2l0aCBkb3VibGUgZm9yY2UgKC1mZikgaXMgdHJpZ2dlcmVkIHdoZW4KPj4gdGhlIGVyYXNlIHdv
cmtlciBvciB3ZWFyLWxldmVsaW5nIHdvcmtlciBmdW5jdGlvbiBydW5zIHdlIG1heSBlbmQgdXAg
aW4KPj4gYSByYWNlIGNvbmRpdGlvbiBzaW5jZSB0aGUgTVREIGRldmljZSBnZXRzIGEgcmVib290
IG5vdGlmaWNhdGlvbiBhbmQKPj4gc3VzcGVuZHMgdGhlIG5hbmQgZmxhc2ggYmVmb3JlIHRoZSBl
cmFzZSBvciB3ZWFyLWxldmVsaW5nIGlzIGRvbmUuIFRoaXMKPj4gd2lsbCByZWplY3QgYWxsIGFj
Y2Vzc2VzIHRvIHRoZSBmbGFzaCB3aXRoIC1FQlVTWS4KPj4KPj4gU2VxdWVuY2UgZm9yIHRoZSBl
cmFzZSB3b3JrZXIgZnVuY3Rpb246Cj4+Cj4+IMKgwqDCoCBzeXN0ZW1jdGwgcmVib290IC1mZsKg
wqDCoMKgwqDCoMKgwqDCoMKgIHViaV90aHJlYWQKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb193b3JrCj4+IMKg
IF9fZG9fc3lzX3JlYm9vdAo+PiDCoMKgwqAgYmxvY2tpbmdfbm90aWZpZXJfY2FsbF9jaGFpbgo+
PiDCoMKgwqDCoMKgIG10ZF9yZWJvb3Rfbm90aWZpZXIKPj4gwqDCoMKgwqDCoMKgwqAgbmFuZF9z
aHV0ZG93bgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbmFuZF9zdXNwZW5kCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF9fZXJhc2Vfd29ya2VyCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlfc3luY19lcmFzZQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG10ZF9lcmFzZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW5k
X2VyYXNlX25hbmQKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgQmxvY2tlZCBi
eSBzdXNwZW5kZWQgY2hpcAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFuZF9nZXRf
ZGV2aWNlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPT4gRUJVU1kKPj4KPj4g
U2ltaWxhciBzZXF1ZW5jZSBmb3IgdGhlIHdlYXItbGV2ZWxpbmcgZnVuY3Rpb246Cj4+Cj4+IMKg
wqDCoCBzeXN0ZW1jdGwgcmVib290IC1mZsKgwqDCoMKgwqDCoMKgwqDCoMKgIHViaV90aHJlYWQK
Pj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkb193b3JrCj4+IMKgIF9fZG9fc3lzX3JlYm9vdAo+PiDCoMKgwqAgYmxv
Y2tpbmdfbm90aWZpZXJfY2FsbF9jaGFpbgo+PiDCoMKgwqDCoMKgIG10ZF9yZWJvb3Rfbm90aWZp
ZXIKPj4gwqDCoMKgwqDCoMKgwqAgbmFuZF9zaHV0ZG93bgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
bmFuZF9zdXNwZW5kCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdlYXJfbGV2ZWxpbmdfd29ya2VyCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1YmlfZWJhX2NvcHlfbGViCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWJpX2lv
X3dyaXRlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG10ZF93cml0ZQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbmFuZF93cml0ZV9vb2IKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjIEJsb2NrZWQgYnkgc3VzcGVuZGVkIGNoaXAKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBuYW5kX2dldF9kZXZpY2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPT4gRUJVU1kKPj4KPj4gwqAgc3lzdGVtZC1zaHV0ZG93blsxXTog
UmVib290aW5nLgo+PiDCoCB1YmkwIGVycm9yOiB1YmlfaW9fd3JpdGU6IGVycm9yIC0xNiB3aGls
ZSB3cml0aW5nIDIwNDggYnl0ZXMgdG8gUEVCCj4+IMKgIENQVTogMSBQSUQ6IDgyIENvbW06IHVi
aV9iZ3QwZCBLZHVtcDogbG9hZGVkIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPCj4+
IMKgICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8ODAxMDdiOWY+XSAoc2hvd19zdGFjaysweGIv
MHhjKQo+PiDCoCAoc2hvd19zdGFjaykgZnJvbSBbPDgwMzM2NDFmPl0gKGR1bXBfc3RhY2tfbHZs
KzB4MmIvMHgzNCkKPj4gwqAgKGR1bXBfc3RhY2tfbHZsKSBmcm9tIFs8ODAzYjdmM2Y+XSAodWJp
X2lvX3dyaXRlKzB4M2FiLzB4NGE4KQo+PiDCoCAodWJpX2lvX3dyaXRlKSBmcm9tIFs8ODAzYjgx
N2Q+XSAodWJpX2lvX3dyaXRlX3ZpZF9oZHIrMHg3MS8weGI0KQo+PiDCoCAodWJpX2lvX3dyaXRl
X3ZpZF9oZHIpIGZyb20gWzw4MDNiNjk3MT5dIAo+PiAodWJpX2ViYV9jb3B5X2xlYisweDE5NS8w
eDJmMCkKPj4gwqAgKHViaV9lYmFfY29weV9sZWIpIGZyb20gWzw4MDNiOTM5Yj5dIAo+PiAod2Vh
cl9sZXZlbGluZ193b3JrZXIrMHgyZmYvMHg3MzgpCj4+IMKgICh3ZWFyX2xldmVsaW5nX3dvcmtl
cikgZnJvbSBbPDgwM2I4NmVmPl0gKGRvX3dvcmsrMHg1Yi8weGIwKQo+PiDCoCAoZG9fd29yaykg
ZnJvbSBbPDgwM2I5ZWUxPl0gKHViaV90aHJlYWQrMHhiMS8weDExYykKPj4gwqAgKHViaV90aHJl
YWQpIGZyb20gWzw4MDEyYzExMz5dIChrdGhyZWFkKzB4MTFiLzB4MTM0KQo+PiDCoCAoa3RocmVh
ZCkgZnJvbSBbPDgwMTAwMTM5Pl0gKHJldF9mcm9tX2ZvcmsrMHgxMS8weDM4KQo+PiDCoCBFeGNl
cHRpb24gc3RhY2soMHg4MGM0M2ZiMCB0byAweDgwYzQzZmY4KQo+PiDCoCAuLi4KPj4gwqAgdWJp
MCBlcnJvcjogdWJpX2R1bXBfZmxhc2g6IGVyciAtMTYgd2hpbGUgcmVhZGluZyAyMDQ4IGJ5dGVz
IGZyb20gUEVCCj4+IMKgIHViaTAgZXJyb3I6IHdlYXJfbGV2ZWxpbmdfd29ya2VyOiBlcnJvciAt
MTYgd2hpbGUgbW92aW5nIFBFQiAyNDYgdG8gCj4+IFBFQgo+PiDCoCB1YmkwIHdhcm5pbmc6IHVi
aV9yb19tb2RlLnBhcnQuMDogc3dpdGNoIHRvIHJlYWQtb25seSBtb2RlCj4+IMKgIC4uLgo+PiDC
oCB1YmkwIGVycm9yOiBkb193b3JrOiB3b3JrIGZhaWxlZCB3aXRoIGVycm9yIGNvZGUgLTE2Cj4+
IMKgIHViaTAgZXJyb3I6IHViaV90aHJlYWQ6IHViaV9iZ3QwZDogd29yayBmYWlsZWQgd2l0aCBl
cnJvciBjb2RlIC0xNgo+CkhpIFpoaWhhbyBDaGVuZyEKPiBZZXMsIEkgbm90aWNlZCB0aGVzZSB0
eXBlcyBvZiBtZXNzYWdlcyB0b28gYmVmb3JlIGtlcm5lbCB2NS4xOC4gU2luY2UgCj4gY29tbWl0
IDAxM2U2MjkyYWFmNWU0YjAoIm10ZDogcmF3bmFuZDogU2ltcGxpZnkgdGhlIGxvY2tpbmciKSwg
dGhlIAo+IGJlaGF2aW9yIG9mIG5hbmRfZ2V0X2RldmljZSgpIGlzIGNoYW5nZWQuIEEgcHJvY2Vz
cyB3aG8gaXMgaW52b2tpbmcgCj4gbmFuZF9nZXRfZGV2aWNlKCkgZHVyaW5nIHJlYm9vdGluZyB3
b24ndCBiZSBzdHVja2VkLCBpdCB3aWxsIGdldCBhbiAKPiBFQlVTWSBlcnJvciBjb2RlLCB0aGF0
J3Mgd2h5IHdlIHNlZSB0aGUgYWJvdmUgbWVzc2FnZXMgZnJvbSBVQkkgbW9kdWxlLgo+IEFmdGVy
IGNvbW1pdCA4Y2JhMzIzNDM3YTQ5YTQoIm10ZDogcmF3bmFuZDogcHJvdGVjdCBhY2Nlc3MgdG8g
cmF3bmFuZCAKPiBkZXZpY2VzIHdoaWxlIGluIHN1c3BlbmQiKSwgdGhlIGJlaGF2aW9yIG9mIG5h
bmRfZ2V0X2RldmljZSgpIGlzIAo+IGNoYW5nZWQgYmFjay4gQSBwcm9jZXNzIHdobyBpcyBpbnZv
a2luZyBuYW5kX2dldF9kZXZpY2UoKSBkdXJpbmcgCj4gcmVib290aW5nIHdpbGwgYmUgc3R1Y2tl
ZCBhZ2Fpbiwgc28gdGhlcmUgc2hvdWxkIGJlIG5vIGVycm9yIG1lc3NhZ2VzIAo+IGluIFVCSSBs
YXllci4KPiBTbywgaXMgeW91ciBrZXJuZWwgdmVyc2lvbiBsb3dlciB0aGFuIHY1LjE4Pwo+ClRo
YW5rcyBmb3IgaWRlbnRpZnlpbmcgdGhpcyEgWWVzLCB0aGUgZGV2aWNlIEknbSB0ZXN0aW5nIHJ1
bnMgdjUuMTUuIEkgCmNhbid0IHVwZ3JhZGUgaXQgdG8gbmV3ZXIga2VybmVscyBzbyBJIGJhY2tw
b3J0ZWQgYSBsb3Qgb2YgdWJpIHBhdGNoZXMgCmZyb20gbWFpbmxpbmUsIGJ1dCBpdCBzZWVtcyBJ
IG1pc3NlZCBjb21taXQgOGNiYTMyMzQzN2E0OWE0IHdoaWNoIGluZGVlZCAKc2VlbXMgdG8gc29s
dmUgdGhlIHByb2JsZW0uCgpBZ2FpbiwgdGhhbmsgeW91IHZlcnkgbXVjaCEKCktpbmQgcmVnYXJk
cwoKTcOlcnRlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
