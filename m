Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87883C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PRKbVyA1mgOl/L3Xt9Nol0dI5kzoQtUpHca4aoh7Ec0=; b=IeFvLsaIYrwWDhdPaETb6Mcwao
	EXzlsdZi/qRbpRtqR8Gs9SAehn7WCf4LRNda4BtIRrLl3Fo2x6YdmDPZIzTgb1XIFWp0LeVYlxHX2
	VcA2SjSEhFdar2F6LZjxY7PRFjdktvq97jUjjD4aiVA9mmSp0jHfiXX94l70INSlxb1b+ZaKJ2VbT
	i3NraWj99/Vv52rWfedmNL4Y9TBAxC4M6JXSnDz849qAsJkwZ5kVk/2vNhgTHkHOevYfJnJrpYUwz
	RWJ0V33F2j2hPVbC+rHXByHfikA8jp+QOkDb60+cmtxywC/oeqsmF4Bl6n0CyOgiRZPKHah2SqY0/
	sRFJxVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUqbm-00GKlQ-Hg; Thu, 17 Mar 2022 13:56:07 +0000
Received: from mail-ve1eur02on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::725]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUqaB-00GJsJ-Cy
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 13:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7ZEE1L99WEcqZrVmPDCfu7Tk0QTtL9tIFpf1BCkxQJAWxc8hvWl31B21tDts47TIgHlTREc2M+0xvBpKofCcPvO/hLWETrAewuWbrFVb3vHqOWSFER6mSR9WJwybESFZ6uDi/ATvuGxGTnBSTEaMFmOkXT8nRcvTEDvnl2rxVud+nhhxUUT5k+5NqKN9G6a3m7EkPskEYZ2nLPpvCldNsfmNytP2b8hv5TbZCxocHGe4Yw3NIwjMD6gqTw2WUzLy13gKwQ7C6nC2kS8U9WfYkx60vVyjbhcLZBMSF3SvnnW6TJ+9DlGTuhHo1eRRymKKdEezWWeOBGW6Enp/u4iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki0B9hjqZhrcVZ/7Mp7ZZxx44bm68A/AVF3ZgJ1FB94=;
 b=eN2xE7XYVPr/T7S5/oYOaurt0SHVPnsLN49MdzVdmxSAzqW3OwvaVxxWp9LQKgDh+bQ5O5yegrM+Pwlwbwj/vy+alNGffvO+qczfTozcRhpzYll5PpXZZsCEut5QIpeBsPTk7+rqg/bZHAWM/D2b9cEvxJwdTln3INAJMQ38pITO0Y+nmm+V7heqcX92v0Lv8R51JNkCTN5zitCr5piuXxAiOnQINwqF+8eHiOQvkLo1UrkTfWtTQdCyj7wSZC/QyQ0rv3ikdTiZln3XLMQ50QIb0KW9YQeozxjFVb0UAHjdz5T3NRVrAXftmZRYJBT9LmAgX7N7VoMXD7vWB0UH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki0B9hjqZhrcVZ/7Mp7ZZxx44bm68A/AVF3ZgJ1FB94=;
 b=djtdw/MJV65RkMPcGdJFcfGcLhfkV3NSa4PCkAxoRW4BmEqelD7XVA9iLeoKuWxt2hVB2/3wc4wge6bRWDmFjjGrCNuqCaea4NtYz04kjD2rxJaZX0MbqP9odFDY9H6d6k0H4yysg67sUxgE2CvnbO7K9WXd28NdMD0zXLX9L6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:d6::31)
 by VI1PR1001MB1197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 13:54:23 +0000
Received: from AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a42d:4509:43b0:a366]) by AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a42d:4509:43b0:a366%5]) with mapi id 15.20.5061.028; Thu, 17 Mar 2022
 13:54:23 +0000
