Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A4ACAC5A0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FhYIn6Y0xbmwVrlUvvR+ZLAlJ8XvI2n6ORckY8ZGqsY=; b=wfO+lndoMWOegmCxVWZ/YkISaE
	2tYbzuoeG/TnsE/A9TDFund71QX8TI3f+MXYHmJuHGPk0lQkq+ReHsQoYNfxEZcbG4H48x6ezpwMz
	xNt7sdvmt1AohaSPDMn8X/5MND7Pq7zLySdkhatQ4LbEu4ZsBIAKoLGHLfUqGealaHPlVY0pzjzXv
	pcNMEnSO1/n5IJObxWGCEf8USsuKlvkZHNBP/tvuAd7TrD7UAayUQMUOxxbSXoeyhQxTKsmo9evsZ
	VedcSy+xTvnt3Zah2y4/uhfpOlyPGRkkc6tlO7zQCIAtO3q9YNwcy5tqI626WFHjcTEtvUHIqRbPZ
	L/JLa8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDR7-0000000HLDN-2FUt;
	Thu, 18 Sep 2025 12:08:29 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDR4-0000000HLAa-0dHE
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 12:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIAvTr2902DPv+r5NrwzQhZzQcVuzEx1TsPikafGjUsXZtYtipyFL2T0+asX5wGDUGN/lCYIy3EtRGCI587TTFFgcXC93JiLBWP16f5ZYK3ZfM/CgjKZrH1Z0gtYlhpOVXPbOrl8V23Ee9NGsy05Sa8LiIXYm2XKOH8vm3gUzd/ZpmUu1eEL1uumgyyyDYiRsOrThE8lpClucK8ho9ZLnspfbtUyNqbfo1aSYCSKmoesA3UXxSyCNlbRZ520DPxKc7AMqM6hMIY17yK4mL9q0Ioz/31ajtFKTxh8Pli3kEp9u48czwZ48hOdb99FmLwAAueU4jzXmysE3orOVy28yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XRuakgGS7MS1DUa76sT8YDQbCbAkRY/vqfxd1g3Lfw=;
 b=m06g1RtB+5LZy4yOsiUcIWT8khMJNLlk0mA6VPEvTcJqu6fQOQr9gFXFTncxHiFlZsG3JwWJQaY+7EZ530AuotRhMKuNcpTyQl5f0o81rvdmrbr2KeB5bXPavTEn5YN0kZ/V7MWHAbB6sf1f3oSocowFfI+F2vnDYRPZ/C20apUTtNAbN+CuNmbmOA1V7nlEqdIJJGB8AvwgQw9b7aEwedey5bgw0QhfiHmZLzdUc9Z6KZGYhgAbeHwRnhiGaYUzmMqVFjBnBZXHSRIVGxiDj310pniO7xz9dsVJMQOVTNyY7wwfq+smO0duWalrzbOR5MIbmmRdfDvFLE1Iotur2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XRuakgGS7MS1DUa76sT8YDQbCbAkRY/vqfxd1g3Lfw=;
 b=6roj5/fZd6wjtcK0veZ+RcwK81BLczqkFqyVcGsNVenm6aPt2AWA/EUupUbrvnt6yHqG8zOB+Hy4gexqIIZFIbrOhY6334BcNefozu/ZlOTcOa6k74THe/0ceXa01QZf2gvByKzZR85m/vL9u6KGn0HKyQi0Eh1cphkJnblxqZtTUaSRiHfYJKLlYzn6hSAmzhQ1WA6SYB6gXtMVxtMWwgFXdCcbvhxrm1XOxSAaJ0k/IQ4N/MH9dUPTiyUxhPRuYjGAknChTYaHvbdHdcfNFph2AiEUQpJ03vovnjwLt5A9Z9hInnG3dpqDuHvocEkOiAuj/TwxOpTzeB+pvM3DaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB4SPRMB0004.eurprd08.prod.outlook.com (2603:10a6:10:37b::5) by
 PA4PR08MB6173.eurprd08.prod.outlook.com (2603:10a6:102:e5::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Thu, 18 Sep 2025 12:08:20 +0000
Received: from DB4SPRMB0004.eurprd08.prod.outlook.com
 ([fe80::6ef2:b085:9647:3e44]) by DB4SPRMB0004.eurprd08.prod.outlook.com
 ([fe80::6ef2:b085:9647:3e44%7]) with mapi id 15.20.9094.021; Thu, 18 Sep 2025
 12:08:20 +0000
Message-ID: <7ba32b86-77bd-42b1-97fe-136a01ab2917@iopsys.eu>
Date: Thu, 18 Sep 2025 15:08:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/3] mtd: spinand: fix continuous reading mode
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Martin Kurbanov <mmkurbanov@salutedevices.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
 <87h5x0180b.fsf@bootlin.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <87h5x0180b.fsf@bootlin.com>
