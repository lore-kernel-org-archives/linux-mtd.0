Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D4ED3C52B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Dec 2025 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENkw51FR5uxvUGrV/noL2QGlrsnpkMcxKVV7KvgESJk=; b=POutSmOlt8HSRZ
	tjMncdxRoWdcdAJHatuHUSq+035bAWKCEJBXwtAP4HmvRacah7H5lc+6ly4NkCWQaBV1b3NyWzjeu
	WA+7aqvtfQ8ZfxzY7vXoL+bPDMp0unNWyGxV8M1q/W+c5PyGuOJ5e6AT27MR2mPx++v4SwXCJFpUf
	ke4Z8HraaC0+26pvHLCI9j8DERr6CMHHfPO6gHcgQKswt8q36tKOJWQbEq5+x7BRiYjU567yIdvCE
	SAGKXlrntz7wws6ulJ1/1UjAGl5WJygZnf3jhfy/a/PbCybLV4muyKz3yOqoA2L/F0Lqwaty4ZjW+
	Dz3nFWRns8MzGcXUpWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTISB-0000000FNqF-1pX7;
	Wed, 10 Dec 2025 11:33:55 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTIS8-0000000FNps-34dB
	for linux-mtd@lists.infradead.org;
	Wed, 10 Dec 2025 11:33:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stuKHpdK3pGTodRy/T1a0zXY4hCDR7rRaIqQBqzKcdSewShxmhXnCUNq+bV9Ify1wZNQzKIq5IJFoVOMoLqa+DvF87SgzYforkZR5U+vXrBGFotUgEohN4l84d+lNY+itYCx170fOO+vWgbW3TbxbU8QSVPAbjX2bCjwx/NuqiF/tRSDqazPEZh1hxsy9os7zj1VduccFx12+HUksOjMvgpkTbVDKM9u2loYsjTzPhaRe9SujusWuCPRn0rqX8DyETZvzwNQlg+bJbCBtnB8brTtX0YQVMKgWso+ubzh41+3EmyLbj8T1cQy/cjO75XJlrEdc8sbPqd586uBXDgOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTr0tfRzJIOv3JIrHEMcxHv4HgtX3KgmuqvyZTUtOCQ=;
 b=eqz4CzaxgyycqCFjtZ4cboZnuqTlx/gBG0D+7cllSlj2C1tJYdqKprFKeRebAbW7PYk+sW9gu+Hbl6v7yeV+2ABmdFqKWGfwBDbke58VyukCZCRr1gNo1E8aijFu0YC8gcIAJhCAZlfYnG1Gh4iZ7Te4nSTozw/Y/AOx03iD93xojQZV2L0Ty3LFZ+Pu+Nyf2yADeqLUQtOZ4agU8S7QnkaGZpnl00vkcgh9J5PZHNgbVJOg+O1nXjedHuQ63n4bAW9tRkQi6/UQTUeJEFawoSBCJwQzIct5lC8n7H2ZlPjI7LEaa6boCAJ4+/0jTgbZb7sQyJf3dBOr0MJSVQOAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTr0tfRzJIOv3JIrHEMcxHv4HgtX3KgmuqvyZTUtOCQ=;
 b=IG/5jXKvagep/ujbMhb12kui6FuukX+kr0PqDN9Ww9yqB+tflr9ALpK5vzMotLS2zq8dltCu8eNEQhiBjY/0y80pOEX023QsijBG899X5jfWMWglRaLvFgooCE4+r0VDcjy7rYKvTW8vgrBIzegjGnlyV6lIih7NPFEh4Ma0wTI=
