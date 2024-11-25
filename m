Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B14ED58D4D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRG82yBOEzHVVEzg4Sw6lVlcaTrRdm0jawZSMPcrrsM=; b=VpkNM82K/9r1HU
	7I7mfDNA8dmByKc2WnOynB2Uzw2NJDBH/uUZPylUwRYMlzQgGbgaW7x8AorVuPgoQQqNXk8v2NnM0
	EQIcjmg+XZTop2Es0VH0aMCMxpXNXrEaqu74G6/bVFaXg2bScI1AlIJx83HoZZ4/L6s+Apmos7l3r
	P+joek3UmkaGfWboecepqM+P13HwR1q9P3uwQ/K7k+3Ch24eKDN5NO2ONLbHryyLDJR/F8j4WGemV
	iARy2Q+byHhGIx/EhmvYB48HJcxh7fHbvSyhYo+C78p8nEJeWwyJU6ZSaDDKLoa1S4YTrXh5Sh5qh
	P5CWQSSPIfqdY9gLr4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZSM-00000008BRX-3Zzg;
	Mon, 25 Nov 2024 13:48:50 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZSK-00000008BQC-16zM
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 13:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ+7z6ZYvFtTr8K4m5Jh8Acq7O2KiRGeNFbLpbzB6LWPZbV+USHANDjtlJTCqu8gfy/3SnNaYsvRxyaNS2MOJY9JZH6PVOSZdILROUi67lXsEWu09/Hq5G3zSxP3vIkKy1rfO9FnNX+pMdX/h1gAemuyIhtHBo5tmCDair9u+fHy+Uz7yQm2hbpWyjOdRzgTJSGUc/WMAanm01j5+xTmjNUdq5O+0fHGFeGTK6fSdxnMYnDztejLkV9mpJq8N7UtTLnM89/v+HAvAFUaK89DH/Pn3wLaFYXqb4N2Iqfyo636avERL33FbphRMOQgyayJvj8cjl07r/TfyR9JJ5g1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHkU0Mlrk3PH94qX4K2o/QSOZ1PRGFnootXqhhkOk3M=;
 b=RyOQrlRDeNDgZEby+6kmoJWJpx3oXZAySjGVtRXgIvW1JWfxZ+TEpVYvu4afpMrqE5ow+CUD8JVFwKcod5ZiYTK7gpJTpUojVSmBss/NtJ8qW8mgLYCkvbdD2llPddNxHNDuZ8wK4DyDO3uTracbKXrJsCctY29Rtj/4PtaMHAF7xP3/bPexZ9lOCdKK/zFEoEWjH3DCJ2bxF0r/qpzdlBQOjJyYMFF2AHXIwJfo2Sl8s+3KLz/B+gTA2Of485PYI2znnIZhLrm8pvXdtQQF++y/rD09y4NqnKlIx4NMLeKq3Fwp9kVQGF9/DGJFQ79Y0fESZPkmH0o+6SuICsdM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHkU0Mlrk3PH94qX4K2o/QSOZ1PRGFnootXqhhkOk3M=;
 b=Lz4slWml2E7+5U826aaYZNvOwTWxmOLFUusNv8bfG9EYl4Id9pie9rbFNXXOrafbrxl0VcECFUAEvj8YAGe74SEbY7c2fthhSeYVliWDdpVpO2DvNnFgVNm+JVG1mPRFJI3za5as7Qnk2W+2P9yRfgbdnq1Roeh662IcdU6ph2U=
Received: from AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::11)
 by PA1PR02MB11128.eurprd02.prod.outlook.com (2603:10a6:102:493::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 13:48:41 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::74) by AM0PR10CA0001.outlook.office365.com
 (2603:10a6:208:17c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17 via Frontend
 Transport; Mon, 25 Nov 2024 13:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Mon, 25 Nov 2024 13:48:40 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 14:48:39 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 2/2] ubi: Implement ioctl for detailed erase counters
