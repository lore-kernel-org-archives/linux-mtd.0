Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95C5E7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xC7jN4wAKJKCKyzzQb8Cz1vlrRWszAOR89TuJcu5jc=; b=j1qQ0PodU8priyFkFL2SHy/EnN
	qWUFLiMnxLlp6cAyDsb2uohd3PtOGkeDTh4h0bJq1yGRG6W7A0uYzaIDDiz10FHnremFq111nEOVC
	wljPcg2VEZyroViAzLc1PtWR9O+RW6OiNvh05vo9O3pzktoKNSZA3AlHMFpWTRQT4ajtLzty1m6sr
	mL7yvEJ4KSShi8JF1pcd1fO+gwgIbeMbeuxGaHUap/vHti35gCIcc3GAYhAXf1Mms8IYcR7UrrYbD
	gvNZNl9AUMPS/FtoDq2LL6iSPCdJAs6vnknbvrasHuIn+oXMtoBZHNhFJ19OKKcv2xdnbGC2fkjUJ
	6+MgBVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaEC-000000076kj-4AD2;
	Mon, 09 Dec 2024 09:38:56 +0000
Received: from mail-vi1eur02on2061e.outbound.protection.outlook.com ([2a01:111:f403:2607::61e] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaEA-000000076jv-0p5r
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 09:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzjK+RcdJ23ZIXD185PUY9LcCjqikj66hBpCOxfen6//2nk9o9oCIHZZP63UXvctAkQmxpoH/mKZc9WzZ20zzq7k8bEUQw9SIQ65oOiUgUFlD+CXHEJyN8qfdANm83RUruQNgvoe95XQTrTM9enH6ysjPDlNynQQc8IA3DL5TtpYmpjEskOUPptA/LvOszrr/whvj8qVTGQZXA/R6agjhviWFrBbHq+IdAZTz6tc0sbgLXEq3qX2sT9q2r5M9wFT+1x6NV/ZH9mEXcs9A3mfvl4vRtWi1p6Zi4msOozPlHmcFBG2+xBYk9nM9E5E1/bPb0zsGivIfD8Gb9CvthsYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIhMMfgyaOHVFb8P1NaP8gznGcNvFe6vbH8XQD/u/ds=;
 b=w8bg2d1EvbyCHJrTejak4EYViVJkbSn/Uf1U1xJ4XeKVAGVYpwGAmsPqOlTaq7XaR83U7K4cZsoxZltwqGjjXpTg1QqYDh9PGKkYt1rChGXZKHl9dWhvRuDMT4PiYdAqm+TvgHIZleBl9Y8o2rCMA5JmKfU6MXwZKWdufxC1wMb/y1jEQ3Ac0mrjXWvsZdOpE9F18+OqBw4ZUy/RhCv4Zv1ThDSUmca0TaOHpuuzsqVxc1fsKxd7CbvgAbi+Ynca44rmiZvB0shJ2UvwVMQyT9z+9q5idikkQUnj2lhdk7gAYNCq7ETJGYLh9kyTIpwlGstwrOUuKj5tfEDbWRaS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIhMMfgyaOHVFb8P1NaP8gznGcNvFe6vbH8XQD/u/ds=;
 b=pGgTOJV2izP1h7KjbqwMvKShm22wFIXm1bopqIDDmiTlo27/g3K2wBQelT+TtQ0t01++KWba0IVYP7mXQYuRQuScSJZU1xx8Inw1iGOLYxGD7Ck4dpfszGUbJHU/GhaduAfCLlG29/9aXrXGxVihdh0DK7dXxqEOiRb3Z4fnCNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by PR3PR02MB6331.eurprd02.prod.outlook.com (2603:10a6:102:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 09:38:40 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%6]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 09:38:40 +0000
Message-ID: <0f58f594-5bc5-bf05-9563-ebf0b9481860@axis.com>
Date: Mon, 9 Dec 2024 10:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/2] ubi: Implement ioctl for detailed erase counters
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 chengzhihao1 <chengzhihao1@huawei.com>,
 Rickard X Andersson <rickard.andersson@axis.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 rickard314 andersson <rickard314.andersson@gmail.com>,
 kernel <kernel@axis.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com>
 <20241206115127.2304701-2-rickard.andersson@axis.com>
 <adeb2ad0-f922-9bb6-db68-deaf7983704b@huawei.com>
 <745357310.45555475.1733558789826.JavaMail.zimbra@nod.at>
