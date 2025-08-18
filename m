Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92ADCA0EE4
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sIDiKt9wQGcf6XzG5ZLUNYPajcmJjev0iDx8cmcb23w=; b=qVBCrhcfyEe4iXKqetGk8o/2jG
	3WreanT1bCwQ7+eznICbUPslOncIvXQjcmPAyb50svYJaS5TsZZCBdkmPMeUfzj0xvMAUUWaW7+XZ
	3lVBLUKOY6Bat1UZ1YqhqpC60BVU0UvS2p44LsZi2zuR7q2sbKHlHQtOebgWy0Jl1oAu56X3ouWe7
	A70TKwzSp+q6Kpmitbya9ZKMViUcK9B3fIEOmqK28F8pwDh6pI4BnHuMBaZIyq/ufiOnpj2GBBegM
	5XN8uXI1l+fVEqu0LE3txpa3AKbJoQk7TBbRQottUUhlpEvDeX6UVvpzvIeqAFwlq39CFPkydoCPu
	Os5tv3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08E-00000007cMi-1bO2;
	Mon, 18 Aug 2025 13:42:38 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyc9-00000007IP5-06nt;
	Mon, 18 Aug 2025 12:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzWP15AsvCt/pPzUNvUiiwyAGclaGONSVJdCPi7itP7gUfY0n7/GbS+uZQaAAgSiXL9SKohSmMYAkylIL/d+bLy5xuh7eQPAeU4OyCD/uQIcCoPLf3qc467QfsfoPpP4EzIRZ0+LgP6akZBEIg62H8w+uITPbGSmqsi7HB1OIF8e7oaIpbyOQhbOzMg8Zw//GJDFAjeScJzy/B8JykU7jSw6zoUESE28NXSJ9hqL9yOVJdFF6DBqraYroNmQEWKuAv5mmtJ6XmQGHneHn+GJjT5JhJNVVcilP0M8K3KUhcUfE+FpIdQ6fxr66jIIkB71YZR4CoVilG1CA/7cQWCLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTmFJhPF+oiw+va1PTaiJPshwT3PYmI+a4u0mhlr+pw=;
 b=sIs9buqktnZEzh19FdQIxLleVmLOtrpFPV7CYCyOCvonv4VCJ5KVkTi8Mtm6MDnNfgV2DQVanW1y3phJQ0qQoEqz+uAhMnfNra4zlJSVCZg4NWC+NXC9RjXXGYQR+YrffKca4OqpjQWJ7X8MK0OuBlStmlQAo+aoGhONh+E9ghpH/FUlIdTIvzgjQGYyCZARB7hIDRl69V1DH7uRT+48dUOSKt+8ZkwXZj8C0Hlsy9Bmqld+dTQdcRonkq1OstLXIyFNmGtAnHX+sXy1QGNu/zksxLq3Ah5mZVKaU/YtsgLToYrLJFURiztTT2aBubknzSP70ic3qotjcBuocaPM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTmFJhPF+oiw+va1PTaiJPshwT3PYmI+a4u0mhlr+pw=;
 b=BVtMOFgLBgHOnclNPtfzNK//VyYFnwi/mute/0Ua+g6z+GyYtpnetCXP2hsn8zrSZzrTe5y1qLclXKQcFyBLdTA4nv0b3JwOwdbxmSe/SUpgMKlWEur+3qkpTQYpgztCVW6o4CaeNWDZHBZeP+mSgqpiobmOw5oePponKzM6FOAXFXja3DVBlCMcX80053SwiGrvTflAicFqqMM90GPU66raJLvI9JTtsBQU5YVgkv/V6AWWijh6x0NgmMZxIruP1kqRb7a8ci/3mfgf88fxmDKEjBPOSZPL20dtUOzZLj1ahF1rKZUK6Ih/8A9FZKz59J4M1a+zkkvLC9R5dvoG0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 12:05:14 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Mon, 18 Aug 2025
 12:05:14 +0000
