Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928DFCF34B0
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBYmYAqiuWj9cw4VcbQrJaGlRJHJPXYqxODoLQd0wug=; b=vhR4w6uArOGz3v
	hY9QMSjpFdag29CdC+esc+jQ2Def4jdeD0lYEKbPFpppgMbLxoD1iPzbAXGgACH17uEcV0aKyhqQ9
	wzn501InCQvycX7oWS1ouI8eUL1+sSE9+zLu8G5UoynhjqX0Kpgb4/+Ty8byYaE3hhz9bZeSkyiUu
	tiDu7HdAJien8GbPaPh5EyAhEkOGFAPAXJK6GAd0crfIo4Oe6TmX4BEF0r+MFP4gA99aioC+Y2rG7
	IreMcgBq1qnrJ5pC1xeSELnfdC44dpFuzRO7iGcfIgk/ymcJT1Vio9dVpe7TxyQS1HjK4L1JATxzQ
	wau5GwfCTVytePN9SvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swNOf-00000009Vei-1aXG;
	Thu, 03 Oct 2024 15:05:41 +0000
Received: from mail-vi1eur05on2061b.outbound.protection.outlook.com ([2a01:111:f403:2613::61b] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNOc-00000009Vbq-0vLr
	for linux-mtd@lists.infradead.org;
	Thu, 03 Oct 2024 15:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdkSREJjAxR4NRKJ8V6+o2CCHZpPFyp5WxoNve5YjzZG7tM+S/mgal+qOu/t+R39hSr73pksKfyTt5K4j2aCUC7lQF6+9ecFFKHFOLbcyRcraUB70svy0y6RMI9qIlXEjFe40etwTAL5D9spOmsAAGj95/vE5UYPbKOvCQRVKq884PiJKyeNHdhFJgDAp+wJMXuYUYIsReNb8qI0uL/pzcA6dxAZxYXLOmKkOEfJ7nWQoLYdFcGYvo43VfHEcmD+/EzHKvKRq+/f9B7R0pjF9UcKVxQJ0qVVYLRXsRhEg766oa5rURBml006Q+GXlrYfLbKFCVzzyTNa3FFsjcVwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSckGkyaaGe27mx/9d0pnlLqOdpwSVfeE8SDEmUDanE=;
 b=r6uGLUCCPApQScAuPIL8DAZEzbBuyzhZzoRXenC32gOBk02UPodytxDZCZ+K/HIIYaBc/oaggZUzCMmiuCMAOKZD2ut6GkAKRCl/232POMmn55Qt1CmThnOsRqbu6nFCFuahBk0/lcG8xq/4E/fK4qCsobKSr4ntOj5jYIFIOCpMWuj2ltWnCo8ASdMLXrUoJXmqz5lOndlLOpA4tU1uNGb8dkFBfdDYDxkJcKS37KaclOfFiQhbYbqCm8aZotqXzbeZqXus06mQ2+tkTXivsRo91JXUnpXWVOihgiYXNiJ2P8AjZygTXb7s0eoZgzV0HvJNfnIse7dL6t+TATV+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSckGkyaaGe27mx/9d0pnlLqOdpwSVfeE8SDEmUDanE=;
 b=mMKWxK9VU8Paxzj0MQsGgCOdP5daBx0OFJc8SMF+sIHrXQ+3dQd0IlbvzHiQW+7UOvfiKsGMxquGokQ3h3hfEaZWBYDtqqeF8IRe9N09e+rtSsZiQ/kesUV5GS1uRFrnv4XOyxoICBcQVQn1sIEjqawRki4aY6Yc2OVjvEXADAuP+zruLrstEzWmjNU2Z1q7mhNIyDFkXru7KZhXQFmdI7HRAb8sV6mh0wHt390ZtQxgD+cjhQ7SR8tkIFBvcW62K6usMruDSazmS0fKJmbV7MByxWj5uGnTLhuFsnvkknRajNTQtcltsN/AEhJ4WJFBpBWHVVjp4a7Wa2T+HxNx+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AS8PR04MB8580.eurprd04.prod.outlook.com (2603:10a6:20b:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 15:05:24 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58%7]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 15:05:23 +0000
Date: Thu, 3 Oct 2024 10:05:16 -0500
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241003150500.uz2efay7kadu47if@cozumel>
References: <20241002153944.69733-1-han.xu@nxp.com>
 <20241002153944.69733-2-han.xu@nxp.com>
 <20241003093840.2965be20@xps-13>
Content-Disposition: inline
In-Reply-To: <20241003093840.2965be20@xps-13>
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|AS8PR04MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc866e4-0352-42a5-8ca0-08dce3bcce51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEZQY0x2SXNYbXQ3YXg2NzNVWXlhdXpKMktyZFZzaVlWL3E3YTVwenFJaXF6?=
 =?utf-8?B?SW4zZGNmQ2ZobUJwRWI1RkQ4M0hPWFErZkR5TzRDeWsxdG9oRVJId2ZYbXBl?=
 =?utf-8?B?SVlRbURHelRsZDcxS1pYSHBxeDhpOWs5eGdiZkE3Sk10Mmpob2lVREtCWnJa?=
 =?utf-8?B?aU5MUEk2L2U3YmN3TkVsbmJkUUxITjJxd3crY2ZhNWFyRzN1Nm5BYWpYcHBZ?=
 =?utf-8?B?NXNLMmxyWXZQak1la2YvNmd3OFQydEVuT01xaWpJL2E2bVNhWFU2TnpkZnNH?=
 =?utf-8?B?OTU2ZEE4dWdiYldhc2ZhVmRRK1ljVlJKendmVmFkWGhOMlpnWml4MVduTkps?=
 =?utf-8?B?d1hoWXRlWStpU2pNVE1yNkVRUUxENWhoaE8wVGxMWlpCai9nL09uN2MyTy9i?=
 =?utf-8?B?NG1MdHF4bnVHRTFibWJQejBKUlYwQjJzRkJVTXZYcFd0SnQvaG1FVFpueGpv?=
 =?utf-8?B?Q0tpZzNUS2N3L2x6Y01vSldnSnlUODhvT0FGbjZlQkdyUFlwOHRWbWJWTnQ0?=
 =?utf-8?B?N3JiTUxUaGVDRWRsNFMyUjFpL2lNV0VXby9ZOG00ZWY0VkZ3MExxSE1FZC80?=
 =?utf-8?B?WGR2MTREV0hrWUFObXl1dWltSjN0Wk0yTU1OL0RLUm5IcGM3OTBuaWZ3d2E0?=
 =?utf-8?B?YzRXcUFWN2dLWW5vQ2RpektnN1IrcXVva1lXTEpXTDZaV3E2eDZNQjk0REdX?=
 =?utf-8?B?M0tpOTBhM2FiRC9rcndCb2syVFZVaUlEVm5BZUdNdlRrejNVQmN0a0xBWEVX?=
 =?utf-8?B?S2Z0cFpqN1dvTndZRGpCcFRXQzIvWkYzWG02QmNpaVN5ellFcVo1T2xxQTM4?=
 =?utf-8?B?cjdBNUZ6NStyY3RHUkJBUXA3bXVUbG4zUlJ1MWluT2R4UkwzNk41a3VDS2hM?=
 =?utf-8?B?cHE0S3d5VVo3aDhENFRxWmlIbVE5VlZjM21ZSFlqTTFiY0F6dlcwSDlPRHlM?=
 =?utf-8?B?SWNtZyt5b21jRUszbms1dy9QYXMxTlpIaUZJQitEdGdFb2trNlJ5L2xYSElN?=
 =?utf-8?B?YWdUdTdzMm1zejc5WEk1cWdqanFlZ1hUTDZDRWFWYW9sdzBYNWEwT2FtdE9m?=
 =?utf-8?B?Wm1QT1FIQ2h4M3pCMU43eUlpNTRzL28xWks2TmozTkdiNE9KMUhNQWtwWVdD?=
 =?utf-8?B?aXJvSE5VZGk4VnM0RW5uMDhqM3BPT3JFSGdaTTloMGY1MnRBUExCcUhXbzdt?=
 =?utf-8?B?VHFPQkZLNGFYVzhkaW5aNUhGTlJhUWFnOEdkZ0d5YmkxNC8vV1llUW5STFhq?=
 =?utf-8?B?cUY0Tkw2ODFjVjhBK2l1YnRtYzBhYlF5cnFnL0ZqK0xqVis5ZXZyQ2s4SzBC?=
 =?utf-8?B?L21GeEdPUldNa2lmMVVUZ21tVEQ4Zy8xSHl0TUpVbWhkZG1DZ05UOGhXUzJh?=
 =?utf-8?B?RytsUkRLQk5VR1Q1bEIzNmEvcjFlVVcrald4aGNIaHF3TW1kOVZmZnRCUkxt?=
 =?utf-8?B?UTBUdm4wbktlOHZnVW1QdHpHR3NOVDJ5enk1MUdYam1PRkkwQnc3VjlSWGYv?=
 =?utf-8?B?bDdXYzVpbHVBS3ZaTktwTGFSVjVCb1NHdEgwWmxhQStyeXVRWUQyUjRQb1hn?=
 =?utf-8?B?VDFYVlhQYW5lZ3VmU29LMEkwWVhFY0tSMW1iL2JmTksrNU0vbVJ5dWtNcU5O?=
 =?utf-8?B?ZjJpcTRpdWhDRDQyb2ZoazNNN1YzRk5mcnFqV3c4UVpNN1FrTVhuU2tZcng0?=
 =?utf-8?B?YXZvOTBvenlzaml4b2NpaHlNc3JwVGk3MERQRlZlNVdkK1VWVXNYTXFtM1Nx?=
 =?utf-8?B?cXJkNmozSFJqVVBwMGJkQmZKS3BmMFJyZVVBNmRraTRWNVlIZnkxTTMyUEd2?=
 =?utf-8?B?bHl4aWJRVWQ3ZUxBbVg3Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hXV3Y1ZE5Dc1BZOW9JcTNlNmcwN2V2ODZ2bm5DK3FxM0tVaGtBSUtFVGsv?=
 =?utf-8?B?QlU3Ty8xVVlhNkRLUUJ5Y2U2M20rUmEvUXVZWStPNGVOMTZWVERiVEVhL0JE?=
 =?utf-8?B?WXI0Q2luc1k1SzIzMmRUWmJwc2kvVTl1RkozNVJabkFTSXlEVWxIYXVWU1J1?=
 =?utf-8?B?d3gyMXhpTFZNU3UxNStTaE1GSjFnVjAzaXFkRldMVGE3TXgwbHpZbEYrdys0?=
 =?utf-8?B?dmhqZ0pibk5TakRKZm5kc3M3ei9rclY0TmxKN0s1K0ZaOVh4WGh0OGY0aGli?=
 =?utf-8?B?bDYxbXcraXQwV1daVkVoRXArVVhCKzc2NC93SFRWQUdldFZ2c0l5ZFNMS0Nj?=
 =?utf-8?B?Y3dYWktCZXZSN3d5bnIvaHcrcnBXT2wzcDZVTSt2VHp2Z0M3STIvcTZGMmN0?=
 =?utf-8?B?Q1ZKdmRvRkM2Z3dNMEJqdXk1VUVEd1dLT0wwUmNIbmxjTlZyVFRuall6R0VX?=
 =?utf-8?B?SUJYcHVvM1hvSnE3blVWUVFDWnJiOEpaUFpMclEyQzVwdUVtbEFUNVljWTJw?=
 =?utf-8?B?MmNRRkY1ZXVuY1pMU1ZFUkNHbm1kcDErY3IzL28wL0V6Y1JJVXp0aFJJSmxT?=
 =?utf-8?B?S1NpSHpRaWs2ajB1dURBdEREcngrcE9oNzB1YndEbmd1dEJEMUlHM1E3a2Jk?=
 =?utf-8?B?dFZQV1RrOVFwVHp2MnN6a1dEMFlzSkU2UGlKcGFqc083ZnFMOGt2K0EvbGJB?=
 =?utf-8?B?REQ5SGJwRml3RHd4dDI2Z1Jpc1o0RmhVZ0RkT1g1T0lrQjVvczZIOEc5WitQ?=
 =?utf-8?B?LzdOazVrTEhjTFgvN3JxT3dkT3FQZituK3FrZ0U4ZWtwcm82andzOC9YR1Vk?=
 =?utf-8?B?VWkyN1V6Y3EyTWhnTnhOMjltQXdnY0NwUGhKRmVXU3I1a1dNSlNEMmZ5OGN3?=
 =?utf-8?B?ZWdDaVo4VVJzK2RjUWR0R1pCZk84RC96UldxbnR4L3BSSmcrNWp2czkwRnM0?=
 =?utf-8?B?enFUVGpVdkRlbkx1VGxFWnQ2L2kwa0U2aytPdll0WTNnRGFYZTMwN2d1N3dV?=
 =?utf-8?B?RFdDSFdZaUQxM3JXc2orVFpWTk9iT1A1M1FxNERsaTdoUSt5WnhNd2Z0VzZa?=
 =?utf-8?B?aXBxdTN0dnNBZldHMWs1YlRndzVXTzVsOXdVWXB4aThZWFFwbnJsa3h1QUVm?=
 =?utf-8?B?VUZVNmpXVWFkeVdxZGxiSFY4NnY5cy9yblhFdEJIV200aVlKT1lEOVFVT0NO?=
 =?utf-8?B?bW84OEJkNmRNaGRuV3hjUC9jcW1hM0tEV1N0djJLb1I0akkvZnhRTWJvY1JQ?=
 =?utf-8?B?UnhvTUZDNjRSM3N3THBYQVo0a0VUNHRyN2RHUXpERUJtMkNkWGc0L0dsekph?=
 =?utf-8?B?SlZwcjVaS0wvR1RBMitad3hlTWlWU0ZXOHF1ZjV1NytZZjIvVDdsNXpuVkFV?=
 =?utf-8?B?VEd2bnRJc0U4VUViYlB5WGJoVU9TLzU2bXI2MnN1a1J4MWlBYmxpNUhXR3Z2?=
 =?utf-8?B?ZGIvdmV6T0Jrc3FpeXdvRndtek1WVWdnWVZ4djJqMWVpQ0VUaEtXZzVLY1JH?=
 =?utf-8?B?M20zTHM2TVE0VEgvNituVlJnazYwYTBES05jejhUOE52QllPeFZ2WlFqbW12?=
 =?utf-8?B?ME5ScmhDb1lzbVZ5WkI5SWdIK1pvSjNZR1A2aXNrU3dKbS83UWdUQ2lRV0hn?=
 =?utf-8?B?MlZPSTVVS0cyK3hQMjdJTnhMdHRueDFiUzhjeS9qVGkxZitSZi9kYmNaZkRh?=
 =?utf-8?B?SXdiSTNYbmxuNzNiRlVHQzBGMWNEYUtLK2QyYys1VE5iVXZxNFlwTXBZQVdN?=
 =?utf-8?B?MFdYUU9heStaL3cxUFZmRmpvbmRkbnNLWGVxSnJiMVFkdHUxc0EwOWMyNnVX?=
 =?utf-8?B?R0ZyUE1jM3VNKzNNcmk4QVVHeEMxNVdkL0FJUHZWdkRhbkZKVTRZSmhWT0lo?=
 =?utf-8?B?L3l3VmdaOTkraWswZ2dTdVlIQ2owRHFDTFZZalNIQ1dRZTNEZUFRTHNraEY3?=
 =?utf-8?B?Um8yRldEaVoyeXN5SzhtejBsS05iV2V6di90OTZVTGlIUXpjaXF1QWw5Rmta?=
 =?utf-8?B?YVByQks5WmJLYjBPR0puV0daMDBERFhTSkE5Z0szb3B0LzZvR0JlUjd3R010?=
 =?utf-8?B?ZENuYWNqYW84a2hPZnp1WkV0NU1ZTFhsQnFtd0FBTmdBaGlEZ080RnI1T1N1?=
 =?utf-8?Q?1do8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc866e4-0352-42a5-8ca0-08dce3bcce51
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 15:05:23.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctm0WYIyG+jYTXp2EcYv7oVc93/7OLT/lQR5O7hqu07/Ke3nbpCCTEjJy0QliCvy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_080538_283585_24F24727 
X-CRM114-Status: GOOD (  16.60  )
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

T24gMjQvMTAvMDMgMDk6MzhBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBIYW4sCj4gCj4g
aGFuLnh1QG54cC5jb20gd3JvdGUgb24gV2VkLCAgMiBPY3QgMjAyNCAxMDozOTo0NCAtMDUwMDoK
PiAKPiA+IFRoZSBjb21taXQgcmVmYWN0b3JzIHRoZSBwb3dlciBtYW5hZ2VtZW50IGhhbmRsaW5n
IGluIHRoZSBncG1pIG5hbmQKPiA+IGRyaXZlci4gSXQgcmVtb3ZlcyByZWR1bmRhbnQgcG1fcnVu
dGltZSBjYWxscyBpbiB0aGUgcHJvYmUgZnVuY3Rpb24sCj4gPiBoYW5kbGVzIHRoZSBwYWQgY29u
dHJvbCBpbiBzdXNwZW5kIGFuZCByZXN1bWUsIGFuZCBtb3ZlcyB0aGUgY2FsbHMgdG8KPiA+IGFj
cXVpcmUgYW5kIHJlbGVhc2UgRE1BIGNoYW5uZWxzIHRvIHRoZSBydW50aW1lIHN1c3BlbmQgYW5k
IHJlc3VtZQo+ID4gZnVuY3Rpb25zLgo+IAo+IE1heSBJIGtub3cgdGhlIG1vdGl2YXRpb24gdG8g
YWNxdWlyZSBhbmQgcmVsZWFzZSB0aGUgRE1BIGNoYW5uZWxzCj4gZHVyaW5nIHN1c3BlbmQ/IElu
IGdlbmVyYWwgaXQgc2VlbXMgbGlrZSBhIGRpZmZlcmVudCBjaGFuZ2Ugd2hpY2ggSSdkCj4gcHJl
ZmVyIHRvIHNlZSBpbiBpdHMgb3duIGNvbW1pdCB3aXRoIGEganVzdGlmaWNhdGlvbi4gVGhlIHJl
c3QgbG9va3MKPiBvayBvdGhlcndpc2UuCgpIaSBNaXF1ZWwsCgpUaGFua3MgZm9yIHlvdXIgY29t
bWVudHMuIElNSE8gdGhlcmUgaXMgbm8gbXVjaCBsb2dpYyBjaGFuZ2VzIGluZGVlZCwganVzdCBt
b3ZlCnRoZSBkbWEgY2hhbm5lbCBhY3F1aXJlIGFuZCByZWxlYXNlIGZyb20gc3lzdGVtIHBtIHRv
IHRoZSBydW50aW1lIHBtLCByZWxlYXNpbmcKdGhlIHVudXNlZCByZXNvdXJjZXMgYXMgZWFybHkg
YXMgcG9zc2libGUuIElmIHlvdSB0aGluayBpdCdzIG5lY2Vzc2FyeSBJIHdpbGwKc3BsaXQgdGhl
IHBhdGNoIGludG8gdHdvIHBhcnRzLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