Message-ID: <fbd5cebf-2221-7582-c834-4d8da29d81d0@kontron.de>
Date: Thu, 17 Mar 2022 14:54:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
Content-Language: en-US
To: Han Xu <xhnjupt@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Stefano Babic <sbabic@denx.de>, Tim Harvey <tharvey@gateworks.com>,
 alice.guo@nxp.com, dl-uboot-imx <uboot-imx@nxp.com>, "han.xu"
 <han.xu@nxp.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 miquel.raynal@bootlin.com, peng.fan@nxp.com, seanga2@gmail.com,
 sjg@chromium.org, u-boot@lists.denx.de, ye.li@nxp.com
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
 <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
 <20210513200242.fxvfvwgua35hbqvr@umbrella>
 <edd64777-ff6a-82fd-63bb-7b2f31f63f44@geanix.com>
 <05831c2f-668f-1386-2ba6-4ce623b50d49@kontron.de>
 <CA+EcR2178yu6DWP2NCODh7autEsXs69JmZaFxROVqzez4jR7bQ@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CA+EcR2178yu6DWP2NCODh7autEsXs69JmZaFxROVqzez4jR7bQ@mail.gmail.com>
X-ClientProxiedBy: AM6PR02CA0034.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::47) To AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:d6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023be0a3-e2ea-40b0-0105-08da081da443
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1197:EE_
X-Microsoft-Antispam-PRVS: <VI1PR1001MB11976BDAD8B858DCD27FAFA1E9129@VI1PR1001MB1197.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5aGid+sdKsdsS30yk1Sm6pdQElmSNFT61IR69Uore6udv2SUhH4AcEgpKPxqgbKZL6plu8fBFd5JnKVB6r4b4qA3oJTO+JshtXkGnc562g+sBzYLo3qSBL9GTDPuzy2DO4tE7edbYlqWMXDMnKdG1T9ZYSB3LNKB+LkfdCkzpSKuL7r5EasXV07Xwr2Az6+mbsPvJe2IjeJisks63cHYpnn640NZNrSFKauoS8utA51eVLO96TasSvN7XlkOf6eOyl5sbllbxOXa/zonlUEKWV9JFpq9jvAtRn6CZ6wXH23TuN1Ow3JyhMSlCZYdpCw2upH339qGv84EUYArlrae6ycjk/q+xJcvzIiX/y9mQ/1ATY9gJhdCiYRvbysGm6vrDhivoQG/wec/cIQhWdMzTvXOT1cA/K+7B1rH/6IP1AVcJAmjPlEhQsRJjCZpqOXm624AdAIe/H/eZp2eTdDeKpIINVWOYoP8V98QXVipqPd7/axhxRGXMzDZz+5/cd8whzjiJuczdky04dsBIw9LQDCTo/5EKRVwqvkeEaWNy19UplxlSl0dY/xIOlW7jvbVEChowfI9NTbDXDgnrit034VBe+ySz4cNkpWmBXHptfhumskIVuWAoIEWbCa7hP8BgL2vGoZOTFCMhYyQtrYAbn075jGhg91cz1AM4xfKowmMdmSfZ5XUOwtUJH5MHvhMwEeVo7/gVZ+7xPTSu0jQS2+J7Ii9cROwaCsQm1ybFBNzK9uFCKHUfO6v2HraWsb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(26005)(38100700002)(8936002)(5660300002)(7416002)(44832011)(66946007)(66556008)(66476007)(8676002)(4326008)(2906002)(508600001)(6506007)(2616005)(6512007)(316002)(54906003)(6486002)(6916009)(31686004)(31696002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0RINEJFZ2w1Y0FUR2lCK3dhY05YbFpONjlsY09VUE5HUWsrODBHZ1YwQ0FF?=
 =?utf-8?B?N3dCNGRkcVQ4L1VDL0JaOS9WWUExVkNpRGZ4YkVnRlVQc0piWlpJaVp5ZlJZ?=
 =?utf-8?B?MTRRLzZNOStCOHFsTGFibXlNdVdpOWp3Y3loWDlZMlkzclJYLzU2NEZXZUdr?=
 =?utf-8?B?MGpoTVUyNWxOYnNnV0JqWFF6RXFrTGNpc3p3bmMxNEwzb0FJcE93dk1ISWVk?=
 =?utf-8?B?TThkZERKalV5NGU1ZXNOa2g3TktGMk05d3pHV3dFNXVKZGRXZnhqVXdTbGgr?=
 =?utf-8?B?eFZqTWtXeTQyaHl6YlJvVE9sRWVnaTlDWThHRFd5ajVFRTZRdTBBRWc1NUJY?=
 =?utf-8?B?dWRpT1JaYlEwOE05dzJudVhoaUlZNCt6VEtDODVRYm9YUk04Q1M2WDBYTlYr?=
 =?utf-8?B?UzB3MU5nOHNNbTc2emlyZUJ5ekVWQXEvWFV5YzNyUzBQRnhOeEF0YlFnUEda?=
 =?utf-8?B?bXI2bzlraUZDU0ljTEdKZzV0RDZlQWN5UjJGSkd1dEhVczdsaUpYcFhweE5x?=
 =?utf-8?B?MFltaHR4dkRzOEp5am1XZHlwRitLVnJoakltTmk5Q2FBN1Y5S2ZJUlJSSmNR?=
 =?utf-8?B?M01xUXVXemVJN2sxQm4yTGtSclhHRGQxSEpBTmtnNEk3NkNSRVBmN3phWjNa?=
 =?utf-8?B?bVZwRk4zZXh6dTdLTXN6b0o5d2htUSt1d1FqSS9VcXhWSEEyZVYyWndmM1c1?=
 =?utf-8?B?NjgvTGxCK0VuQUgrY3JjZHMweXo3bFRjeWw5VDJ4UXk3MnJrdTM3WEduNUJj?=
 =?utf-8?B?NFBlck1VRDVFbTIwS1laZFRNOVJYbjh2VTBMaHNNaUdpam9iaWtNQW9ueDkr?=
 =?utf-8?B?b2pLQytxQVlpWnhCOGYrY3RYREtLR3pSbWNmZFR3M1NMV053dDF2d3oySlR1?=
 =?utf-8?B?bzBVUWVCZ01VR3lmUkppTWpwbGhaR2huTGpIWFVXUXh6NWFCbmJmR2cvUWhH?=
 =?utf-8?B?RkNiRE5Ra3lOMENqVy9iUGxwQ0F6aEVrclpjWjhwN2xMQXF0QTV5MFNXMzRk?=
 =?utf-8?B?dHFraGJOMUs3VlYxRlpXaGY2d1duNzVuYkY1Q0FlWE9kK0g2cjgwaGswdzNo?=
 =?utf-8?B?aXkrQXVlNnJDU1BiNlVKMk1XNjNrczVhdFFGRyt5YzZtcFVHalZCd1Z5RUp0?=
 =?utf-8?B?TEI3U0NYMlNhZ0NMSFFuMGtpR3hkMDZhK21GS2ZrVjRDS3FsT1hjbUNTbzVs?=
 =?utf-8?B?UGc5VlgvQXFkamhleEZmRlNOc2hnK3dHZnAwdGRCVkdKMUZZaXRCWG1vM1Bp?=
 =?utf-8?B?MWNoZlYrSnplK05HR1paVDBlVFhEZlkyWGNySXd6UUtZY2o4a0tqTEt3alVh?=
 =?utf-8?B?eTVBN0Z4NnU0K0xpTElxSGM2VGNPa2tVa2lyVDEzNHZ5ckxBaS9uZm0yUmdw?=
 =?utf-8?B?TlV0aVJLYW9oajdMSFY4SnNhSXBsNHdBUnBkMmVPbWJ0djdSNXNZaVlaamV4?=
 =?utf-8?B?OUtFSHJyTjZ5RERJLzhMNEtldWd0dWFRaitMMkNwK0VPTi9wa3NGaWlBREtE?=
 =?utf-8?B?Wm5HUWV1Y2xlMzlFbldBUW1UNjVsMEpRWVBuSDdhTEdXSzlzVUdMcHRZVWFh?=
 =?utf-8?B?VUVkTUw0S3JqazBINHVOL2VGNkcwaEo2V3prcjBJNmk1OXZEUVhBZkhrWUFZ?=
 =?utf-8?B?QkEwRzB5eVFLK1lERFUvUEhlUlU1a1paK1VLVjA0Y0h5NlJXTVVJVGp3OVJ4?=
 =?utf-8?B?Q0dWc0hKRXpPQVkvbmVhVldhUDNoUHVibk44aVJTaTA3dDBGTEtlWDlFYkRE?=
 =?utf-8?B?cVJhaUlNRFBEZld1WStqMjl6VTIxMDVuZGQ2YlY5ODB5UjB5UXFLT1VyVmM0?=
 =?utf-8?B?R0pBeER0ZWNyQnI0SXlaZFduVjRCVTByRXUrK2xUWTdEV2s5ZW1LbXljdUYv?=
 =?utf-8?B?eFNzS1gyRDlXUnE5VkxoUlZQMHNLWGFyMmplejJGTldHejFjeVR4QTMraGhs?=
 =?utf-8?B?QVg1bUFZSEx3bTM4bUIrVEJzU1oreGZmMDNsdGdlZjlwVU0yakU5bzFvMTJM?=
 =?utf-8?Q?nh3nXk9k97dMJVZfJhoJXQYWI92b78=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 023be0a3-e2ea-40b0-0105-08da081da443
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:54:23.0056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rkYA5x5UFqfSQ8zLn0ixxpcqCu/B9oGYqCpvq7qxFRPpNBH/347Pth6MK6Rtibqx509etZ9jp5Muu7lPBPut6paYVZQ+4R2L7MTyZqs4hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_065427_510624_82A9C32D 
X-CRM114-Status: GOOD (  26.56  )
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

Hi Han,

Am 17.03.22 um 14:33 schrieb Han Xu:
> 
> 
> On Thu, Mar 17, 2022 at 8:27 AM Frieder Schrempf
> <frieder.schrempf@kontron.de <mailto:frieder.schrempf@kontron.de>> wrote:
> 
>     Hi Stefano,
> 
>     this old patch was delegated to you in patchwork. If you're not the
>     correct maintainer to address, please let me know. As the NAND layer
>     seems to be unmaintained at the moment, I'm not sure whom to ask.
> 
>     This patch fixes a regression that was introduced by 616f03dabacb ("
>     mtd: gpmi: change the BCH layout setting for large oob NAND") which
>     alters the BCH layout in a way that doesn't match with the
>     implementation in the Linux kernel.
> 
>     This causes failures when loading an UBI image in U-Boot that was
>     flashed by Linux or vice versa (see [1]).
> 
>     There has been an approach to fix this through an optional devicetree
>     property in 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
>     geometry"), but this is not acceptable. The "legacy" BCH layout
>     compatible with Linux should be used by default.
> 
>     The approach to upstream the "new" layout to the kernel [2] seems to be
>     stalled and even if it would succeed, it would break systems that use an
>     old U-Boot and a new kernel, which is again not really acceptable in my
>     opinion.
> 
> 
> Hi Frieder,
> 
> I am not in office this week. I will send another patch set to change in
> both kernel and u-boot to fix the compatible issue.

You already claimed that months ago, but nothing happened:

> I will send patches for both kernel and u-boot to use legacy bch
> scheme by default, and add some code to treat few MLC nand chips as
> corner cases.

Sean's U-Boot patch is effectively reverting the default behavior to use
the "legacy" BCH scheme. So that's in line with what you want to do and
you can base your work on top of this fix. But we should get the basic
fix in regardless.

Even more so because switching the layout in U-Boot by using
fsl,legacy-bch-geometry in the devicetree requires CONFIG_DM_MTD=y,
which causes the bootloader size to increase by around 250 KiB in my
case which might not be an option for some boards.

Thanks
Frieder

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
