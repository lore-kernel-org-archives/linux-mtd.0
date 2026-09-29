Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF3CA5FAC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vI8Vdl85M75wzsJ0TwyKgrtL1mRX9rdkntLtZnJT0Tc=; b=kUZWNjYHBRJXww
	QiiJBRqUhpAAMomPy3H7eOBIwo14eo8Fpy1RxuKO18XLMvyEqbVOOKbnBKOgO5fSzVrRGYMZPqDl9
	yE9wI3Y8TuRJgNm9dRof8u864GTeC9XO1UjHYcB63AAgqAL7Pf9pJtl1w1ToDA+DKzszt6AWUGnBh
	i9MTlSkW79sjOAmevRakwoXMYmi8bwvurrdIEPImYIpCP1VFramvzlU8hnANUHzSeVR8nEv8FrUK5
	+8oGw8OKoerd44TnYHPa+gIFv9bcnA4jReYinS8K0T6LxCX1evIYh34MLlc0GJ9zr3L6QLWJc4/0S
	bF8HH1PS9cmiShVVCGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaFD-00000003zsP-0dbI;
	Tue, 29 Sep 2026 15:59:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaFB-00000003zrq-2SXN
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=pytzascx4NS9TJFVlpmb2Q1/1Q+YaO4wwV7AE1hGbSY=; b=htebnHeNmWNyxzzbPhMInTkDAg
	AVcqox8De+1BM44w6tB2wvYYjCJCdvIHLurjR1vxcZD5JozIQPc8IXQixrotKLC+FK7K+BATiPjJ5
	TFg3qV8mV8/+44dYEP2I7OyltUO5gxWpIaZUWbeL+EdQOhJ5HLM+pGV08j9tjqJ6MAYUbjMA+0g+A
	098WLw5U49Ym2ZTwBNSlEA6oevCyF+MAfDl8RaGtqDa8NC2ilnt+VMZYDJ9oHXNimspq/xDzxH35O
	kBjl7HwYaKClak3c/uSbjsulohDyhYS+UV7Cq0pk6WfjBnkPwb1gD+72G5XP9GKpmjAgwXdcQrU5/
	4v80LBvg==;
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBaF8-00000002pFR-1oGn
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 15:59:48 +0000
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE40es2793052;
	Tue, 29 Sep 2026 11:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=pytza
	scx4NS9TJFVlpmb2Q1/1Q+YaO4wwV7AE1hGbSY=; b=oKZvV+Ao0pysm6BA5gSWw
	skD8kPX8oJ/7DH0ERmdj8KtC1Dmwpx8t6lNkCrdqdf7jP6gp0DoOLW5iLU8UuAUl
	HJhkehjTqhnlt4hEeQEHpO0x4UtwN8vzqjkyiRrhYBrkzpx160R7FLqc+OyET7hM
	tC6GyfhbAOSaXG8BvgEyYwyEOJFliTCubBs8wq2wnAElPn+WTQYgLEMK1fUZKCkU
	sSEv+dmBFPxZr1RoRlfLDrW3i/FMlCtiWuwGU3WctgBMIznyOdgwN3G0l6ZsWD5m
	AAETP89phMoYuKb0t6WchU0k6mOCuvkCwE2MWb5Vc5GRBZOJxgYpux/13QCHQaI/
	g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gyqygy71a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:59:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWjK7qblvNRyMYxONNU1Wrk1LlVcvPoM9xFlk79C2fFKWBDPCQXSPnZsuL3Qt7DNy0dJxHiUIFbhP+aPH5JmAEZ1uTWNipNvWonAw4wR86BAv+4OWEEaAwje6b3Z8QiGDn8nBGO5O6xDOwOagxmMW/Cyeb2AukgVdNXNMP4b2e3dK0RAKKQC+so33shlLKDytlKPOczukKfaABJXj4wO1K47T/Fkt6W9yWcFhiQIYxXcfI/4FgzUF4GDFd4Mehm9TwiEFWy1+bwoLLHyTahnZxe3FcAXrgwUapqwOV2Iy/zS1PMJ3ErP4rIBAzQ8NmuEZL4Q8eVCFNo4siXg+IOxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pytzascx4NS9TJFVlpmb2Q1/1Q+YaO4wwV7AE1hGbSY=;
 b=vr5DmGAafjs0u+9H1dXoCQjjlGAtxmxUmz083ceH1FMAIojZTcI+b+CUC96zQUdBjyDRbwGvN2h5cIM3DiPm5rt+Q3esRm79/VeLC/lgaNYcY+zIkSUMt+N7h//KYQb8sNFLR/z2Ynoo6qQOPCu4vzb4LiCYykVdvPf4hnIJZ13HsZazPuK9349L2unnRqJStOSakaqjOe2EAwaQmXGIfikgcdBWe1v5LKwUScgHSEPhFohiLP8RMoeg3J6bT3kTlxBo28Mh0rTRvqU6as4shJM0SPhoDj2cAbhNO6Kh+Dj2CpGRCT5QxA7gjwrtrYX8mjMHnfcgotUhDBuDF3T+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DM4PR03MB5984.namprd03.prod.outlook.com (2603:10b6:5:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:59:20 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 15:59:20 +0000
