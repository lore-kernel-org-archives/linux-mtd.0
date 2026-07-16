Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467FCC44512
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hOJOtdeES8A0hc2fsOQoBtGjd9z3dnGf5xMZz/AeKA=; b=3Prb1Htt91i/kwrnZWX+ruUf9+
	cID0zBAB6fnXIvEK8rn9NqtI8CLoAvEmfwB36uG5vyupZhkS2ao0yJJx7svk10nbNHUDRzzZ24su5
	o8R8etYIntrnGjIWXYXyB4j5MGuKIUksk8aaWl41PpymSOM5GY8bRBjJ31KXrarmJ3xZ2ItgoKeXj
	UfeN4JJe23N8i59oNc/U/OE3S0ha+dJYDCW6fvulIvJVUcdJT7D1WiQ1O4CcD0f6AuB8ZZva3a4sy
	AXrgH3C/ilxEN6TOayUHHuDnqAP/hcgb+Pmur892wsIF53MQhicn1lq+EHb5MYS183+JZidUJ79yw
	A1wq5jzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMaj-0000000HQ8f-32nv;
	Thu, 16 Jul 2026 13:57:33 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMag-0000000HQ8I-0e4z
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 13:57:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xiy2bIR2iOO9y7tATOCNoXTSCmC4W84J9WbecDR1SkUKtVgZCJpy+Ci8Dzu6+I82bIdK1Brt9BWRgbxFch5jxGPUWjcWWPLXDytMwHvc69LNd9DXneIzHxoAA69ScSlzM79IwOgU8KIM4vh9UAnlmRGSs8RCXR7+Xhmmuc55unA/93Tnk8fnUAqM+ro+hYoJhC7K2v0ZR/nL/MCQwf6HkIEyrCVe2YCoIRG/hNrud/EUPJkg0Pxaaa0RjNRmvc2ngxkjXRJETzTpP+u/+hYMue8udm0utZhQpi55RdMx5F9F0WOCPsEcVFbuGPaLqOSYsBseYV1JRNYvWATccGVbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZvSRWYodKkMM9SUhKz4VpEyKocTeHkDqe0gltuLMUY=;
 b=LQ2s35QBUmC3wHLJ0NPwZUhz2nkfelHip4kV/Jd42xDmGMkcc3UZeSs/Hv/SReyMKDB0OpqpEAYugr3i0JYmRn7IhQ2THdoh54MmvlrL7FkMhWulCizPgxnfRMJq20DQ5nxgNvyLq9lFQnKxM0rIxU8C4r5wKour7/sVjhZaiHDE4Bs0MEDDusXi8oFpQRkuvFWXf4l2ZTxkZyrLZRvhF+JJBw78RRL3Zw2Axteop1vrnW2Fo42MORQlWaZn5X3Hv6tHlLGDoSZk3CftqMXur+ounJHCAO0y8ccW93kyLpWB8acaGWJ4rZPpG3r+PTcXjY9crElQTK3Rw0JBc5uL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZvSRWYodKkMM9SUhKz4VpEyKocTeHkDqe0gltuLMUY=;
 b=oEShmw+ezZSxwdXYjiAOFiwvlvQ6NjIu3QjYKOE7ZEcpPBESUX4W0pnLrl/1lYge6wkMvVOzztLetTrkTIsoEDNRuzB1ViCF28uKq08zoa3itJ3L+xZbbRpSr+nTT0MbqCWG8qXXD4oNTNH5XnVsUw3ypmlLg7Aw6Oa2m56NtB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SA5PPFF1E6547B5.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 13:57:19 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 13:57:18 +0000