From: Rickard x Andersson <rickaran@axis.com>
In-Reply-To: <745357310.45555475.1733558789826.JavaMail.zimbra@nod.at>
X-ClientProxiedBy: MM0P280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::17) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|PR3PR02MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 2959c88e-6fa5-4b37-8ceb-08dd1835438c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFlsL2hJWmFvK1VCcmtSbVpXT3pCajVPdFRmaXRSRzlzMy9XdG1qRjZ3Z2xl?=
 =?utf-8?B?OWpQeTRYcEhDbVZzREJWd2NQSlJ3blpVMWRVenZSOEZxNTlMMFdpWmRlNzlj?=
 =?utf-8?B?a1lOdEFsUmNBSDF3ZjBhR3g4Q1Y3dmZQODlQMTU2Tld1cm52ZEZUN3lHVmlG?=
 =?utf-8?B?SzMrNFdxcWFyYlFPTU1xdGlpY1F1eWZGdGliYytqQW1paUJVTkVHWS9OY1pD?=
 =?utf-8?B?b0c1cXZPL2JIOTJXN3pIR2JrQTk3Mm9UQkt0TXFpTXIwMmwyVk94TXZMckxv?=
 =?utf-8?B?TG5aWmJ6NzRuR0IvS29MQllvSGJNdTk0MnpDSGdxcXc1K0JTdURoRFFnUXd1?=
 =?utf-8?B?SlcwenFIdThHYlJMenJJR2NUSjA4aHR5NnVaZGpNeEVCbHFzVUpGZWYwYVFD?=
 =?utf-8?B?dTdIUm9IUGNNcTFZSTZWRmY5Q0oxb3VLby9zVXZTcC9OeWhPaGtoM1RDWkc4?=
 =?utf-8?B?V0xoa2tnN2dUdnY0dEZ0dkF4UmN2RXdYWkZHVWVDbGx6ckE1U3VzZmNxYzNJ?=
 =?utf-8?B?dkp3ak5QU0pmNTM1RHJ4MENPUW5rWW55VGNGRXZpQVBUaVppUEpKQW1VWW9a?=
 =?utf-8?B?cnRnQ3dOY3QwQ2ovUE0xOVNzOHh5cEFHaXNudUt1RlYxSFRpNTVPNFJRY3Yr?=
 =?utf-8?B?Q1pRRWdBaHNCMGlPNHM4Wk40R2hRM0JMZjRZbk9vZkxEd05NRWVmSVZ3RVRw?=
 =?utf-8?B?cFp5VU9aTUFZb1JNSlVvRDdGN1BkWnRWRnhldkVRaU11MkVrRitaSG8zVmx4?=
 =?utf-8?B?TWo1K3dqK0l1L1VYN2hia3pQeExqamYzVFdsMENXMW5iZXB0TS9naSs2ekcv?=
 =?utf-8?B?Um8wR2QybzdoUnkxeHVCV1ZtN0dVbDdDSjZoVWlMS0RrWSt1ZnhnTStqa1hJ?=
 =?utf-8?B?cWg5eUJQakZ3VUc1K0Y4VWNZSDl5YXBPYkNBRXhYRU5ZSVZya29KRTJ3ZU9F?=
 =?utf-8?B?Qm1MeTMwNzBkaEhBZnVGbk96UFdpU2x1ckVlNW5QOStGZEtQMUM3YzVsVkFl?=
 =?utf-8?B?MTFySTJZU3kyMW54bXdhZllmb3BYc2NGMklGSEk4SElJRWkwN3pGSnJJS1VB?=
 =?utf-8?B?MzZVUGNqUDF2TlJjOExZa3owK1ZQcXBrcWhaZCtpT2J2SlhKeE5vNmJRK2xo?=
 =?utf-8?B?bGNleFQxd2Z5MHBBTkhxQWRTdHAxLzVWaHdubjIrbWVFRm8xbGNWR0JKdldL?=
 =?utf-8?B?MWw3VHRVM0VLK1oraW94ZTcvOXh2UVVtRWF0WEd3Z2U4RUc2dHJYcHJBek5B?=
 =?utf-8?B?bVBnSnMyeC9Zc0JRSEMyRE4wTEpjNFptYkVIamtiZFlxMDdyVnRkb3ZFVERP?=
 =?utf-8?B?L2l0cTE1TFZ5YUpPVU41YUZpU1p3M0wvb1pMamVhclRnQm9FQUFPR1IrZGVZ?=
 =?utf-8?B?MUlkeXJaR1JueE01NlhZSDBDeGorU2xWd0xUNHc4TERTeGduSzN6OXJxcTFt?=
 =?utf-8?B?Q0ZidGdxaTEyTFI0QldFSWtLQXJnTkNrVFhmRzNiSGxVMVZCRVRUOVExdTRy?=
 =?utf-8?B?a2ZxYW11VFpqejNVQzRUZDE4enE3cnl1ekRHM2dtVnFIVUt0b1MzaGQ2L1Fn?=
 =?utf-8?B?YXY5VnhrWCtwQzNjV0NwL1pkT2V1NFI5Ti83NkwrRHZJdllnQm5SeGo1RFMw?=
 =?utf-8?B?ZURkVDJHQk51QnRLV2tIZXhpTVJpYkY4Y1JJMm5HTUlQQXNNNTJKZEdmcVMv?=
 =?utf-8?B?RG5hV2lCdmFISGhWWDhhV0pBRisvM290NVJURkVTeThRMk44bkxGeFJ2T2Mw?=
 =?utf-8?B?QmNVeks4ZHdJQWZveVNBaHJCc2xmRmVLcFFxWWZEclJSUENUeEZSUEgySmdV?=
 =?utf-8?B?ZkZOYm9nRS9SVDhneWNaQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCt5M2N1T2dSdm81d042YXZvZm14MWZiY1VGejNwMjZKdXZxRzVUU2hXT2J6?=
 =?utf-8?B?USt1OHkvcEZNdmxOc0M3VWE4WFlqbWo3UXA0MWRqblVYOC9WdHZXckthUUhD?=
 =?utf-8?B?V1AzS0lwcnR0cWEyTEplYjEyVTA2NElmT1BaTm1OamFiRHlzUzJreUMvemhr?=
 =?utf-8?B?MmFYbDhyRU9ydWx2K09TdGExYjZOV1ZRZmVVNm5PcnU2VEF6WTBYbHNkTTJn?=
 =?utf-8?B?RmpBaDBMYzJvcmNXY3FVTUZsbTNId2lCcnJiZERSMnZLSjNlckF1SFpUQURF?=
 =?utf-8?B?aGEvajFDUGhka1YvMm5yMWdDaGxyc09jZ3dMZndHazhuQmc4Z1JHMzhtUHdC?=
 =?utf-8?B?YVY0V25TRTAycUR0V1hEQXYyZ25jcThSTFlibkVwUVRoaDJ6emdrS0V6a3hG?=
 =?utf-8?B?Ykg0eHNQTVBuOXZrZisrUllPVG9KOTRJZGVpSzM4dnZDSUJnVWl6QjVCV1V0?=
 =?utf-8?B?S1ZKeWVMLzIxM1BXdEo5a3ArKzIvb1hNMmFER2NXUkV4RlEwNnZlNitFLzh4?=
 =?utf-8?B?RFloSC9jVkU4ZWQvMU12QkgzSnJCNk90eTA0eC82b3hyMWxHVGFxUTNWck4v?=
 =?utf-8?B?dS9ueUdQOFpWR1IyV0RnRmlWaWZMemVRTnY2bWRZcUhyWCt1ODFrRldRWG9u?=
 =?utf-8?B?QUI2Y0t1czRKL3NVdm5wRnd1aW1Yd09CblVJN3VoK3FDVUFveTMwOGNEcVVq?=
 =?utf-8?B?M01rV2R5aDRrY1hEMUhrTWtqay9FMEt3SFlKeUJ2aEJCaGpRUTdlWVc4V2ll?=
 =?utf-8?B?Z2hUS2NrWEhFZ0tmZlBJb0VLL3JjY2dKMXAvempxTEdrOWlCUnBveXl1UjZN?=
 =?utf-8?B?LytHUkFXSXgyQUpQbkwrRktUbG1YNGxIdFpweGN1Mk5sR2Rlb1lsd2RBR3BK?=
 =?utf-8?B?d0o3b0hzRmltODNkTGI0dDJkNVhwN3RxNi9xNUNHNllaWEhNN2N0WXZQTllX?=
 =?utf-8?B?eXJNSjNoeHRETUx0RmFwNzdydUFHTk9LR2VBb3FrMXF6dVRpZmRHWmwvR2dY?=
 =?utf-8?B?WXBmSnptWnZPVlgyWkJ3WnJuK3c5a2hzVnp3WFpoVzhWY0NIVDc1OVRlNVV3?=
 =?utf-8?B?QXlra1p4M3BIbWd2SVZSdnkySW03QUZJc1k5dEhkb2E4VXNvUE5qN1JvZnhO?=
 =?utf-8?B?a0NraFdRZFJYVENlbm9KZ1JWdHBrN1NxNk5QR2F6eHhEWk9BWkxCeVRPRjZx?=
 =?utf-8?B?RXhjMjhRU1V3ZFVoSU5QTGwvd3krdlIxVlUzcHpuUXZTM0dMUjlYS2p3aEpz?=
 =?utf-8?B?NXA1aVRMckQrN3YyY0x0QTFtVXVrMlQ1UXJrWWM2VGVaOEJYdUNoN3ZKSTVV?=
 =?utf-8?B?WW9jZXRUOE1EZFdsZkJuTFNsZWpTM1dEclRuaDYrTHJUR0NlalFwU241cVg4?=
 =?utf-8?B?UVR3WlhyQ2hFanZrV3hZb2xFUUtBeElnRkN3RGNQU2Zua1ZyQ3ZNT012U0F2?=
 =?utf-8?B?M1pBQzVGVHIxaTV1THZiNTM5eEJhNFhGQ2h1eGpyNzE3ZGZxdWUzTTZqT0Z2?=
 =?utf-8?B?Y3BLeTJGWWxSUnNCU2grTGdaMVR5MEh4MnNOdENZYUdGMS9kQnh1UUN1K2JK?=
 =?utf-8?B?ZFB4enVMTVNlVEJPL0dWUk1IN1V3ZEZ5aW5uQjh2c1JzL2lpd1FkM2w3SFQ2?=
 =?utf-8?B?Ykw1VXJQcEZwc0pLaWhmY0RndFpyT3FpYllEREFXUVI1VEJSTVA4dGxuazRi?=
 =?utf-8?B?R0FXUngzc0NNUkFOT1d1YXpOb3dQd2loNFA1a2lZQUNrNkxLT2RZbXNwSHNE?=
 =?utf-8?B?SDdUVVc0cW9EN0RGSU9TemNBSnZDNUs4d055K2Q5VVd4Z1BrSzRuWXgxYSsv?=
 =?utf-8?B?bHdlZU5NcVFJL2F0UXppY0dGVnlrMzZEL2h2dTNqeDY3NHlPUWhlR08xY0pp?=
 =?utf-8?B?SzNXeElXbjF4RktOOTBvYUF2TzRkNWZHVEV1MDNaUGUycGo5SzNjQ0NXbW43?=
 =?utf-8?B?eUlBdWxsWmpWQktGTDBTaVVobmlwaVBvTXJBNTlqaEpsd202YlhkMm01bkxk?=
 =?utf-8?B?SEZpZjd3STk0VVpLZFo2VDVod3N5eHZNMExVRlRsUzNOTVArazZaUVZmRE50?=
 =?utf-8?B?N3A3VHRrRUxwd1cwNTVtelcxSGJ3QTRnYXpSSVdIWjZkcTRWdTA0Ym1qTm52?=
 =?utf-8?Q?h7+60zx/VEVXfXGucy6ZBlqRF?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2959c88e-6fa5-4b37-8ceb-08dd1835438c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 09:38:40.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zv/Hh8xpjqd2fEhcpJjqkHOGf5/laCd6UG79svuTFnPol8WMUMO+8WhTA7yYlaSgTg3DqEaSwyKrHjWsbUHVJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_013854_558589_97F9EDA3 