Date: Tue, 29 Sep 2026 17:00:23 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <arvgR1vN66ChzGjO@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
 <arqBm7OpMHuVhzg0@nsa>
 <DLRTFDVTU3XS.2Z1O4PO8PBM1D@kernel.org>
Content-Disposition: inline
In-Reply-To: <DLRTFDVTU3XS.2Z1O4PO8PBM1D@kernel.org>
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DM4PR03MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc0dc1d-1fac-49f1-bfa2-08df1e429f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|5023799004|10067099003|3023799007|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MK5XssiVa8qqOuVRWl5pvIg3Ju61+TLnpahEI5QKtDDO8hE9OHVF4KCwnfEJdsOLkQPYwskpyZ2+igirRqntLi6G5LLj6iAkP46PqV0e0NoZf8OkDEattgaSUHA5sf5uSpLFB5nCtcgeve8cah+byg6970QFBH/5Io3umWV3bTWiXBj4c+u/WVMbbUG85MSw5CStX4nufLqh1ERUPWjyK0mfAamVW53UAXK96wHSUtZB4MSaz9I5d79HkjapAuCrIPtkJ91An/efNvsDb54bj3T7S6TtaIfv6CifEiS+I5SD9f9ZkdQlyjGhamsPhWZevZHGDk2T2QEzLPylgM0gf4obIKD7uhBIBi+N2rLgy1Ql6d48i3WHBrWUpplPdYU/L5Rax/a9npZa69qvIkj/Q9prejos25CEMkbvPspnSefiUNDT7kfSa88U6yDMAKC+FN9gcg7UvmJLoB5MEXmXSa1pJSxKPYiXQPerg+FoHAjG9v7gyr/sH+M41HqD8S0RYVBkpvz36vxurJeHsicuPbclJqB9GsKte1aOCW++tGB6Nnx/dHSWyn6NY8RukdoWT8It+66mC8Le63QLD/VY/9u7KhfXdYhAiKvGwSMwDXx0Q6NAIO6akNM4s4wGdS5qP5W1Ovl2aqRyvfsvUtfB4HLkivk26sxznB3apMBJzAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(3023799007)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZIQndUY2pmd2RxaGRPRTBjZWZGUmRwQkVzRU55eVBPOUdsQkhIenMxL0l6?=
 =?utf-8?B?MEUyVkxBeXIxUUZxbFhuQy9XbElRZEtoTENXVmFKaUkxcTkxRlNyajg1TmNX?=
 =?utf-8?B?T2Fuc0k5angwQXhRZVhmR0o3SFZtNURYVExTVEV4bTl2UWhvNTRNdzZuUU1Q?=
 =?utf-8?B?WkUvZ3NMNDFmaWg5SGdpN0Zyd2Q5RVJjYXdUU0xtamlpOWtGVkduZG94dXlr?=
 =?utf-8?B?TDRjYkwrTWZVR2svbUdNZlFzRzdCMFlENG9NKzhiVE04T2RqU2E1NENmUXRw?=
 =?utf-8?B?SW4wV3g0SEpmN3hkcGRWeUZFMCtTU1h2YStNTUx6eE5TZG5DQWN6elVoS2hI?=
 =?utf-8?B?TDdEY2tqcmhtQnpGeUxmeGUwVzJ2OXl5bVBzaFhLYXpSWTJFNHZXWjlqZkdP?=
 =?utf-8?B?Y3NTN3I2bjVzRWFlQ2NMRkJhOHJBUDFxRWxTbzFnaUlnZ00vYWhsTVRsdU13?=
 =?utf-8?B?NWVQeXpNM1NZOHdOZDQ3Ty9wS2xreVFzZzJobTE4SkxFbHFaNDVYOFdTRWRh?=
 =?utf-8?B?YXlvSVRndHFPZXpTWEFobVRJSnp4TUtsTE1jNW5LRVdueHJabkFabDVUSW9v?=
 =?utf-8?B?c0p2V3FTUVJVazVCci83cW9SdWswakUveXkrR2UyZEJjdjJjT09HU3R4Y0pl?=
 =?utf-8?B?MDVyczlyWWttUzRHNnVrN1BpTW13Uk0yaFV3K2ZpVlhOWVIveGpZZ3h2UlJG?=
 =?utf-8?B?MjU5VVpxU1FYZThjY0Vob0EvL3F1NUJQVGVhMy9lRkZJVGluN045M1RTNndC?=
 =?utf-8?B?K2kzM0h0Z1lTWXdxcldFQmtIYnRUWHBrOGxEZm12NHFXNG52ZngvU2xKWHNi?=
 =?utf-8?B?MDFIMzROS0l1THVIa05UakhjTUJjUTd6VmVyWWorT2FsdmpBU1g5RFRxdHhC?=
 =?utf-8?B?UVIyb1hraHBWTU5qOW1YVkpRT3hnSWprS2ExWTludS93OGhUWFRVbnB0MGdQ?=
 =?utf-8?B?T21zVTkzVVprazJ1NWhwOVdVZ1A2MW5nSVJTQWFzT2hUMFlObmlubWczbWxE?=
 =?utf-8?B?R2RrMGMzaDBib25HRUdGMzFYTkZQSDFlbURhOFFWWk1FdGRmVWhlYzB5TnhX?=
 =?utf-8?B?NkNSb0gyTmoyM2JLTVhlQjN5aFQyYzBQSlR6ZmJwOUtHN1RDZlNvUU1RamUr?=
 =?utf-8?B?VEFvd0VaNXlRTzhZSUdCRmN0K1dEZE93ZGwyTjJWYnpGdTh5NUFjY2lISmxP?=
 =?utf-8?B?SDZRc1Y1M1lYRnVpdzd6aUhPT1BydFBISHhLWmJTV0RLMjZleDhrVll3R0tJ?=
 =?utf-8?B?SkNqME5mN0tjOWk5U0RsejNvUmhZOGl4U0RFRlhqaHMxaHk2Q01ranh6ZG43?=
 =?utf-8?B?T2EvelJFL1VSdm9mamJ3MnoyZFJOKzFydTVTd1hnNVpJY1I4czE2c3RUQ2tD?=
 =?utf-8?B?SzVzTWtTOVphN0lHeVJkUXdGbEVGeUQ3U2UvZms5VUh2dFM3YnV6RXNGbG1C?=
 =?utf-8?B?OVhSRldsRCtleS8wQWtRWWFBcEs4c3I5K3dybTdpUVJRdjB2L1ZYM29NYXJI?=
 =?utf-8?B?VGFpVlRsRFlQOVFDWVZnbE5IR3p3VndJaGNXeityaFVraGpZaTVjZzNiUDV2?=
 =?utf-8?B?SENqVTNiS2NXV0Z2WW5QdWxlenppckE2SHlhVGRaZnE0OEsya05GRnVHNG9I?=
 =?utf-8?B?RUpDa2swVUNGS2xyOFV3L1FDQWtGSjhlZWZsR3U4UnN5dGExRmVIYkk1ZkIr?=
 =?utf-8?B?MEZTTlF3cVo3R2pXSUc1WXJQTiszYUZiY1N1Q2V5NzVVOFFzNUVIVGlJeDI4?=
 =?utf-8?B?M2lxdEJZNTkwQnV1QmxEQWo2c0g2ZDZsZG0xbnVxOWZGNk5MbUxYQkVtekFO?=
 =?utf-8?B?SVZDWGtnSU1sRUZTcFlEU3NDQ0JTREpmYXBqM2pOVlhSeDRwdVBhWElNcTN6?=
 =?utf-8?B?VzNISEFyUnJJb05CUGI1bk92TVlKYmV2QlJmbmV2bi9WckRmWGFSQ3dSRjQw?=
 =?utf-8?B?ekZZSmtaVU94dlZBaFV4S002dlUvN1Vld2x0QzVzQnhnelVMbEZXcXRHY2dJ?=
 =?utf-8?B?ZFlVNUVRdnNFcjBzbzNnWjRxaThhQXluRHZ6Q0NRNFZzVnp6WkREUk11eGQr?=
 =?utf-8?B?Smd2OWp3L3I1cjczU3M1OXppSHZxdkdkSXh6VXoxZDYyMnR5YUwzRGxicWVs?=
 =?utf-8?B?aFBkWEVQa01SckZ4MUlFVVRKVHBHR0NFVVBWVS94MkJIZSs1cnFKRVdGcVVQ?=
 =?utf-8?B?Y1BlVHgwY25CZDNpaHEyWVJUT2ZNUmFZZ3VKdGhZd1ZkUS9EQThMa2laUlhY?=
 =?utf-8?B?VnN2eFRrcjJHZitrSjZWbG1kVzhxYUszc0xGS3ByeGVha0oxRnBpOXc5bDhP?=
 =?utf-8?B?R2t6TnFjcGZIZVZMRU5PczBSUzVTZW5XdGVPb1UwMlBySzB6ajBZdz09?=