Message-ID: <979c6ed6-4e75-416a-ae5f-a2a8d3ec1a4c@amd.com>
Date: Thu, 16 Jul 2026 15:57:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/16] spi: cadence-quadspi: add PHY tuning support
To: Santhosh Kumar K <s-k6@ti.com>,
 "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "takahiro.kuwano@infineon.com" <takahiro.kuwano@infineon.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "praneeth@ti.com" <praneeth@ti.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>,
 "a-dutta@ti.com" <a-dutta@ti.com>, "git (AMD-Xilinx)" <git@amd.com>,
 Amit Mohapatra <amitrkcian2002@gmail.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <DS7PR12MB9503EA13A8FB71938556F1CDDCEF2@DS7PR12MB9503.namprd12.prod.outlook.com>
 <13926125-5e55-43c5-b502-4e487d561ee2@ti.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <13926125-5e55-43c5-b502-4e487d561ee2@ti.com>
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SA5PPFF1E6547B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 21feda4a-6711-4999-b07f-08dee342265f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|921020|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: whGIZpVcp11BLsMA9T2cmF2Uf8F1kuIgKNrEPa4Q2B0SfhaLT9bNuJgnewf3xGF54Rvm9URdlNO0l2ijxuBAC0Oa/sMHEQQZeK+PmWcivtEDOIte3282kVdlGK3Yv4VaVGngzMFvlfQSG+fZLR6PpWSzaW7qt35BseDMmh4szRKLNoORaZZrjBF5+5tH1LXUMFkF6pX/gUlasI2pywSow53xtAX62tlMR6AkXnFd5bE0ewoLNhh1ISem0F2xcjTuQSumnq5nzOdlH2iD+rq6fc8rheErHJBIQJ4BSelE4NWnWPsiSk4rEhZRFki4ivcEeTT9eYX6iom7tGtsspOSlYb3lD6YDXauJ8dyXUwQOIIhbC8oIGrMThkqlF89UMBEOsos2EOS1gFb2eFIIKWOdX899QKM7sJhWeFY10iaHK/LmhHeVQJSYph2LYUXZCaH+RaXPHikAwmMBf06o7i5nb36YQUPuvlUiseI2J27X2rjcALH4EoUY3681mcB09cxaV9tcooiUPPUXJWOndItmBAer2AIwTNbpihxuox6cN0nxubjPZGRj9nL/+5iKAiTEOCq3tAeS4JmZsedEGkt18PL0G6x2qpN5MQazDBBfTd5tZYVG0dx3OZ1yGtidh3a6wctSCw0hoM4GSDKGihNTr+YA+CPxGGG4OROwJonaDEHQwEVdv+DFDskkOt2DzB3DCqrW5VZ6LG80bT6KGdNcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3pBd0ZKUjZwRzdpeHhKWkNLOVlxNzJGN2lScGlxalBWRHpwY2xCbnZ2bUts?=
 =?utf-8?B?R0FqNStmMm90Nm5SUDhnVCtNR3NvcGs4Q0xraVVNNEdnV3U5RHVkQ1RtK05o?=
 =?utf-8?B?Y1dBRnVkNnMyTWdhSzgycmZKcXhDNHV3aE53SG9KRTg3L0xKOHQ3WktuN0l0?=
 =?utf-8?B?N2w4VmErZllLdTRnNHk1cm1XWkRaVUhUR1RuZUpka3NuUndRcEkrMVhZS0No?=
 =?utf-8?B?dEN6c0l3dnJRL0syQXRkRHc2eklRbTAwTlFqQTI1RG9Jdy9idmE5Tmt6Y1RD?=
 =?utf-8?B?cStzRzVWUTFxTG1lYWVzN1NJQ0JSOHp1WVhJR0RPVDRyYjFBMExCSWJQWWZl?=
 =?utf-8?B?UDNTOGNtRUUzY3h3b1NEcWtJaW53T09FQUNnVkNzcFZMTDBrZ0hiUytWZFBX?=
 =?utf-8?B?T3FPTDVMcjhuZDZBWGppTTdDL2lWSWlvb0lTV1UwZ1FhRHFzcm5rUUN1by8y?=
 =?utf-8?B?ZEo4RXBwcUJxWlMzOVZkYmxTc00rRnZ1YVI3Z3o5V3NDR094bmhNaldCWG4v?=
 =?utf-8?B?Z1hnWFhNMlBQd1hiZjhzZk00SnI5OHJLLzlGaFZUYzNSSVdZYWwyZmtEcC9v?=
 =?utf-8?B?d0RLMHZ5R1YrRWRlUk1Ea0dyRERQeDN3SU1ONTVsckNiZE1RVWZpTkY0RlB2?=
 =?utf-8?B?eGNBOWh5L2h4YzV2eXdJU09mR3VRdWIzNEplTkZqSlJWVFlVYVZ1OFpLRkJP?=
 =?utf-8?B?a1YrWVZDVU9BUXlTYTd6cjVqYzA4N0UxeFdpdHlxK0dMK1ZwTDI1QnhYeU5a?=
 =?utf-8?B?NGVrYlVKbndlM2tGNlJsOFZ4Vm5RMExqS1g3WmlZeWc1b0J5L015TWJkNWNr?=
 =?utf-8?B?T0Evem9saTd1OUFQVlQrb21ZaHAwVEZMWW1IYlp4K3BldDN1ZGxPdFVsVHd6?=
 =?utf-8?B?enQ5TG03bVEvSGdsWHArNEZ4SG41bzc5c0tYemo5eVpwRGllNnpQT1hCM205?=
 =?utf-8?B?ZEVETzNybld6Q0MzVFpkdDFhaUV6amUrV3pMQUpOSDFGU2hZM0h3YkVCRGp0?=
 =?utf-8?B?VFU0dGNNaWNrN0xLaWtoRm1CRDVGczNKODl5c2tzSkd5TEdnbzhON1NMeTN1?=
 =?utf-8?B?eUlZWXQ2ckZFMDJFNUZHeHVPQlJ6ekFneE1BaFlWY1VpbE00dndhRVJ3ZnUr?=
 =?utf-8?B?cWhXSGxTR0o3OFYzcGUvQm1ZWk11bW5BV0xWaVZLR3lXWTJHNmhTeE5jemRh?=
 =?utf-8?B?MDR1RE14UGlFS1g0aDJvVzFaaFdpZm5ZQ0p3VnVLSDQ1emdqTzdQT0FzeHIz?=
 =?utf-8?B?SmczUHZUcnlPUFB2VTE4SlBWMFhiamt3NTBvSEFBQTgvV1llcUt3Rk5rbUVN?=
 =?utf-8?B?ME5rN2s4OFRCZyt6L2g3cWxxTk9BY3FHM2xmMGJpV3JTR1RUaXdRRDF0cElt?=
 =?utf-8?B?VTRxVHFlbTNoeUZOUWhhYk9HMHdTbjhldkJIcTFiUFlGcW8rTGNqNzZiQ0hr?=
 =?utf-8?B?djFKZEY4QUt1bDBKZXpLRkF4WlhtR1diQnV3dUxzVmkwVk8yeUlBRktnVUZq?=
 =?utf-8?B?NGVLMjBXK2c2OTZadUlTdHZFUFNVR3JMTko4SDhDYzVqVXdyU3d4cm5LbTM2?=
 =?utf-8?B?QTNBdjBzQVFVZlo3SGtYWmllc2RpSndFUHY5UUR1aFZKMTBpaVp6M3h6NDd6?=
 =?utf-8?B?U1VsU2h3MFBIM2x2QmFkZ1Y4T29xbGpMZzFlR1pveDJPbmlJZHVVeUo5ckRn?=
 =?utf-8?B?V2ZMVWZrVTJiNFY1U2xTOG5xYnBPMzVZRDNlY3RHaVlvTjdXR2JhR0l3bEd6?=
 =?utf-8?B?ZVJMaERFYjFGVjVaRlZrdHRYV3R0ZnplcUMrSGhYRi9LZGFaM1FxNzNKVjE2?=
 =?utf-8?B?RUNsbnJnN1J5czQyZFQvYm1mWU5jR01GeTVVZUMvNmMzdk1FdGdVUGpXQWxo?=
 =?utf-8?B?NXJmQTRibTdldlZaK2JYQUd3TXJyTW9WK051L0RhK1YveWI5WFZZL0hyUFRL?=
 =?utf-8?B?TElOcGd4d2RyMDc3M3ZiUStuUWpoRkJiTklYbFZUTkFYc2lid1FMUU5FT1o1?=
 =?utf-8?B?NUNRbEp2NFR4MXNaVm9jQVBzd1FPMmUzZk5IbmF4cDUvUHJweWZMa1N3QTha?=
 =?utf-8?B?ckRwdmFxNmF2UnZFMXFIYStlZ2kveW5tcUFVb2dWRy81MnVCenlHdWtBZE9B?=
 =?utf-8?B?MkVYcU1tUEhuYjduKy94bU9YNFhELy9SOC9TZTUrNjY0aVlnWHpONDMyS1Z4?=
 =?utf-8?B?Sy9Xc2EzaE1DSjJsUTZBeDQ2WWdVNElYZkxEQkVOM040bXBrYlZJTUt2NkRi?=
 =?utf-8?B?dkJOc21HdTcxdnlERmRjSjBaQkxKRFhUM1VsU1g5N3JTM2dsQ2JFSkxpcmdJ?=
 =?utf-8?B?UElPc3ZzUWloVUxBRmtSanhUR1NBb3BBanplSEp6S1FlelI0RTlDQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21feda4a-6711-4999-b07f-08dee342265f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:57:18.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd+eVnanPAsGD0mCfmaNiELBoLcpn2f0z1/dB4K4PfUZMun3MraUBMCoELkc2l9u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF1E6547B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_065731_215465_BC75FEF1 
