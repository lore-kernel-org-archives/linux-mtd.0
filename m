Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A0C5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYTr59W1ncb9CPucdbrkzDo5o3KTgKvSQkd/cX/7nyQ=; b=hhgmwh51lPSLA5
	A/H47ykDwqgp7CBSSKwQLlJXgncByqezqFQXImvIcDJRmUwCeGdQw3OQGYbRTluYQkSgygTW23e3m
	1iJUwrAgCSYKT2yxY1EYfBMLMMmbmorD5r4w14X/eqcCpLFVuu0yNV4D+gfQ6DqnM/biFUEVG2+pa
	f6AIywGGZosiBCyTHFI5vMTg+X16BSdIBAmtajqn+7jwy47+ocn6zIfUjonwEAnxSjXXeQbqoQkMY
	QsW1LFbqKWXAdIlgWwjGRcpA9Qjj4uv8dnR46Rld2Qxnpe5eD1cJpUQqnqyUi6qR3vCoJgkpglXYZ
	6ofJFtv1/JCi67BVKh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBue-0000000Gb1U-3pfT;
	Wed, 12 Aug 2026 16:34:44 +0000
Received: from mail-norwayeastazon11013052.outbound.protection.outlook.com ([40.107.159.52] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBuc-0000000Gb0D-33Pn
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 16:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQacQPJiqgpIOh1yfhG2L/cJcKvucev8rMESvEFPUtuaCK+O7ZyQO9Ag9RHDLv87QOrMPw9+jYnQ4eTlMUksPQspIBeqKLGTE/yb0Xhv/oYuyAkpl3XVZzUMCaazv+pLQK7/GtKPYXbMvARNpZQyGfDGunyXlh0VxD8tqbtTlwNQswe3FAXRnmqevHdJ4PJqifkBqyJfHg1iIq1jbbsAff914iInE3oRkHBc0CHxB0HAtHwX+hOqkXnxB7aHmEVIJDnjlr61ViEhhv3B3sdgp9BMWSeIHaT9adHldammXbWleL4TbAeGyHYpNDypBkNRLv0I9Jj24S89Fr1ANrOY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf8L0ywHA1IXPTwtTqMimuqh8NOIrlsdb9CrFwEpuh4=;
 b=Qcee7HjAY8pcKbMRxB4YUhNKNOMLZf+IHky2+3ccD4jpswO1y8fR72ZLfIYiBFAEdZ/qrJmXAYxN/QZoIZHAiRu6X/HgjojrjdaMam+w/4PnpfkWrnxfTL0xecr316BXjNyygpn1uAJ6ubu1d7DVC61gtSZQn/iGBsqu7ExjskRz6AmVA2kA1IzSCw+giTEaNFq1pU8jglxZefpAm2pNK2ILEUrEqvN0Pj5pmCgehfg7BoOUSGAy7wzDZaHoDcjv3omOPdhcX9XsR9WobY1d5PNMrpWhb5PhripJ118lY45QrPHTuI6yiJpLtiwQ3o04P1jIgEGmQf+ZwFtpR1PK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf8L0ywHA1IXPTwtTqMimuqh8NOIrlsdb9CrFwEpuh4=;
 b=diYGIa1oloNx+Qx4FMcPATi7b3VW8HAxkhM0A0MXJZy/gY194VBW0JeL7z/3ipiW5VxW6Q6xClji/mhmD0mso82lS4NNRVYvMeWuuFaJ6o5A3Vde8HyyuBuC04Ecu2v3ppyEr+hB0cIosfVbZDEcw8Rf0N/4BIyDy8FcAhXw5uB9aNHQ822/kPaeUk0FyL8K6tB9Inh8pHeMpYIdeEl2xCrWi3mq8IFxD20hHkyFkpEwXSNgZZViCm3ymMbem4THmilOT8TNxRBPwhKXH3oab5SGwjYvav8NqfapmgbeqtVyhFnZDDdQ/Ghb58PCZggJ2aoDvj9Ux1RyRWpriA2izw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 16:34:33 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 16:34:33 +0000
Date: Wed, 12 Aug 2026 11:34:26 -0500
From: "han.xu" <han.xu@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Peter Pan <peterpandong@micron.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: spinand: Enable QE on all dies
Message-ID: <anowMUOYurNYphfU@cozumel>
References: <20260807-spinand_qe-v1-1-c102c79834a3@nxp.com>
 <87qzk6s8yr.fsf@bootlin.com>
Content-Disposition: inline
In-Reply-To: <87qzk6s8yr.fsf@bootlin.com>
X-ClientProxiedBy: PH8P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::29) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: 82176652-fcc5-4275-22e6-08def88f96cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 81D46BrZ3I6D5ta76Wd625CqQpqLBBWFenpgiBIqU8k2z0/CAAeQzgETz+fgjdtIhPYQpLADVU6MeyiXTHhxbChEd5qsIBd5NzjvhKR54wAcuyuUyS/XWg8iMXzmGr9kkb8kRKozH/nmSAwLrjIoPsERZYEo+1YKkSUHV6+zfKsaqk8zx9KCG32NLW5PWKN1cpbd9Q2McvW6bJzQreh3MclVx11e/lDDwg7dcA7jXIyeNAL9MlRJ5u3Mv8tH2NaFgkQS/bcOwCCtoAncwBCowGGtb0w6KFZaIBD6WwKF46zgjIObg9wXch599cwsfYocKc0jicbT+Xe8NT9aE5hGxOZfNrKfXeOvhFLC8jzwvBBpe74/Oe1msLXVXZ9Sv86ae6xMIxoxFX0SvlSQKiXJg96fm2/ya+HfNpIGBk+wyce+4emcEHpjDtVcALu4P/3cWBN2UVxPhpSBPTY3wCkTo1cKJS/ZqsP442TIRxJZqQBmZ8vFiMNnMfOeW60YBc7HzGwG68rMlPgKNUkSBX4AIb4zpCefFfCiaFo6fdQpsIzirdT0ApuV8L0r7ZTlAtuB9lSJypYhR2/ZJPBcGPFGhTF1YSfhbMsvkj/gbCojue/h6242ZARV20fxN43VL3S1hKf+9usD6omoPrGBxKKDmVEFxdUoYlbizi561TmUK8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXlZK0hzbFkyYTR6akdjTU1OMGVsL21IVXZxTVV4MlI5RlFOUXpMK3gwY1Zk?=
 =?utf-8?B?cm9CYnFXYlJwNWNYWHZoMW9Db0pEdVUrUmpQV3BpV05sRUI1ZUt0bUhDRlAw?=
 =?utf-8?B?ekRzS3hNVVQxcWN3bEpsV2k5ei9EaUdBOGR4eDdCNEpxbXR6MWttQTNzV0Rl?=
 =?utf-8?B?VS9aejNwT1MySGVjNjF1dkJtSFZOR0VwQVd2M0I5TnFCZCtDc055YlY2VXpN?=
 =?utf-8?B?aDNYWG5RRG9KSGZyQWZ2eDZGZC9YLzlQa3F3dmd3aUNObjNGdXZwNFFzOWFP?=
 =?utf-8?B?Wi9mK3FNRnhqa2huK25NU3VpMEFwRnZ6aUFlSnVvVGQwQXJZWTBEL3FvNnRy?=
 =?utf-8?B?TnhwTHdYUTRKK2pNYUFrUUhQKzg1WGhZZ1ZsYmVHY05Ya2lwTmY1ajgxUXlJ?=
 =?utf-8?B?aDF4Q0x3UDJQZmNaL2tQcTNEa3UzOXlmOTI0MTdpYzR0dDZoRUEyQ09ucmtm?=
 =?utf-8?B?YmhKVHF4TWNSTkM0L2NueWhmdW1mQmZwbzRQV3lyd0FvczlFWUxBUVFsQTFM?=
 =?utf-8?B?YlIxVnlFWlVQNFgzaUZUdmxyaU4xYytTQU1JM000SE1PbkFsYmNxRXBrK2tL?=
 =?utf-8?B?QXBLdHM1L0RmMkVXUHNYRWZ6YnJaZER0bUxKMStOOHMwNjJBcjFFcmdLRkQ5?=
 =?utf-8?B?WmNjczJRcW1va0dxQ0hhUXZkbUxJTmRiUGZOV3ZZT29VTWljbnpIZVRWcjRF?=
 =?utf-8?B?N0RpWkIzaGlTTEVIQmUxd0pPb2ZheGZhMHRtUlY3cDZnV21STWpoa1gxdzM2?=
 =?utf-8?B?YVlQeEF0RFEvcGtnVGp3VUo5RllFWExvS0xsMDlja09ZSHZVK1RaK0FlWmJF?=
 =?utf-8?B?NXFkcWlJaVVwMlk2Mm5ja0tmdzlhZmpxajNHOU5xWmdKUmFzdS91MHFFekI4?=
 =?utf-8?B?Tk9sU1dPR0JTRG01ajF3NkxPREI0d2lYMjl2OW52SlNuZVJkaG1rcklYTlRM?=
 =?utf-8?B?MEJBYlNOd2thdldHSVBveEtzWmkwRjM0WkRCSXU1QkhML0hqRXBIU3RWNnc1?=
 =?utf-8?B?NWh0Q3MyUk02Vmx2ZmJCemV2ZVQxVVQ3U3NjUWJOZG9IQjZwTmdPUkhiQWxr?=
 =?utf-8?B?K1JtejlrNERlcnZVWGZHUWEwRHVJeXlEcCtxWUNqTEhzeVp3eTNUMFpXWkJv?=
 =?utf-8?B?VzR4WG1LM0tpemVTMmgrMmZaY3doYWRiOVNCZmxUMEs1M3JIVkFXeURXaFZH?=
 =?utf-8?B?YjJLZ2JMN1oxbmVNMzdYcXBsUG5sMmY0ZVZ4dDNjNW1nVkFYNXBUZGNHYWdn?=
 =?utf-8?B?ZVVET1p3VHFKcHp2WkxFZGUxUnhLMzVWRVExcXduRUp2dWVBSUhTMUFRUzVT?=
 =?utf-8?B?L1czajBXM0lPTEd4UVlHbktHektpZFJpNTMvc3FQbDhkNlB3TEZjUlV5bEFl?=
 =?utf-8?B?OUp4WVh6VjhhYkRhTWhjS0VlSjBnc0VMR2ZSNWp1Y2xhd2IrS2NEU2xhYzcz?=
 =?utf-8?B?Y0puMGNkUk1HaitaK29vQXVoaG5RTFNjazY2QVB0aE5UZlNOV0UycUZ0YTlJ?=
 =?utf-8?B?UWNlMHZLZnViVlQ4OTB2aEpQYTZYUG5pMWlSMERqVExMWTdjMkl5YkhuQjFX?=
 =?utf-8?B?cjRRMzd4bVQ0MG5aeG13NmhxMGxjQkE1OS9lVUhoc1F5elcvYnlNWWt2WTgw?=
 =?utf-8?B?QTlFRFluMndmbGk1V1lmUDhnS2prM2R6ZU1LNStNblRTMWI1Rm1BWUxWYlRC?=
 =?utf-8?B?M1IzdytsNTZIN0ZNK1FPTjJCZmQ4c2lncVp4YTc2TU5OL0tEZlgzeUg2b1F2?=
 =?utf-8?B?TngvVXdtemZLMWYzeU44N3Q4Vld3Tm1JcndWc0hMUVd5aW9kMEVrRVdVcEJM?=
 =?utf-8?B?ZGI2QnlWRDhpWEcyck45ODBBSWVDOTlwWjg0YVg2M29wc0tXZGtJeFRySnZU?=
 =?utf-8?B?T2tXLytKRDVEeUdpUWhxalhXTHBWbDh0b2tiUElENENCYnZYMy9vZG4vTEZj?=
 =?utf-8?B?aTcwbEVzUVBZUUNIODRXT2szcG5BZG83cFpId2c3RkhoNER3VnZYQVhZTVdR?=
 =?utf-8?B?U0VyN242alVBOEcwYTJyQzk2TW1iMDM5Q1pRbm56WjlDd1F6WjJlaVBTOWNi?=
 =?utf-8?B?bGZsYVZEdTlDclNKYlZwY3hIUHZSQ1pvaGF6UzZqc1FOUVp5L1dFa2UwcHpG?=
 =?utf-8?B?MHhYMi8rNWZ1R0dFMHl2d0hlY3BJMTh4aEltL1JZQlFmTGJBVWFPOXF0d1pz?=
 =?utf-8?B?Y1grcEdhaFRiYXpoenkvd05UbGpHVjBBdTZmMERVNDRrYnozWSt3TEhic3dS?=
 =?utf-8?B?N3YyZCs0bnZGbTlFdzVsQ0tHWjVtbDRLcHpjYW45VldkeHZqVUo4YmRQWHJj?=
 =?utf-8?B?R3pUS1pMWmtNaktvUzhGNG5QQlJWQzFtVEw1ZUFMeTJJRW5PV2ErOUtRMjhG?=
 =?utf-8?Q?LaIxxm85xHBS9SWosXdfThtxu/3fjYzWuhjmu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82176652-fcc5-4275-22e6-08def88f96cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 16:34:33.2065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkDkUBeaVBn2ihdyoSpkoUnBE2ai0HeIVePVP8sunOxfV5H5NlCHaW4JxXQNg5JXvchWLbEQ5nzVCYZCJYd1i/5ywwwjDsDm3eDDBZNVFX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_093442_773141_880AF8C7 