X-Exchange-RoutingPolicyChecked: fMUhBYS3DeRsP1xEevv7tRLgTQ43kGnJ+EqExBzhhPmhWvluT/lJhmEtn65zBaSiUCLmI6UP0SrTpS2bHel1vR90D95uI/6/XaYJk1ZCgWwF535VZ+7Y4hug0vcZJ20sYBXOU56JZivEk0bLxvDWQWCUz9nhzYj8d86FyglgGfDeynNb0hEkvERlSjd8un4TtKofW0JCOadQUYJOGSam3hurUxiFkS4Mcvv65Z3GRB8eNt8WPuQwosH/m5hdHITqnBGwOWCJT2ZJPBrs16PXH523KwIElbbyy685GsNP5PESqBMNoUxwogpXmsafrFgIrymsIBnl28c1n9ot3efplA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc0dc1d-1fac-49f1-bfa2-08df1e429f59
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:59:20.2584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WapPzRqfed++WdGRXM+otY098/Oxw/cikzHNBExsHcwI9x9zZeFgZpYr8/f/fFp/+3Ps6EvocCfcI9V5qvLMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5984
X-Authority-Analysis: v=2.4 cv=CIu/zhrD c=1 sm=1 tr=0 ts=6abbe05a cx=c_pps
 a=EPZJxM4MYJNUcCtligPUUQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=fxxGF-MwVb8NT6w17VMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2sXYauPR95pGqmndctWE-3vKI-4bNT4W
