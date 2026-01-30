Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C7D73EA8
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 00:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fpw+3eMWvP8PoC3Xu/s5HWmksvoFXT3ECS9x8imsfDU=; b=GYYXLDZsa5bH8uP3jT2jX2ebK3
	u8vFHTI+lq0PFImqU7o/HfRBE11QP9EAFTvP3qQribbVdmIT2g9Sda9otjZ9fRDu0EwnSLYokxZ+V
	x1CwKtPNEDWrc4PdPg5SE+f9cBwqHKviOgoJ1Lt8mg5MkmczPBlxcp7xTvQQ4sA7ui2xBfl47d05P
	TXiy7nF2c7hk0r8GZhlXRBb9jBPRjLU/E9+s+rZCTNYeNMXykWwq5ABJe4fVTyY96lBIa4P+VrMqK
	dUR6d/2ad3Ob90Z17USoJAAieLuhZ+s90jCrSnjlRP/PMCwrsKsftVF1zlBzljZg5gkLmWkwywfA5
	88GL6NKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlc1X-00000000ni0-0Guf;
	Fri, 30 Jan 2026 00:06:07 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlc1U-00000000nhJ-0cLd
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 00:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEBIshiKRv+f9U2dk5HfZSduoSB0g/W0N/dyddU4wz6LXB60ksa8bCFN98V+YRrxH/7ZiRLq/nlcpaDH5DWbnsAwmk/LIB0hiYV6Okckm8EHCCo/wsch+q2LYkBYD57FWxDhoyayCtAWyXNwyEZoHhoFuAwsslrQ0Jq/+iIAumWBUETXlhqDunc4NWvg2gqx+lMCPnE/argRxGVjSRjkxZNl95QwLm9yIIHgidYmQTb6kYHrepNgmgHC+Igoyah7S/kEgPAA8bMpanRcyuF7WRUlk1IjPFUoJqADKmZlruCdxNKR5j6/Rk4zoPdaGbAmnKsJFAYg7D6vyRPLnbK5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7S3DByF51IgEARjYmv4fPI01q4K5wxWB6ECQuaTQMM=;
 b=D8qsm8omd1xyZcKhrHX26DeDVflRMOJduATHWH8dEp9R7/0Tythb8legswRDusa8wWuKRaNA59mgiCPIt6gix2Orj2n2WkUgif7Qi23a3uDZ568N1MQ078xjsRDWyaIQz406L7nsF+skuHYjoA5c5k4fgZMJG0TaggBGE+bd4r8+manFF3+23XL0oTz7VOjDRUTIqE2fxRanvWo5mO/gxPZVxg5nKyW2mk4aJMEvLcVN4f2xUD1blRpEPP3gcjBnYTOxriiS3xoX2PjbxbNLd5Lb139ajsCNV7k4IX+Nbn2DwwL1fo676NBryztjxkdf3rBScHm+JHDdI6nVt8/xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7S3DByF51IgEARjYmv4fPI01q4K5wxWB6ECQuaTQMM=;
 b=c9I2qUrr4wZRGkEmM9IZJblDBsTMBelRVXZzPhA+IydqPeWHoI/e7fBAkM9So+NR3JuRSQL04OARALeTt4vmcxTuBgmmQirReLkfyhVZm1a+4Blm3DqUZmX/WSgjnEh0n7fu86dYw/bhZkIKHPWk9CH9MrMAhkgabqEozr006eE6aM2hh1G7DbQvXy88zS3o86aKXCbDZSykLjAAOtFjXau/lxqITCDyLIaHhxjJw6ufB6eeeBRd2JMgeQUJM/9DVh/MB8QdPEUo4aS8pNxRTlxHLvgxHmz9M2AOoU0l0Ab6BT1DDOqmJ+Y+wz8mxVMd6sv9TMgd+w+4wnm6gq8iwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AMDPR08MB11525.eurprd08.prod.outlook.com (2603:10a6:20b:71a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:05:58 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9520.011; Fri, 30 Jan 2026
 00:05:57 +0000
Message-ID: <5fc6b07f-4998-432f-9f9e-197ed08c2d16@iopsys.eu>
Date: Fri, 30 Jan 2026 03:05:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spinand: Disable continuous read during probe
To: David LaPorte <dalaport@amazon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Martin Kurbanov <mmkurbanov@salutedevices.com>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Gunnar Kudrjavets <gunnarku@amazon.com>
References: <20260129221606.35158-1-dalaport@amazon.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20260129221606.35158-1-dalaport@amazon.com>
X-ClientProxiedBy: GVX0EPF0005F6D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::653) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AMDPR08MB11525:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d40750-ca28-46b3-850b-08de5f935818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEVmeHYwaThuV0tXV2FCVFhnRG1DTVpWVTlRbzRSeEE0TDNCaEZDZ25ma3NV?=
 =?utf-8?B?aXlIM1NlSUExVm9jZkhxQjBUK0Z4YThmTTVFUlJUMFpJNTh5ZjNVNWFlQXFu?=
 =?utf-8?B?M3Yza3kvTzRiR2lOYm1mY0lwWCs0dGR3dHFrOVRZVy8vdytIY1RCbU5vWEla?=
 =?utf-8?B?Sjlsa1EvV2twZGlJK24xODU4Vk5ZR0lWb1o4ME4xQUFkb3NOejc5VFN0em03?=
 =?utf-8?B?cE1GOHdkcDBMRUhnVWNBdVhnNjg5Ylkxejg1SlB6RFlQc0t1NFEvRnRoSnNH?=
 =?utf-8?B?aVVSYmRiYXdkbDhWZE83MkRwbGJSRDl6UFB0OWxlRGV0cjR3MmlHNFIzWThr?=
 =?utf-8?B?dDJlbHJ3aHMvNHovOW4xeFdBQ1BFc3hsUDdsSXpRZFlTdWNZU2xIK2szbXVr?=
 =?utf-8?B?UnFnWmhFaVRoeVpVY1g5QUUwMFJ4RXZlZnNyZGVFNFVlc0I1cU0raXhiZkt4?=
 =?utf-8?B?N0dkZnZodVhkVWk2MDdYZHJtUVRXSEh0cVBSa210LzRKZkUySjFzcm4rQjJR?=
 =?utf-8?B?LzV5RWNvekNaOVBwcDQvQnNOSXgvSGFqVXRod0J3TEY1S3NhZmJEQndDalJN?=
 =?utf-8?B?aWd5WllnSUl4REtZcVZqOVpTeGFzQ2NWREt2Mnl6YmhxYjgzWWJUelBCRFR5?=
 =?utf-8?B?WUxDaEdvY0haZ1IrYjk3V1hGRjlFNWRrbDFNYmxzL0VuTzFsdXZxNWQ0cmQr?=
 =?utf-8?B?NGU1MkZEZXQzOXpyQ3BXVjJ5c09PamVwSEcyR0Vrb0tlRjNjTmdTTnltaW42?=
 =?utf-8?B?RkpNRmFnYjJrdGhpOEZqU2F0Y1RjY2hOY2QxUS9QblZia1NzREFwekxLeVQ0?=
 =?utf-8?B?ZmZIU2F0WjVIek5DdDFQUmVpM3A5RmdOQzFxdEc5VVcyTkk4MjdNMjFTZ1cx?=
 =?utf-8?B?cXhoQ0YwNVNGZC9uYzNaTTZuaHpTbjBwWC9FWHBGb0plSVpITjRNRmN1dHQ1?=
 =?utf-8?B?Q1M0WlIyUUhySmF6Z3V1bWtwTWJxazFuUU5QOTQwRjd3Sk5LOFdpd1p6TUla?=
 =?utf-8?B?MkJZaHIvZmJPQjM0ZVdNWlBKaHhFeFBUNVVGcktzVFhEbFNJc1JsVit6eTgy?=
 =?utf-8?B?MHg2SGJTK01NcExQSFVVdUhZOXhNNitsOWc3SkxMblVSRENpQU5HMmtJRnVo?=
 =?utf-8?B?MmxMNDJwMzNLK3lPZUNkd3ZSOHExaTdhNGV6Y2ptQXdxS2xUQ1oxM3ZZTWc5?=
 =?utf-8?B?SW5SaGY3S1I4NzRnVzFFV1JNMUw0M2g4eVIvblVjMVhkQzlsNHJiODI2SnhJ?=
 =?utf-8?B?aVQ3MmpkUG9UKyt6bEo1aWNXb24yc2ZGK3JQdjR0R05BQTRFZmVWTmpNWWFE?=
 =?utf-8?B?OVpsTnVPczBTK2dCUnVDNmxtdEhIN2xzNXRBa0VjdGN1TEtSbnJwd0ZXWkJ4?=
 =?utf-8?B?SnA4czhxOENNa21WSS9nTCtkVjlrRTVHd1RuY1ltQStGSWhGc2M1M0E0YTVY?=
 =?utf-8?B?VWFDSHAzR1dmS0NJRjhFeUwvamxSYjg2YjR2Z29mbEQ0ZENGeGc4VER1M3Zw?=
 =?utf-8?B?aXlCU1NBZXViTjB6UjN0bktiMGFYaFl2V2J6djZIVXgvZEtySU0wUGlFeVQz?=
 =?utf-8?B?QUgxOVRQaGFUUWlaUHJXV21jRkxGN25GVTl1TituZTNIUG1tdklyd2I5bUJ2?=
 =?utf-8?B?Slg1TzdpaEo1TzFmZTFQZmRFTEVkcmZIMit2RGZ5RWwrOXZQN0I5SEZ6Vm8r?=
 =?utf-8?B?V3FzelZIcktZUDU4UjdTNW5wWUFsbC9Qa05DcG1KNSswd0dmanVDTGJ1UFU0?=
 =?utf-8?B?NTFHanBEajFjNENZQWFYMTZ6TGk5eEJtbFJCYlNjb0NIejNnaW1OWmJWSTZr?=
 =?utf-8?B?cnBJb09DSHlzS0JOUWhGV3pGUWNmOGErTDEvKzRnajVPTTRGbnFNYzFQc1pN?=
 =?utf-8?B?S0hJQXBVWUQzbXBia0hIQjZkSnZZNzZ1VnJuMFNxSVVPaE5JTnBYcE16TFpy?=
 =?utf-8?B?WXVPWEU3ZlMrR2c2MkIrbXNudmdXLyt5TWJSaUVUSzRPRnBXU3M0YWpaQXhL?=
 =?utf-8?B?R2NPK2pUME5wdTlXQ0ZBeXJRN0lCS1BtV1RVaEszaXdLemZtRXBKbWxlK0gz?=
 =?utf-8?B?cDZMZkxUUnZXcGVua3pKVitRWFRlR1paYzc5VURCYmpST1pUQW5nNDlRSVcx?=
 =?utf-8?B?cklYTlZIQnM2QlFSdGRwSGdBenJrWU0weVEwTXJpV3E2UkJzVzg4aEZremxY?=
 =?utf-8?B?QWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHgxWUNVOE9ZMXVPb1B5UXFHVzFvUjRmVFc0TkNGMDhPWUJUNUxGVmM1cXB3?=
 =?utf-8?B?dXYyWE43dGZyUmloNGZCYWljR1NBMURNSnJ5dmJlMm9HR0NKV2QzYTA0YjBx?=
 =?utf-8?B?bEVibjlGWncvdUdyZmF1S0w0U2pQVnR1MUFGZkRZV1F1ejZvQ216bUUxZGoz?=
 =?utf-8?B?TjdZYWRJZ0NhMDBwTUtMWXpsa2xKU1o2OEliNWVDeXNncG9aOVJNWmI3ZFFY?=
 =?utf-8?B?L3R1b00rWk56eWhIY01TR24vSmtEODVtbjJ4bHBzbkR2RHlXY3ZHUmtBNDIw?=
 =?utf-8?B?cTdyTGUwL2FidFRkUVNoVEl0Uk00bW1iSEFVbE1MOGR2U0lmV1oxdDNyc3RF?=
 =?utf-8?B?VGRWMTExSGl4TFUyQUV4c3RuM2VzQ0IreForcGxEbUU5MGx0bXZhM1h6d3Jk?=
 =?utf-8?B?U2FuSHN0d3hTOFdGU1dxemFzOXdSdVhNVFFwSXNzdld2R29nUEVTN2xUR0JZ?=
 =?utf-8?B?OWdsUDcyMnJOS3dDbzZJMkgrdERnOG9Uc1FNa2FKNytXTkRhY0Rjczlud3Ez?=
 =?utf-8?B?TjZSQitIcVoxTVFHZGkxdks2YWMycFhXa2JUQzBGdjRWZDM4UDIxKzFHM2JB?=
 =?utf-8?B?V2RGMEdmbWtBT1N6Ri9zVFBGOWxSSHJ2OVFZK25GU3d3UGF3bGpxOUZyZHZU?=
 =?utf-8?B?OEZHVXlObXpoV3hXYTdzazF4ZEZ5dnBOYi94Zi9POGFCYWxpYkRVWkl2MHox?=
 =?utf-8?B?cmdQamNJN3llZWJsaEJtY055RFIvZ1Z2SVo3bjh2VnhPSmRuWVFnMzBBc1hL?=
 =?utf-8?B?bW05WkxpWTRVUmxjYS85OG15ZnBMRThlSitGakhaZEJHcTlHMmxRZE00MWpF?=
 =?utf-8?B?VG45S05MUCt4KzFabEVOR1gwTUhaeWxUMzJzek1DWURhOFJZTFZ1VFJhVzNq?=
 =?utf-8?B?alEvQVA0WE9pWVREazlYdGtpcGhLY0pBdUEveEsycTB3OS9GNXVDREgvSVJn?=
 =?utf-8?B?MlRxVmhpbW02UlZzbDNaK3RCUmpuNlFnTHFmNnRlTjNCK1VtMkY0Znh1U1g5?=
 =?utf-8?B?RkhVQitTZTU0NWFWSENNVjVPZjlMNDNJaGllbm5nNitjMzIwTXpoWGkyZ3Bn?=
 =?utf-8?B?aFY1NlFSdlcxUlNHV2ZRV2tZZm81Y0pLN3JRemRnZDYzOFZBbUFXeGJpS1Ru?=
 =?utf-8?B?Wjl5c0hramFmNjFUckhFMVRVU2d5M0JuMnB5TDNPbW9HY3NJOUd1dHNiL2tV?=
 =?utf-8?B?Z3ZmZFhBNVYxSHc5dmJCVHVvdG5jZWp6S1VMNitUeDRIVFUzUnZ4RlZMWmdx?=
 =?utf-8?B?SUZHbFhPUmd6TFJzcFlld0VOM3lnZHlEUUU0Y0x2TnJPS0p3ZFloVnNGY09i?=
 =?utf-8?B?WG9IWG41SFFrWDBVSG5mRXN0OGxISFRVZTRadzBmOVdOc0lycWhTOTJ4ZVVL?=
 =?utf-8?B?L0taN21VS1hsaHo3UGhJVm5QUlV1R0dNdncxUG9rRVBXZy9Qem5DcCtuUUVN?=
 =?utf-8?B?MzZDZEw3bHJNTVlTQmg3T3VZYVFrZzlUWmNQbmJSUUpWVU54ZG1OS1hMVnVU?=
 =?utf-8?B?UkJtb3ZZOEdZVVBEeVJYOG9uNWN5cDRjZ3FjMWF6Y21vUGxDanRLWTZXYkNU?=
 =?utf-8?B?d1F3NFZtVFJqZ2xLTXlwYUVUMGlMdGIwNUxYOWppcUhMeEpWSjQ1VE83YStO?=
 =?utf-8?B?ZUlBRlA0V1pBNUF4bDhmVFVSYnpzSjFiK2t2RlJYc3MvM0RQSUxNU3JtSkdx?=
 =?utf-8?B?dGhKZWNtVkdCMHNQTCtzTVFjS0l2RGQ2M0RrNEVBUXVIb0xESS9oZzNVK1Jj?=
 =?utf-8?B?L20zY29TZnNkNnpVVVZRMTE0cVVoNHN0Z3pKcE1jTE1UWkhBSXN2QjNDMkxa?=
 =?utf-8?B?ZkhRYTA0SUpJcjFWeFdJbG5SR01ZY3gzLzl2STBZM2FuVmVtQUJlb1ljQlFk?=
 =?utf-8?B?alF0UjNyNzRlU3kxejdqYTJmd1hmN25rOUE1aHhHeHdSb2hYYVhaczZJUzFv?=
 =?utf-8?B?OFAvallXajgwRVZPVTBxejlIcGJPTnFxS1ZzdnRFdU1Ec0dadjY5UnBvRzYr?=
 =?utf-8?B?UU5SZnlHTnBWSHFVQWdkVC9RdWRRU2M4VkVVRjZ5a3ZKVnJGT3gybnJrZ0l3?=
 =?utf-8?B?N3RyMDRzUGNOcmlmcW5XbnI3ZlNuMWltSXBla1cwcWV0R0h3a2hMMHdBc0hK?=
 =?utf-8?B?ekJ3K0xRa3FrQ2tqajZhMU05eVVPYTIxK1VqcmdqblhPQXpMOW1DNnQwSTJx?=
 =?utf-8?B?T1M0dWNGbWtublZlOGJucVV1aDU3a1FMUDhkSkMyTWxIV0Q4Q1prazEzZmhB?=
 =?utf-8?B?QjVTMEtmMEZlakN1R0ppV001NVV4by94SFZEM0V3YmdNWDhRSGRNTjlIZWN3?=
 =?utf-8?B?UDdQSUNFVm1oRUIxenlZcFBNZkEvY0tiS0hOak4walltWnpFbGREY1hPSkdm?=
 =?utf-8?Q?mAJDvfgdpKIRVCcw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d40750-ca28-46b3-850b-08de5f935818
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:05:57.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF/CwQztSduuFNXlShLmF+7LIIw4R3nVE9E9eNQXVu6ycr7q9+n54N38wKpOcKbr7xkbBqOk8lSYivsNpUT1bk5EYVsALJmFz1rW7JsxwfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11525
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_160604_688491_3D198E1F 
X-CRM114-Status: GOOD (  23.94  )
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