Date: Mon, 25 Nov 2024 14:48:20 +0100
Message-ID: <20241125134820.560648-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241125134820.560648-1-rickard.andersson@axis.com>
References: <20241125134820.560648-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|PA1PR02MB11128:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd25694-e96f-40ad-804a-08dd0d57dee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2YwMHM3VTI0ZDBFbXV0enJDWk51VjAwRHd6MEhZYTNkRUNGWlpVQjdDay9l?=
 =?utf-8?B?Q1gzRE9IcGZ4cEI1eS9rcG0wZTljRnFQeWxGdWZwK0ZSM2hCL25RMitHNjB0?=
 =?utf-8?B?UFk1a2VsRm5BUi95TnZQemZNNGNPWE5tMTNFOXVEWllxRytJb25WZGpMSDFy?=
 =?utf-8?B?cWhKOC9hVFRwaGtDbmlDUkNTak82VHlPYldvMXFFY3F3aEFQL3dBMkhQcldz?=
 =?utf-8?B?K0tSK1dmcFZIUlJtU1hQUjBOSzkyTEx2cEZKSVdEMy91MStqS2tSK0ZtNG40?=
 =?utf-8?B?N0ZSL2RPdkNOd1VCUmoyNlBNRURLWWs4QmJVTUNZejluSmxpdDNRVU5QR09a?=
 =?utf-8?B?SUlZZ2poeWFoNmFnaUhKRnR3MlY1L0tMOWZ4azEwQ1AyTEM5MU1qbTdDVHdC?=
 =?utf-8?B?VnkxOEtneWwxUHlSY1M5NytlUzlSZjB2SEdpY3dpbHEyaGdUMDJGOFUzMm5H?=
 =?utf-8?B?MVB0bG9ZQU5vZ0hGbkFMa1V1UXZUcXdtWDRiR05McDUxNTBpY3l0YWVROFEr?=
 =?utf-8?B?NkFtWGJ5bTdaU0N5UzNJNnVxVVpqMjBGVmYzMzEzeTJWMnFDbHlpRHUzNjVR?=
 =?utf-8?B?d21idW9KUUFaWjZXRHl6ZWx6M3dmanNSME5HUUxvNXh6MFEwN0RFaU9tdEhu?=
 =?utf-8?B?OUliQWRHUzNBdWRITzN3cUI4WWZMbUtQb0lnQ3hlajZYcnhqZGx0UGdHS084?=
 =?utf-8?B?dGU3S21RbmQ2cy9TV1pBTzE0SlhqTHh4OWl4ellGQXRsd2hlV29ZTjRhSVRp?=
 =?utf-8?B?enRPUHh5S1l6MWZlRTd1YTgxdk1tVm16MTBKUHZYOTE2ZXpKNkFzU1RYbWIv?=
 =?utf-8?B?MzVQM2NlOVRjdWJaa0lwekV3RnQrdFdXV255eThhTmU2L1h6M2hNUXdsSTU4?=
 =?utf-8?B?Y1M5Y2pBaUpjdlRHb0FuWWFLalpyLzFEbmR2eEtiWkpsditZMHJ0c0tHUjNZ?=
 =?utf-8?B?b1RKdnlmOUVNUS9rZStLYm1GYUhWOFZJN0I4bjNnM2F6Qzk3Szd5Mmg1ZXZj?=
 =?utf-8?B?R25qN1ZkYWprNFQ5Yy9ucEdraExYSDh5ZXJndlk2eERETzNVMHZzMmRlRnN5?=
 =?utf-8?B?L1lLOFlaNGt4QktnRXF1TEtiM2hxbENsTkxSNm5nUldGR0RLTVFHbGlqRjJI?=
 =?utf-8?B?UzBhM0Y3dE1zQW0zOFozRjdvV243dkdLd3NvbjM4d0RhcHJDajJhelJJS2h0?=
 =?utf-8?B?dWRDajZEOXN4Zml4KzZLVG9Ic1JDRXQvNkpRbGt3aHAwS0tCREU3NEJhVGNR?=
 =?utf-8?B?WC9OZmxvL3B1dWhIWGtDTlBNMTFOOVhzZnAzZzAxc3hCTXF2VzNRanhNZUVz?=
 =?utf-8?B?bGE4OC94YjI2c1JMSENDdlM0ZVpzZ2Y4dU1MeGlhNGVrZTZOSXp3V3Y0UUpN?=
 =?utf-8?B?WGFHNEEzdWMrc0Z0blBHdStzNm5RRWc1WlVsUmVuMVVRZmFVK3Z3bXdFZ1lJ?=
 =?utf-8?B?VlpIcGdSaGhIbWlJUXVUQ0hVOWZadEczTnRvVVV5ZFhCOGVMbDBrSHdJeVo2?=
 =?utf-8?B?SzBOQ3VQNXZvNnJPSE80OXNIc0FoWWRXZU03RmIyR00wRENtZitUZE1rdUl6?=
 =?utf-8?B?dTZuendCc1NvRWUzTTg1Z1BnUmYzd3gvcjQ3bkl6dzcydThsNzc3N1EzMHd5?=
 =?utf-8?B?VlRzcEtDalhIckZkbjZZTCs0c0dIWWZjYys1UXptTmdpSnZlcEdpekt6RlZM?=
 =?utf-8?B?WW5XeE9CUWpvVTFjKzMzZUFyRHh5ZmkvZnlLNW8xSm5OditlRHA2RDI1aDVj?=
 =?utf-8?B?TmxtWHFpbTZKYXdjNGdrM2JuU3prRnhXVWkxQ3ZFWFhmcnY4OUg0VHBWNjB2?=
 =?utf-8?B?NGpCYkx3clBTK2RKMXFsbGpuS1I1NmhGamF4K0VSbTM1RHBGUFQ1TGVZRklo?=
 =?utf-8?B?WTcvUXBVVkp5UklleGxXclkvQ3lxNTVjaWZrREFYbkdkSUx2NzcwUUVWM1Bh?=
 =?utf-8?Q?l4b50DS3nWqIKYgMXgvq7oATXAag4vnS?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:48:40.8580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd25694-e96f-40ad-804a-08dd0d57dee0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_054848_307591_CE3E6F73 