X-Proofpoint-GUID: 2sXYauPR95pGqmndctWE-3vKI-4bNT4W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX9ixGKBghr/tB
 uMYi4R7hIRrxaMAjZGngtGV3vkmtzEJrWasZzXw1FRJpyk8kBHMxCkLkwRaAx+1oVnXzDVvG8SP
 rtmSfwihSyb01reTg33XS9ITvJpUCa2u7oPIBdYZoqIbBTXdc3IL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX7MgAwBg6FVGI
 EL6ZnxVpfJDvS1gn/ObOv54VTyCm3pPGeRbZb0Wy9HKfQAdf1ivThjIUqDRUHYErZiDJizgyHBm
 h0IKw58+d897ZOSNsPa2zXkfHsjiy+97hYwrPOJgEW5Ct5DkcmNp6tLoQiVxkc3Q9dT0bMo8opK
 Xf604IKH+tv/7n5WnpDpw/R33PQoeyuSCOU6u3Bqloc5iZRUwmPU5uWViqUFGFRMrMsrlNYRMwA
 gZRn910eg65ol+EMmG/QCvyRFDTc+eQzga1YTeei+8ZzwzVmdp0Lqvb2uHOw3i6/dVth8pWqSDL
 0CDHM3bk+4FN92CsHBuKsL2+Ljti1saTt9XOCi/wa7CC8gc4uCDYO3gIHxAFhNYxIZYwoeFW1PJ
 G9DD2QI45nY7b/1USfROvqk1k/jZzjZSeC/olZ1FlwQNiYFplR1UzjeKYtbo2qOJaNOX8l78/T5
 jhhEIy6ZsX6LZDCH+Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165946_899293_564D8357 