X-CRM114-Status: GOOD (  10.46  )
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

T24gMTIvNy8yNCAwOTowNiwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVyc3By
w7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+Cj4+IEFuOiAiUmlja2FyZCBYIEFuZGVyc3NvbiIgPHJpY2thcmQuYW5kZXJz
c29uQGF4aXMuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJsaW51eC1tdGQiCj4+
IOWcqCAyMDI0LzEyLzYgMTk6NTEsIFJpY2thcmQgQW5kZXJzc29uIOWGmemBkzoKPj4+IEN1cnJl
bnRseSwgIm1heF9lYyIgY2FuIGJlIHJlYWQgZnJvbSBzeXNmcywgd2hpY2ggcHJvdmlkZXMgYSBs
aW1pdGVkCj4+PiB2aWV3IG9mIHRoZSBmbGFzaCBkZXZpY2XigJlzIHdlYXIuIEluIGNlcnRhaW4g
Y2FzZXMsIHN1Y2ggYXMgYnVncyBpbgo+Pj4gdGhlIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtLCBz
cGVjaWZpYyBibG9ja3MgY2FuIGJlIHdvcm4gZG93biBtb3JlCj4+PiB0aGFuIG90aGVycywgcmVz
dWx0aW5nIGluIHVuZXZlbiB3ZWFyIGRpc3RyaWJ1dGlvbi4gQWxzbyBzb21lIHVzZSBjYXNlcwo+
Pj4gY2FuIHdlYXIgdGhlIGVyYXNlIGJsb2NrcyBvZiB0aGUgZmFzdG1hcCBhcmVhIG1vcmUgaGVh
dmlseSB0aGFuIG90aGVyCj4+PiBwYXJ0cyBvZiBmbGFzaC4KPj4+IFByb3ZpZGluZyBkZXRhaWxl
ZCBlcmFzZSBjb3VudGVyIHZhbHVlcyBnaXZlIGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YKPj4+
IHRoZSBvdmVyYWxsIGZsYXNoIHdlYXIgYW5kIGlzIG5lZWRlZCB0byBiZSBhYmxlIHRvIGNhbGN1
bGF0ZSBmb3IgZXhhbXBsZQo+Pj4gZXhwZWN0ZWQgbGlmZSB0aW1lLgo+Pj4gVGhlcmUgZXhpc3Rz
IG1vcmUgZGV0YWlsZWQgaW5mbyBpbiBkZWJ1Z2ZzLCBidXQgdGhpcyBpbmZvcm1hdGlvbiBpcwo+
Pj4gb25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBSaWNrYXJkIEFuZGVyc3NvbiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4+PiAtLS0K
Pj4+ICAgIGRyaXZlcnMvbXRkL3ViaS9jZGV2LmMgfCA3MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3MiBpbnNlcnRpb25z
KCspCj4+Cj4+IEhpIFJpY2thcmQuIFNvbWUgc21hbGwgbml0cyBiZWxvdy4KPiAKPiBQbGVhc2Ug
YWxzbyBydW4gY2hlY2twYXRjaC5wbCwgdGhlcmUgYXJlIHNvbWUgY29kaW5nIHN0eWxlIGlzc3Vl
cy4KPiBPdmVyYWxsIHRoZSBjaGFuZ2UgbG9va3MgZ29vZCB0byBtZSBhbmQgY2FuIGJlIG1lcmdl
ZCBzb29uIQoKSSBoYXZlIGFjdHVhbGx5IGJlZW4gcnVubmluZyBjaGVja3BhdGNoLnBsLCBidXQg
aXQgZ2l2ZXMgbm8gd2FybmluZ3Mgb3IgCmVycm9ycy4KCkJlc3QgcmVnYXJkcywKUmlja2FyZCBB
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
