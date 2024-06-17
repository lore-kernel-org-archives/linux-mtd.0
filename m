Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281BFC27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr/vo4xZZVIsNdegtEzMoazfs1kDu4olyUluxpQ5WPc=; b=Qy46+RcSV5JNK4EalV+R3IBBio
	agmqTAB1nSbynyHNe44oKdgIIjFXe/N92/BbA3xg2+YLRwB3sy4M/nBZ/cOTbcgtSZTNseuzgrtSz
	mzXWfu5uJUzXjtqVVhVkSFkikUnKSppeJHQS7qCK0LW/AGWMH+szn58oSF0GoE/NLS3xyOmo1UQev
	eAMg2ZMcsg29fXvvswmw/dT9/QVUQvhakmmNLY+9vEwxrOq0gbLQo+7XNPlXxI+2266wDBpwIBAlm
	wKiq0vJtLMxuNOkcNxwFQxsQa5mVq3lRahFuCXtr7n1b8zjO+nB4D2bNWvFz28nc+o7RWvuRhzayR
	qXJfjNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCiY-0000000AwOG-45FC;
	Mon, 17 Jun 2024 13:48:18 +0000
Received: from mail-db8eur05on2062a.outbound.protection.outlook.com ([2a01:111:f400:7e1a::62a] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCiV-0000000AwMk-0TAD
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 13:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuqXKnykk2gKxd1KacTlsGW/CcoWRonNIOnChnQwLOwD42tYIVwMkgYjYjSIH91Bl/YdV47XplNOIi/xvDe/kYUadyj3NPjriNgFxBZvbnL2JOsPVFF85lie4FUmDejGnYjt9ed9RjYe3Ekc7qjpIxucVZ47ZIpqezRQ+WdZi8Co8lVwFeaHCBXp2ZXZl2kwbxDYGlRKg2yrvLTnJWD+GF/QRuBLSEEU5YOT6ZvE1t9s1sK+HUhcCMawzHM2OtO2bOG2t4TZWUB6FltEGgk2AbGo4fQknCu3mIdcfkaTrSE2z21B6wug5Bj3ccwm9XVUvye0GcZvhagpYxWwSO9yXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xESuwId/V2WDx5zwwNYDE+Ar1M0wajB/GO7D9xvHrVw=;
 b=ToepVtHMx+khDFwpga0ItT5aiIgQtzR+eN5nMDWdP7hYhHK4CKzop29itPZ5r8p39+f+2RbkHUURzulojYmlU8Hl+iGkn8XC83v2hObpIubm4xvZLO4pPySAc+IsbLaAJnGE/5EJ9PaRAtYi8wa1pxKTVwWj1sivoQiJXECK3DGkHINZL5UUfL8QeFWIF2b3DRBo7cLjcs8y9mg7He7YCHossprTEWWfNThvlJeVOjgVnBbqpmPeLU2VRH5KM1wi6mQlaW/qNaOGuM3UxD7gQjQi/yfbH1hJVYsfMBgTwdHdkdfouJ5NCwWm6JwxKZhRIbIDZTvrAzSU+rz4zjMeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xESuwId/V2WDx5zwwNYDE+Ar1M0wajB/GO7D9xvHrVw=;
 b=iOeYaRdRP4BaOM+aCQGl1vjiPQTZk0x+Pb/3tTmzt1DVuBjo9ASCzAxB63GoOs5XyDJOeYuMGxMuEY4T36F5A/qNrKJ3qYxNIzonF8P2xu0FQ2zLyr0w1iU9A2OXvBJ7c37nFUpY/gZ+6SRDw3ewHD2VX6TOVxaa4cMywLN6Qik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by GVXPR02MB10519.eurprd02.prod.outlook.com (2603:10a6:150:14f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 13:48:08 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 13:48:08 +0000
Message-ID: <60ebb822-3161-f9b1-59df-fcc9b5e0e24e@axis.com>
Date: Mon, 17 Jun 2024 15:48:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Lots of fastmap writes
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
 linux-mtd@lists.infradead.org
Cc: rickard314.andersson@gmail.com
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
 <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
 <f92bb95d-05a1-315b-000c-5189004175d5@huawei.com>
 <aad1b520-ee9e-476f-911b-45be9eb09195@axis.com>
 <a8bf10e3-009f-3d4b-fa4b-43bbc6e1bebc@huawei.com>
 <0a53be8a-6d21-0ae3-a013-e1155140c889@axis.com>
 <ab27b215-8069-02cf-6bfa-9c8d85aea697@huawei.com>
From: Rickard x Andersson <rickaran@axis.com>
In-Reply-To: <ab27b215-8069-02cf-6bfa-9c8d85aea697@huawei.com>
X-ClientProxiedBy: MM0P280CA0076.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::18) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|GVXPR02MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: cffcec16-837f-4a1d-df4c-08dc8ed41f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnNmTlNvOUZnTmw0QnlhVCtCTTZrQnVBV1puTWpyRTQreCsySzErQkM5V3VG?=
 =?utf-8?B?MXJYZ2J6OC94NW4zUnhZYWFpOG10WkJ6L1N2cC93bTVQdHdKLzF2bE1iSGk5?=
 =?utf-8?B?Sitndjd5SWF6anZZVnFESnJJMGdTL2JZVDJtNWMySURuY0JKcFJaRGxCekdQ?=
 =?utf-8?B?bU1EYzRRc2h1dk5nT21Ib2U1TUFQRFNaWlJDVlNFaXJYUEl1OERSMWRWMk9P?=
 =?utf-8?B?eHI2d0dPb21XL2I2OUZHMjBvTUIwWlN2cXJORWkxdTE4UExBMmM4MnVNVm1u?=
 =?utf-8?B?UTI0MmJvZjViMkFsWHF6SGczQ0lkeUo3T1hsQlFTd0Fpcldsb3k4S0N3SjRL?=
 =?utf-8?B?OEFYMG80WG1MTGVBRm9zMGJzR3lFMldCOUYzbTkzYnVDTUVaOU1NaXJ5QlBH?=
 =?utf-8?B?WmlWS0J6RkJRbzR1MjZvQVdkdFV5UGlSSi9hTlNLaWtlcjkyekdtMDFsWndw?=
 =?utf-8?B?bk1DMy9SazV0eVNuaGlvVktuczFrRHBHeVFDa2dGcFZmd09NOWFzQ25rQWtu?=
 =?utf-8?B?c2k2T0J1VGppQnlOSWFNMno4cGNNYnJsdHB1UUE1Ky9TOUx2RS9ZN3YvL2xR?=
 =?utf-8?B?RGUvTEc4ZWd6NVNmODc5Z0Z4d0tweENCeDRvcGRnWmlpcUk4c2pnRklJSkdW?=
 =?utf-8?B?UTB0R1VzcEtjQ2JKM05lVUhLTEY1bkV2alJsSGw0WXZESEZkcUtiVFI1eWxX?=
 =?utf-8?B?QzhZNDRJZFM1LzFKSFAzOG96aGt4MzVya29RenJXWGdjb0p2QmthejFoaGp4?=
 =?utf-8?B?S2w1V1RzalZKN1NzN0tHaS83RGs0dm4zcjArMVJiWUpkd3lFRjdrOVFRWmN5?=
 =?utf-8?B?ZXl1U1E5dVRTQ3puVmxPcFFjMlJzWjcrVmZ3NGdCbWEzTVdvOWNpZHh6ZkxK?=
 =?utf-8?B?czBRa3VaS0x4OWJIQlRVQnNKTkFRM3hMVXBuOS9ORlA3MkVjbktDNmR4UmlE?=
 =?utf-8?B?YTdPN05ZRzE4QnNkNjBjeFZiSEtZdTZacXI1Ri9QYkR5cVFvSWErSVBEeGgx?=
 =?utf-8?B?aHE0R1EvNWhmMnNDTGpPeTdxVEo4V1FTRW1NWjVzUmFMeUxHNE8rVGJGYW0v?=
 =?utf-8?B?QitvQVNyWVNyMHZXdno0amtTVnVJK004TGRlZCtiUklrN0htd1RaMmRWc2hx?=
 =?utf-8?B?eHRvb1RkQ1pPWDBXMWlEU0dKRTgvWHJvYk1CREQxcjZYRzNDRFo1TVhzZEhT?=
 =?utf-8?B?VDh3R1RtT2tETTNMbE9hdVU1aGMrZFROd3VzQm0yeC9JSHFldG92cTFIV2Fk?=
 =?utf-8?B?c1ZLaTY4VmVoTWxIVFJFbmFFelROcDdtbHRBZmgyMkJYOWpGRm12T1FQRERw?=
 =?utf-8?B?Ky9ERE1FZTBkLzNrc0ZxRTZiRjZJWmtFcnVIRSt0dWpybDVqQk1QWnBtMWMv?=
 =?utf-8?B?dE9yMFd1cHMxT2ZRS2ZEMk40UG0rajFzczJYZC91T212Z09jTkpoNitvSXpG?=
 =?utf-8?B?NXRna25LY1NONzgxRHB0RTc3cTZWR0VEK0RxQ0xPdDI1dFhYSytqVFVRME9y?=
 =?utf-8?B?SVY0OEh2bUgzM0ZjVU1HMHNCNGJXWGZ4Z3V3bDlXWHk1TTZ4WWY1NlE0RmJC?=
 =?utf-8?B?MHN6SG02dVBOWEIyaHE2dUxqYnIzNzNRQVdjSm9aQ3FSSzV4c3FlRDUwVUdD?=
 =?utf-8?B?endQK0lXb1Urdnk3NVZwUWFMRERLbFZ6NE5yVzRxeG1xYjQxOWlGSm1tbmw1?=
 =?utf-8?B?SHNOQTlrUzRMcEJvQjFZR25YQXNnLzR0UjJwMzNuN2s2SEp4VDdWQUJWY0Jp?=
 =?utf-8?Q?ke6PaYLmiHIyt1/uU/6A2f+xpkoP0+tFoniloAT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWhVTW5HNSs5b1ZWeEFhV2lOYXM3bkNQbW9XckJJaUVWdXZWSi9DTVlxY2g1?=
 =?utf-8?B?NGhXeFlaZ1k3bUM3MWQwNGt4WklSVS91b0I2YzQyQ1c4MkVDWm12OG8weHV6?=
 =?utf-8?B?ZzltRTJCMyt1Q29rL1A4emVpTVFBZHBhLzhvVTJRMW1EVzRvNGRPZlpzSFM1?=
 =?utf-8?B?NlVvd1plcnhHdU53dVF5T2dTL3lnUlEzZU5DTXE1RVJwRzMyRTF1RG0rbHps?=
 =?utf-8?B?K0dabXV5ZDRqTEJnOU51b0cwb0ZOLzNUaVBtK2kyZ2Y4YmFzNWgzSjVnRlZm?=
 =?utf-8?B?RkZWMjV3elBRSmtyL21tMHVBNlZ4T09PKy9hZnFSWEtIcUViakV3ZkIwcUVU?=
 =?utf-8?B?WDdjSkpNcWZzWFlyZDMwb2Vqcjh2ZVJCMnF4L2kyZnVNMmtwRkhRaXhRbmI5?=
 =?utf-8?B?RGpyeDNYVW81SGNTZVlYTFBYQzhzbk5lVVdKTkg4VUN4SHRsMHhoV0JpU3lU?=
 =?utf-8?B?R3dYdlZOcXRMc2x6NEFmemRMaGFpZ0VLdFNFOW4xd3dqME8zNVVyVEtKN3NQ?=
 =?utf-8?B?SkxsQ2FYNUo4cTNLUjJqc0o4VWZWYmlPMFVURnpVcjlzZGhZNnhoMEI1SFhZ?=
 =?utf-8?B?dmNmaytsNnZnRmJwSGRRMDFRWUc0OVlQNHpBRS9sYURaSzdod2RudTN2VGx0?=
 =?utf-8?B?cVpUQ0drL3prZHlJSXhPdnlmYmhVV2VPbzhiMzRQUUVsaXJadWwyc3NURHpp?=
 =?utf-8?B?U0oveWJUNVVNbzd0aVJQZEpUR1JJOFo4MU9sT2JuUStvTWdIUE8rV1Z0cEZX?=
 =?utf-8?B?Q01tZGQwVmtDMmVaWEJnSlVLWk5ZRE5IbGVYTU83Zkp2NGFHZDIxRThKckc1?=
 =?utf-8?B?NnVlWGQ4RlFyZmYwQ1dpODlFTUdPZXlNd3ROK3pGZ0tCenlJcGt6ODN3QXM3?=
 =?utf-8?B?SFREV0NiRnBLeTZISjB2aDZOZmRrODMvOGM4aTRaMlJVcmw4WmJhR0VRa3kv?=
 =?utf-8?B?YWFhc3gxb21TcEJ5eGdpUmM5YmwyZWx2aGJXYTZ5T3hiRU1CYXZkelJHV3hU?=
 =?utf-8?B?Q25hdFVOaEtCd29ScVlXZzB2aGZWUXBwaUcyR3hXUWFFRWJRTVFqUDhheHFk?=
 =?utf-8?B?cnBvbVd6LzNXZit2S2tYRDRoenI5amhuZ212T2h1L0VubEMvdTc5am9hZE5Q?=
 =?utf-8?B?SDEvVjNyRlkyOEFQa0JTeFgrNk42VTJzRjBlMnFUa25jZXJmYnJWUUpMNkpl?=
 =?utf-8?B?djYzMGl2c3I1VkwzOGMvRU85bUZ0NlcxOEdwNWJyR0tZTEN2eE5zNUJwSnov?=
 =?utf-8?B?TmgrWi9uWWkrNGJ6QUVCOU84NVAxZkxySWJpdmdTODZCYyswMlY4a1lTeHdW?=
 =?utf-8?B?ZU5RaUxuQXdPbmRzOWovQU9OZzJCSU40blluSkRGWTJIMWRWeVhUYjl2aDBj?=
 =?utf-8?B?ZW1jejlzWnNPMmx0aFgrK2owbkVOVVJYb0xoWFo4QVdNdm4zYmNlUWpGY1RS?=
 =?utf-8?B?RW9pMURrSXBBWjMvaFUxejVEQnNPY3hINnRQU2x6OUtyQjdyYzZMQW4ydlpl?=
 =?utf-8?B?dzQrc3VNMGxEWGxwM2IvdlJlem9SZGVaOGk1ZFpuQnhKSzV2MHdtZTZUZG5j?=
 =?utf-8?B?aGZVR0Z0NXZkanB5ZkZLMEZwTEdZclY4Q2QzdTU3SktSU0g2bXl2ZUFBMzI5?=
 =?utf-8?B?aDk1VGN1UjhPVVMrV1hneElVTFdPOU02MjNhSUgvVXF3RElhRVBNSVRFOFkv?=
 =?utf-8?B?ZXhsZ0RHUWhyNEVDekVLNWZ1bjhNRDJDZGE4di9iTFROVWovemkyZUtoVDVU?=
 =?utf-8?B?eG9tRTJjcVBpajVmeVIwMVQ1eW92UXNvaVRES0xOVlZSZE9ycUt1TUdYakhF?=
 =?utf-8?B?OUdSdno5blF2cUVBdXVTMWp2eFhlNVhGMU5sbGZ5dDMyM0xDdkphYlkySmJI?=
 =?utf-8?B?UXdJd3h5MjN0Z1VQWE9pNlJESGdkZUU0YWFObXI0UCtsMlgwR0c0bUpldXNs?=
 =?utf-8?B?NXJ1RmVEYUJZejJzV1N3YmpRZm1QaFNsbEcwdVB6ZXdqcDRPWTVCWTduUE5r?=
 =?utf-8?B?SHRKcktKa2VsKzdZazA2N2Y4RTlXc2JzYVI0V2h3c1pacnNaa1ZsOXY1bmVa?=
 =?utf-8?B?TnAvRm1lZ1Z6UGxtVkkwZXBnTnVxeENNTTJUOHdmOFRsWEphR2I5MXN0SUlw?=
 =?utf-8?Q?SmjZZz0PgCsDs3qsOZMhEIR6e?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffcec16-837f-4a1d-df4c-08dc8ed41f3c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 13:48:08.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrpBdN3qDrsPhZyZi9dyOEQE1MZSM91JRf6o/fMRkQU/CAXdPfkj5L36oTA3ySP+7JDrx30HXbioGw/jK4Ovtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_064815_234126_28FAA328 
X-CRM114-Status: GOOD (  25.04  )
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

T24gNi8xNy8yNCAxNToyMSwgWmhpaGFvIENoZW5nIHdyb3RlOgo+IOWcqCAyMDI0LzYvMTcgMTk6
MjAsIFJpY2thcmQgeCBBbmRlcnNzb24g5YaZ6YGTOgo+PiBPbiA2LzE0LzI0IDE0OjI4LCBaaGlo
YW8gQ2hlbmcgd3JvdGU6Cj4+PiDlnKggMjAyNC82LzE0IDE5OjQyLCBSaWNrYXJkIFggQW5kZXJz
c29uIOWGmemBkzoKPj4+PiBPbiA2LzQvMjQgMDM6NTIsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4+
Cj4+PiBbLi4uXQo+Pj4+Pgo+Pj4+PiBCVFcsIGFmdGVyIGFwcGx5aW5nIHRoZSBwYXRjaGVzLCB0
aGUga2VybmVsIHNob3VsZCBydW4gb24gYSBuZXcgCj4+Pj4+IGZsYXNoLCB0aGUgaW1wcm92ZWQg
d2Vhci1sZXZlbGluZyBhbGdvcml0aG0gY2Fubm90IHJlc2N1ZSB0aGUgd29ybiAKPj4+Pj4gb3V0
IGltYWdlLgo+Pj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2hlcyEKPj4+Pgo+Pj4+
IEkgaGF2ZSBiYWNrcG9ydGVkIHRoZSBwYXRjaGVzIHRvIExpbnV4IGtlcm5lbCA2LjEuIERvIHlv
dSB0aGluayB0aGUgCj4+Pj4gcGF0Y2hlcyBhcmUgc2FmZSB0byBhcHBseSB0byBMaW51eCBrZXJu
ZWwgNi4xPwo+Pj4KPj4+IFllcywgaXQncyBva2F5LiBJIGhhdmUgYmFja3BvcnRlZCB0aGUgcGF0
Y2hlcyB0byBvdXIgcHJvZHVjdChrZXJuZWwgCj4+PiB2NS4xMCkgYW5kIGl0IHdvcmtzIGZpbmUu
Cj4+Cj4+IFRoYW5rcyEgSSBiYWNrcG9ydGVkIHRoZSBwYXRjaGVzIHRvIExpbnV4IDYuMSBhbmQg
ZGlkIHJ1biBteSBvd24gCj4+IHN0cmVzcyB0ZXN0IGZvciBhIGZldyBkYXlzLiAoT24gYW5vdGhl
ciBkZXZpY2Ugd2l0aCBmcmVzaCBmbGFzaCAKPj4gbWVtb3J5LikgSXQgc2VlbXMgbGlrZSB0aGUg
d2VhciBvZiB0aGUgZmFzdG1hcCBwaHlzaWNhbCBibG9ja3MgKDAtNjMpIAo+PiBpcyBhIGxvdCBs
ZXNzIG5vdyB3aXRoIHRoZSBwYXRjaGVzIGFwcGxpZWQsIHdoaWNoIGlzIGdvb2QuCj4+Cj4+IEhv
d2V2ZXIgSSBnb3QgdGhpcyBwcm9ibGVtIGFmdGVyIGFsbW9zdCAzIGRheXMgb2Ygc3RyZXNzIHRl
c3RpbmcgKGZpbGUgCj4+IHN5c3RlbSBpcyBzZXQgdG8gcmVhZCBvbmx5IG1vZGUpOgo+Pgo+Pgo+
PiBbIDc4ODUuMDM2NTc3XVvCoCBUMTgyXSB1YmkyOiBzY3J1YmJlZCBQRUIgMjkwNCAoTEVCIDA6
MjI5KSwgZGF0YSBtb3ZlZCAKPj4gdG8gUEVCIDYyNwo+PiBbODM3MjEuNzI0NjIxXVvCoCBUMTgy
XSB1YmkyOiBzY3J1YmJlZCBQRUIgOTgzIChMRUIgMDozMjQwKSwgZGF0YSBtb3ZlZCAKPj4gdG8g
UEVCIDcKPj4gWzgzNzIxLjgzMjUyMV1bwqAgVDE4Ml0gdWJpMjogc2NydWJiZWQgUEVCIDk5NyAo
TEVCIDA6MjgxOSksIGRhdGEgbW92ZWQgCj4+IHRvIFBFQiA1Cj4+IFs4Mzc4NC43NTA3MTRdW8Kg
IFQxODJdIHViaTI6IHNjcnViYmVkIFBFQiAxOTI3IChMRUIgMDoxMCksIGRhdGEgbW92ZWQgCj4+
IHRvIFBFQiAyCj4+IFsxNjU4MTIuNjU3OTM0XVvCoCBUMTgyXSB1YmkyOiBzY3J1YmJlZCBQRUIg
MzY5MSAoTEVCIDA6MTEpLCBkYXRhIG1vdmVkIAo+PiB0byBQRUIgMTgKPj4gWzE2Njc0OC4wNTUy
NDJdW8KgIFQxODJdIHViaTI6IHNjcnViYmVkIFBFQiAzMDQ1IChMRUIgMDoyKSwgZGF0YSBtb3Zl
ZCAKPj4gdG8gUEVCIDgzNwo+PiBbMTY2ODM0Ljc0MjQ1MV1bwqAgVDE4Ml0gdWJpMjogc2NydWJi
ZWQgUEVCIDkxOCAoTEVCIDA6MiksIGRhdGEgbW92ZWQgCj4+IHRvIFBFQiA0Mwo+IAo+IExvb2tz
IGxpa2UgdGhhdCBzb21lIG9mIFBFQnMgaGF2ZSBtZXQgdGhlIGJpdGZsaXAgZXJyb3JzLgoKT25l
IHRoaW5nIHRoYXQgc3RydWNrIG1lLiBXaGVuIGxvb2tpbmcgYXQgdGhlIHNjcnViYmluZyBiZWlu
ZyBkb25lIAphYm92ZSwgaXMgaXQgbm90IHN0cmFuZ2UgdGhhdCBkYXRhIGlzIG1vdmVkIGZyb20g
cGh5c2ljYWwgUEVCcyBvdXRzaWRlIApmYXN0bWFwIGFyZWEgaW50byB0aGUgZmFzdG1hcCBhcmVh
PyBGb3IgZXhhbXBsZSBmcm9tIFBFQiA5OTcgdG8gUEVCIDU/Cgo+PiBbMjM5OTg2LjQ5Njg0MF1b
VDMxMzg3XSBVQklGUyBlcnJvciAodWJpMjowIHBpZCAzMTM4Nyk6IHViaWZzX3NjYW46IAo+PiBj
b3JydXB0IGVtcHR5IHNwYWNlIGF0IExFQiAzNTE5OjEwMTM3Ngo+PiBbMjM5OTg2LjUwNjgwOV1b
VDMxMzg3XSBVQklGUyBlcnJvciAodWJpMjowIHBpZCAzMTM4Nyk6IAo+PiB1Ymlmc19zY2FubmVk
X2NvcnJ1cHRpb246IGNvcnJ1cHRpb24gYXQgTEVCIDM1MTk6MTAxMzc2Cj4+IFsyMzk5ODYuNTE5
NzQyXVtUMzEzODddIFVCSUZTIGVycm9yICh1YmkyOjAgcGlkIDMxMzg3KTogCj4+IHViaWZzX3Nj
YW5uZWRfY29ycnVwdGlvbjogZmlyc3QgODE5MiBieXRlcyBmcm9tIExFQiAzNTE5OjEwMTM3Ngo+
PiBbMjM5OTg2LjUzMjA1Ml1bVDMxMzg3XSAwMDAwMDAwMDogZmZmZmZmZmUgZmZmZmZmZmYgZmZm
ZmZmZmYgZmZmZmZmZmYgCj4+IGZmZmZmZmZmIGZmZmZmZmZmIGZmZmZmZmZmIGZmZmZmZmZmwqAg
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4KPiAKPiBUaGUgZGF0YSBjb250ZW50KDB4
ZmZmZmZmZmUpIGlzIHdlaXJkLCBzaG91bGRuJ3QgaXQgYmUgJzB4ZmZmZmZmZmYnPyBPbmUgCj4g
Yml0IGZsaXBzLiBhbmQgdGhlcmUgaXMgbm8gRUNDIGVycm9yIG1lc3NhZ2VzIQoKWWVzIHN0cmFu
Z2UhCgo+Pj4+IEFub3RoZXIgdGhpbmcsIHdvdWxkIGl0IG5vdCBiZSBwb3NzaWJsZSB0byByZXNj
dWUgdGhhdCBwYXJ0aWN1bGFyIAo+Pj4+IHdvcm4gb3V0IGRldmljZSBieSBzaW1wbHkgdHVybmlu
ZyBmYXN0bWFwIG9mZiBvbiB0aGF0IGRldmljZT8KPj4+Pgo+Pj4KPj4+IENhbiBJIHJlZ2FyZCB0
aGUgcmVzY3VpbmcgYXMgbWFraW5nIGVyYXNlIGNvdW50ZXJzIGJlY29tZSBub3JtYWwgCj4+PiBh
Z2FpbihtYXggLSBtaW4gPD0gVUJJX1dMX1RIUkVTSE9MRCk/IElmIHNvLCBJJ20gYWZyYWlkIHRo
YXQgbm90IGFsbCAKPj4+IFBFQnMgY2FuIGJlIHJlc2N1ZWQsIGFjY29yZGluZyB0byBnZXRfcGVi
X2Zvcl93bCgpLgo+Pj4gRm9yIGV4YW1wbGU6IFBCLCBQQyBjYW5ub3QgYmUgcmVzY3VlZCwgdW5s
ZXNzIFBBIGlzIHRha2VuIGZvciB3cml0aW5nIAo+Pj4gYW5kIHRoZW4gd2wgaXMganVzdCByaWdo
dCBzY2hlZHVsZWQuCj4+Pgo+Pj4gdWJpLT5mcmVlIHRyZWU6Cj4+PiDCoMKgwqDCoMKgIDI5NjAw
KFBCKQo+Pj4gMShQQSnCoMKgwqDCoMKgwqDCoCAyOTYwMChQQykKPj4KPj4gSSBtZWFuIHRoYXQg
SSB0aGluayB0aGF0IHRoZSBiYWRseSB3b3JuIGRldmljZSBjb3VsZCBiZSBtYWRlIHVzYWJsZSAK
Pj4gYWdhaW4gYnkgdHVybmluZyBvZmYgZmFzdG1hcC4gSSBtZWFuIHdvdWxkIGl0IG5vdCB3b3Jr
IHByb3Blcmx5PyBJIGRvIAo+PiBob3dldmVyIHVuZGVyc3RhbmQgdGhhdCB0aGUgZmlyc3QgNjQg
cGh5c2ljYWwgZXJhc2UgYmxvY2tzIHdvdWxkIG5vdCAKPj4gYmUgdXNlZCBpbiBwcmFjdGljZSBz
aW5jZSB0aGUgZXJhc2UgY291bnRzIG9mIHRob3NlIGJsb2NrcyBhcmUgdmVyeSAKPj4gaGlnaC4g
QnV0IHdvdWxkIG5vdCB0aGUgZmlsc3lzdGVtIHdvcmsgT0s/IE9yIGFtIEkgbWlzc2luZyBzb21l
dGhpbmc/Cj4+Cj4gCj4gSSB0aGluayB0aGUgZmlyc3QgNjQgUEVCcyBjb3VsZCBiZSB1c2VkIHdo
ZW4gdGhlIG51bWJlciBvZiBmcmVlIFBFQnMgCj4gYmVsb3dzIDY0LCBmb3IgZXhhbXBsZSBVQkkg
cnVucyBvdXQgb2Ygc3BhY2Ugb3IgdGhlcmUgYXJlIG1hbnkgZXJhc2luZyAKPiB3b3JrcyBub3Qg
YmVpbmcgZXhlY3V0ZWQgYmVmb3JlIGdldHRpbmcgYSBmcmVlIFBFQi4KCk9rLCBJIHRoaW5rIEkg
dW5kZXJzdGFuZC4gVGhlIGRldmljZSBpcyBwcm9iYWJseSB1c2FibGUgYnV0IGlmIHRoZSBmbGFz
aCAKaXMgYmVjb21pbmcgYWxtb3N0IGZ1bGwgb3IgaWYgdGhlIHN5c3RlbSBpcyB1bmRlciBwcmVz
c3VyZSBJIGNvdWxkIHJ1biAKaW50ZSBwcm9ibGVtcy4KClRoYW5rcyEKL1JpY2thcmQgQS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