On 1/30/26 01:15, David LaPorte wrote:
> [You don't often get email from dalaport@amazon.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Macronix serial NAND devices with continuous read support do not
> clear the configuration register on soft reset and lack a hardware
> reset pin. When continuous read is interrupted (e.g., during reboot),
> the feature remains enabled at the device level.
>
> With continuous read enabled, the OOB area becomes inaccessible and
> all reads are instead directed to the main area. As a result, during
> partition allocation as part of MTD device registration, the first two
> bytes of the main area for the master block are read and indicate that
> the block is bad. This process repeats for every subsequent block for
> the partition.
>
> All reads and writes that reference the BBT find no good blocks and
> fail.
>
> The only paths for recovery from this state are triggering the
> continuous read feature by way of raw MTD reads or through a NAND
> device power drain.
>
> Disable continuous read explicitly during spinand probe to ensure
> quiescent feature state.
>
> Fixes: 631cfdd0520d ("mtd: spi-nand: Add continuous read support")
> Signed-off-by: David LaPorte <dalaport@amazon.com>
> Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
> ---
> Testing details:
> - Instrumented feature enablement and verified fix with affected Macronix
>   serial NAND device:  warm reboot without patch marks all blocks bad
>   during partition allocation; with patch applied, device registers
>   cleanly with no bad blocks marked
> - Patch cherry-picks cleanly to mainline v6.19-rc6 and builds without
>   warnings
> - Boot tested mainline + patch on aarch64 host without SPI interface
> ---
>  drivers/mtd/nand/spi/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index d207286572d8..1fb05ac8678b 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -859,6 +859,7 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
>             (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
>              engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
>                 spinand->cont_read_possible = true;
> +               spinand_cont_read_enable(spinand, false);

I think a comment should be added here explaining why you disable
cont_read here

>         }
>  }
>
> --
> 2.43.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