Message-ID: <e01d40c2-cf1d-42f3-8589-da998b23901f@iopsys.eu>
Date: Mon, 18 Aug 2025 15:05:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drivers: mtd: spi-nand: repeat reading in regular
 mode if continuous reading fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Martin Kurbanov <mmkurbanov@salutedevices.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
 <20250804192132.1406387-4-mikhail.kshevetskiy@iopsys.eu>
 <875xf1hjb8.fsf@bootlin.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <875xf1hjb8.fsf@bootlin.com>
X-ClientProxiedBy: GVX0EPF00014AFA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::30b) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM9PR08MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f827c82-7180-4cd6-a28a-08ddde4f7cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDZwSFZRMFB6ZmFkVmNPY0FzRFdTc1lsYkxmRnlHdGpTbDYvSldNQUgrT1RZ?=
 =?utf-8?B?c1ZSN1VCdGZyUG15SkVuQitRdWZFaktvVjlOL0JhZnRKN1B6ajUwNWZRY3VM?=
 =?utf-8?B?V1cvM1B1YzZ6eTVoOUtoOGYvdnFveHdJRXBWWGxWc3VPeVhFeWlESDZVdlIw?=
 =?utf-8?B?cHFJbmE4NHJFNW1jbmp4ampFY1AycU1GRjB5QUFlalVrWUE0T2U4N3pZYjRT?=
 =?utf-8?B?VlVaZXVxSlRBNDQ1T3g1RlZLeVBzTXkzNUFNSUpzczBVUzlzMzJIUG9QSUk4?=
 =?utf-8?B?WDM5RW1aU2tPVnZ6NGNCOEJlMWtLU3JSd3hWVnpScTlPdVVZL3dtMTU3K0Rh?=
 =?utf-8?B?MXI2ZmZCeUtBc1lSUWJjYmxJeFQvUGVES0xmazNNb3Y2REwyem5IQlhiWVF6?=
 =?utf-8?B?aGIyQnZ2b1dMbStKTzAyM2VaYVJmRTM5UEMrVi9EUGpFb3UwREtDQmpZZUhp?=
 =?utf-8?B?UnVRMDB5RGlxYUJzYlZWQ05YMW90QU5uYngwazRKblZJTjJNaUxhelpCeDNZ?=
 =?utf-8?B?WVJUUWVvbU1SSWl6WEhmUXRJOVFHOGFLVlNvYkp0bjYvamdNaU9ZYVZxSytp?=
 =?utf-8?B?SlFBNUpwL0NFMXNoVjQwR1U4aU5DekhvME5tb1NvbmZ3VU1oSVY0MWZndHM2?=
 =?utf-8?B?SEZ2U09OeFc4OTI4NHFFTEk1WDVYRE5KS2NBYWp2aWNxVUplT2JhdURHQ3dX?=
 =?utf-8?B?TTFBd3N5Q3NUbFZUaFE1YUFJTFNOMWNMeUxrUnpod1FtQjBrZVZmMW5sT1lN?=
 =?utf-8?B?a3doZWZtaEowcE90Q2VlOFhCczN3NXBaRUdnRzlvREFtOWdDU3pMc21tdGp2?=
 =?utf-8?B?M1VlZEtPbXJmOWl1TVF0cWtXRjhnTzRYL1lveVlRVm81Q3dVODFUMUNTM09v?=
 =?utf-8?B?cU11WDVrTTE4UFhQbDl6cEY3c09zKytiekRzdFRyRzRtSklyd3FBOFZxRVNL?=
 =?utf-8?B?T3kzMkhnclFUdVN2SmpiaUJTeXMrVWlqVGRPeFpjcXNsWGtvbjViL2pFSnB1?=
 =?utf-8?B?NVFxcStuMysrS2ZMSGFkVjVIWDc1N2ZMVTVCSmF3OHBTSjRMcmlvTW5UYVk3?=
 =?utf-8?B?S1pYOTZqMVB1R0JML2RZdDkySHdVRXVpU0V5endsTWFvblgxSWNsMm1kUkNU?=
 =?utf-8?B?bWxLRzdRM2xRd2VSc2o5ek5MZk12QWNESEpFeE5xQTBFN3VlWG5rYWd2OHlS?=
 =?utf-8?B?NUdmeEo2b29yWUdMbzcwc1Uvczd3REIxeUVneCtRVzROTzBIT25Ja290KzVq?=
 =?utf-8?B?RXBPZXJHS2U0a29EUTloNjFXS05ZOFowL252TVZuckRsSXphNjVZeWlmeWJU?=
 =?utf-8?B?SVJJdE00L2xvSzl2VHhtY0src0x6R0RFaVhJeGlUNEJsR2lsTlBPeHY3WHVn?=
 =?utf-8?B?M2hya0JsampGbmd4TjhuZXFURmszYXl3N283V3V6Tk51MFlzdWRhb1JjUDJq?=
 =?utf-8?B?WmgweDhkL1U5S3Y0RkdSTVZ0ejJoQTBYVkl2Nm5YTGtnc01BZzB6clJWWU9R?=
 =?utf-8?B?KzJMVU1EZVg2K2xnbWxmdVg0cFhOMm1acmllL0lBdWI2REU4ZGhnTzFxSWhy?=
 =?utf-8?B?NkxyeHh1cDZYdU1TK0IwWlhnYndYNlV6aGd4SjRXN0hIbExTOGF2OW1JMkRB?=
 =?utf-8?B?Q1luOVI2aFRpb2JxaWljTUR5VmhuTU1RU0NwMjRpVisrZjRIY3dRMldvdllo?=
 =?utf-8?B?RkZKdWRzNU9MRk5FM3c2NElheFQrbm90SGNBZlRlYURqVVd0bDY5MHZIOTRD?=
 =?utf-8?B?eDJBOUpBdWp5T00rZ2d1R0Jsd0lYZVc4UENsU1RQYkFvRm0wNUZDZHN0bHR2?=
 =?utf-8?B?OU9WTWlNbE9NM2N5dS9JWVFkczkwdEVnQUR0WEFMY0dEcUZlVzdyay9QQ0ZF?=
 =?utf-8?B?ZHZ0dkN3YjJTTkdxM1VXLy9GQjJPbi9mLzZMUDVkTktDNzFRN012OUE5SUJN?=
 =?utf-8?Q?QCleQA3Xxo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWpGY0tVVUV6Z1NNejdaRWowdmd2NGJoZzBVTWRlTmw5VW55V1hHUUNUcWl6?=
 =?utf-8?B?K2lEZTRzOXhJVEZEOG5qc2h3YzRCdlFKc1BBd1JudFVXckRENlhadmM2RXZI?=
 =?utf-8?B?ejExTm9ZL0xzR1J3TG5jMkpweEwreEo3eWIwcXBtTGZkMXJLS0d6TnRFajJm?=
 =?utf-8?B?b2VkOFMxd1lqZnM2U0FHcVNmek93cWJsdFR4cUFhb3BVVGkrblZVRlNTWlJw?=
 =?utf-8?B?dTMyNHBSbjBYRHJVdnFQMGZ6WDdkOHlISjlUZlIrQVgzRmQ3aUtIMnBrU0x3?=
 =?utf-8?B?RFlPeXpYOVRERmF2VEo5YU5nNlYvaWlVeWRRaEdvdHY2dUNrRUpicEhjaGxy?=
 =?utf-8?B?bC9NSFUxUXhHUGNmamdDY0dldVVEaFFFbmRseXlRT0c4Zm9mV0o5QUYzbmpN?=
 =?utf-8?B?NWFnMEk4QVp6WWF3OW9YeGJVK2s5KzREUHZCRy93cVRvY2svSW1QcTBrK3gw?=
 =?utf-8?B?VWgzRDZSS2x0SVpKelZpeXF6U1J6S2VWYXRHc3JNYXlaa1hlK3ZRcEtSTWgx?=
 =?utf-8?B?bTBTMjJta25ySkpKbzFxMXQ4dWYrYXBDL3o5U0JFdjdvdlVhcjB0ZzEvSDlW?=
 =?utf-8?B?cnJDbi9meTVYbE5uaXdjQkRwS3QzWnNaVzhkZXl6c29uN2NVa0t2V0JpZXdK?=
 =?utf-8?B?OXFhMWNSTnNqa0YrQ3JkdS8xMjRDMlJ4K21odjNCYXI3THJ6TFY5S1FtZ1F2?=
 =?utf-8?B?S2doaGIrdzM1N3RJSWxTRjQ0Qnh3QzlvWkdMaXFIbUV3VG9iVVpNVmxXL1VJ?=
 =?utf-8?B?TGZkWDdwRXlWaSs4cnBoM2x1T2txVGpUZkRlenNDa3dnYk5PS2lSU0dNY2pa?=
 =?utf-8?B?cytka3c4b2VtWWFjbEEvczBzUTR5Q29acDUvMmUvUU5XQXA1bytqdy96bmgv?=
 =?utf-8?B?VUZXYllqMGZ2a3UxRU9LaWNuNVNjYndJejJ1QjRFVVF5V1FGNXR1cDFGWnpN?=
 =?utf-8?B?K0VaTEJIZitxaG5FWG9uRHROOVc1SWUxcTE5bDBtQWZZajBHbTVUalpZN25v?=
 =?utf-8?B?a28vTXFVcFREQzdocXZOZld4L3VLZ2hTaXRydHQ0YkZCbG5BRDhPajMyeFBF?=
 =?utf-8?B?Y21VaXUvYnFmc0xqaFVJeEhtZmFpNWtaQ3JXR0dVcDF1a2IyZVNXeFJiYWFq?=
 =?utf-8?B?OWZyd0MzRHdwUWViZkdNeVFDdy9mVTlrM1dFUHlITVFPc0hYUUtmb3kyclRT?=
 =?utf-8?B?RXRZdkgvNEh0eDM1Tm1FSTBkMUdBL3kvNkdmVS9aa29pL2U4ODl2eGE5VzlE?=
 =?utf-8?B?TTY0alo2OGhJSnlQMHZZZnJZeHVNL1RhMjdiVTVNNHVSZjB1WEhRNk91VXNt?=
 =?utf-8?B?TTVuUDlOYW5ZeVJlNTNINDFaY2RYL0RqOThxNm1Bdk1BSWtiVkhUa3UwL2o5?=
 =?utf-8?B?NDU0MERmdWltdkoveFdUT3lReGN2Y2hMcThoYWw0dys5eW45cDh5cTZyOGlt?=
 =?utf-8?B?NWVJejNmYXB4UWp1SXRKSktpSC9jb0VIVzVlMXYvVDd2a3BEa2E2MWpUT25Z?=
 =?utf-8?B?cUNsVGRmN3RpZCtWVDlYcXEyZ1VsSUN6VDNFc04xcFpFcDUwZGpFeFNycmM3?=
 =?utf-8?B?UlAyRUQybm5pWTlzT2lLYkwrRDY5c0RZeHQ1d25DYzZRVW9hNlUrYVM4STMr?=
 =?utf-8?B?dWVsRXdoQ2UzWndNZ2FrYm1XZzh3ODVmU0tBeTdSUjZzQnRJWE5rZGpJV1FS?=
 =?utf-8?B?NmNwQ2NZdHYrbkdROXpobUptdlZZMWxWaDJLVkFnTzkrY1VJVjZORXFvWHVw?=
 =?utf-8?B?ejVCQjFsd09TcERuZUwwSmo2dnNYZlo0S05mT2wzeVN1UzFpdVk4a1lTYkpW?=
 =?utf-8?B?VFRqTFJtUEZVM25iWHNyd3B5ZlhiM1k4VG9KOHZWTW1qZ0VvbVVoNW5QcHFl?=
 =?utf-8?B?Mi9WZDNReEVvcm9KckZWMDdWdnZFTjAzMEtDVk1iVVZ5NXlWeDQ0WU9SL09T?=
 =?utf-8?B?Y2FHT2NpRlVZWEVlSCtrVnZ6d3JxNEtEbXhHNWFqdVRTQlZud1ZHQ2FDcVNZ?=
 =?utf-8?B?WHdlSnZFMEN1WktGclMyOHVzNXd3VUd4b1ZabnBWeWZ3VXBhSnp0T0pDSFlx?=
 =?utf-8?B?VDRzdGtwWlM3YUJkeDhScGFGWlhnZEhmZWZZaHRCZ2s0ZlNWMU1EdHY2dzM5?=
 =?utf-8?B?WEc5RWl5T1pGZk8ydGZrMjNrYjZRamozT25SeVlrSGV2a0I3T1dCOVp3MGNN?=
 =?utf-8?Q?xzsI/iyQ0qel27b4X2rjXUk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f827c82-7180-4cd6-a28a-08ddde4f7cf7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:05:13.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omtVsF8l9s1iL7SaaNiyPUPw/BOrR1idRX6ZK0tIIe/R/b3vsvVhOXPL16OUj3c0k/c23t7BxVY1KpbbtVPKrfOv2tCLEXNjuYDTZRst+wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5988
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_050526_013878_ABE8B7A9 
X-CRM114-Status: GOOD (  18.57  )
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

