Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCAFEB28CA
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2kcXNwbPzgZzAg1XS8WmfFpFKdnBRxD95lGr2uBrg8=; b=m4RuuJu1C6HTXA
	v/Cu0fiAg9TD2icBiX2h131w3kwTBspcXf8vd6u5ONSWOYKBfrKD1P8zncWujeRcpXElD9SUIUF44
	F+CqW8HlTyfccxHjrNtJ3IDq9g0B61WmmUe8U3AhmLEOCdPHd0OG/er7pqiZ5Ve4tbkofLT54b9my
	+2IfifX5tt9frEyUPVO7KPtzcurtxLdQ4NUiFTdGrCdCa7dg/AVvpo35qkoPGY3vuqi+CrQYh6E5v
	3JSC2/SMmysWB3EyS6JaLtVo9PZxBV7rjiYZlZjFmfABTrj61q1evk31x6QbXs1XYWOxCGc5h1ZEL
	nxFp4OPLqGF9rb6RD1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEpY-0000000AvEw-0uz4;
	Fri, 06 Feb 2026 05:56:36 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEpV-0000000AvEa-1odv
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 05:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1qY7zt5nZxuQoxN5crccShFR5h7Gdhq8Zbm6HoI3xq0aqy7o0cUPpg7lST/gP86tZPQuX57LrxtXoQ6u8jnnZXF0pP78NB6XtHAf15/Xq4Eqyyleyny2Nh27fCv7UjT9iXKZVObtV8pU5CXyQlahhuZPHNf0kTYl9W1QsDSfpu2hfhp7t8T2HWna7sdkUf/o+/kO5mZ4fqRzdG53EZzEsd4Ra0MoUg8OLAUl49/C6UUQ9uhZle9Opr7EF/v0t92ybv0dy617IfFl8XMVNltCaVsltYyqcPV3dis4TS6+KTb5N/KL+XOeH4eYVVEk1gKDTwKZxxJcPzqfDMBRvPYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Umf2Xn15/SMRo7nGdcuoA1U57hdaUN9HMOYhDZaYs8=;
 b=FkS915W94X7syjRfR657SRCqXHXTJhaj77u4d8X+NSF1XBERhx8FCp1VMODibigFXn0SFD/PyvuRLpBffzdcv4XdBgWtc07mYIwTXdHJT1ZnDNkNJv95jD0vcO+98DwMNunHml2oISr/pTAIiLdBBKzGlyiVPgG6/vDMRO/LDD/IkndlFo3TDKT7Wf+PEPLxwCDw2AYGc2ttf9KVlKo3ylCJGu6DByi+i6Bb9l5k1xWRmObX27J4nYX1fJ2Yyzvy/Bp/NfyyC80TjUH3CEC5r8I5Wu4kWCDHw9lzuFywg1LvkKKggbQNhjc+wwsdg3mlga6//kDQX0Ajok7cdMjZrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nod.at smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Umf2Xn15/SMRo7nGdcuoA1U57hdaUN9HMOYhDZaYs8=;
 b=MlgIjiCsgLRvgys22wmus9gLy7RZooG5HZk+zNDEQdXr9btuXCSSDv+yXplYNd4zzMIHjC3GmCLYtEGjFIgrbo6LJKRLJLWHuSQVTXXuXm4KqGBxVC2gsoVqyxs18kKGeEhJ7KSp7KxDN3AqcyIwNxc6Ha/iH2Asl+mmsZsu3L4=