X-ClientProxiedBy: GVZP280CA0079.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:274::12) To DB4SPRMB0004.eurprd08.prod.outlook.com
 (2603:10a6:10:37b::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4SPRMB0004:EE_|PA4PR08MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 974d043f-0458-4682-8764-08ddf6ac0ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFN5TmNlT2lYS2FBSkFiWXFrZk9sRkVkRmpOMHg4eS93SHFLS09LaHNzSnR1?=
 =?utf-8?B?T0lPT21SdDdYcnJId0ZzNDRzOXo3VmV3a3NqVTN2UkIvdHRyTWk4cjdLZlZn?=
 =?utf-8?B?NW9HYmNmZ0hHaWVIR3BraWFKdUJacHUydlNOd1ByZ0xtMkhNdVpvZTVmVC83?=
 =?utf-8?B?eW12ZkxCVys1eTUvS29KMGtUQjJwZy9QNy8zRjl3N01EOFRTbXdhMEs0YjlS?=
 =?utf-8?B?QzdxS1JUaXIrMVFIRXRSeWYybzJjWnRERlBhNFdTTzM4QldlOWE5eWxjZkxr?=
 =?utf-8?B?SU1sbWVMRm15RVVTa2F5V3lhWVpvOFQ5QkI2TmdFZ0J3L1ovOUlQRzJIK0Yy?=
 =?utf-8?B?SjVDWFA0ZnQxb2lRWnVTSWs3VExuV2EveFZCbWprSlRKZzNGMmRKU1FScTY2?=
 =?utf-8?B?UWk4MHhuTkx4aHhWWE1LNURaMmhWbVFySi9Ocm9BOGUrK1VPN1hXcXZ2M1Fn?=
 =?utf-8?B?Mm8rUlRIaUhVbDFvMDB1czFGUmFwV3AxRzEyNVFkdjYwM0h0bS9Cby8rSmFO?=
 =?utf-8?B?VXVZdnBzbzB3TS8rUUlpMSt4a09mN2dKcUp1U1hyRUVnZTQvbDlTbHZ6QWQz?=
 =?utf-8?B?TTZyRzlyZzRtMFdIMGQ1czRUU1czZjVkb3VGVWIxbDVMSVBqS1ltNGhQL2NM?=
 =?utf-8?B?TUJkUWxhcUl3dkk0citIR0FKenF0Q2tjd0ZaaU0yV0FGRDRoRWJQNWxYakph?=
 =?utf-8?B?dThPRWRPMGJtSi8vQ2dmOGs4NCs3bE5va2VORmxmQld3Q2llUS9yOXR1UVRo?=
 =?utf-8?B?UGNHeGdJV1dBMFY5R2lRZjd6WE5TOWpjeHpNK1Q1MGc0a2hBTmN2STkzbHJG?=
 =?utf-8?B?OEd6MW9hdjlOb0VTckpzSDMrVWFzRVlxRW9QcktHRmxXNTdDZWd2NllvSVNY?=
 =?utf-8?B?b3BXaTFGSWVDQ3JzRFRycEFrVklxT1NDK2t5YUxGOWdGNXkxcWROUncxWkE3?=
 =?utf-8?B?NlBET3VKT3VkMmxjNU1jRk5XQlJvQ29jNWVXdEdBM2sxZXFhdVF1SHphUmJE?=
 =?utf-8?B?bFZJUWhJc1ZBRzAvdW1KRFlsSUZwN0t3TEgzYVVNODlRZ3RQQmsyOUxaUFlz?=
 =?utf-8?B?UFhabGlsS25PeG81cEltUFVVa0E2VDJTMDh1UXVHR0hvdWZ6MlJJMjZuSFpo?=
 =?utf-8?B?aUMrV2UxcmpqSXRpUURwczgyQmxIZ2pSd3JER1B0RzQrQ0NuY3ZQc25YSE8w?=
 =?utf-8?B?Z1lObHZxNjUwbFlnUEZGTml6c2FiSHk3QUpHNU9sQnFTODRIRm83OGRyM0dr?=
 =?utf-8?B?VTZoajlTbjV5bUkxcUxBUnVzQlhXOEtyTUUzN3pHZkM5dmcwSjV3M2s5RUNk?=
 =?utf-8?B?ZVNQSWRmd0NkMHIvRHo1RERvSitTT1BGcFZ2M2hIVmo0Mk12Mkg5MEM5SEhM?=
 =?utf-8?B?NDdtYnRLcjNlRVVVMy9lWElXL05HRmwvbzZ5Wk5Ra3NZQ0xMVEs0RXh2UTJD?=
 =?utf-8?B?eGRpanJsVzQwcEk2L3Uzb1FEamM0WVB6Uk9mVDEwMW5JdjhobWhaR1YrTUox?=
 =?utf-8?B?MFNVUHJ6RlIvUzJDNitPMXpYdi9IVjNWVDNnUEJkeTE2dWZrUDJ4NXpmb2Rw?=
 =?utf-8?B?QkJVUW1uZjhzQ1I2RzhYeG5ndDJlMHNWWmxrS2Vtdzd1Q3RyYVVkLzZKUUNk?=
 =?utf-8?B?UEl4RCtUOXhmZ0lPbE9DUW1CSjdTNWhPTWtxQ0hnY0xTY2lGeGc4cG5vUjNz?=
 =?utf-8?B?eXVPMWFEQ1lFT0VveUJQcUtoUGNhU1dqYkZIQ1VHM1EwY0xyWXVBMjl6Skcz?=
 =?utf-8?B?WHYwWi91bytnZGVIU1p0NzhsNGI5R1Q0MUxKTVJaeUg0ZlhUdTh5Ym5MRWVo?=
 =?utf-8?B?aHFoa0t3OEM4WHBiViswNzZsUU5kNldlU015NXI1VVcwdlFwQ3ZlMUcyc3FO?=
 =?utf-8?B?MlhvTjNKd1NHUVFUa3pRVHhzM2oxcG4wbDRhOVk5RFFGTTRhMWxBNU9hQnZV?=
 =?utf-8?Q?s0tUycJb/hs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4SPRMB0004.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNwWmI5Q3J3SURhSWs1RnFVZE84cnJiQTZ0L0duN1FTaG9HS0VGRGcrdXEv?=
 =?utf-8?B?dTJnSlMrTFB4U2E1QXcxdVN1bXhpaFA2T0VnV0FKQTRjb1RwZE1QNTRnblp3?=
 =?utf-8?B?dll1ZFFMLzlXVzd5T1JkYnk1L3FYQ1NRSGF3THA5QThvNWc2aDBYS1k1OUZh?=
 =?utf-8?B?ZXFmMTNnbXF3c2htbjdrVDFLQ3YyRXZvMHhXVEtvWXE5RXlkVUx4dld3TDZn?=
 =?utf-8?B?ekVqdHpHRUtCTlZjY3plcjh1OFZxUFA2Y1JxRmtCRnd2OC9tcUgrdWRjZnda?=
 =?utf-8?B?NHMxaGEvMXkxODFOZ3RycTdrblZCREwzczRncWlwbEc1bG12WUYrZmtiaStD?=
 =?utf-8?B?VWJ2bkNId3hpSTFXZ3dycjZ5Zk9IZWUveVl3S09ubUlKaWdqWGxIRWtmZTNP?=
 =?utf-8?B?NzRDZDNUYTd6ZEM3UjRSMkxkd0EwWlVoYVR1K0VKMmovTTV2UTdFMk1uL2ZW?=
 =?utf-8?B?cUpmYUpIdzlhd3E4NnJuc2dKNC9oWlpJNkE0eDZNN2hrRFN0d3QvNU5oanhN?=
 =?utf-8?B?bWxBTDhpbWFueWV2K3JJOXhHQ1pramVZZm5hR3p4Vk1Sa3FDRitjbngwTGJ6?=
 =?utf-8?B?OVFYY3ZZVCtadFVZaSt5N3FmZlhLUzhlOGZTU1dpL3RkL2dnOG5oN21MQ05U?=
 =?utf-8?B?eU00clJjOTVVVmFETUZRc21ZbkZLeTVmakFQRkZNRS9ERmJCdzkzQld1V1ky?=
 =?utf-8?B?UjJOSUFML3ZVOW1UZjlld1o4NTFSMnMrY2piVi9YQm1yMm92VDBlTHo2dkN5?=
 =?utf-8?B?Z3ZEQ3o4ZEtwM09zUFR5ekJLY0JLcU9kSjg2ZDh1K2E0RXdtbnZ4K0pVdm1w?=
 =?utf-8?B?UUowcVhXekR2ZjVPM016ZmNHWlNCT2thQXltQnZqVm5NN2lOSXBsa2VyUUVJ?=
 =?utf-8?B?S2ZGdE9hcjNER3dRM0tpY1FpWVVBNHBwMi9xZ0lCd1lWV2FjTkhkU1NBYWoz?=
 =?utf-8?B?TmJ4WTdvZHFkWTZvSklkWEp3OFVHNklwM3BNcGkvYUdaYTRTUTNPZE5kUXhP?=
 =?utf-8?B?UTFNanY5RGlSOGRvNkN0QkViTXVwVFhjMmRCQzdvbkpRcCtxY2VRbVdZRWky?=
 =?utf-8?B?ZTZqbk9EbThDcGVBTWtSaVA4S25neEJ5bkJXVnVCaDVmYTU2TS96TTI4WDRX?=
 =?utf-8?B?REZsM1IrVTVCY045b255TXJRbTI0cTBBbDZqYzg1VXpqck8xZTdmdkUwRy9q?=
 =?utf-8?B?Z0c0Mk96NEI0bUxkdERxNURMdnVjSm5PNGVoRFpjaWQ3NjJRcVo5V1A3Zmxl?=
 =?utf-8?B?QThGVXVQeDQ0QlZDRThMV091RmtKMmZOZVc0clBEWW5Md0NxdkQ3REw2ZDNV?=
 =?utf-8?B?bGZHK0FwWm9BMTRkYWpQNmZ4UmQ2aXJjQ2pmMVZZNEpuWG15UVhjaWttYmFv?=
 =?utf-8?B?OHVmdTFXdFhiS0haWHVkMHFVS2pIVDB6bWdvUzBYUEl1Wi84Zlg2ZllCbmJy?=
 =?utf-8?B?OFA2UXd4ZUpaSmNra293ZGpZS1BKTWhpVUJaaUlWK1BYVm9jRVFHUnNUZ2o1?=
 =?utf-8?B?dzNNUVNqcWdOaCtlRENsWURSUXMxYVlhZ0tjaE1DbmJKUE0wU2Nod1JoRkxR?=
 =?utf-8?B?TW9jOFFaSFdqUVhrVHJtSEFKRmhBQ0ZXWHd4Wk03MkxTOUdoS0xlUWVnUzg5?=
 =?utf-8?B?Ukt0Nm82TlI1OEs2enJtblJLLzRzelo3MHFkVHhYaWd5NDBMRjdhbU1KeGlG?=
 =?utf-8?B?YnRObXMwdWl5c0tEczM3K29yQ1JQN2ZnRHZ4YnpQdlRoZUI4UW1iSFpTeEd6?=
 =?utf-8?B?c2k5OG1NNHNpWGxVZGNjQnVWQ1JKZGwzbGFJdEgxaFYwdDlhQnpVaEVBY2ZV?=
 =?utf-8?B?K2ZyY3h6YjNaNkltLzU0ZmY1cWdLSFJEcjIwNy94SW0zOCtOZVZRNldaQStl?=
 =?utf-8?B?cEN1dWtWRGxWNVVyKzVNWG5xWjU2U2tydnEydlJ2bDFmdndySFAvUTQva2tH?=
 =?utf-8?B?ZDRPQzFJclduRG12UGV3dm5aMEVUWVYxZUZicDFLcE12aENyYXl2Mm40cjIy?=
 =?utf-8?B?TlZmN21EOVVMeWVKeENmMEN2d2pLZUJzK001TFZVK0Z0Y0p5MDVzV3dYRkJl?=
 =?utf-8?B?WWk1NWpDTlNMVlpKc1VTTHJVS3g0NElaeDljeWFnWFVSSlA0ZDhnU2ZDMUJS?=
 =?utf-8?B?R2FwZnphWmUvT1BodFdZNDRYQXZrZGxSemR5T3NNeUVFM0V5bjBzamYxVGZh?=
 =?utf-8?Q?IGD9CYvRCXSM5bwBv/OIRv0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 974d043f-0458-4682-8764-08ddf6ac0ea0
X-MS-Exchange-CrossTenant-AuthSource: DB4SPRMB0004.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:08:19.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqYaX+evVGMcWj7KzuDWGZai7bjO+5eL8awFfMa9p+uODTWBmhzu/psK1vEHDq2LvYCb+IhDGwpVQ3BjT9JPBwFAx2+QJzsJeLpDaHRvJs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050826_731199_5E42C736 
X-CRM114-Status: GOOD (  11.36  )
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

SGVsbG8gTWlxdcOobCwKCk9uIDE4LjA5LjIwMjUgMTE6MjYsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gSGkgTWlraGFpbCwKPgo+PiBDaGFuZ2VzIHY1Ogo+PiAgKiByZW5hbWUgc3BpbmFuZF9jcmVh
dGVfcmRlc2NfaGVscGVyKCkgdG8gc3BpbmFuZF9jcmVhdGVfcmRlc2MoKQo+PiAgKiBnZXQgcmlk
IG9mIGNvbnRyb2xsZXJfaXNfYnVnZ3kgYm9vbGVhbgo+IEkgcmVjZWl2ZWQgcGF0Y2ggMCBhbmQg
MSBvdmVyIDMgb25seS4KClF1aXRlIHN0cmFuZ2UsIHlvdSB3YXMgaW4gdGhlICItLXRvIiBsaXN0
LiBBbHNvCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI1LzkvMTgvMTUgc2VlIGFsbCB0aGUgc2Vy
aWVzLiBDb3VsZCB5b3UgY2hlY2sKeW91ciBzcGFtIGZvbGRlciBhbmQgbWFpbGVyIHNldHRpbmdz
PwoKPiBQbHVzLCB3aGF0IGlzIHRoZSByZWFzb24gZm9yIHRoZSByZXNlbmQ/Ck5vIGFueSBhY3Rp
dml0aWVzL3Jlc3BvbmRzIGZvciAyIHdlZWtzLiBUaGlzIGxvb2tzIGxpa2UgdGhlIG1haWxzIHdl
cmUKbG9zdCBpbiB0aGUgdG9ucyBvZiBvdGhlciBtYWlscyA6LSgKPiAgVGhpcyBzZXJpZXMgd2Fz
IG5vIGxvbmdlciBpbiBteSB3YXRjaCBsaXN0IHdoaWNoIG1lYW5zIEkgd2FzCj4gcHJvYmFibHkg
ZXhwZWN0aW5nIGNoYW5nZXMgb24gaXQsIHdoaWNoIHdvdWxkIGhhdmUgbGVhZCB0byBhIHZlcnNp
b24KPiBpbmNyZWFzZS4gQ2FuIHlvdSBwbGVhc2UgY2xhcmlmeT8KSG0sIEkgdGhpbmssIEkgcmVz
b2x2ZSBhbGwgdGhlIGlzc3VlcyB5b3UgbWVudGlvbmVkIGJlZm9yZSAoaW4gdjQgYW5kCnY1KS4g
Q291bGQgeW91IGxvb2sgb25lIG1vcmUgdGltZT8KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKVGhh
bmtzLApNaWtoYWlsIEtzaGV2ZXRza2l5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