SGVsbG8gTWlxdcOobCwgaXMgdGhlcmUgYW55IGNvbW1lbnRzIHRvIG15IHYyIHNlcmllcz8gTWlr
aGFpbAoKT24gMDUuMDguMjAyNSAxODozNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiAwNC8w
OC8yMDI1IGF0IDIyOjIxOjMxICswMywgTWlraGFpbCBLc2hldmV0c2tpeSA8bWlraGFpbC5rc2hl
dmV0c2tpeUBpb3BzeXMuZXU+IHdyb3RlOgo+Cj4+IENvbnRpbnVvdXMgcmVhZGluZyBtYXkgcmVz
dWx0IGluIG11bHRpcGxlIGZsYXNoIHBhZ2VzIHJlYWRpbmcgaW4gb25lCj4+IG9wZXJhdGlvbi4g
VW5mb3J0dW5hdGVseSwgbm90IGFsbCBzcGktbmFuZCBjb250cm9sbGVycyBzdXBwb3J0IHN1Y2gK
Pj4gbGFyZ2UgcmVhZGluZy4gVGhleSB3aWxsIHJlYWQgbGVzcyBkYXRhLiBVbmZvcnR1bmF0ZWx5
LCB0aGUgb3BlcmF0aW9uCj4+IGNhbid0IGJlIGNvbnRpbnVlZC4KPj4KPj4gSW4gdGhpcyBjYXNl
Ogo+PiAgKiBkaXNhYmxlIGNvbnRpbnVvdXMgcmVhZGluZyBvbiB0aGlzIChub3QgZ29vZCBlbm91
Z2gpIHNwaSBjb250cm9sbGVyCj4+ICAqIHJlcGVhdCByZWFkaW5nIGluIHJlZ3VsYXIgbW9kZS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogTWlraGFpbCBLc2hldmV0c2tpeSA8bWlraGFpbC5rc2hldmV0
c2tpeUBpb3BzeXMuZXU+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwg
MTkgKysrKysrKysrKysrKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gaW5kZXggZmY2YTFlMmZj
ZmRjLi44OGU0YzAwY2NjYzQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gQEAgLTQzMSw3ICs0
MzEsNyBAQCBzdGF0aWMgaW50IHNwaW5hbmRfcmVhZF9mcm9tX2NhY2hlX29wKHN0cnVjdCBzcGlu
YW5kX2RldmljZSAqc3BpbmFuZCwKPj4gIAkJICogVG9nZ2xpbmcgdGhlIENTIGR1cmluZyBhIGNv
bnRpbnVvdXMgcmVhZCBpcyBmb3JiaWRkZW4uCj4+ICAJCSAqLwo+PiAgCQlpZiAobmJ5dGVzICYm
IHJlcS0+Y29udGludW91cykKPj4gLQkJCXJldHVybiAtRUlPOwo+PiArCQkJcmV0dXJuIC1FMkJJ
RzsKPj4gIAl9Cj4+ICAKPj4gIAlpZiAocmVxLT5kYXRhbGVuKQo+PiBAQCAtODkzLDE1ICs4OTMs
MjYgQEAgc3RhdGljIGludCBzcGluYW5kX210ZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBs
b2ZmX3QgZnJvbSwKPj4gIAlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBtdGRfdG9f
c3BpbmFuZChtdGQpOwo+PiAgCXN0cnVjdCBtdGRfZWNjX3N0YXRzIG9sZF9zdGF0czsKPj4gIAl1
bnNpZ25lZCBpbnQgbWF4X2JpdGZsaXBzID0gMDsKPj4gLQlpbnQgcmV0Owo+PiArCWludCByZXQg
PSAtRTJCSUc7Cj4+ICAKPj4gIAltdXRleF9sb2NrKCZzcGluYW5kLT5sb2NrKTsKPj4gIAo+PiAg
CW9sZF9zdGF0cyA9IG10ZC0+ZWNjX3N0YXRzOwo+PiAgCj4+IC0JaWYgKHNwaW5hbmRfdXNlX2Nv
bnRfcmVhZChtdGQsIGZyb20sIG9wcykpCj4+ICsJaWYgKHNwaW5hbmRfdXNlX2NvbnRfcmVhZCht
dGQsIGZyb20sIG9wcykpIHsKPj4gIAkJcmV0ID0gc3BpbmFuZF9tdGRfY29udGludW91c19wYWdl
X3JlYWQobXRkLCBmcm9tLCBvcHMsICZtYXhfYml0ZmxpcHMpOwo+PiAtCWVsc2UKPj4gKwkJaWYg
KHJldCA9PSAtRTJCSUcpIHsKPj4gKwkJCS8qCj4+ICsJCQkgKiBTb21lIHNwaSBjb250cm9sbGVy
cyBtYXkgbm90IHN1cHBvcnQgcmVhZGluZyB1cCB0bwo+PiArCQkJICogZXJhc2UgYmxvY2sgc2l6
ZS4gVGhleSB3aWxsIHJlYWQgbGVzcyBkYXRhIHRoYW4KPj4gKwkJCSAqIGV4cGVjdGVkLiBJZiB0
aGlzIGhhcHBlbiBkaXNhYmxlIGNvbnRpbnVvdXMgbW9kZQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGhhcHBlbnMsCj4KPj4gKwkJCSAqIGFuZCByZXBlYXQg
cmVhZGluZyBpbiBub3JtYWwgbW9kZS4KPj4gKwkJCSAqLwo+PiArCQkJc3BpbmFuZC0+Y29udF9y
ZWFkX3Bvc3NpYmxlID0gZmFsc2U7Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gKwlpZiAocmV0ID09
IC1FMkJJRykKPiBXaGlsZSBJIGFncmVlIHdpdGggdGhlIG92ZXJhbGwgbG9naWMsIEkgZmluZCBw
cmV0dHkgdW5yZWFkYWJsZSB0bwo+IHBlcmZvcm0gdGhlIHJlZ3VsYXIgcmVhZCB1cG9uIGEgcmV0
dXJuIHZhbHVlIHRoYXQgaXMgYW4gZXJyb3IgY29kZSBzZXQKPiBpbiB0aGUgaW5pdCBzZXF1ZW5j
ZS4gQ2FuIHlvdSBwbGVhc2UgcHJvcG9zZSBhbiBhbHRlcm5hdGUgaW1wbGVtZW50YXRpb24/Cj4K
Pj4gIAkJcmV0ID0gc3BpbmFuZF9tdGRfcmVndWxhcl9wYWdlX3JlYWQobXRkLCBmcm9tLCBvcHMs
ICZtYXhfYml0ZmxpcHMpOwo+PiAgCj4+ICAJaWYgKG9wcy0+c3RhdHMpIHsKPiBUaGFua3MhCj4g
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
