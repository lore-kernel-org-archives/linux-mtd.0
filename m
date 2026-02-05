Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AF9ECD994
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtchrsYl5ZgyUsjnnZwjF6mItHWoyGtEWuWMux9AHTo=; b=rlUHIAyD7lwpfA
	3ofat6dw8jgfpv0G8mHVq3i5x+jQN47RkDj5eeqqmWQgEgAW2RfQzJuuIp2BYTyunQNJhFqNhzP8N
	daoUWJvLBlEa8h1Zwl+lX8xzy8KehotNgioT/I5DPeoCao9JkTcdx4ABAcHfMuuxHImDuD+93zRRs
	EhgB2e54HflW9Rz+8dvXTsvlavZh1B68vDA6Nv6S6gqgAQ6yrcSdWKtoATKmh1hBgCStBmPZFw2dC
	VyuUdzOX6YdBIwHmKWJm3OhNe2Xf7COF86WHC7VzdFapw+/KhbKzLkUKjCikglXdak/zg/gRPiWlV
	+Ns0SejJv+T75Dy0qsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Ra-0000000AJy5-0ESy;
	Thu, 05 Feb 2026 17:47:06 +0000
Received: from mail-northcentralusazon11013017.outbound.protection.outlook.com ([40.107.201.17] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3RX-0000000AJxe-2ayW
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDfj+w6koYkjoE2fgSJNRLHioQhhFJu+NL0r0SNSLG+47qX0gho1HhMYH6+9ExQ7QnFcz8gEoTkaOv/n0hDbCLBMU/YrpVWAQw27ABCTpHizKScmANK4PfAiHlNux9UJo5NcqlgqgRWz4X2Zc4b0yqEfoWAGCyiqSThCDzrH9P8umPx4sEX6f2F5s/1EvshLxtLm4t7jBi0ysd7gInRyra2L9yfqfNcQrv005MURn9ggdElmCGpg4IBbR+vvT2NRRn2VY0lckVJh8FL/XrrwPbiLOowZT2+NIWBShxJLFsndWqJLM7lbQgDO0ZQb6s2No+Kj/QG/d5AkAz8LVA8AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4o1jb8q+Yvyj++OA/g+12T/+nLS+yCuij9qLuGhzF0=;
 b=BCewuUI9imM5Azofk1Xl/IPqstYZlZD+z2ifFlfZ7lDgE39KzczMKoNdjlH1fAAgyRwAriWBNZKP4wXbrfWc9vAc5Dt3gTT2MjhYjbuJpCH7cfToNRruLATpLD+k4PSQk+CkAQJliwmlHwlX69V8tKuMpr1aBjNynfX5nm5Gj2wTSdhuB7/W/H7MqZjCI8KlCqpqrY6WlbCRz+Fm4oeLZVcF9J2jgJvKzg5RHQJpPU1xD5lF+HjTOfMLLFS+za9zG9cF9W+LqMC2GHxJelwQYPPO4tviqsnwjAJLkusaC282Hm7e+K656AH99pj9lNlS6AVImoQHwfVsjvSA2mZIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4o1jb8q+Yvyj++OA/g+12T/+nLS+yCuij9qLuGhzF0=;
 b=OMzGeJTyy5lEe9kIRcjIFBBIfKYlh2NZNx3kqyrCKNi2zhNd9SEBWmbiR+uGqyp/BnEUVg9F//11RYJXxMmUeOPc+YLp7UYf7d9abCmufBSBwFYIi/JQbV0k0LAuMTmeb9VEjW2RRQmuhWj6IvjPCBNser/if5D+OusuVR2Qelw=
Received: from SA9PR13CA0120.namprd13.prod.outlook.com (2603:10b6:806:24::35)
 by BL3PR10MB6091.namprd10.prod.outlook.com (2603:10b6:208:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 17:46:58 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:24:cafe::99) by SA9PR13CA0120.outlook.office365.com
 (2603:10b6:806:24::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 17:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 17:46:56 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 11:46:53 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 11:46:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 11:46:52 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615HklpB3832201;
	Thu, 5 Feb 2026 11:46:48 -0600
Message-ID: <ba78303e-36aa-4f40-9416-c22ff12b7458@ti.com>
Date: Thu, 5 Feb 2026 23:16:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/12] spi: dt-bindings: add spi-has-dqs property
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-2-s-k6@ti.com> <87wm0sg50q.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87wm0sg50q.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|BL3PR10MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 615a2bbb-70e6-4271-9325-08de64de8e7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amoxTFd2enJvOWVWUEhQcjJhVVZ4eTliVGx6Z0k2Wk1adlZFMnJKbG5nZGxs?=
 =?utf-8?B?dUtjNGF0REl4Zi9KSS9WQjRtZW54NWhZaGFubkh4UXR1ZnVyanVDSlE0R0NB?=
 =?utf-8?B?bFNqai9LcVNUM0pwSXYzaVRaUmRqdnFSR29nV3ZGYzk4NElwRlNJK0ZlbVJs?=
 =?utf-8?B?SGRUcGNmeHhqZTY3azNXZXUrYlhzMzdoRmNScW5ZSGhEdUcrd0ovdktOMVVz?=
 =?utf-8?B?c2d1SjBZTTZaRTVackF6Z29RaDZIL3FlQjA1ZG5NaWdFQ3RlaStkTGVhZEYx?=
 =?utf-8?B?RVhVdGRmTnpyOGRNUjRxNC9WRlcrSVdKMk5NYzl0aWIvcDNaKysxRW5hbktK?=
 =?utf-8?B?azkwMloweVlXWFhFMGk0YXhiQmFtRmlnbkwyWG4vMjhLaFh2cVM0elQ1bldU?=
 =?utf-8?B?dG9hZDBwbTFLVnltVG1vREFNb0RPbTNTSTYzblcrYTlzYjBRL3lMZjFrSVRC?=
 =?utf-8?B?bVVqQzBsSG5NU2FxM25ycXcxT2xzZWZUU0JjSUgvdnRINHh5NzByYkdsdDdk?=
 =?utf-8?B?ZGZlcjhEblFtMThQR1k3WkJJOW4xMkdyV3ZTTW9qQmhwL1hZNDNVcGp0ZXdZ?=
 =?utf-8?B?VFVyT2FsaWMwUWptTHhhdFNOa0F3emhFaXlvTnN6aFRlUE1tNnEybk1aMmhi?=
 =?utf-8?B?dU5iMW1wOFIvRHdyRU5ob0wzV2tWM1o1ZmhKYW95T2dMNG5kMXRFM0Y1cVB2?=
 =?utf-8?B?ejJEREpVdTJlQVdVaUx3M2JhaUI5cllTa09leTBKTHFBSFh2Q09uSnBEbUZQ?=
 =?utf-8?B?Z3NuNFpiODZsbEpuZzVETVlGQXdBd3pxZWdDQkZyS2VibEF0eXVUeDg1NVVD?=
 =?utf-8?B?dHB3UGh0b3VRa0FjVkdidDdsYTZrTE1UNGpVeTdxalk3a1dZdGtpN3dhNVZM?=
 =?utf-8?B?QnV1T2NlUFNyYm1UUnBrRWxmRk5MbWZMbWNnYVM3eTBJLzU4U2R3M1dud3JY?=
 =?utf-8?B?QlQwdkhHanNyUk16MlZXNzNJcFh0QUo0ZDZuTHgzaElSdkVqNHlBTXFHL0Z6?=
 =?utf-8?B?di82Z1BiaEozRU5DazV5YjhBVjczT3FIOXRGajhaZ3pteDhobXFzNm1EdUdB?=
 =?utf-8?B?TGlSbTlnNFdjL1RhNCsvblg3ck9odm1Vb3d5QlZ2Rlc0K3N1cWNocTZ5bFlI?=
 =?utf-8?B?T0w2Y1BZUW1mWnA2NUVMR1Uwa1NjZ0xTYm5ncHFwNmhqUGFXa3hVemRtVjk2?=
 =?utf-8?B?bDUvUlNnU3lqSmFvTStjWFU1S1gzVFQzS2M4OEdhdncvVzJZZ2htdEJwYita?=
 =?utf-8?B?UnRvZEFGS1UzQytBSzE4K2poNHhKRm5rdU80cjRqV2xOZmRoZGp6U1FaQW5R?=
 =?utf-8?B?TlNCS1o3TmpQbzdGSUdaVUx4NlZCeGRXUmhESmVCbVRSeWNvUjV0aitISWRN?=
 =?utf-8?B?SFpQQkJ2dkhRV1NnVWY4cWZKWUY5WHFnY0xSRzd4eGIzVG1mbnZYbnJYRmZW?=
 =?utf-8?B?UTUvaHd3QmhjM29FMXgrNC9kQ0lpUE0wVE1hV3RnSzNtV3NUL3VKajlZMnlE?=
 =?utf-8?B?QmFUaFRKQUQxaWZXbVJnRjd1QnpRWFp3MjRJWXBsdTQ4MHJzUW9TeGVtV2FH?=
 =?utf-8?B?dzdSNVJDR1ZrcTJEQmZmcWlUY3VGREU3aHFFTUY5OU5vajcwZDRHaEgxUEhG?=
 =?utf-8?B?cEw4dmMwSWxWbFNWR0MvcC9PMGlnM0E1NzFEc1FCOHpodEUwZWU1MW5Tc01L?=
 =?utf-8?B?dEJwSkEwQjl2NHVmT3JjeU1odE82WnN0b0Rlc0ZmTzlYQlluU3dwTGRUOUNI?=
 =?utf-8?B?eVBGaEdPTVRwbUIxM1lZSm1MSU42ZStoVTdQeUZ0MC9lQmlBWjM2ZEZoRHRx?=
 =?utf-8?B?Nys3dUU4N0thRlg5MUV2d1VPTzVQczYvK05ZTkFLS2FIUzg5QTdhM09UcGVC?=
 =?utf-8?B?VU4rdHRLdFlWb2NwK28xdTczMkFMaThGTmR5TlNGRE1RR0F4Y1gyK0FOa3ha?=
 =?utf-8?B?WUpnZzMzOHJReXFkMitFaW83dUpIS0VsOXpqTkdia3JTRUx2YUdnNEV3eTRE?=
 =?utf-8?B?cUhDVkliOXdvRS9rRDZlSjhBaU5jVTBReVd0SkhqTXVFMDJBWXFwMXJkL0Q0?=
 =?utf-8?B?ekxIN21zRTVmMS9Ha09GMGFwMG5OOHJVWjBya3JsMTlibGErOUI0azUrOFlz?=
 =?utf-8?B?ODM3YU9GeWd5N1A5YWJLSzZZYVNwVDB0emlZNUhkTWFwRDdhUWRJVEN0YmZI?=
 =?utf-8?B?VWlnaXNWbHpHWkVtR1U0UmxXOWZ5c3NDbWRneksyZjAzUTR4RkhhN3FZUE1q?=
 =?utf-8?B?QTNaemh5Ty9uWUhxSFlEQkxkRkRRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eRV6ajFUZByQC2y3sBKzMG7VVTNmh4DF8yAaa6lflRAM8hzEc9Doors2NuEDNT5DvWcem5TQ2J8Gu7MkHSn7X299dQa1i3RAZNQo5iDyZ6Y/FB/11AJTA4NhdY9zPeg0D18VFrIsCiUwpk3rivSX9WA8uR7494jGDRUtsw+XYP1UUKV5xtSRZUghuGz+WFztrrba0rQOVppGrqjk7L3QkmDyWF7mhZEmWLRz74m47r5Xe+nXizsVDNge11BaLu/R+v8xm0wr95KRh//+3tL3QIFRCZYfb/7Tmc7kEIBaztUIPVaYlz3XHAqyhhKDEsEuo0oOwltyRTQGelwVLj10d6u+XMASyZzSEZ+riFmxGj20id8KIhkMqxxflIa2i4SejK/t9z5yFtbs31r4q7WMJF7eI7oYBy0/1IS1JbNLQxlImZ4s8nBKtu9TRKj/8RB4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:46:56.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 615a2bbb-70e6-4271-9325-08de64de8e7a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_094703_680206_BF7317A6 
X-CRM114-Status: GOOD (  23.54  )
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

SGVsbG8gTWlxdWVsLAoKT24gMDQvMDIvMjYgMTY6MTYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
T24gMTMvMDEvMjAyNiBhdCAxOTo0NjowNiArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgo+IAo+PiBBZGQgdGhlIG9wdGlvbmFsICdzcGktaGFzLWRxcycgYm9vbGVh
biBwcm9wZXJ0eSBmb3IgU1BJIGZsYXNoIGRldmljZQo+PiBzdWJub2Rlcy4gVGhpcyBwcm9wZXJ0
eSBpbmRpY2F0ZXMgdGhlIGZsYXNoIGRldmljZSBzdXBwb3J0cyBEUVMgKERhdGEKPj4gU3Ryb2Jl
KSBtb2RlLCB3aGljaCBwcm92aWRlcyBpbXByb3ZlZCB0aW1pbmcgbWFyZ2lucyBmb3IgZGF0YSBj
YXB0dXJlCj4+IGluIGhpZ2gtc3BlZWQgU1BJIG9wZXJhdGlvbnMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCAgICAgICB8IDYgKysr
KysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1w
cm9wcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktcGVy
aXBoZXJhbC1wcm9wcy55YW1sCj4+IGluZGV4IDhiNmU4ZmMwMDlkYi4uYzZmMzMwZmQzMmFhIDEw
MDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1w
ZXJpcGhlcmFsLXByb3BzLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sCj4+IEBAIC04OSw2ICs4OSwxMiBA
QCBwcm9wZXJ0aWVzOgo+PiAgICAgICBkZXNjcmlwdGlvbjoKPj4gICAgICAgICBEZWxheSwgaW4g
bWljcm9zZWNvbmRzLCBhZnRlciBhIHdyaXRlIHRyYW5zZmVyLgo+PiAgIAo+PiArICBzcGktaGFz
LWRxczoKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgIEluZGljYXRlcyB0aGUgU1BJIGZs
YXNoIGRldmljZSBzdXBwb3J0cyBEUVMgKERhdGEgU3Ryb2JlKSBtb2RlIGZvcgo+PiArICAgICAg
aW1wcm92ZWQgZGF0YSBjYXB0dXJlIHRpbWluZy4KPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy9mbGFnCj4gCj4gVGhpcyBpbmZvcm1hdGlvbiBpcyBjdXJyZW50
bHkgbGFja2luZyBpbmRlZWQsIG1vc3RseSBiZWNhdXNlIG5vYm9keSBldmVyCj4gY2FyZWQgYWJv
dXQgaXQuIFRoZSBEVCBwcm9wZXJ0eSBpcyBJTU8gbm90IHRoZSBjb3JyZWN0IHdheSB0byBnaXZl
IHRoaXMKPiBpbmZvcm1hdGlvbiBmb3IgdHdvIHJlYXNvbnM6Cj4gLSB0aGlzIGlzIGEgY2FwYWJp
bGl0eSBvZiB0aGUgY2hpcCwgd2UgZGlzY292ZXIgdGhlIGNoaXAgZHluYW1pY2FsbHkgaW4KPiAg
ICBib3RoIGNhc2VzIChOQU5EIGFuZCBOT1IpIGFuZCBhdHRhY2ggbWFueSBjYXBhYmlsaXRpZXMg
dG8gdGhlIGNoaXBzCj4gICAgYWxyZWFkeSwgc28gSSBiZWxpZXZlIHRoaXMgaW5mb3JtYXRpb24g
c2hvdWxkIGJlIHByb3ZpZGVkIHRocm91Z2ggYQo+ICAgIGZsYWcuCj4gLSB0aGUgZmFjdCB0aGF0
IHRoZSBEUVMgc2lnbmFsIG1pZ2h0IGJlIHN1cHBvcnRlZCBkb2VzIG5vdCBpbmRpY2F0ZSBpdAo+
ICAgIGlzIGFjdHVhbGx5IGRyaXZlbi4gV2luYm9uZCBjaGlwcywgZm9yIGluc3RhbmNlLCBjYW4g
ZWl0aGVyIGVuYWJsZSBpdAo+ICAgIG9yIG5vdCBkZXBlbmRpbmcgb24gdGhlaXIgY29uZmlndXJh
dGlvbiAocHJvYmFibHkgdGhyb3VnaCB0aGVpciBWQ1IKPiAgICByZWdpc3RlciwgSSBuZWVkIHRv
IGNoZWNrIGFnYWluKS4KCkkgYWdyZWUuIFRoZSBmbGFzaCBkZXZpY2UncyBjYXBhYmlsaXR5IHRv
IHByb3ZpZGUgRFFTIC0gd2hldGhlciBpbiBTRFIsCkREUiBvciBib3RoIG1vZGVzIC0gY2FuIGJl
IHJlcHJlc2VudGVkIGFzIGEgZmxhZyBpbiB0aGUgZmxhc2gKZGVzY3JpcHRpb24uIFdlIGNhbiBs
aXN0IG91dCB0aGUgcG9zc2libGUgY29tYmluYXRpb25zIGFuZCB1c2UgdGhlbSB0bwpjbGVhcmx5
IGRlc2NyaWJlIHRoZSBmbGFzaCdzIHN1cHBvcnRlZCBjYXBhYmlsaXRpZXMuCgpIb3dldmVyLCB3
aGV0aGVyIHRoZSBEUVMgc2lnbmFsIGlzIGFjdHVhbGx5IGNvbm5lY3RlZCB0byB0aGUgY29udHJv
bGxlcgppcyBhIG5vbi1kaXNjb3ZlcmFibGUgaGFyZHdhcmUgZGV0YWlsIGFuZCBzaG91bGQgYmUg
ZGVzY3JpYmVkIG9ubHkgdmlhCkRldmljZSBUcmVlLiBUaGUgRFQgcHJvcGVydHkgaXMgbm90IG1l
YW50IHRvIGRlc2NyaWJlIHRoZSBmbGFzaCdzCmNhcGFiaWxpdGllcywgYnV0IHRvIGluZGljYXRl
IHdoZXRoZXIgRFFTIGlzIHBoeXNpY2FsbHkgY29ubmVjdGVkIHRvIHRoZQpjb250cm9sbGVyLgoK
PiAKPiBUaGUgcXVlc3Rpb24gSSBoYXZlIGlzOiBzaGFsbCB3ZSBlbmFibGUgdGhlIERRUyBwaW4g
YXV0b21hdGljYWxseSBpZiBpdAo+IGlzIGF2YWlsYWJsZT8gTm90IGFsbCBjb250cm9sbGVycyBz
dXBwb3J0IGl0IEkgc3VwcG9zZSwgYW5kIHdpcmluZyB0aGUKPiBsaW5lIG1pZ2h0IGFzIHdlbGwg
bm90IGJlIGRvbmUgKG9yIGluY29ycmVjdGx5KS4gRm9yIHRoZXNlIGNhc2VzIHdlIG1heQo+IG5l
ZWQgRFQgcHJvcGVydGllcyBpbiB0aGUgZnV0dXJlLiBCdXQgZm9yIHRoZSBEUVMgcHJlc2VuY2Ug
aW5kaWNhdGlvbiwgSQo+IGJldCBpdCBpcyBub3QgdXNlZnVsLCBhbmQgc2hvdWxkIGJlIGhhbmRs
ZWQgYXQgdGhlIGNvcmUgbGV2ZWwgKG5vdAo+IHBhcnNlZCBieSB0aGUgZHJpdmVyIGxpa2UgeW91
IGRvKSBiZWNhdXNlIGl0IG1heSBoYXZlIGFuIGltcGFjdCBvbiB0aGUKPiBjaGlwIGludGVybmFs
IGNvbmZpZ3VyYXRpb24uCgpXZSBjYW4gaGFuZGxlIHRoaXMgaW4gZWl0aGVyIHdheToga2VlcCBE
UVMgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQKZW5hYmxlIGl0IHVzaW5nIGEgImhhcy1kcXMiIHBy
b3BlcnR5LCBvciBlbmFibGUgaXQgYnkgZGVmYXVsdCBhbmQKZGlzYWJsZSBpdCBleHBsaWNpdGx5
IHVzaW5nIGEgIm5vLWRxcyIgcHJvcGVydHkuCgpUaGFua3MsClNhbnRob3NoLgoKPiAKPiBJIHdp
bGwgdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIHByb3Bvc2FsIHNvb24hCj4gCj4gQ2hlZXJzLAo+IE1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