X-CRM114-Status: GOOD (  16.13  )
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

Q3VycmVudGx5LCBvbmx5ICJtYXhfZWMiIGNhbiBiZSByZWFkIGZyb20gc3lzZnMsIHdoaWNoIHBy
b3ZpZGVzIGEKbGltaXRlZCB2aWV3IG9mIHRoZSBmbGFzaCBkZXZpY2XigJlzIHdlYXIuIEluIGNl
cnRhaW4gY2FzZXMsIHN1Y2ggYXMKYnVncyBpbiB0aGUgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0s
IHNwZWNpZmljIGJsb2NrcyBjYW4gYmUgd29ybiBkb3duCm1vcmUgdGhhbiBvdGhlcnMsIHJlc3Vs
dGluZyBpbiB1bmV2ZW4gd2VhciBkaXN0cmlidXRpb24uIFByb3ZpZGluZwpkZXRhaWxlZCBlcmFz
ZSBjb3VudGVyIHZhbHVlcyBnaXZlIGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YgdGhlCm92ZXJh
bGwgZmxhc2ggd2Vhci4KVGhlcmUgZXhpc3RzIG1vcmUgZGV0YWlsZWQgaW5mbyBpbiBkZWJ1Z2Zz
LCBidXQgdGhpcyBpbmZvcm1hdGlvbiBpcwpvbmx5IGF2YWlsYWJsZSBmb3IgZGVidWcgYnVpbGRz
LgoKU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4
aXMuY29tPgotLS0KIGRyaXZlcnMvbXRkL3ViaS9jZGV2LmMgfCA4NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4NiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2NkZXYuYyBiL2RyaXZlcnMvbXRkL3Vi
aS9jZGV2LmMKaW5kZXggMGQ4ZjA0Y2YwM2M1Li40YWY5OWRkYmJhNjYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL3ViaS9jZGV2LmMKKysrIGIvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwpAQCAtODI4
LDYgKzgyOCw4NiBAQCBzdGF0aWMgaW50IHJlbmFtZV92b2x1bWVzKHN0cnVjdCB1YmlfZGV2aWNl
ICp1YmksCiAJcmV0dXJuIGVycjsKIH0KIAorCitzdGF0aWMgaW50IHViaV9nZXRfZWNfaW5mbyhz
dHJ1Y3QgdWJpX2RldmljZSAqdWJpLCB2b2lkIF9fdXNlciAqYXJncCkKK3sKKwlzdHJ1Y3QgdWJp
X2VjaW5mb19yZXEgKnJlcTsKKwlzdHJ1Y3QgdWJpX3dsX2VudHJ5ICp3bDsKKwlpbnQgcGViOwor
CWludCBlbmRfcGViOworCWludCBpOworCWludCBlcnIgPSAwOworCisJcmVxID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IHViaV9lY2luZm9fcmVxKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFyZXEpCisJ
CXJldHVybiAtRU5PTUVNOworCisJLyogQ29weSBqdXN0IHRoZSBpbnB1dCBhcmd1bWVudHMgKi8K
KwllcnIgPSBjb3B5X2Zyb21fdXNlcihyZXEsIGFyZ3AsIHNpemVvZihzdHJ1Y3QgdWJpX2VjaW5m
b19yZXEpIC0KKwkJCSAgICAgb2Zmc2V0b2Yoc3RydWN0IHViaV9lY2luZm9fcmVxLCBlbmRfZWNf
cmVzKSk7CisJaWYgKGVycikgeworCQllcnIgPSAtRUZBVUxUOworCQlnb3RvIG91dF9mcmVlOwor
CX0KKworCS8qIE1ha2Ugc3VyZSB0aGF0IHN0YXJ0IHZhbHVlIGlzIGxlc3Mgb3IgZXF1YWwgdG8g
ZW5kIHZhbHVlICovCisJaWYgKHJlcS0+c3RhcnRfZWNfcmVxID4gcmVxLT5lbmRfZWNfcmVxKSB7
CisJCWVyciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0X2ZyZWU7CisJfQorCisJLyogQ2hlY2sgaW5w
dXQgYXJndW1lbnQgc3RhcnQgdmFsdWUgKi8KKwlpZiAoKHJlcS0+c3RhcnRfZWNfcmVxIDwgMCB8
fCByZXEtPnN0YXJ0X2VjX3JlcSA+PSB1YmktPnBlYl9jb3VudCkpIHsKKwkJZXJyID0gLUVJTlZB
TDsKKwkJZ290byBvdXRfZnJlZTsKKwl9CisKKwkvKiBDaGVjayBpZiBlbmQgdmFsdWUgaXMgbGVz
cyB0aGFuIDAgKi8KKwlpZiAocmVxLT5lbmRfZWNfcmVxIDwgMCkgeworCQllcnIgPSAtRUlOVkFM
OworCQlnb3RvIG91dF9mcmVlOworCX0KKworCWVuZF9wZWIgPSByZXEtPmVuZF9lY19yZXE7CisK
KwkvKiBDb250cm9sIGVuZCB2YWx1ZSAqLworCWlmIChlbmRfcGViID4gdWJpLT5wZWJfY291bnQp
CisJCWVuZF9wZWIgPSB1YmktPnBlYl9jb3VudDsKKworCS8qIENoZWNrIHRoYXQgd2UgZG8gbm90
IG92ZXJ3cml0ZSBvdXIgd29ya2luZyBtZW1vcnkgKi8KKwlpZiAoZW5kX3BlYiA+IChBUlJBWV9T
SVpFKHJlcS0+ZXJhc2VfY291bnRlcnMpICsgcmVxLT5zdGFydF9lY19yZXEpKQorCQllbmRfcGVi
ID0gQVJSQVlfU0laRShyZXEtPmVyYXNlX2NvdW50ZXJzKSArIHJlcS0+c3RhcnRfZWNfcmVxOwor
CisJaSA9IDA7CisJZm9yIChwZWIgPSByZXEtPnN0YXJ0X2VjX3JlcTsgcGViIDwgZW5kX3BlYjsg
aSsrLCBwZWIrKykgeworCisJCWlmICh1YmlfaW9faXNfYmFkKHViaSwgcGViKSkgeworCQkJcmVx
LT5lcmFzZV9jb3VudGVyc1tpXSA9IFVCSV9VTktOT1dOOworCQkJY29udGludWU7CisJCX0KKwor
CQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7CisKKwkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJd
OworCQlpZiAod2wpCisJCQlyZXEtPmVyYXNlX2NvdW50ZXJzW2ldID0gd2wtPmVjOworCQllbHNl
CisJCQlyZXEtPmVyYXNlX2NvdW50ZXJzW2ldID0gVUJJX1VOS05PV047CisKKwkJc3Bpbl91bmxv
Y2soJnViaS0+d2xfbG9jayk7CisJfQorCisJLyogUmV0dXJuIGxhc3QgcmVhZCBwZWIgKi8KKwly
ZXEtPmVuZF9lY19yZXMgPSBlbmRfcGViIC0gMTsKKworCWlmIChjb3B5X3RvX3VzZXIoYXJncCwg
cmVxLCBzaXplb2Yoc3RydWN0IHViaV9lY2luZm9fcmVxKSkpCisJCWVyciA9IC1FRkFVTFQ7CisK
K291dF9mcmVlOgorCWtmcmVlKHJlcSk7CisJcmV0dXJuIGVycjsKK30KKwogc3RhdGljIGxvbmcg
dWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJCQkg
ICB1bnNpZ25lZCBsb25nIGFyZykKIHsKQEAgLTk5MSw2ICsxMDcxLDEyIEBAIHN0YXRpYyBsb25n
IHViaV9jZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLAogCQli
cmVhazsKIAl9CiAKKwljYXNlIFVCSV9JT0NFQ05GTzoKKwl7CisJCWVyciA9IHViaV9nZXRfZWNf
aW5mbyh1YmksIGFyZ3ApOworCQlicmVhazsKKwl9CisKIAlkZWZhdWx0OgogCQllcnIgPSAtRU5P
VFRZOwogCQlicmVhazsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