X-CRM114-Status: GOOD (  28.37  )
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

T24gMjYvMDgvMTAgMDk6NThBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbyBIYW4sCj4g
Cj4gT24gMDcvMDgvMjAyNiBhdCAxODoxMToyNyAtMDUsIGhhbi54dUBvc3MubnhwLmNvbSB3cm90
ZToKPiAKPiA+IEZyb206IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+Cj4gPgo+ID4gVGhlIFFVQUQg
RU5BQkxFIChRRSkgYml0IGlzIHN0b3JlZCBpbiBhIHBlci1kaWUgY29uZmlndXJhdGlvbgo+ID4g
cmVnaXN0ZXIgb24gc29tZSBTUEktTkFORCBkZXZpY2VzLiBXaGVuIGEgZGV2aWNlIGNvbnRhaW5z
IG11bHRpcGxlCj4gPiBkaWVzLCB1cGRhdGluZyB0aGUgUUUgYml0IG9ubHkgb24gdGhlIGN1cnJl
bnRseSBzZWxlY3RlZCBkaWUgY2FuCj4gPiBsZWF2ZSB0aGUgcmVtYWluaW5nIGRpZXMgb3BlcmF0
aW5nIGluIG5vbi1xdWFkIG1vZGUuCj4gPiDCoAo+ID4gSXRlcmF0ZSBvdmVyIGFsbCB0YXJnZXRz
IGFuZCB1cGRhdGUgdGhlIFFFIHNldHRpbmcgb24gZWFjaCBkaWUKPiA+IGR1cmluZyBpbml0aWFs
aXphdGlvbiB0byBlbnN1cmUgY29uc2lzdGVudCBxdWFkIEkvTyBvcGVyYXRpb24KPiA+IGFjcm9z
cyB0aGUgZW50aXJlIGRldmljZS4KPiA+Cj4gPiBUZXN0ZWQgb24gSVNTSSBJUzM4U01XMDRHOEIu
Cj4gPgo+ID4gRml4ZXM6IDc1MjlkZjQ2NTI0OCAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFz
dHJ1Y3R1cmUgdG8gc3VwcG9ydAo+ID4gU1BJIE5BTkRzIikKPiAKPiBUaGVyZSB3YXMgbm8gSVNT
SSBkZXZpY2UgYmFjayB0aGVuLCBidXQgSSBndWVzcyB0aGlzIGNhbiBiZSB1c2VmdWwgZm9yCj4g
b3RoZXIgZGV2aWNlcy4gSG93ZXZlciB0aGlzIHNoYWxsIGJlIGJhY2twb3J0ZWQsIHNvIENjOiBz
dGFibGUuCgpJdCBzaG91bGQgYmUgYSBjb21tb24gaXNzdWUsIEkgd2lsbCBDQyBzdGFibGUgaW4g
djIgYW5kIHRyeSB0byB1cHN0cmVhbSBJU1NJCmRyaXZlcnMuCgo+IAo+ID4gU2lnbmVkLW9mZi1i
eTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gPiBpbmRleCAzNTM2NWI2N2RkOGUuLjc0NDY2MjUzM2YzNyAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jCj4gPiBAQCAtMjgxLDggKzI4MSwyNiBAQCBzdGF0aWMgaW50IHNwaW5hbmRfaW5pdF9j
ZmdfY2FjaGUoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ID4gIHN0YXRpYyBpbnQg
c3BpbmFuZF9pbml0X3F1YWRfZW5hYmxlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwK
PiA+ICAJCQkJICAgIGJvb2wgZW5hYmxlKQo+ID4gIHsKPiA+IC0JcmV0dXJuIHNwaW5hbmRfdXBk
X2NmZyhzcGluYW5kLCBDRkdfUVVBRF9FTkFCTEUsCj4gPiAtCQkJICAgICAgIGVuYWJsZSA/IENG
R19RVUFEX0VOQUJMRSA6IDApOwo+ID4gKwlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBzcGlu
YW5kX3RvX25hbmQoc3BpbmFuZCk7Cj4gPiArCXVuc2lnbmVkIGludCB0YXJnZXQ7Cj4gPiArCWlu
dCByZXQ7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIFFFIGlzIGEgcGVyLWRpZSBzZXR0aW5nIG9u
IHNvbWUgZGV2aWNlcy4gUHJvZ3JhbSBlYWNoIHRhcmdldAo+ID4gKwkgKiBpbmRpdmlkdWFsbHkg
d2hlbiBlbmFibGluZyBvciBkaXNhYmxpbmcgcXVhZCBJL08gbW9kZS4KPiA+ICsJICovCj4gPiAr
CWZvciAodGFyZ2V0ID0gMDsgdGFyZ2V0IDwgbmFuZC0+bWVtb3JnLm50YXJnZXRzOyB0YXJnZXQr
Kykgewo+ID4gKwkJcmV0ID0gc3BpbmFuZF9zZWxlY3RfdGFyZ2V0KHNwaW5hbmQsIHRhcmdldCk7
Cj4gPiArCQlpZiAocmV0KQo+ID4gKwkJCXJldHVybiByZXQ7Cj4gPiArCj4gPiArCQlyZXQgPSBz
cGluYW5kX3VwZF9jZmcoc3BpbmFuZCwgQ0ZHX1FVQURfRU5BQkxFLAo+ID4gKwkJCQkgICAgICBl
bmFibGUgPyBDRkdfUVVBRF9FTkFCTEUgOiAwKTsKPiA+ICsJCWlmIChyZXQpCj4gPiArCQkJcmV0
dXJuIHJldDsKPiAKPiBJZiB0aGVyZSBpcyBhbiBpc3N1ZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBs
b29wLCB0aGUgY2hpcCB3aWxsIGJlY29tZQo+IHVudXNhYmxlLiBQZXJoYXBzIHdlIHNob3VsZCBy
ZXNldCB0aGUgZGllcyB0byB0aGUgIVFFIHN0YXRlIGFuZCByZXR1cm4KPiBhbiBlcnJvciB0byBj
b250aW51ZSBpbiBkZWdyYWRlZCAoc2luZ2xlKSBtb2RlIGlmIHRoYXQgaGFwcGVucz8KCgpTaW5n
bGUtbGFuZSBpcyB0aGUgbW9zdCBiYXNpYyBvcCAtIGlmIHRoZSBRRSBzZXRfZmVhdHVyZSB3cml0
ZSBmYWlscywgdGhlIGxpbmsKaXMgYnJva2VuIGFuZCBzaW5nbGUtbGFuZSB3b24ndCB3b3JrIGFu
eXdheS4gQW5kIGZhbGxpbmcgYmFjayBuZWVkcyB0aGUgdmVuZG9yJ3MKb3duIDFTIG9wIHN0b3Jl
ZCBzb21ld2hlcmUsIGJ1dCB0aG9zZSB2YXJpYW50IHRhYmxlcyBhcmUgZGlzY2FyZGVkIGFmdGVy
IHByb2JlLgpTbyBpdCBsaWtlbHkgcmVxdWlyZXMgcmVmYWN0b3Jpbmcgc3RydWN0IHNwaW5hbmRf
ZGV2aWNlIHRvIGNhY2hlIHRoZW0uIEdpdmVuIHRoYXQsCm1heWJlIGp1c3Qga2VlcCB0aGUgY3Vy
cmVudCByZXR1cm4tZXJyb3IgaW1wbGVtZW50YXRpb24uCgoKPiAKPiBUaGFua3MsCj4gTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