Received: from BN9PR03CA0766.namprd03.prod.outlook.com (2603:10b6:408:13a::21)
 by SJ0PR10MB5566.namprd10.prod.outlook.com (2603:10b6:a03:3d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 11:33:45 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::c2) by BN9PR03CA0766.outlook.office365.com
 (2603:10b6:408:13a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Wed,
 10 Dec 2025 11:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 11:33:43 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 05:33:33 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 05:33:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Dec 2025 05:33:33 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BABXSuT2856514;
	Wed, 10 Dec 2025 05:33:29 -0600
Message-ID: <0928678d-7f5e-418c-a006-ae56f7534ff5@ti.com>
Date: Wed, 10 Dec 2025 17:03:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Pratyush Yadav <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<broonie@kernel.org>, <tudor.ambarus@linaro.org>, <mwalle@kernel.org>,
	<p-mantena@ti.com>, <linux-spi@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<a-dutta@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>, <s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
 <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> <87qzunt4n4.fsf@bootlin.com>
 <ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com> <87ecqcakjo.fsf@bootlin.com>
 <mafs0ms4j4fuz.fsf@kernel.org> <cf87ced7-aa66-4b15-98e5-92cb76737073@ti.com>
 <87v7io9c23.fsf@bootlin.com>
Content-Language: en-US
In-Reply-To: <87v7io9c23.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SJ0PR10MB5566:EE_
X-MS-Office365-Filtering-Correlation-Id: e666156c-3312-4398-51b3-08de37dff973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUZKOGxSd1VLTDhoeVI3SW1PZFQyVmN1ZjZZc00rWlJ1TnRFMDJuSU90UG1H?=
 =?utf-8?B?YnhBUkh6WEJOVmpzQ0VNd1k5RTdKQ2Z4RDg5U1R6dHI1eDdqYWk4MVl2R1Fm?=
 =?utf-8?B?a1YwMENlaytXV1BWSlFFR1J3ZnJwRGNKRUpUYTZKaUdpcGdiaGVWY2JoVUtp?=
 =?utf-8?B?aWZIR1llSUNSdnprQW1uY3dwUytESmRleWZqbGVQa0VYdGt5T0JLbFpNWkNN?=
 =?utf-8?B?QWJlUmU4a3VzSk9LQk45bXNPeEhnb05pYkcyMXlrMXN1aDBHYUJYQktYWGxt?=
 =?utf-8?B?a1cvaHNJbkMrL3BWdkFqeHNrNXZUTFkwMGtxNXVkS2lvVnExS0dtakpuSE5L?=
 =?utf-8?B?MVJsQUJOOTJ0RU9KMEpGUm9BYjZYK0ZnZUMxczhKWFlzTy9FVlNtcVBKdG5M?=
 =?utf-8?B?Snlieit4R0NheDNCZUI0RW1jekZ2Tk5yNy9SZXI5V21seEN1RGhMbzRLbXdQ?=
 =?utf-8?B?bkx3NHhlWHg4N3hjWEpQby9tZGUxMTJWM0JnaVVOcGEwMGFhNlZjYThySFgx?=
 =?utf-8?B?bmFHWnRwdWQ2b3ZGY1l3aG1aRjlqUW0rTlNUKzRSdktYQmdXTmp4K3lFSmN2?=
 =?utf-8?B?UldtbmI2Vy9xamhmTFV1QVVleWJBL3Y0Q3BldTFiWE82OEtVU2QzYzJoZExU?=
 =?utf-8?B?aVhBbTdiUlRVbVhaVDZrLzJNbkhlWUVCM1VqaEtRWlM3azIwd044V01OM2Ny?=
 =?utf-8?B?Uks0NE1KR1F6YmdVK3huSU9VdzJGZCtrM2FxNC9xSDg3a1l6eStZMHE5ZDhG?=
 =?utf-8?B?ZUdhbTgvYThiSmtiNEV1bU5scUJUSWRnUkt5UXpxVzBaVVpTTCtmVWlxeXhu?=
 =?utf-8?B?enpDWjNiMkNjV3dQdzFZRGEvUy9hNWNVY2dMNzZNUEtWdU1yQlpYRm1oUjVu?=
 =?utf-8?B?ZGJSaStHSkR2dHplQ2xYaHBWcGxodXpTdXluRDV4Qmh5WHhBNS9jTHlrZFRv?=
 =?utf-8?B?QUZERS9QejlmeHlUYW1oVUZTYUtYalFLLzA4M3RjaDFZNWVhbTBlanFuRXhF?=
 =?utf-8?B?bzc2WG1hNkRIZEtacTh6Z3NmRTI3UDhGZllWZFdlUkpuczR4NzAzUktpUjhL?=
 =?utf-8?B?dnNqVGhWRGJVemF3eGdsZy9FL0FlRnMzYWk0aFZlZTZ2aXpNbGpkT0pPS0dN?=
 =?utf-8?B?REpqRlVldDlwRHoxRHcycVRjc1BDU3locU9EVVFMMzFpNWxGYmwvc05iUG1u?=
 =?utf-8?B?RTV2eE8vRkZzeFF2c1lSd09WMThkenhRa3hFVXBxMjVieHZUMHFsNWlNQVl2?=
 =?utf-8?B?Q2w1SGx1dWdhYi9wNWJUVkRGV2RCUUNNdVB5R1FxSHdEcnM3SVUzeGI4cGdh?=
 =?utf-8?B?UUUzV2phb1AzNis3aU5jTDlNYkdPeTBPaDc5dkJ2M3BiMW1va0Z6YW5OdXJj?=
 =?utf-8?B?RkVFNVgvN2dWdERwVXY5WDA4a0lFN21XZCtmQ1h0ek9xNTBONlZpV21CcWNE?=
 =?utf-8?B?MTNxbW1UT3ZMbTJuOUl6MnVuMFJUQS9RTlNyY2dRQWtoaktqeHB4TVhNelZV?=
 =?utf-8?B?KzcyVkx3dzRIQTlKL0dERS9xOUNRUWtEaHpEbmYvaVE4TVZRQ0V2T3pJY29t?=
 =?utf-8?B?TmVOUWZldFgxbVpkRFpzSWJQb09yUWllMWtGUHJObVRBOHBlQytyZWVyTFlR?=
 =?utf-8?B?bXZHVktFblBpSjErbVNuL2l5Z3hJR3FWdkh0Mi8rWEdQNzJqQmNpQmJLNVdY?=
 =?utf-8?B?WjBobnVudlpobnhPSjlJdUxuMGhMSDRIQlgyUDFacTRpTG9sOUUrNzRYUHdh?=
 =?utf-8?B?VjN1dFM3V3hBT0F3TS9lRGF6d2orRzJyUlJqUzBmYS9oNXZ0WEJzZXU5ak1Z?=
 =?utf-8?B?SHY0Z2syYk9oVnpKTXNJY1g3OWVRZFM1OU1oVWF2NnpHbHVPcUl4VlpJVGtl?=
 =?utf-8?B?TGlHWmFnVGVqZzJEZG9JTXJDNEkvalluQlVJNkl4bkZNQW83eXp3dHZ4QStL?=
 =?utf-8?B?WTBmVklkeDJsbmlOT2pHbkgycG9BMm96Y1Vxd1Q0Z2FRMUN4NjEyMWJ6aGls?=
 =?utf-8?B?VS9RNnFMV3ppMzFXVUNqMzRySnJxMUh0RFplWEk3MmZ0UzFTQ0ZPRDZMY1FC?=
 =?utf-8?B?WEZKMDB5VEllZ0d1bW81RDBUYVBSY0hoVnVWUCtZMWowb1JDRDVvNlZWVzA0?=
 =?utf-8?Q?btgY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 11:33:43.4413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e666156c-3312-4398-51b3-08de37dff973
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_033352_984761_128A9D13 
X-CRM114-Status: GOOD (  23.75  )
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

TWlxdWVsLAoKT24gMDMvMTIvMjUgMTQ6MjgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEp1c3Qg
dG8gc3VtbWFyaXplLCBmYWxsYmFjayBsb2dpYyBkdXJpbmcgcHJvYmU6Cj4+ICAgICAtIElmIHRo
ZSBjb250cm9sbGVyIHJlcG9ydHMgYSB0dW5pbmcgZmFpbHVyZSwgdGhlIHNwaS1tZW0gY2xpZW50
IG1heQo+PiBlaXRoZXIgcmV0cnkgdHVuaW5nIHdpdGggdGhlIG5leHQtYmVzdCAobWF4LTEpIG9w
ZXJhdGlvbgo+IAo+IFRoZXJlIGlzIG5vIHN1Y2ggIm5leHQtYmVzdCIgdmFyaWFudCBvbmNlIGlu
IE9ERFIgbW9kZSB1bmZvcnR1bmF0ZWx5LiBXZQo+IHdpbGwgaGF2ZSB0byByZXR1cm4gYW4gZXJy
b3IgaW5kaWNhdGluZyB0aGF0IFBIWSBjYWxpYnJhdGlvbiBuZWVkcyB0bwo+IGhhcHBlbiBhZ2Fp
biBhbmQganVzdCByZXRyeSB3aXRob3V0IGl0Lgo+IAo+IEFzIHRvIHdoZW4vaWYgd2Ugc2hhbGwg
cGVyZm9ybSBpdCBhZ2FpbiwgdGhpcyBpcyBhIGRlbGljYXRlIHRvcGljLiBCZWluZwo+IGNvbnNl
cnZhdGl2ZSBtaWdodCBpbXBseSBqdXN0IGRpc2FibGluZyB0aGUgZmVhdHVyZSBhbmQgbm8gbG9u
Z2VyIHVzaW5nCj4gaXQgZnJvbSBhIFNQSSBjb250cm9sbGVyIHBlcnNwZWN0aXZlIHVudGlsIFNQ
SSBOQU5EL05PUiBjYWxscyBmb3IKPiBjYWxpYnJhdGlvbiBhZ2FpbiwgYnV0IGl0IGlzIHVuY2xl
YXIgdG8gbWUgd2hlbiB0aGlzIHNob3VsZAo+IGhhcHBlbi4gTWF5YmUgd2UgY291bGQgdHJpZ2dl
ciBhIGJhY2tncm91bmQgam9iIHdpdGggYSBsb3cgcHJpb3JpdHkgZm9yCj4gdGhhdC4gQnV0IGRv
bid0IGJvdGhlciBpbXBsZW1lbnRpbmcgdGhpcyBpbiB0aGUgZmlyc3QgcGxhY2UuIEp1c3QgbWFr
ZQo+IGl0IHdvcmssIG1ha2UgaXQgZml0IGluIHRoZSBjdXJyZW50IHN1YnN5c3RlbXMsIGp1c3Qg
S0lTUy4gV2UgY2FuIGZpZ3VyZQo+IHRoaXMgb3V0IGluIGEgc2Vjb25kIHRpbWUsIGVzcGVjaWFs
bHkgc2luY2UgZmFpbHVyZXMgYXJlIG5vdCBzdXBwb3NlZCB0bwo+IGhhcHBlbiB2ZXJ5IG9mdGVu
LgoKWWVzLCBmb3Igbm93IC0gb24gYSB0dW5pbmcgZmFpbHVyZSB3ZSBjYW4gc2ltcGx5IHJldHVy
biBhbiBlcnJvciBhbmQKZmFsbGJhY2sgdG8gdGhlIG5vbi1QSFksIHNsb3dlciBvcGVyYXRpb24u
CgpBbHNvLCBub3RlIHRoYXQgIm1heC0xIiBjYW4gbWVhbiBkaWZmZXJlbnQgdGhpbmdzIGRlcGVu
ZGluZyBvbiB0aGUKc3BpLW1lbSBjbGllbnQuIEl0IG1heSByZWZlciB0byBhIHNlY29uZGFyeSBP
U0RSIHJlYWRfb3AgaWYgdGhlIHByaW1hcnkKT1NEUiB2YXJpYW50IChlLmcuIDB4Y2IpIGZhaWxz
LCBvciBmYWxsaW5nIGJhY2sgdG8gT1NEUiB3aGVuIE9ERFIgZmFpbHMsCmFuZCBzbyBvbi4gVGhl
IGV4YWN0IGxvZ2ljIHdpbGwgbmVlZCBmdXJ0aGVyIGRpc2N1c3Npb24gb25jZSB0aGUgYmFzaWMK
dHVuaW5nIHN1cHBvcnQgaXMgaW4gcGxhY2UuCgo+IAo+PiBvciBmYWxsYmFjayB0bwo+PiB0aGUg
bm9uLVBIWSwgc2xvd2VyIG9wZXJhdGlvbiBhbmQgYWRqdXN0IHRoZSBkdW1teSBjeWNsZXMgYWNj
b3JkaW5nbHkgdG8KPj4gdXNlIHRoZSBvcHRpbWFsIG5vbi1QSFkgdmFyaWFudC4KPiAKPiBXaHkg
YWRqdXN0aW5nIHRoZSBkdW1teSBjeWNsZXM/IEkgYW0gbm90IGF3YXJlIG9mIGEgZGlmZmVyZW50
IG51bWJlciBvZgo+IGN5Y2xlcyB3aXRoIGFuZCB3aXRob3V0IFBIWSBtb2RlLiBJdCBzaG91bGQg
YmUgaWRlbnRpY2FsLCBubz8gVGhlCj4gZGlmZmVyZW5jZSBsYXlzIGluIHRoZSBmcmVxdWVuY3kg
d2UgdXNlLCBub3QgdGhlIGZhY3QgdGhhdCBQSFkgaXMKPiBhY3RpdmUuIEFuZCBvbmNlIHdlJ3Zl
IGRlY2lkZWQgYSBjb25maWd1cmF0aW9uLCB3ZSBjYW4gYWx3YXlzIGhhbmRsZQo+IHNsb3dlciBm
cmVxdWVuY2llcywgYXQgdGhlIGNvc3Qgb2YgYSBmZXcgMTAwa2lCL3MgbWF5YmUuIFNvIEkgd291
bGQgbm90Cj4gc2VlIHRoaXMgYXMgYSBjb25jZXJuLgoKUmVnYXJkaW5nIGR1bW15IGN5Y2xlcywg
SSBtZWFudCBhZGp1c3RpbmcgdGhlbSBvbmx5IGFzIGEgY29uc2VxdWVuY2Ugb2YKY2hhbmdpbmcg
ZnJlcXVlbmN5LCBzaW5jZSB3ZSB3b3VsZCBkcm9wIHRvIGEgbG93ZXIgZnJlcXVlbmN5IHdoZW4g
dHVuaW5nCmZhaWxzLgoKRm9yIGluc3RhbmNlLCBvbiB0aGUgVzM1TjAxSlcgT1NQSSBOQU5EICh1
c2luZyBGYXN0IFJlYWQgSS9PKSwgdGhlCnJlcXVpcmVkIGR1bW15IGN5Y2xlcyB2YXJ5IHdpdGgg
dGhlIG9wZXJhdGluZyBmcmVxdWVuY3k6CiAgICAtIDggY3ljbGVzIGF0IDg2IE1IegogICAgLSAx
MiBjeWNsZXMgYXQgMTI0IE1IegogICAgLSAyMCBjeWNsZXMgYXQgMTY2IE1IegoKU28gZm9yIGZs
YXNoZXMgbGlrZSB0aGlzLCB3ZSBkbyBuZWVkIHRvIGNhbGwgLmNvbmZpZ3VyZV9jaGlwKCkgd2hl
biB0aGUKZnJlcXVlbmN5IGNoYW5nZXMuCgpBZ2FpbiwgYXMgSSBzYWlkIGVhcmxpZXIsIHdlIGNh
biByZXZpc2l0IGRldGFpbGVkIGZhaWx1cmUtaGFuZGxpbmcKbG9naWMgYWZ0ZXIgdGhlIGJhc2lj
IHR1bmluZyBpbmZyYXN0cnVjdHVyZSBpcyBtZXJnZWQuCgo+IAo+PiBBbmQgeWVzLCBmb3Igbm93
IHRoZSBwcmlvcml0eSBpcyB0byBoYXZlIGEgcm9idXN0IHByb2JlLXRpbWUgdHVuaW5nIGZsb3cK
Pj4gYmVmb3JlIGFkZHJlc3NpbmcgYW55IHJ1bnRpbWUgdHVuaW5nIGNvbmNlcm5zLgo+IAo+IFll
cy4KPiAKPj4+PiBCdXQgb25jZSB3ZSBzb2x2ZSB0aGlzLCBjb21lcyBhIHNpbWlsYXIgcHJvYmxl
bSBvbiB0aGUgd3JpdGUgc2lkZS4gSG93Cj4+Pj4gZG8gd2Uga25vdyBpZiBhIHdyaXRlIHdpbGwg
b3IgZGlkIGZhaWwgYmVjYXVzZSBvZiBhIHRlbXBlcmF0dXJlIGNoYW5nZT8KPj4+PiBXaGF0IG1h
eSBiZSB0aGUgaGV1cmlzdGljcyB0byBmYWxsYmFjayBpbiB0aGlzIGNhc2U/Cj4+PiBTYW50aG9z
aCwgZG8geW91IGhhdmUgYW55IG51bWJlcnMgb24gd3JpdGUgcGVyZm9ybWFuY2UgaW1wcm92ZW1l
bnRzPyBJCj4+PiBhbSBjdXJpb3VzIGlmIGl0IGlzIGV2ZW4gd29ydGggdGhlIGVmZm9ydC4KPj4K
Pj4gVGhlcmUncyBubyByZWFsIHBlcmZvcm1hbmNlIGdhaW4gZm9yIFNQSSBOT1IsIGJ1dCBTUEkg
TkFORCBzaG93cyBub3RhYmxlCj4+IGltcHJvdmVtZW50IHdydC4gcGFnZSBzaXplLgo+Pgo+PiBX
cml0ZSBwZXJmb3JtYW5jZSBudW1iZXJzIGZyb20gQU02MkEgU0sgd2l0aCBXMzVOMDFKVyBPU1BJ
IE5BTkQ6Cj4+Cj4+ICAgICAtIHdpdGhvdXQgUEhZOiA2IE1CL3MKPj4gICAgIC0gd2l0aCBQSFk6
IDkuMiBNQi9zCj4gCj4gRWFnZXIgdG8gc2VlIHRoaXMgaW4gU1BJIE5BTkQgKG9ubHkpIHRoZW4h
CgpUaGFua3MsClNhbnRob3NoLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