X-CRM114-Status: GOOD (  44.81  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMjksIDIwMjYgYXQgMDI6NTY6NTNQTSArMDIwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBNb24gU2VwIDI4LCAyMDI2IGF0IDU6MDMgUE0gQ0VTVCwgTnVu
byBTw6Egd3JvdGU6Cj4gPiBPbiBGcmksIFNlcCAxOCwgMjAyNiBhdCAxMToyNTo1NEFNICswMjAw
LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4+IE9uIFdlZCBTZXAgMTYsIDIwMjYgYXQgMTA6NDQg
QU0gQ0VTVCwgTnVubyBTw6Egd3JvdGU6Cj4gPj4gPiBPbiBXZWQsIFNlcCAxNiwgMjAyNiBhdCAw
OToxNDo1MkFNICswMjAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4+ID4+IE9uIE1vbiBTZXAg
MTQsIDIwMjYgYXQgNTozMSBQTSBDRVNULCBOdW5vIFPDoSB3cm90ZToKPiA+PiA+PiA+IE9uIE1v
biwgU2VwIDE0LCAyMDI2IGF0IDA0OjA0OjQwUE0gKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6
Cj4gPj4gPj4gPj4gT24gTW9uIFNlcCAxNCwgMjAyNiBhdCAzOjQyIFBNIENFU1QsIE51bm8gU8Oh
IHdyb3RlOgo+ID4+ID4+ID4+ID4gKCopOiBJIHNob3VsZCBub3RlIHRoYXQgdGhlIGNvbW1hbmQg
YWN0dWFsbHkgZmFpbGVkIHdpdGggLUVJTyBidXQgaXQKPiA+PiA+PiA+PiA+IGFjdHVhbGx5IHVu
bG9ja2VkIHRoZSBjaGlwISBBbmQgdGhlIHJlYXNvbiBpcyBiZWNhdXNlIHRoZSBmbGFzaCBhcyB0
aGUgc2FtZQo+ID4+ID4+ID4+ID4gRlNSIHJlZ2lzdGVyIHRoYW4gdGhlIG1pY3Jvbi1zdCBmbGFz
aC4gU28gV0VMIGlzIHNldCB0byAxIGJ1dCBjYW4gb25seQo+ID4+ID4+ID4+ID4gYmUgY2xlYXJl
ZCB3aGVuIGNsZWFyaW5nIHRoZSBGU1IgcmVnaXN0ZXIuCj4gPj4gPj4gPj4gCj4gPj4gPj4gPj4g
V2h5IGRvZXNuJ3QgdGhpcyBhZmZlY3Qgb25seSB0aGUgbG9ja2luZyBvcGVyYXRpb24/IFdFTCBw
b2xsaW5nIGlzCj4gPj4gPj4gPj4gdXNlZCBhbHNvIGR1cmluZyB3cml0ZSBhbmQgZXJhc2UuCj4g
Pj4gPj4gCj4gPj4gPj4gU29ycnkgSSBtZWFudCBXSVAuCj4gPj4gPj4gCj4gPj4gPj4gPiBOb3Qg
c3VyZSBpZiBJIGZ1bGx5IHVuZGVyc3RhbmQuIEJ1dCBBRkFJQ1QsIHRoZSByZWFzb24gd2h5IGVy
YXNlIGFuZAo+ID4+ID4+ID4gd3JpdGUgaXMgc2lsZW50IGlzIGJlY2F1c2UgdGhlIGRlZmF1bHQg
c3BpX25vcl9zcl9yZWFkeSgpIG9ubHkgbG9va3MgYXQKPiA+PiA+PiA+IFNSX1dJUCBbMV06Cj4g
Pj4gPj4gCj4gPj4gPj4gU28gdXN1YWxseSwgdGhlIFdFTCBpcyBjbGVhcmVkIGF1dG9tYXRpY2Fs
bHkgYnkgd2hhdGV2ZXIgbmVlZHMgdGhlCj4gPj4gPj4gV0VMIGluIHRoZSBmaXJzdCBwbGFjZSwg
aS5lLiBwcm9ncmFtIG9yIGVyYXNlLCB3cml0ZSAoc3RhdHVzKQo+ID4+ID4+IHJlZ2lzdGVyLiBU
aGF0IHNob3VsZCBhbHNvIGJlIHRoZSBjYXNlIGZvciB0aGlzIGZsYXNoLgo+ID4+ID4+IAo+ID4+
ID4+IE5vdyBmb3IgdGhpcyBmbGFzaCAoYXMgd2VsbCBhcyB0aGUgc3QvbWljcm9uIG9uZXMpLCB0
aGVyZSBpcyBvbmUKPiA+PiA+PiBwZWN1bGlhcml0eS4gV2hlbmV2ZXIgdGhlcmUgaXMgYW4gZXJy
b3IgYml0IHNldCBpbiB0aGUgRlNSLCB0aGUgV0VMCj4gPj4gPj4gY2Fubm90IGJlIGNsZWFyZWQg
YnkgYSB3cml0ZSBkaXNhYmxlIGNvbW1hbmQuIFdoaWNoIHdlIHNob3VsZG4ndAo+ID4+ID4+IG5l
ZWQgYW55d2F5IGJlY2F1c2UgaXQgc2hvdWxkIGJlIGNsZWFyZWQgYXV0b21hdGljYWxseSBpZiBu
b3RoaW5nCj4gPj4gPj4gZ29lcyB3cm9uZy4KPiA+PiA+PiAKPiA+PiA+PiBBbHNvIHRoZSB3cml0
ZSBzdGF0dXMgcmVnaXN0ZXIgd29uJ3Qgc2V0IHRoZSBlcnJvciBiaXRzIGlmIGkgcmVhZAo+ID4+
ID4+IHRoZSBkYXRhc2hlZXQgY29ycmVjdGx5IGFuZCBpdCB3aWxsIGFsd2F5cyBkaXNhYmxlIHRo
ZSBXRUwsIHNlZQo+ID4+ID4+IFRhYmxlIDI5ICgiV1JJVEUgUkVHSVNURVIgT3BlcmF0aW9ucyIp
IGluIHRoZSBNVDM1WFU1MTJBQkEgZGF0YXNoZWV0Cj4gPj4gPj4gYW5kIFRhYmxlIDgsOCAoIldS
SVRFIFJFR0lTVEVSIE9wZXJzdGFpb25zIikgaW4gdGhlIElTMjVXWDAxRwo+ID4+ID4+IGRhdGFz
aGVldC4KPiA+PiA+PiAKPiA+PiA+PiA+IE9UT0gsIG9uIHRoZSB1bmxvY2sgcGF0aCB3ZSBkbyBz
cGlfbm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjaygpIGFuZAo+ID4+ID4+ID4gZ2l2ZSBu
byBzcGVjaWFsIGhhbmRsaW5nIHRvIFdFTCBzbyBJIGltYWdpbmUgdGhhdCB3ZSB0cnkgdG8gc2V0
IGl0IGFzIDAKPiA+PiA+PiA+IGJ1dCByZWFkIGl0IGFzIDEgKGdpdmVuIHRoYXQgaXQgY2xlYXJz
IG9ubHkgd2l0aCBGU1IpIGFuZCBoZW5jZSBJIGdvdAo+ID4+ID4+ID4gdGhlIC1FSU8gaW4gWzJd
Lgo+ID4+ID4+IAo+ID4+ID4+IFdlIGRvIGEgUk1XLCBzbyBteSBndWVzcyBpcyB0aGF0IGl0J3Mg
dGhlIG90aGVyIHdheSBhcm91bmQuIFdlIHJlYWQKPiA+PiA+PiBpdCBhcyAxLCBidXQgdGhlbiBh
ZnRlciB3cml0aW5nIHRoZSBTUiwgaXQncyAwIChzZWUgYWJvdmUpLiBUaGF0Cj4gPj4gPj4gYWN0
dWFsbHkgYXNzdW1lcywgdGhhdCBpZiB0aGUgV0VMIGFuZCBhbnkgZXJyb3IgYml0IGluIHRoZSBG
U1IgaXMKPiA+PiA+PiBzZXQsIGEgd3JpdGUgc3RhdHVzIHJlZ2lzdGVyIHdpbGwgY2xlYXIgdGhl
IFdFTCBhbnl3YXlzLiBDb3VsZCB5b3UKPiA+PiA+PiBkZWJ1ZyB0aGF0IHNvIHdlIGFyZSBzdXJl
LCB0aGlzIGlzIHdoYXQgYWN0dWFsbHkgaGFwcGVucz8KPiA+PiA+Cj4gPj4gPiBTdXJlIEknbGwg
ZG8gc29tZSBkZWJ1Z2dpbmcgb24gdGhlIHVubG9jayBwYXRoLiBUaGUgRFMgc2VlbXMgYSBiaXQK
PiA+PiA+IHVuY2xlYXIuIEl0IGFsc28gc3RhdGVzIChmb3IgdGhlIFdSSVRFIERJU0FCTEUpCj4g
Pj4gPgo+ID4+ID4gIi4uLkluIGNhc2Ugb2YgYSBwcm90ZWN0aW9uIGVycm9yLCBXUklURSBESVNB
QkxFIHdpbGwgbm90Cj4gPj4gPiBjbGVhciB0aGUgYml0LiBJbnN0ZWFkLCBhIENMRUFSIEZMQUcg
U1RBVFVTIFJFR0lTVEVSIGNvbW1hbmQgbXVzdCBiZSBpc3N1ZWQgdG8KPiA+PiA+IGNsZWFyIGJv
dGggZmxhZ3MuCj4gPj4gPiAiCj4gPj4gCj4gPj4gTm90IHN1cmUsIHRoaXMgY29udHJhZGljdHMg
ZWFjaCBvdGhlci4gQXMgSSByZWFkIGl0Ogo+ID4+IAo+ID4+ICAtIFdyaXRlIChzdGF0dXMpIHJl
Z2lzdGVyIHdpbGwgYWx3YXlzIGNsZWFyIGEgV0VMLCB0aGUgb25seSBvcGVuCj4gPj4gICAgcXVl
c3Rpb24gaXMsIGRvZXMgaXQgYWxzbyBjbGVhciBpdCBpZiB0aGUgcHJvdGVjdGlvbiBiaXQgaW4g
dGhlCj4gPj4gICAgRlNSIGlzIHNldAo+ID4+ICAtIFdyaXRlIGRpc2FibGUgd29uJ3QgY2xlYXIg
dGhlIFdFTCBpZiB0aGUgcHJvdGVjdGlvbiBiaXQgaW4gdGhlCj4gPj4gICAgRlNSIGlzIHNldC4K
PiA+PiAKPiA+PiA+IEJ1dCB0aGUgdHJ1dGggaXMgdGhhdCB0aGUgc2Vjb25kIHVubG9jayBJIGRp
ZCBjYW1lIHdpdGhvdXQgYW4gZXJyb3IuCj4gPj4gCj4gPj4gV2hpY2ggbWlnaHQgaW5kaWNhdGUg
dGhhdCBhIHdyaXRlIHN0YXR1cyB3aWxsIGNsZWFyIHRoZSBXRUwgYW55d2F5Lgo+ID4+IEJ1dCB0
aGVuIGl0IG1pZ2h0IGFsc28gYmUgaW50ZXJlc3RpbmcgdG8gc2VlIGlmIHRoZSBQUk9UIGJpdCBp
biBGU1IKPiA+PiBpcyBzdGlsbCBzZXQuIElPVywgaWYgYSBuZXcgd3JpdGUgZW5hYmxlIGlzIHNl
bnQsIGEgd3JpdGUgZGlzYWJsZQo+ID4+IG1pZ2h0IGZhaWwgZXZlbiBpZiB0aGVyZSB3YXMgbm8g
YWN0dWFsIGVycm9yLgo+ID4+IAo+ID4+ID4KPiA+PiA+PiAKPiA+PiA+PiBCdXQgdGhlIHF1ZXN0
aW9uIGlzIHdobyBpcyBzZXR0aW5nIHRoZSBlcnJvciBiaXQgaW4gdGhlIGZpcnN0IHBsYWNlLgo+
ID4+ID4+IEFuZCBJIGd1ZXNzIGl0J3MgdGhlIHRlc3Rpbmcgc2VxdWVuY2UgZm9yIHRoZSBsb2Nr
aW5nIHdoZW4geW91IHRyeQo+ID4+ID4+IHRvIHdyaXRlIHRvIGEgbG9ja2VkIHJhbmdlLiBTbyB5
b3UgY291bGQgYWxzbyBhY3R1YWxseSB0ZXN0IHRoZQo+ID4+ID4+IGxvY2tpbmcvdW5sb2NraW5n
IHdpdGhvdXQgd3JpdGluZyBhbnkgZGF0YSB0byB0aGUgZmxhc2gganVzdCB0byBzZWUKPiA+PiA+
PiBpZiB0aGF0IGlzIHRoZSBjYXNlLgo+ID4+ID4KPiA+PiA+IFByZXR0eSBzdXJlIHRoZSBhYm92
ZSBpcyB0aGUgY2FzZSEgSWYgeW91IGxvb2sgYXQgb3RoZXIgdGVzdHMgYWZ0ZXIKPiA+PiA+Cj4g
Pj4gPiAiT25jZSB3ZSB0cnVzdCB0aGUgZGVidWdmcyBvdXRwdXQgd2UgY2FuIHVzZSBpdCB0byB0
ZXN0IHZhcmlvdXMKPiA+PiA+IHNpdHVhdGlvbnMuIENoZWNrIHRvcCBsb2NraW5nL3VubG9ja2lu
ZyAoZW5kIG9mIHRoZSBkZXZpY2UpOiIKPiA+PiA+Cj4gPj4gPiBFdmVyeXRoaW5nIHdvcmtlZCBu
aWNlbHkgZ2l2ZW4gd2Ugd2VyZSBqdXN0IGRvaW5nIGxvY2svdW5sb2NrLiBUaGUgRFMgaXMKPiA+
PiA+IGFsc28gY2xlYXIgYWJvdXQgdGhpcyAodGFibGUgOC4xMSk6Cj4gPj4gPgo+ID4+ID4gIi4u
LldoZW4gYSBjb21tYW5kIGlzIGFwcGxpZWQgdG8gYSBwcm90ZWN0ZWQgc2VjdG9yLCB0aGUgY29t
bWFuZCBpcyBub3QgZXhlY3V0ZWQsCj4gPj4gPiB0aGUgd3JpdGUgZW5hYmxlIGxhdGNoIGJpdCBy
ZW1haW5zIHNldCB0byAxLCBhbmQgZmxhZyBzdGF0dXMgcmVnaXN0ZXIgYml0cyAxIGFuZCA0IGFy
ZSBzZXQuIAo+ID4+ID4gSWYgdGhlIG9wZXJhdGlvbgo+ID4+ID4gIgo+ID4+IAo+ID4+IE9rLgo+
ID4+IAo+ID4+ID4gSSBhbHNvIGRpZCB0ZXN0ZWQgd2l0aCBiYXNpY2FsbHkgdGhlIHNhbWUgY29k
ZSBhcyBpbiBtaWNyb24tc3QgYW5kIHRoZW4KPiA+PiA+IEVSQVNFIGFuZCBQUk9HUkFNIGNvbW1h
bmRzIGp1c3QgcmV0dXJuIC1FSU8uCj4gPj4gCj4gPj4gQnV0IHRoZSB1bmxvY2tpbmcgZG9lcyBu
b3QgcmV0dXJuIEVJTyBhbnltb3JlIHdoZW4gaXQncyBleGVjdXRlZAo+ID4+IHN1Y2Nlc3NmdWxs
eT8KPiA+PiAKPiA+PiA+PiA+PiA+IEFGQUlDVCwgd2Ugc2hvdWxkIGRvIHNvbWV0aGluZyBzaW1p
bGFyIGFzIG1pY3JvbiBzbyB0aGUgd3JpdGluZyB0byBhbgo+ID4+ID4+ID4+ID4gYWN0dWFsIHBy
b3RlY3RlZCByZWdpb24gZmFpbHMgcmF0aGVyIHRoYW4gYmVpbmcgc2lsZW50bHkgZGlzY2FyZGVk
IHdpdGgKPiA+PiA+PiA+PiA+IHRoYXQgc3RhdHVzIGJpdCBzZXQuIFRoZSBxdWVzdGlvbiB3b3Vs
ZCBiZSBob3cgdG8gZG8gaXQ/IFRoZSBjb2RlIGlzCj4gPj4gPj4gPj4gPiBwcmV0dHkgbXVjaCBp
ZGVudGljYWwgdG8gWzFdLiBUaGUgbWFza3MsIHRoZSBvcGNvZGVkLi4uIFNvIHNob3VsZCB3ZQo+
ID4+ID4+ID4+ID4gc29tZWhvdyBoYW5kbGUgdGhpcyBpbiB0aGUgY29yZSAoYnkgaGF2aW5nIHNv
bWUgY29tbW9uIGhlbHBlcikgdGhhdAo+ID4+ID4+ID4+ID4gY291bGQgYmUgc2V0IGluIC5sYXRl
X2luaXQoKSB1bmRlciBhIGNvbW1vbiBNRlJfRlNSIGZsYWc/IE9yIGp1c3Qga2VlcAo+ID4+ID4+
ID4+ID4gYm90aCBpbXBsZW1lbnRhdGlvbnMgc2VwYXJhdGUgZm9yIG5vdz8KPiA+PiA+PiA+PiAK
PiA+PiA+PiA+PiBJJ2QgbGlrZSB0byBrZWVwIHRoYXQgb3V0IG9mIHRoZSBjb3JlLmMsIGJ1dCBh
bHNvIGxpa2UgdG8gYXZvaWQgYW55Cj4gPj4gPj4gPj4gY29kZSBkdXBsaWNhdGlvbiBlc3AuIGJl
Y2F1c2UgdGhlcmUgaXMgYWxyZWFkeSBoYW5kbGluZyBmb3IgdGhlCj4gPj4gPj4gPj4gaW50ZWwg
c3BpIGNvbnRyb2xsZXIgaW4gdGhlcmUuIFNvIG1heWJlIG1vdmUgaXQgaXQgaW50byBhIG5ldwo+
ID4+ID4+ID4+IGNvbW1vbi5jLgo+ID4+ID4+ID4KPiA+PiA+PiA+IEFsc28gZG9uJ3QgbGlrZSB0
aGUgZHVwIHRiaC4gQ291bGQgdGhhdCBiZSBhIGZvbGxvdyB1cCBvciBzaG91bGQgaXQgYmUKPiA+
PiA+PiA+IHYzLiBGcm9tIHRoZSB0b3Agb2YgbXkgaGVhZCBJIGNvdWxkIHRoaW5rIG9uIGEgbWZy
X2NvbW1vbi5jIGtpbmQgb2YgdGhpbmcuCj4gPj4gPj4gPiBEb24ndCB0aGluZyB0aGlzIEZTUiBy
ZWdpc3RlciBpcyBzdGFuZGFyZD8KPiA+PiA+PiAKPiA+PiA+PiBOb3QgcmVhbGx5Lgo+ID4+ID4+
IAo+ID4+ID4+IEJ1dCAoYXQgbGVhc3QpIHBhcnRzIG9mIHRoZSBkYXRhc2hlZXRzIGFyZSBhY3R1
YWxseSBjb3BpZWQgdmVyYmF0aW0KPiA+PiA+PiBiZXR3ZWVuIG1pY3JvbiBhbmQgaXNzaSwgSSB3
b25kZXIgaWYgd2Ugc2hvdWxkbid0IGp1c3QgcHV0IHRoZSBJU1NJCj4gPj4gPj4gcGFydCBpbiBt
aWNyb24tc3QuYy4gKFllcyB2ZW5kb3Igd2lsbCBiZSB3cm9uZywgYnV0IEkgcGxhbiBvbgo+ID4+
ID4+IGRlcHJlY2F0aW5nIHRoYXQgc3lzZnMgcHJvcGVydHkgYW55d2F5KS4KPiA+PiA+Cj4gPj4g
PiBBbHNvIHdvcmtzIGZvciBtZS4gU2F5IHRoZSB3b3JkIGFuZCBJIGNhbiBzZW5kIHYzIHdpdGgg
dGhpcyBpbgo+ID4+ID4gbWljcm9uLXN0LmMuCj4gPj4gCj4gPj4gWWVzLiBCdXQgYWxzbyBwbGVh
c2UgdmVyaWZ5IHRoZSBvdXIgZ3Vlc3NlcyBhYm91dCB0aGUgcm9vdCBjYXVzZSBvZgo+ID4+IHRo
aXMgYW5kIHdoYXQncyB0aGUgYWN0dWFsIGJlaGF2aW9yIG9mIHRoZSB3cml0ZSBkaXNhYmxlLgo+
ID4KPiA+IFBpbmdpbmcgdGhpcyBvbmUgOikuIEkgc2VudCB0aGUgZGVidWdnaW5nIHJlc3VsdHMg
aW4gYW5vdGhlciBtZXNzYWdlLgo+IAo+IFdoYXQgaXMgdGhpcyBvbmU/IEkgdGhvdWdodCB5b3Un
bGwgc2VuZCBhIHYzIHdpdGggdGhlIGZsYXNoIGFkZGVkIHRvCj4gdGhlIG1pY3Jvbi1zdC5jPyBJ
IHByZXN1bWUgdGhlIGNvZGUgZm9yIGNsZWFyaW5nIHRoZSBGU1IgaW4gdGhlcmUgaXMKPiB3b3Jr
aW5nIGZvciB0aGlzIGZsYXNoLCB0b28uCgpJIGRpZCBzZW50IHNvbWUgdGVzdCByZXN1bHRzIGlu
IGFub3RoZXIgcmVwbHkgKHRvIG15c2VsZiB3aGljaCBtYWtlcyBpdAphIGJpdCBub24gb2J2aW91
cykgYW5kIGFza2VkIGZvciB5b3VyIHByZWZlcmVuY2Ugb24gaG93IHRvIGFkZCB0aGUgZmxhc2gK
KGluIG1pY3JvbiBvciB0aGUgY29tbW9uIGNvZGUpLiBJIGd1ZXNzIEkgaGF2ZSBteSBhbnN3ZXIh
CgotIE51bm8gU8OhCgo+IAo+IC1taWNoYWVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