X-CRM114-Status: GOOD (  12.51  )
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

CgpPbiA3LzE2LzI2IDA4OjA0LCBTYW50aG9zaCBLdW1hciBLIHdyb3RlOgo+IEhlbGxvIEFtaXQs
Cj4gCj4gQXBvbG9naWVzIGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4KPiAKPiBPbiAyMi8wNi8y
NiAxMDowMCwgTWFoYXBhdHJhLCBBbWl0IEt1bWFyIHdyb3RlOgo+PiBBTUQgR2VuZXJhbAo+Pgo+
PiBIZWxsbyBTYW50b3NoLAo+Pgo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+IEZy
b206IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPgo+Pj4gU2VudDogVGh1cnNkYXksIEp1
bmUgMTgsIDIwMjYgMTowNyBQTQo+Pj4gVG86IGJyb29uaWVAa2VybmVsLm9yZzsgcm9iaEBrZXJu
ZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7Cj4+PiBjb25vcitkdEBrZXJuZWwub3JnOyBtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tOyByaWNoYXJkQG5vZC5hdDsKPj4+IHZpZ25lc2hyQHRpLmNv
bTsgcHJhdHl1c2hAa2VybmVsLm9yZzsgbXdhbGxlQGtlcm5lbC5vcmc7Cj4+PiB0YWthaGlyby5r
dXdhbm9AaW5maW5lb24uY29tCj4+PiBDYzogbGludXgtc3BpQHZnZXIua2VybmVsLm9yZzsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+Pj4ga2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IHByYW5lZXRoQHRpLmNvbTsgdS0KPj4+
IGt1bWFyMUB0aS5jb207IGEtZHV0dGFAdGkuY29tOyBzLWs2QHRpLmNvbQo+Pj4gU3ViamVjdDog
W1BBVENIIHY0IDAwLzE2XSBzcGk6IGNhZGVuY2UtcXVhZHNwaTogYWRkIFBIWSB0dW5pbmcgc3Vw
cG9ydAo+Pj4KPj4+IFRoaXMgc2VyaWVzIGltcGxlbWVudHMgUEhZIHR1bmluZyBzdXBwb3J0IGZv
ciB0aGUgQ2FkZW5jZSBRU1BJIGNvbnRyb2xsZXIgdG8KPj4+IGVuYWJsZSByZWxpYWJsZSBoaWdo
LXNwZWVkIG9wZXJhdGlvbnMuIFdpdGhvdXQgUEhZIHR1bmluZywgY29udHJvbGxlcnMgdXNlCj4+
PiBjb25zZXJ2YXRpdmUgdGltaW5nIHRoYXQgbGltaXRzIHBlcmZvcm1hbmNlLiBQSFkgdHVuaW5n
IGNhbGlicmF0ZXMgUlgvVFggCj4+PiBkZWxheSBsaW5lcwo+Pj4gdG8gZmluZCBvcHRpbWFsIGRh
dGEgY2FwdHVyZSB0aW1pbmcgd2luZG93cywgZW5hYmxpbmcgb3BlcmF0aW9uIHVwIHRvIHRoZSAK
Pj4+IGNvbnRyb2xsZXIncwo+Pj4gbWF4aW11bSBmcmVxdWVuY3kuCj4+Pgo+Pj4gQmFja2dyb3Vu
ZDoKPj4+IEhpZ2gtc3BlZWQgU1BJIG1lbW9yeSBjb250cm9sbGVycyByZXF1aXJlIHByZWNpc2Ug
dGltaW5nIGNhbGlicmF0aW9uIGZvciAKPj4+IHJlbGlhYmxlCj4+PiBvcGVyYXRpb24uIEF0IGhp
Z2hlciBmcmVxdWVuY2llcywgYm9hcmQtdG8tYm9hcmQgdmFyaWF0aW9ucyBtYWtlIGZpeGVkIHRp
bWluZwo+Pj4gcGFyYW1ldGVycyBpbmFkZXF1YXRlLiBUaGUgQ2FkZW5jZSBRU1BJIGNvbnRyb2xs
ZXIgaW5jbHVkZXMgYSBQSFkgaW50ZXJmYWNlIHdpdGgKPj4+IHByb2dyYW1tYWJsZSBkZWxheSBs
aW5lcyAoMC0xMjcgdGFwcykgZm9yIFJYIGFuZCBUWCBwYXRocywgYnV0IHRoZXNlIHJlcXVpcmUK
Pj4+IHJ1bnRpbWUgY2FsaWJyYXRpb24gdG8gZmluZCB0aGUgdmFsaWQgdGltaW5nIHdpbmRvdy4K
Pj4+Cj4+PiBBcHByb2FjaDoKPj4+IEFkZCBTRFIvRERSIFBIWSB0dW5pbmcgYWxnb3JpdGhtcyBm
b3IgdGhlIENhZGVuY2UgY29udHJvbGxlcjoKPj4+Cj4+PiBTRFIgTW9kZSBUdW5pbmcgKDFEIHNl
YXJjaCk6Cj4+PiDCoCAtIFNlYXJjaGVzIGZvciB0d28gY29uc2VjdXRpdmUgdmFsaWQgUlggZGVs
YXkgd2luZG93cwo+Pj4gwqAgLSBTZWxlY3RzIHRoZSBsYXJnZXIgd2luZG93IGFuZCB1c2VzIGl0
cyBtaWRwb2ludCBmb3IgbWF4aW11bSBtYXJnaW4KPj4+IMKgIC0gVFggZGVsYXkgZml4ZWQgYXQg
bWF4aW11bSAoMTI3KSBhcyBpdCdzIGxlc3MgY3JpdGljYWwgaW4gU0RSCj4+Pgo+Pj4gRERSIE1v
ZGUgVHVuaW5nICgyRCBzZWFyY2gpOgo+Pj4gwqAgLSBGaW5kcyBSWCBib3VuZGFyaWVzIChyeGxv
dy9yeGhpZ2gpIHVzaW5nIFRYIHdpbmRvdyBzd2VlcHMKPj4+IMKgIC0gRmluZHMgVFggYm91bmRh
cmllcyAodHhsb3cvdHhoaWdoKSBhdCBmaXhlZCBSWCBwb3NpdGlvbnMKPj4+IMKgIC0gRGVmaW5l
cyB2YWxpZCByZWdpb24gY29ybmVycyBhbmQgZGV0ZWN0cyBnYXBzIHZpYSBiaW5hcnkgc2VhcmNo
Cj4+PiDCoCAtIEFwcGxpZXMgdGVtcGVyYXR1cmUgY29tcGVuc2F0aW9uIGZvciBvcHRpbWFsIHBv
aW50IHNlbGVjdGlvbgo+Pj4gwqAgLSBIYW5kbGVzIHNpbmdsZSBvciBkdWFsIHBhc3NpbmcgcmVn
aW9ucyB3aXRoIGRpZmZlcmVudCBzdHJhdGVnaWVzCj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhpcyBz
ZXJpZXMuIEkgaGFkIGEgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSBWaXJ0dWFsIENvbmNhdAo+PiBk
cml2ZXIgcGF0Y2ggc2VyaWVzIFsxXS4gTm93IHRoYXQgaXQgaGFzIGJlZW4gbWVyZ2VkIGludG8g
dGhlIGtlcm5lbCBhbmQKPj4gZW5hYmxlcyBzdXBwb3J0IGZvciBtdWx0aXBsZSBmbGFzaCBkZXZp
Y2VzIGNvbm5lY3RlZCBpbiBzdGFja2VkIG1vZGUtd2hlcmUKPj4gZWFjaCBmbGFzaCBkZXZpY2Ug
aXMgcHJvYmVkIGFuZCBjb25maWd1cmVkIGluZGVwZW5kZW50bHktaWYgYm90aCBmbGFzaAo+PiBw
YXJ0cyBhcmUgcmVxdWlyZWQgdG8gb3BlcmF0ZSBpbiBERFIgbW9kZSwgZWFjaCBkZXZpY2Ugd291
bGQgbmVlZCB0bwo+PiBwZXJmb3JtIHR1bmluZyBhbmQgc3RvcmUgaXRzIHR1bmluZyBkYXRhIHNl
cGFyYXRlbHkuCj4+Cj4+IEdpdmVuIHRoaXMsIHNob3VsZCB3ZSBjb25zaWRlciB0aGlzIHVzZSBj
YXNlIGFuZCBhZGFwdCB0aGUgdHVuaW5nCj4+IGFyY2hpdGVjdHVyZSB0byBzdXBwb3J0IGl0Pwo+
Pgo+PiBJJ2QgYXBwcmVjaWF0ZSB5b3VyIHRob3VnaHRzIG9uIHRoaXMuCj4gCj4gR29vZCBwb2lu
dC4KPiAKPiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBhbHJlYWR5IHN0b3JlcyB0aGUgY2Fs
aWJyYXRpb24gc3RhdGUgcGVyCj4gY2hpcCBzZWxlY3QgKGRlbGF5IGxpbmUgc2V0dGluZ3MsIHR1
bmVkIGZsYWdzLCBhbmQgb3BlcmF0aW9uIHRlbXBsYXRlcyksCj4gc28gdGhlIGRhdGEgbW9kZWwg
c3VwcG9ydHMgaW5kZXBlbmRlbnQgdHVuaW5nIGZvciBlYWNoIGRldmljZS4KPiAKPiBIb3dldmVy
LCB0aGUgcnVudGltZSBwYXRoIHRoYXQgZW5hYmxlcyBQSFkgbW9kZSBkb2VzIG5vdCByZXN0b3Jl
IHRoZQo+IHBlci1DUyBkZWxheSBsaW5lIHNldHRpbmdzIHdoZW4gc3dpdGNoaW5nIGJldHdlZW4g
Y2hpcCBzZWxlY3RzLiBBcyBhCj4gcmVzdWx0LCBjb25zZWN1dGl2ZSBQSFkgYWNjZXNzZXMgdG8g
ZGlmZmVyZW50IGRldmljZXMgY291bGQgZW5kIHVwIHVzaW5nCj4gdGhlIHdyb25nIGRlbGF5IGxp
bmUgc2V0dGluZ3MuCj4gCj4gVGhpcyBjYW4gYmUgYWRkcmVzc2VkIHdpdGggYSBzbWFsbCBjaGFu
Z2UgYnkgcmVhZGluZyB0aGUgY3VycmVudGx5Cj4gcHJvZ3JhbW1lZCBETEwgYW5kIHJlcHJvZ3Jh
bW1pbmcgdGhlIFBIWSBjb25maWd1cmF0aW9uIHJlZ2lzdGVycwo+IHdoZW5ldmVyIHRoZXkgZGlm
ZmVyIGZyb20gdGhlIGNhbGlicmF0ZWQgdmFsdWVzIGZvciB0aGUgc2VsZWN0ZWQgY2hpcC4KCkFy
ZSB5b3UgZ29pbmcgdG8gaW5jbHVkZSBpdCB0byB5b3VyIHNlcmllcz8KClRoYW5rcywKTWljaGFs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
