Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60923CEDD93
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 13:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UD5XyWnqHeA6iq/pUZVD0AyXEZnE8YqS2gMLScmDXYE=; b=dg93VZDbixicMHfJauvp+EBcnr
	0DdNm2HMr7U8hIkWaLAtb+CwhVByH5Ag9Oahx+LWi43/q53ms+l9mFAxmLaQ+/fg8dGSA4N/vqNZS
	QJ8Q4A3F413YNrzpUrki6QUtJbc2f0Z4+imMj50sx6VSCWHWrGWrvenz0tF15765Gz4UPSp4af4Pb
	7syOqE35psTiYli0p6ZO2RXrJI++1NVqUrToerzQSauGrHB33a9Xa+5LtEZaGymF+/PihRu6Vw/Mp
	UfBe3KbgJQoFobJ9Os7dramCwW+IWDuVBznNI0suhC2cSE1LQQJrhTv6rMebrQvcl7RaWSA0YP7GP
	hZu9WcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWs8-00000009QrE-1DI9;
	Wed, 09 Oct 2024 13:37:00 +0000
Received: from mail-db8eur05on20700.outbound.protection.outlook.com ([2a01:111:f403:2614::700] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWoZ-00000009QEH-1UPl
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 13:33:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWSAyfcCrkxfT95Y15Y5LM78v7MsOxS6YZ2Qe7bYhR4CQbM8CpQec3YWAi0tFMpvKTmg0VRy94PZZVrPDrccBOa4dCwfvaH0NdGfm0aVD+AErfuaa03zEmHFymEO50QH1x2mtBujcqXFjKONeFHU0Fuq6S97hhOM965/26T8k0B9tliLHggbELX1HGk1I/QI1TgvivocEfUqhQsyuHFttDDxUN8dmlyZQo/IQQnlFKlbJDGnOHOfJxEKaApSOjXfoGMRGKQq+HheecIrddqsBfqs3RkucXs1vG2nirpDKpPqPMbu+S8L19Kc0diCwnfLxUtFkH0Nt2UfUpUNg6OKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS4tJL82tlj2pqMYcDXtJ/E4icw1o69FUQnU7XMJzZs=;
 b=oyFKKoZqb+Aktf5fIegjkZvkwJClX6LPkK5a+i9Wu/GGmuTjYWyRXjk/7i3DryqXBvEeTQ8RUq6dG6SZT6mI98eji3H8UQltQfffVKGXM0yv8IcU6aGwlRVL6XOb3lRki4SV3USqll11SlOv3DMR/QcjVvBS7eqSkEbXfTODm7D+8C6LQF5rY4RfnKunTALdghOgeyA1Kf5MZB+t5rBGHJZU3CFMBicW87H73pU2yXpCdRq6JTDOI5n36TEzXw+53wd63I4qsjKVUbDKJOIR0A3DWssqAcLMvVOMJoTfYd325UCinQGJwVFy8RV88kfjbi401R96NIftPiafEcrwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS4tJL82tlj2pqMYcDXtJ/E4icw1o69FUQnU7XMJzZs=;
 b=PyHyZxUQLefJTxBEXuJofvtGECX56VUwnWA0N+hY8/8bd3lHxQMM4zg+BZ5jvcbc/+98z8txNO51obk+dvY5z9J0hQ2Tc2wBYBzdMWsjjHbEPopZ9SfeA0ZlQqRazk+/MT7wmUs6RMNbI6bIAv4jruOepP2N5hpn0uU3h329nkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 13:33:12 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 13:33:12 +0000
Message-ID: <3345c66e-6f18-4bc7-8e52-4af7de6ff401@kontron.de>
Date: Wed, 9 Oct 2024 15:33:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mtd: spi-nand: winbond: Fix 512GW, 01GW, 01JW and
 02JW ECC information
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sridharan S N <quic_sridsn@quicinc.com>, stable@vger.kernel.org
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
 <20241009125002.191109-3-miquel.raynal@bootlin.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241009125002.191109-3-miquel.raynal@bootlin.com>
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GVXPR10MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b3d414-a528-44be-f9b0-08dce866ec24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG9YVVNzamM3MUc0bkdWQ3MzWmhhaSswdzRZQlNRQXNtdmJETDBHdkkzU1A1?=
 =?utf-8?B?dWZaajB3RzB0aktSUkN5Y2RFSzdNOEJRZ2VkdjhnRlIxOWhRNmU5WmEvYVFS?=
 =?utf-8?B?UTZycy9aTGEwNGkzRUpLK2JTQzVDT0xOaEpQT2l6M3JmVXU3V25VL2JFVTMx?=
 =?utf-8?B?cnRBQnZ3RjJRVldxUTRFdGtKeXZxYklCcFoxYUozRGxVeUk2elJtU0hjcE9O?=
 =?utf-8?B?bFhKSGZ3NW9Qemk2d3N0WERYc3dmTklvT3B3RXFrWW5vNG5tNU9mT3FiYXRM?=
 =?utf-8?B?RkthTHZlbVdScnh1bmM2WG81ZXFqQVBGZ1EzakU3SlJ6cC9zTllXUDlOUDRz?=
 =?utf-8?B?UVVkTWgrYnJlbEt0Z1hmN0o2YlAxZ2p1RjB2dlpYcENwd2pzTit2UWdOODVh?=
 =?utf-8?B?WmdabXE1K0pNNHZxWDhtU29mdzFUMnV2LzhCYmtPOGI3V2VvNjRqcXhDTWVw?=
 =?utf-8?B?a0szY0FGSW5CY0VmRFJDc016NWo2Z0pwMzRDejZSVmx5eldMUVlwcUd0UmlX?=
 =?utf-8?B?c24wWFM2bHpaT1V3NFg4Uy9Xb0kwRlYyL1NyUHdrY0piNVpIWFRYa0VhQlNN?=
 =?utf-8?B?ZmorS29qNFF3VmVScHNsdUVxWlM0SjRGLytXbjdBK1AvSHVSbmR0b0s2Mnhm?=
 =?utf-8?B?NThjTVZuKysxaUNPcUdaWXBtYW9JZFVEdnNYZ0pmN2I5bUdvZmNCNkt2MWVx?=
 =?utf-8?B?Y3JYdWZiNUZwS3Z2WlJWRnZ0TkVQSlFLaUIwVDZ3VWIvQy8vbmFGa0pEdXg2?=
 =?utf-8?B?STVpYUdKaDIzZVVrd3pSRmVncEFueVFMOHBveGV6M1BrK0hXT0VwNnVicnlm?=
 =?utf-8?B?aWp2VjZCV2hkNklNSEQzSG5WMGVXZmZxMlltOHlSaElRa3VKc0ViSGhnTkhR?=
 =?utf-8?B?bEtCdDNpQmk0dG5MQ1haeFM4aUQydnI5ajlHcUR0SFpzRW1kYjVVT2IrMU0y?=
 =?utf-8?B?WitqUUQzVVowTjdqWHQ4cDZXZGhMeTBPU3RqSFR1V1B0R3hiYmpkVnN4Z2hw?=
 =?utf-8?B?eXVpTmdhNnVrVzl6Y2pzS3kzOEtPbDlTcHdXV3JZUi9OaCt5cWk5QjIvUG42?=
 =?utf-8?B?Vi85cUkxR1BlaE5hQ1hYYnRiTU5VS2N2REZ0WkhYOHFoejhsSnpVRkM4Y01T?=
 =?utf-8?B?NnFZa2U1VFMrQ2xNTWk4REVvQnM2TGZVZnp0RnNORy9QV2dmSEYwR25MWHZw?=
 =?utf-8?B?aXZ4aUs0MjBJNzRReGpYRWJ1ay8wRTMrbWZGa2tyVGd1cG5iQ1AvdkViTGJI?=
 =?utf-8?B?RFk3OWpHNTRjQ1dLRWNuanFGaDYveWNYeFc5M2xRNFVPVFVKdzR1bTFqSEtB?=
 =?utf-8?B?bGJVK3BsUjgvTUk0enMvNDgrTDhVbmNtSE5rWkVUd1FTemR4RXRxemQrdmRl?=
 =?utf-8?B?SmZhNXBBa0dFV0JxbmJoRDdURjZaOEwvamh3RmwyUEhRSkl5N3Z1ZFNwS3RJ?=
 =?utf-8?B?a0QrREU5dG9ZQXZLWldOSnRaaThkL1FuaWhib3JHOWNsZmpVL2h1VnFrSWVE?=
 =?utf-8?B?RnhHTFhHTjJNSmEyOVRicXNYa25RZjRveHNHMWlKTzVrS0ZZTEFObCtwM0hn?=
 =?utf-8?B?Mk5yYmlNL3ozZ3g1dnFsd2FMclAvN2ZzUElDRXU2amp2MjQ0LzdSbjJRKzhk?=
 =?utf-8?B?MkdWUlcyKzk2d3JVdXZWRzk1U1lHdWtHYXYxTW5ielFsd212R01xbmdRa213?=
 =?utf-8?B?c0owbElubGZBb1IwNWdpSmNwZ1lXSSt6Rk03WGdtby9CbzJKRzZNcUhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDJyOStTaG02M2hIV0JKMTBNNkZTajBCMHN5UHlDM3V0YnVDc01vVzBZVXdX?=
 =?utf-8?B?bjZRb01WUlFzNm0yYVF6eTMzUTlobjhpb0g3T05XU0dsR25wZGcvejQ3cmto?=
 =?utf-8?B?eUpFS0ZOMkJNSWNZOWRGR1VZSzZLcThvS2tWTnV0QWhJUGdlQkFqY2p2UWVY?=
 =?utf-8?B?anRFaHd5Q0UwOUs0VnlNNGhNeUZvTTV1VUhLU3Z2NDFqZEYzcTRzMHdzamxa?=
 =?utf-8?B?c1VUNm9sQzhzM1JCdjdXaWRrRlVPb0pxK0drbEYwb3lQK2J5Q29GN29CUDEz?=
 =?utf-8?B?Z0ZZYU5BUVlXUW1yTGt4UDBYYlZ6T0ZVdnY4ZE1JbG5UMmwwS2FOUXpxN0FN?=
 =?utf-8?B?cE5mSzVrb0E1bUVMWmtqeUxXU1A4bVhaQVJwQlJBWjBCSGg1RGxDWm1jNzFl?=
 =?utf-8?B?UXNHRG81L3I0d3ZueFZhUEtqRG9aSHJjeC94UGJHVzNiZ3VlODN0VDRPS3R0?=
 =?utf-8?B?RE9lbXQzY3p6T3NJVTBJdFZCVlNFNkw2TkJDMzFrSlZyNmpVb2s3MGFFYzI2?=
 =?utf-8?B?dktMVFVobXVGWGt4TEdueXhUVkdmWlJselp4dW0xMkwxQ3VqMGY0amZzQitl?=
 =?utf-8?B?VGtHb0NzSFR6SVZxcktrUmxIc1p3SHM1aWtyYzdRMmhlNXNOTnBWSUNDdy9I?=
 =?utf-8?B?V0t5RW1vdXBPb21laTlYSFNjRUh3YWVCeHZXRGE5NEhJT1V0eTRnZWVRSGQ5?=
 =?utf-8?B?UmxDeGFhRVMxc3A1bDQzOXN3aGRGSzN6dWc1aXZzQ09MNUdzRmlGakdDUlJj?=
 =?utf-8?B?SnRkYys4LzNTNEdjQ09ENUV4c1FrUjRuSnNzK0krVFQxR0NCZmlDQlFVd0tG?=
 =?utf-8?B?Nk00b0pJRG44ZzZqUWpUM1BicHdIUmV4eWsrS1hCM1hhamYyMTYxQkVCcWk4?=
 =?utf-8?B?RHNYbTFFeXl1VkkvUkZCZjdpSEZPbU9uVm8vcFZsaGF1UHRXOU9IU2cvZTlU?=
 =?utf-8?B?OFVodmNEZjNoclVHSVVlcDJMM2ZncXpNcDVFS1pVN0lqZU9ZcloxTmRSSk5l?=
 =?utf-8?B?NFVNd3RFVlJNNkZUMnlmOVVyTSs3N0RtaTNuTGIraUx6UmdwUXJFNUxBTE1H?=
 =?utf-8?B?UXlvaEdRMEFYLy9Oa3JYc2J2aUVHWnd2M2tkb0MzY3RaanRWRitLRXFKQlEv?=
 =?utf-8?B?MTE2ZDVNVytCY0hFUjBTeFpod0QzYnZzWndnL3l2NXF1S0t2cjM4cXFZMGZM?=
 =?utf-8?B?MER4djVUNVl0L3MyQlZPdWZJbWpyVlRvaXJGeStLajI2SjZlWFByNVpSTndL?=
 =?utf-8?B?cFhycS9YZDVSemdKQzlnN3dEZEdDTkUxeGp3NXNveEF3OUNZUVpoOWdTQ1Ft?=
 =?utf-8?B?TGtEbHhINllxNE9mZUphM3hFWk4wUUpIUTdzcU40ZEJLekFib29aTDBERmlE?=
 =?utf-8?B?aEY1bjE1M01kQ1V5SHR4YnN2KzlPRTRYU1NwYjRDaWduVzZreGlEd0hPc1VR?=
 =?utf-8?B?QUVja0U4bVV6aE9CaDhmTW5NOVcrQW11OGI5R3B0Y0VERDFndGNrYTVDdkFE?=
 =?utf-8?B?QVdTUVlCbTR1RG5LZDh1eHZLN0pacm1KSkdPa09VczNvNFJWL0ViZlYzQXdD?=
 =?utf-8?B?NWVNSTRSRlpoR0h0TEh2MDFweG82RGNZWUJyNmNDU2RNSVdyMExYYXJQcFdR?=
 =?utf-8?B?ekJEMTZzTjNWQUZGQTZwV0I4VC9DZmszY0Zic3Bjai9BTWF0Nm45aXVPYmNO?=
 =?utf-8?B?cTVxNWFPWVhBdFlVVG1pSHhuSjlTMkd4YmpvWHA5WmZTU3l1dWNKczBNVzYv?=
 =?utf-8?B?QWtBU2hZZ2Y1M09HQ0p0S2o4WnorQ25BblRXdjFqUlU5bHhpaHJmZGM2Q2FT?=
 =?utf-8?B?L2hreTBNUFVoTnVHSWlrV3VTUFgwdGM2bzZZRjZ4TDltTTZ2NlpJT2oyNXIy?=
 =?utf-8?B?MmpiSkVmUTJXdFVRK2MyTVBMbUVybXJxdzBCbm9HeDZhaUV6ZXVoVzVwMHlv?=
 =?utf-8?B?OFdzdEt2RzBYSW5mVnBhMm10V2wzQ0xPai8vaUF3NFFVTjFueHFvbytkL0h4?=
 =?utf-8?B?OVhPd1JtY1pDT2JFVFR4WlRnK2M5ckFkc2lvZUJEaDJQemdXTGY0VnVvQUN5?=
 =?utf-8?B?Y0hMKzNUTGcySGdtcVFyMUhYT3NVbm5OR2VwRW9ocEkzcklPOThRQTZaZ1U0?=
 =?utf-8?B?YTdTOUpoaDJSdHZWM2NiTTV1cHJYMmZTU1hqcE9VQVlZUHI4a2xhZHBWZXA5?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b3d414-a528-44be-f9b0-08dce866ec24
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 13:33:12.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmhy0+kiZEJhl5PXCUb1Yc6V2FemeIeS1ziccSYE9G1hRNxejKGNzklAeF8pdQ91RqX6Tcbp86UZ0FTJP8csvMsdU2Aa79ZsrqrmvTzsXw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_063319_463069_C6F0B2E7 
X-CRM114-Status: GOOD (  11.64  )
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

On 09.10.24 2:50 PM, Miquel Raynal wrote:
> These four chips:
> * W25N512GW
> * W25N01GW
> * W25N01JW
> * W25N02JW
> all require a single bit of ECC strength and thus feature an on-die
> Hamming-like ECC engine. There is no point in filling a ->get_status()
> callback for them because the main ECC status bytes are located in
> standard places, and retrieving the number of bitflips in case of
> corrected chunk is both useless and unsupported (if there are bitflips,
> then there is 1 at most, so no need to query the chip for that).
> 
> Without this change, a kernel warning triggers every time a bit flips.
> 
> Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I had a quick look at the datasheets and this seems correct to me.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