Received: from SA1P222CA0150.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::20)
 by CO6PR10MB5587.namprd10.prod.outlook.com (2603:10b6:303:146::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 05:56:29 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::42) by SA1P222CA0150.outlook.office365.com
 (2603:10b6:806:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 05:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:56:28 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:56:25 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:56:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:56:25 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6165uNIK634721;
	Thu, 5 Feb 2026 23:56:24 -0600
Message-ID: <4d4ab8af-3e09-4e48-a79d-0af3453600c3@ti.com>
Date: Fri, 6 Feb 2026 11:26:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
To: Miquel Raynal <miquel.raynal@bootlin.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <aYO2IPsoxmDtTsec@smile.fi.intel.com> <87a4xnfu8j.fsf@bootlin.com>
 <aYS93aJ_TlN3C3-T@smile.fi.intel.com> <87y0l7gkmo.fsf@bootlin.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <87y0l7gkmo.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CO6PR10MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 178f7030-1a00-4cc1-09c3-08de6544787e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU5renhOUC9WaXJ5UjN5K1pDQXdnVmxxQndLcmc1WXAxdVByOGNKMzl2Smxs?=
 =?utf-8?B?U0I5VnB4S1g0QmphL01nSEN5LzYybGZVR0YxZjQxajcyWTlubGp6Nk1YQ2xW?=
 =?utf-8?B?NTdlT0cvNWgza3l4MVVrN2Urcm5DMWJkWm1rbFZoYm5TRlpmR3RjeTE3bDFE?=
 =?utf-8?B?YlFOSENDYXZjWkhHL3g5eDF0bDlrL0F4TzJHUU9TNEcyQzVTRjl3Y1ZWbkhG?=
 =?utf-8?B?bGpxY0xwdVZ2bTE4cEwzZU8yWERyT2tFQTY1ZG8rTzQ2cTY2VjJTUWM5SWp5?=
 =?utf-8?B?djZtUHVTMDZGMSszdzBIelhWYUxUZ2dLVE4yd3lRRkFyYVFkSitwVXRITUpJ?=
 =?utf-8?B?a0JqbWtlTDhmVldjM0M0bGhUeFcxbTZEbTg4aVp5UzFNUVB5T2FySGlKYTlr?=
 =?utf-8?B?VlhOdWRGamczOWpldXNPWkhtRnVrcWllV3dhUE05MG8xaG5CdklqUlRHT1lp?=
 =?utf-8?B?RTVqakl1RTQwbk5Ta1dBZ2hEQStSbGJvUU9PajEyT1U3YS9PZlZYWTR6THRO?=
 =?utf-8?B?K2NFS1pVUlBXVWlOT0ZPS2t0S0V0cFM5NncvK05KQ3hFVTdiWjlVSzd5ZWxk?=
 =?utf-8?B?VEVPamNGYmRWQWFZTzliYzVzRUc1YkhJUVdxaWtmQjdyblRETXV5YW8yTkxS?=
 =?utf-8?B?K1B2VjljSHJndWdjV2xpK2tnVStDYU1qT2RqSlhweHdJSEVnWVZDdGpnbWtO?=
 =?utf-8?B?ekpFeUlsb1JIVGxSYXVJSElzZDkwRE5yL1luU2ZWM0xBSndCL0lWRUV5bUtJ?=
 =?utf-8?B?NnAxelh3bE8xcE12OURRbUltZlNHUEFoMk95WUVrMXBCRkduN2RteXpwVFdL?=
 =?utf-8?B?RW00NjVaelFwd1RMeE1IUW91M21DckZkTDRXbnZ1dWpuaTB4NHM3T2xzRlJW?=
 =?utf-8?B?bzRsZWd5emJmcXU3RFZjRkRLSjI3bmorMS9KRjBFSWJMTUlPNU9mUUs1M244?=
 =?utf-8?B?QXV3MWE5b1gyTXF2NmJVVzArZXF4SmJwVHl4VVlkWUFsNnZVVmlOOURqdWx0?=
 =?utf-8?B?SzNoRXFvQTFFb2NVemZLOU8vWm1XVzlCWlo1cXNWaHhnYXdySjFESUY3TEd1?=
 =?utf-8?B?ZVB5a2hpNmIxTjRCM01KWE9YVGs0S2hzNHEreXJvL2JyallRNC9DVFhhZElm?=
 =?utf-8?B?cm5mK1VQYTJvYXV0c1g5T0FqZ0lGVk9pWk5OQVJpUzFZaHhXckMvU1hEb2RB?=
 =?utf-8?B?b3RGQlFIZU1TVnk5c1ZIL3ZqemZHNzUwVGpGT2tEU2N0bFhLQUlPUDBwbUNx?=
 =?utf-8?B?OHNZVUxpR3R5eEhrZEFuR2NJTDBjMkRKZ3BIRnBnL0pNQjlPUUplNWdLUTlh?=
 =?utf-8?B?cVZ6Qnl0S3AxbXlJZVB1QVJIL3ZLYm1QSVFOUVZtZXUwNTE3ZmdkalNJT2hm?=
 =?utf-8?B?cGlLcXI5VTIyNjlpa1dGN1A3WHl1dFp0NmFuc2pDUUp4V0U5dkhOblBBTHNO?=
 =?utf-8?B?R2lLQXV6THRySHhMUTh2KzU3Vk85MEI4dHJ6WG05VlZQYWxFRTJpOEVZZVgz?=
 =?utf-8?B?QmJJSkx3WDdodkRGYk9idnlSTjYrZTJBNmRpdko2b2VlQUkwZHVYb0tUdkNv?=
 =?utf-8?B?dXNHdjNMMy81ZWVmbTFBQmpjcDRCUExkUEhyNERaSW1SdERUeFFZbUQrcERt?=
 =?utf-8?B?MjhLQ0ZudFhCMGsvKysrZ0dwOEdJUHFHT0ExbVdHK3Q4R1VGbCtFZWdQQXB0?=
 =?utf-8?B?VGx6ZFBzNjRMTFBlUGxTYzgzVEE2NndCS0JKaHJwQVdUYjRxUGhHY3N0Z1g4?=
 =?utf-8?B?TDdhWUt0VG1Pb2tpVVpHbkdBV3pJSXNTd0dUVVJOa2hhR1BPT3VOVEZYMmFp?=
 =?utf-8?B?RkRoQkNQa0VqTGFab0xLUnZtcGJWTURMMG1vaFdYM0lSSzBhVnlOWkNmNWV0?=
 =?utf-8?B?VmtJNm8zM1A2N3kvbmQ0ODI1dnJoOGE4NzM0RlBIS2Y1QWV4bGFQYXMzVndn?=
 =?utf-8?B?UmlhdisyUDZCSEhuRjdtL2tVU080djRiOGQza0FhZkY5eDZXZlBNdTk2K2Np?=
 =?utf-8?B?VjJGZ3VyKzVWa2xrWVlNekNvUkhIa00vS1pWTkpMYmdhenJORVYvSzlTV21O?=
 =?utf-8?B?bnNPRTNpR3dSM1BJbC9Xc1pmcTlOYnhiWk5pczlteDl4d1JKaVdLekNJVVla?=
 =?utf-8?B?c2ZDNStWTDRrZXNOdEw4L1JaeVR4YnNhVFNJa1htUmQ0RHd6cXVjTDlCWW9p?=
 =?utf-8?B?dWQrRnBMOVVDMkFxeXJMaXBQVGc3YUZlQThyWTNuSE44QjNiaXNuYnkxaThh?=
 =?utf-8?B?cENWR0QxYWlkaGlMcnNWSEovRWt3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GZrSTJNlhYmUO2Kc/VZDxR0/aqF1AZ+3OU/D6X5TSAoZkzR2rPzjwAL3AfmNFQH2AcNnbEkib7V6OoHT8vvNmW2wRH7zXU8WEtnHPpHjm06HXqpDayL3gtGyuCft8VpBInf8VGsyYOv00+LHlskQXtcvBf8tOeZikT76XyhktNq9ozjRcQb1MyOTbMQs/V1E5YWXkSDOp4zlinS9Q83UQy+nhmHaaPHeaCntvP/3Pq+Cv68A32TVVOhU3qtA2KC8vc4zUJSY1g+fUdJFxrYRVpMSPBYLzc8Zw32c2Z1jIhYqle/qhqV7Wu5xm1odrcJfOAL7IZ2PlntUmimM2Fj/oUEz5nrafFwIF2qfistzswfz7gqYVybopPzKjAgwO3nPG9d26ZKycFo1MInKDz+qNFjbERgSQubLmM2frKoHqK+hfq2FDMIr8KqG013qjnK8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:56:28.6132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 178f7030-1a00-4cc1-09c3-08de6544787e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_215633_706962_C5CDEDC7 
X-CRM114-Status: GOOD (  12.78  )
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



On 05/02/26 23:04, Miquel Raynal wrote:
> On 05/02/2026 at 17:57:17 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
>> On Thu, Feb 05, 2026 at 09:51:56AM +0100, Miquel Raynal wrote:
>>> On 04/02/2026 at 23:12:00 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
>>>>> Compiler is not happy about used stack frame:
>>>>>
>>>>> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
>>>>> drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
>>>>>
>>>>> Fix this by factoring out do_write_buffer_locked().
>>>>
>>>> My gosh, I already sent a v2 earlier and there were some replies,
>>>> I need to check...
>>>
>>> I'm not sure I get what you mean here? I got no reply (in my inbox) to
>>> your v2. I am letting a bit of time for Vignesh to take a look, but I
>>> know he's busy so I might take it nevertheless by the end of the week as
>>> we are approaching the merge window.
>>
>> I got some strange LKP reports, I need to check them.
>> Please, discard this email thread as we have it there
>>
>> https://lore.kernel.org/r/20260124133730.3454241-1-andriy.shevchenko@linux.intel.com
> 
> Ah, this did not reach my inbox, marked SPAM... I'll discard this patch
> for this cycle, feel free to resend once the report has been figured
> out.
> 

Yeah, things become tricky with CONFIG_MTD_XIP enabled. With
XIP_INVAL_CACHED_RANGE() moved to caller, initial_adr becomes unused
when CONFIG_MTD_XIP=y

One solution maybe to move calls to XIP_INVAL_CACHED_RANGE(),
ENABLE_VPP(map) and xip_disable() and their complementary functions to
do_write_buffer_locked() as these calls need to repeated for every
writes (if and when we find need to reuse do_write_buffer_locked())

Alternately move INVAL_CACHE_AND_WAIT() and everything after that to caller


-- 
Regards
Vignesh
https://ti.com/opensource


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
