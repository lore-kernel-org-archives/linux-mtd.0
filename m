Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74252CFD36B
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 00:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hfi5FHmZCkYO0wXZYpNmiQDtprRmNhDRHMq7dHt1bfY=; b=pCvBtj14CSjTmc
	IyPr7czCaCnw0V4da2FBRQ9spy8i8Q/sabTL7GF719o2rnCfKyCODGQqUekQmKcONtZoAxzZf9tWr
	k/YUsHV7Y8dv07GXjg7c9AFg6L9ojVGq47BQzCr1v+G/VyPcsJ0YkLtsOOQaZR/mq7p0RvUBbYKP3
	himzILdSmwBQ/YrFZeROgHnYOTBdpNz/Ni1jqvfoPUUnph9WPEj4XaswLLkTNJdmNiWDfyujgCoSl
	FtGcICQ+1ZWykTuolANEhNzV9Ud1afJK26f8jKwZT3p8aQM34cWBUGKhPTOi3e1wN9XAmKcetyYQb
	j83BonuVL7HwWIXvgsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgWp-0000000CV0b-3G4J;
	Tue, 25 Nov 2025 00:03:31 +0000
Received: from mail-westus3azon11011034.outbound.protection.outlook.com ([40.107.208.34] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgWm-0000000CV0C-45b7
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 00:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJ4kqDmjoFOv+7x2syyanR7l8okPiLkc0L/s+Ekyh+SXnN7FyNzeIoXLB6EwrQ5NXQwQDx+pkP2RkafjB2kcCTBytATYiWYBm2zjUabQldfnGEoBJGo28CRYzrRK4ddhBOAK1bYwwMTYJBBQZUqAHL1AxFDxvFnnvZlcAb0qzzUB3ODXLDaLnP9UCAfNc9817Qg6l/zqMsXI4tj4vmX/hQFKxHcRFbVyUDmV16QZxKd6Xryw40Jn1cf+oeqX03sQoQPuzCNEgW0OMRVGHsWqUAZ3ikuPDaGC45S8fLc5m94Yea2+JmyT9Ty6iZOQ1maZklxsF6JSq460+SqZ7bw/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUZIO3+ZWL8v2Uz/fbiig11jjQlnIjH+6I4nK7JxlqE=;
 b=CROnqKCGU0H69XjzGrs7Odm5gYQ0oOpG0e4mNtu0Dsg0w8vDStPfAs3fPmjRtTD681ZLb38XytlqX4cadg+in4pQDb+i7jr7CGu2nhKiS7K1OUKwfLA4yxw06H7G+CkXi66aOxn2xMN2vSkQisFr+8heaIVBjp1wxQLM4+amv+Kaxg9W0yKPEr78yMZdcYi16nFfX0C2eOSYaCHt4pOiubzqWQ1gfQuq1JiTxvKW3IRrV81qBbOK1AcweAgfqPVwipQ2sAZ4osRhIirtD8oQ4Opdj+eW4fmpAzaIOSx97OHDAl4CMYgYI1/oN5cpPylCOGgytD7auNW7W8DHwwAUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUZIO3+ZWL8v2Uz/fbiig11jjQlnIjH+6I4nK7JxlqE=;
 b=dhoXautMnEtCE4A73+EYSw1qSHsKzzpO3YoGs8Ft6Y2PRQyEekQVHScRbH3fcq4mgywfhocAXwlk15pkm7fuO/LbOkhrWOTYe9pwv5ms/yBbivPeFUJo2O+nILtnUfq2qwM0ollC9zT8SUAUCCuhoAbCwjX+tTBwkTk+JJ+Rt5GP7H+UCMpqSBsacXU2MLu82ucXHSiMvQB/cIZkTrfGSwSD++hjgL9Fy2/Jnxqx2XTMmYeDMs8usHdROrYfE1PLW0zhe7OfxYNvndqCRIJ+JJJtHd1hIejjBETKkBnu68PT6oBoIBpbff558o7xVzeQH7lIHCRQCksGTsIFDc1DwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by IA0PR12MB7505.namprd12.prod.outlook.com
 (2603:10b6:208:443::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 00:03:22 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 00:03:22 +0000
Date: Mon, 24 Nov 2025 16:03:20 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
Message-ID: <aSTySAFSQCxoFz/t@molberding.nvidia.com>
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
 <87jyzfzwpw.fsf@bootlin.com>
 <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org>
 <87bjkrzvk7.fsf@bootlin.com>
 <DEGSOCUMG4WZ.3IYU22B83Z2AI@kernel.org>
 <87wm3fyeof.fsf@bootlin.com>
Content-Disposition: inline
In-Reply-To: <87wm3fyeof.fsf@bootlin.com>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a1c397-b222-42bc-37e9-08de2bb60bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QYikZWij0Bon2mYAkfIdr7vR/9FSG7/hIzE3JdffBs7X4dv/9R6ZyXS7PjKS?=
 =?us-ascii?Q?cnPK63IMtLqGEbcPkvtUHrkyVhMSgG3HeSH4bbepqHRPqUOrp9tFt412cy63?=
 =?us-ascii?Q?ovL3jkaHOHxI8lwKcIJhu8BMMLOUVp04lTm13UE5B36M2d97KM1OKDWayPVf?=
 =?us-ascii?Q?EAU/q9lJGUMgCB/AXlKXRT6pvWCTqCCoReSj3virrMYKH4YY7jFxLzKVQezl?=
 =?us-ascii?Q?BE9h6A+yoAnbOUHLODsWsrNSa64QGdvgqi70PLgCDbwhzes15UvrTf1vBjLE?=
 =?us-ascii?Q?H3LQgj0OFlb846hz1rjeOnBsYtaaXkUYDO92Gc2l0lwutfCw+GipqaCvHTAb?=
 =?us-ascii?Q?8axufd7Rl4E7B06WDr4VDBucjWidDDDrxIESd1jFO09se+SZNK8JvBMlS+5d?=
 =?us-ascii?Q?c1LV9mHLTTNvCPV6NxhNMurTFnpsjBuV2wFij25lepbM+Apvdi3iWOau40vu?=
 =?us-ascii?Q?6ASgSatlPv9mBxH02ClyferJkmgWgjIRoELt4zY7QWPIlsXHir8gRYTCwIki?=
 =?us-ascii?Q?bAtuiPop3mKaeiEz81bZPXpr3mvnlrkWScxSXiI5mXtWzlnedIWuPy3Bv7yR?=
 =?us-ascii?Q?v7vzAB6lXIDOGBPytn/sMbsin1bLnevZDw8abgceILWCGuWThq/EY8anOUNj?=
 =?us-ascii?Q?B6yjgywCi/+gH47iTLBaDXGRKNx9S+F/vrdHldQPWFGwaTjnhMPV8B44O6ak?=
 =?us-ascii?Q?hVMB3oaTmI4meS1xbnUqznaJmn9nPQigTAQc0HLyoC9QDqIuW/brp88q0VWg?=
 =?us-ascii?Q?keVo3A99/YBYWUkBsBUmbkvVI8QZ/ZwoUBGpN4Gr+FCcwmEnHtXFamqloePy?=
 =?us-ascii?Q?bTKVqYXQKlRJuuYhY6VMKPNAEtQcu+NoQCOnl7P0CyWlq9rJTHISCPQXNrpQ?=
 =?us-ascii?Q?qyaFf3IxLESZu3YolcJy0mN6Ly7QW2aEugrmjuLF8pOJSWf1RDtMPmN72yfT?=
 =?us-ascii?Q?C3OPzG93KdHeAXSNqSqaKkv1Hsg39Lkjloxqh1qLreCEWQa3DJik7Nudp2gn?=
 =?us-ascii?Q?f6KWy2dkV9dLCkTtPP8/3ChaDhuoQYinwR8aS2VDA8kaNnidn5YF94cLxBsX?=
 =?us-ascii?Q?wjHEYN4A8W8dPS5/h67DsbwQN4CD6HCO1Udgxg7PtZQyeIAyxXCi4Fn0w6bo?=
 =?us-ascii?Q?NC92Yz1NtbeQ4VFIWishp5JKk7+MqosyO1Lf6XLO+5HxuvoUCO/Z9xPeZU41?=
 =?us-ascii?Q?N21L3kKEHR2BG9Y3UgiswUwqpO8XfwoAnLBR4yPSy933ZatXZJkVjQZkJjUF?=
 =?us-ascii?Q?ZTjFKwunqk99Z9QL0qb3PbBDw7dhT0h6aHMOmu3lHLdIL01Sjp8Y8RWAcJ6w?=
 =?us-ascii?Q?YGBlMps5Q4a8K4u2cqg5wgZ+XqT481LVA00rx7GipK7E40tnnLeusvmbi4Sc?=
 =?us-ascii?Q?aVqr48wBG0y6R4OBTBi/W0d0w5+pgynFshWAWWtApNhjfMb9vnDP4SW5zp/+?=
 =?us-ascii?Q?sWGwa1WB4w2KRZGrb2S1//DY69CP6F7JfhqRZx7CeQcoEdIWwnewCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpdsf2P2YmU6GI31Q0gUvU8M+wit2vlV7tUGUm9HxT5uHB0tJK5y6UeWaO8j?=
 =?us-ascii?Q?X50b45s7235lnwvWMm73BI9slMDS/beH36rsnp0YjjcUnfeXgtCNQJPbqgvy?=
 =?us-ascii?Q?FHtmN9CNtUVYvksWvnsfJVCkTfYjuAMu4sJwNFupUN2dPp2cuxLF2UsJ2bI5?=
 =?us-ascii?Q?yprUTCro8zqk7Xtgz06zvafrw0jZ95BIMwCisr6v6QopTNyVvPwDUKBCmXav?=
 =?us-ascii?Q?J7MEW8h35rlSGdeR2KRpnBeacWcLH5NWZKGW1rDtZ+Ht4jyOlEyWyHP+TLhv?=
 =?us-ascii?Q?dSTd2XZKZaekDZ7rrHCjkmO+il1hRhXliDPhxFLCiXmND3+aL3l/C46nbfb1?=
 =?us-ascii?Q?rHnCsrtufWSlvVLtNq+qrIP/tUNcheTXrqbuQURDQzR95cEB/9iqc76R70IC?=
 =?us-ascii?Q?PFfbINBSZ1fIeH2SMX4YWNYr+QVG7GgAl/rtTWwI0VyaSSJ4svb3YIWL2qjq?=
 =?us-ascii?Q?sc1jHk8My2H1yfsjCE1nB43Evza44xKxFKf1p3oUK9PLDABr9W8QvfQ9eh8J?=
 =?us-ascii?Q?48+Av/r/GH0fIwoEU0/G51wNTPm0E7qvZW9S5YmKFbasrZrzAAsQ2O7/JK1M?=
 =?us-ascii?Q?UKGFq62tFRDvhxsEB7pUHcn9+IlrnBFzKCKc2AM6CtVoSJCMfIeKgWpP1llV?=
 =?us-ascii?Q?zeo1juhfaVy1oGGZwghb33rqxw6dYv7ZWZ2trgB0WyUmn0CK/YPXoNv0k9OV?=
 =?us-ascii?Q?7C4st+fD2BKqQ+xK/x42NYkHmL0DLkq0LxMw6I8vSBAvobBxxYl3/80yAwb8?=
 =?us-ascii?Q?cOJ+hAI7rzUuZrA6J1aI7ObzumjFzSJQmiQGMpmYGj82M92iXDllorPgkt3Y?=
 =?us-ascii?Q?TE/zSpAHhcXzRLjY4jH/BZZDV7ES7VczkjRXsKF9akszR7i3MKjtMgdL6brd?=
 =?us-ascii?Q?yrA6X1a8dzy/P8KLTJmJpk+6lUPsvAvX6WjypGn0C9pC1cXogvTmKS77/MtP?=
 =?us-ascii?Q?JEDcPPybbvHqIgKihAXnBTNVw5b+rjVdpqkgJN393g+wWhTLYXT3NGLUtB+a?=
 =?us-ascii?Q?2STsjLXNyPn2UP/qrvYACJOzC54FO/v5zWg/3ThIGUDTNLYbCha4jwSP0qE4?=
 =?us-ascii?Q?CQztQ9RV9dNhg4CPbE6v8Yu7O3Z7jwDhkpoWHAVkuKpO9mLtfVDERMC0W7L+?=
 =?us-ascii?Q?HE6kLqD+YyfQ1CHrWsUG0EX9CCU5AVtsogdcFKuJkDa2JI4wvofvpd8LDOUf?=
 =?us-ascii?Q?PFMQrEBbZQXPdpjAqMFc8fxbYEWVyBTtAfAVkSd9hAZ1hTSGaQu+tIhzb+JK?=
 =?us-ascii?Q?oS2/4q/y+ek9QVF93jmwa/yoPZk6Dro6/nNt4t7maM2gf1qOCRBTOI8WZPOJ?=
 =?us-ascii?Q?mGc560BGRG3luJ8sniEs9Esswku0Fx2/0DzLvCCe5cVY2BM8XaxVeBrS7KvN?=
 =?us-ascii?Q?DXCrkECu5amhnunrpB86pqe7qO3kNUqzB814s/yaDmUEnXYyFT/ichw/jZTn?=
 =?us-ascii?Q?CK7WAvWX4fghyOVMACCrwJuF2BnumR+yuTSuozuhwuqMxmPZDY/PteIAiDIC?=
 =?us-ascii?Q?ZD/7GuWaUgJfiQUCCL0ZfHbMaUPID2s25XYxO7RGDTEF68TgQGeuuPBf2CtD?=
 =?us-ascii?Q?uu/eVpMqVXy1vmHZpQ3aO/kwvyGHJY6Ff1/IU2fn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a1c397-b222-42bc-37e9-08de2bb60bfd
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 00:03:22.0275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muoFSW7nKVhoZXnHYd5MEsIJlRUfOwKaiWDNH/hIwwiSkComgQeigDl3Li0kAMMogl/gowYaVnUvDUyUDhMx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_160329_043913_7F858EF4 
X-CRM114-Status: GOOD (  33.44  )
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

On Mon, Nov 24, 2025 at 10:15:28AM +0100, Miquel Raynal wrote:
> On 24/11/2025 at 09:50:27 +01, "Michael Walle" <mwalle@kernel.org> wrote:
> 
> > On Mon Nov 24, 2025 at 9:25 AM CET, Miquel Raynal wrote:
> >> Hi,
> >>
> >> On 24/11/2025 at 09:12:38 +01, "Michael Walle" <mwalle@kernel.org> wrote:
> >>
> >>> Hi,
> >>>
> >>>>> +		.no_sfdp_flags = SECT_4K,
> >>>>
> >>>> This one is the right fix and should stand alone in its own patch (first
> >>>> in the series if you add support for the block protection).
> >>>
> >>> Only if that flash really doesn't have SFDP. But since the entry
> >>> didn't have a size property the flash *must* have SFDP in the first
> >>> place.  Otherwise it won't even be probed. Please provide a dump of
> >>> the SFDP tables, see [1].
> >>
> >> SFDP data is in lore
> >
> > At least yours :) And if I decode that correctly by hand, it has the
> > 4k erase size bit set as well as the correct opcode 20h or 21h for
> > 4byte addressing.
> >
> >> , but not the params which are missing (?) Marc, can
> >> you compare with your data?
> >> https://lore.kernel.org/all/20250110-winbond-6-12-rc1-nor-volatile-bit-v3-1-735363f8cc7d@bootlin.com/
> >>
> >>> Also please provide the contents of
> >>> /sys/kernel/debug/spi-nor/spiN.N/params.
> >>>
> >>> -michael
Thanks all for the discussion, I appreciate the insight. After investigating some more,
it looks like the sfdp table is identical. I'll be honest I'm not a spi expert.

This data was taken with the original patch, as sfdp didn't populate as I had provided
the size field in the spi-nor-info table, this seems to cause us to skip any sfdp parsing
and go down the deprecated path. Looking at the info table, it looks like all but 4
spi chips in the winbond table use the deprecated path. Its not clear to me however,
why it works on Miquel's board but not mine. 

/tmp/xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff

md5sum ./sfdp 
a7b9dbf76e99a33db99e557b6676588a  ./sfdp

cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              ef 40 21 00 00 00
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET

opcodes
 read           0x6c
  dummy cycles  8
 erase          0xdc
 program        0x34
 8D extension   none

protocols
 read           1S-1S-4S
 write          1S-1S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-07ffffff |     [   3] | no


> >> My understanding (which may clearly be erroneous) is that most of these
> >> flashes support 4K blocks but somehow don't advertise it in their SFDP
> >> data, so every time we describe a chip we must remember to tick that
> >> flag.
> >
> > Which flag? SECT_4K? I don't think that will be used at all, does
> > it? It's only used in spi_nor_no_sfdp_init_params() which in turn is
> > only called in spi_nor_init_params_deprecated() (or if SKIP_SFDP is
> > set). 
> >

See my above comment about setting the size in the tables. This eventually
gets used by spi_nor_needs_sfdp. This ends up being most of the winbond chips
defined today.

All in all, I'm a little confused what the difference is between Miquel's and my
tests. Any direction would be appreciated, in the meantime, I'm going to continue
debugging on my end.

Best regards,
Marc Olberding

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
