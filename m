Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FE1CA0EED
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Aug 2025 05:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+GtR93wrqDSvOeQutFioZAAWiobLWXBcaOvhw71nOw=; b=w5wOkZImNPH5bh
	UqpqD1MAco8QHuX9jkBNMgTWIzFQv9d31oVrh08otzyyVDFYq2tU4nEaxxCG45e1bEhVcq3XrMeXC
	NKWvR882Z8s+ZVfRUoPNjf/711Uk09xMeuG8Syghce9C02XObZkDC6uUv/3y0iT4jZnr+x34OOwNC
	Id2u0IgLYxuAimXvykvcnofXWYwDyjsNtWtPlaRUUnVHKro/yKqYF2gIM0Pw7eRtKa+M8ryjY86Sb
	heR9m54wgu45j4qm5pEykZH6TJs1nMbBfExKVceXMwo2Snc4/n+iWjOyYtKwt+U+arJNhwv7LXLOd
	q1bjbZMJOakSXyPFELog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urV8P-00000000JrR-2h0z;
	Thu, 28 Aug 2025 05:25:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urV8M-00000000JpJ-0lzZ
	for linux-mtd@lists.infradead.org;
	Thu, 28 Aug 2025 05:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVCZ8ev7ZcHo/RaUaBTisVXdbIFc/ypcov9yuaQsr472Yvq4wBLi+4TuKb2GMVRqRGG8WNjXcbKDXlvQVJAiU6+Az3wVTaW4M4KKiIdMpas9NXLnXR508QlSxSzmckT7Rl/xahm9UfyId06ezF8jNC2kXObBn6w5YzhR6T0n8lwQJG/+8do9mCPK7IcBdYsxuoCv8Wb9zd+Gu6j4rvpJ4Fk+5S0e2KCXrzZl71Wp3EmWd/mRbQsyd6fBWk7cyuGYDPIB23G4tp360XvsijoVhvv3A2dEx3OeOoaFn+vp+agpXsQcEn8ocmBd3+YoDAdv27bMg9+NcDAPoqqgIt79hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6NM34XdP2kld4QRYtH9CpK5NcHxayz8eExhvoQ19zY=;
 b=cUYvfEUxUFAOoeWTTEH8FXgcdq7ycqA0DmlmEphUdDZ3TkZY5nVePROsiwH/TUH/vuDK5jZpB2wTE3Uh2Wr41m4ev9//EIeWQIOQETUeECkkKtpZXof1eYg59OwcAS+NYszc+b0pIUcLub6B3fW0nk+b366TWHFRUCJT7jeSJW9w2Xp8iY3+GwVvzbjjvduVNorSGL6t9gq9sx+L2jukoxx6DRhtn/0x8X3cVNTYBfzLDkKid+UCjef2r9qbxlc6gwuyWJ/AkD6WrCWuyg5sW7XDabb3GEx2HDkaKtL0tmCuP67yjq3+gWMnJF+W+xPvF4hwq16ZQcC+KBmgiBNS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6NM34XdP2kld4QRYtH9CpK5NcHxayz8eExhvoQ19zY=;
 b=AmdVGF9ibyol5En67eyi9LohGjw73QAM1Qu1fR/AkQfscA4jHvnmfljx6Jj62GhSSGY8mpIdIXk8m0QUQ6UerllKJ1M4S9U1n6diLy0kaHunOQCx5QAaJijIa8bOHa1/B82sMa5W3maVhVUH2ZMFGwj1JlALeuX4VYQApGiLUb0=
Received: from AM0PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:208:be::37)
 by GV1PR03MB10519.eurprd03.prod.outlook.com (2603:10a6:150:162::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 05:24:51 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:208:be:cafe::e8) by AM0PR04CA0096.outlook.office365.com
 (2603:10a6:208:be::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 05:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 05:24:49 +0000
Received: from n9w6sw14.localnet (192.168.54.31) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Thu, 28 Aug
 2025 07:24:49 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: mtd: rawnand: Inconsistent parameter page on Foresee FSNS8A002G ?
Date: Thu, 28 Aug 2025 07:24:48 +0200
Message-ID: <4990592.OV4Wx5bFTl@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <87tt1whe19.fsf@bootlin.com>
References: <3542795.LZWGnKmheA@n9w6sw14> <87tt1whe19.fsf@bootlin.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.31]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AD:EE_|GV1PR03MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: 572c1d8c-658f-4179-784e-08dde5f33599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?isqmfxp9qlnNl+mCu+wWGlD36jZKbN+Bfz7pKSCLWGHTD+y6Kd51Z0hHrk?=
 =?iso-8859-1?Q?0EdOznu/PDSU3aznUXj6UBmgdb/hcFfYTmxZYRkwys6Z99nktaFq9fTmX6?=
 =?iso-8859-1?Q?/ThLH6XKHhpJWgCrdvM8uggekC3/3mt8PibR8hshalzYJVUPxFSohrNMUZ?=
 =?iso-8859-1?Q?B8cdT+ZKy9Fwjx6bo5hrc6RY6Z6xPesPlr0smilmlAK6FcRL1o8QnrqDaE?=
 =?iso-8859-1?Q?szOj+1F71HYPuWcycnxEEsT/x/AWqZGAgUWcgFnlaU6XwZg+BBBFk83CyK?=
 =?iso-8859-1?Q?lnIZLe5krEeD6JT2ZrTx74iObiVwa7HE3er1h4FhUXAxfcnzq8brQNFw/a?=
 =?iso-8859-1?Q?ST+MdZhWOYtHdoKnwCSNC4r3yXCaSybWdYePUjZHhO8LIuevOQAfHn+1U0?=
 =?iso-8859-1?Q?9d7wNowBQZE0kh2lM1qHfbLI/8RIBx5xloS0lF5pku1kTuex9zAZpUsKWk?=
 =?iso-8859-1?Q?pJufhGvcP7Vjjf9z3tZfM/Uo+rMtSlr5O7s5sITW5bh9fwT+PWBwWIiJTN?=
 =?iso-8859-1?Q?9jhLARFkjUBcdLQ13r/7UbyUraXqlEqU7Gs/yN4Giyf/RVNh3/z/ToNzRO?=
 =?iso-8859-1?Q?7q0xRVgZt4t9xf50QumNOAj0NOP29svQszvwdVKwjqK9tcTannNQgYVvRK?=
 =?iso-8859-1?Q?3iBjhpTuI0stSpCLkB0gJHr9DbjbFoSflf39RoM9CiPC+fCs9V2N4q0TtO?=
 =?iso-8859-1?Q?bbQX3TqO+U7J6744EmSSLWTyEROQnxzOISp/MlkCiOXp4ZCaQeq+JHdJ/O?=
 =?iso-8859-1?Q?bqB0TFcpNI2x0VYCGtZCFGj6Z/d/xMV2RhCGfm4Vr2xabKfq8ud2Jco2qF?=
 =?iso-8859-1?Q?iyDDyA83LGYo7eKyq+DBZsCY/OmPVpc0cEZkM1/BhN3Ga/ejGgf2+Oazif?=
 =?iso-8859-1?Q?ay7jxLMT7fUgHiXzo8AjdAu8qW94D1v7u2Q00gJ0DbuDh1TGAbc8tDR9R6?=
 =?iso-8859-1?Q?0054CogeANzMtbxfiqtSe8DsyF6CZOuTossXJJYCAX64DBl56sRHT7fhdf?=
 =?iso-8859-1?Q?bJyUEYCK2CuE6i59gTr6OljjfcBiNWOQmaw9ciiwD6N3ulzYs73DZeO1Km?=
 =?iso-8859-1?Q?WRgvRP7elfPbsJgC2mAchyC0WrQ01RyR0ZVAMRSb6ecYdd1iXept9qiEFu?=
 =?iso-8859-1?Q?xKJtV2VTCZlGeEZD76STCAjav/al6amtu5h6GMWPIBGB7B1gJENsGBM+IA?=
 =?iso-8859-1?Q?x//7Tb5+uioKQ7yXsuyEobDWB8pb1T+agZjGSuYTF5Ld8SNhSdYo8DQa4O?=
 =?iso-8859-1?Q?3CW19kmObx5Yrg3V3LKrxP++SZBNgBR9ORsPUnNM60j6VNtVBLcHt7GTm8?=
 =?iso-8859-1?Q?dv42eRWMaM3JApfnJEv/SKwab2Gd3D8zYX1S45T8YDeIq7mIAHUpsjSVIS?=
 =?iso-8859-1?Q?Qjq274RcoP4soJ967Y1m+WS/0ZhR2kK3ukPWQvoSjewKfBnmqSDvsy7vAd?=
 =?iso-8859-1?Q?qAwEx/LVhNXkDtktsSlmSh8Jvj8i9QAJ9vKxbFlk525MU/WSMDtECeEAoY?=
 =?iso-8859-1?Q?zzgzHGAEETCLKuqnH3DGeigeDN8TaXutOjhU/SlHysKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 05:24:49.5134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 572c1d8c-658f-4179-784e-08dde5f33599
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_222514_217673_99386500 
X-CRM114-Status: GOOD (  27.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Sunday, 24 August 2025, 18:37:06 CEST, Miquel Raynal wrote:
> Hi Christian,
> =

> On 18/08/2025 at 19:02:49 +02, Christian Eggers <ceggers@arri.de> wrote:
> =

> > I try to use a Foresee FSNS8A002G SLC flash chip on an i.MX6 GPMI contr=
oller:
> >
> > https://www.lcsc.com/datasheet/C5126835.pdf
> >
> > The kernel output looks promising, but one line looks suspicious:
> >
> > ...
> > nand: device found, Manufacturer ID: 0xcd, Chip ID: 0xda
> > nand: Foresee FSNS8A002G
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > nand: SDR timing mode 4 not acknowledged by the NAND chip
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Bad block table found at page 131008, version 0x01
> > Bad block table found at page 130944, version 0x01
> > 3 fixed-partitions partitions found on MTD device gpmi-nand
> > ...
> >
> > According to the documentation of "Read Parameter Page", byte 129-130, =

> > SDR modes 0 to 5 should be supported (page 19 on the data sheet).
> > But the documentation of the GET_FEATURE/SET_FEATURE operation misses
> > the "Timing mode" register (data sheet, page 24).
> >
> > I saw that there is a quirk for some Macronix chips which also seem
> > not to support getting/setting the timing mode (but declaring them
> > in the parameter page).
> =

> Unfortunately, it happens that sometimes flash vendor mess up parameter
> pages, so either the flash supports mode 5 and it is lying to you (you
> can test it and add a quirk) or the flash does not because this batch
> could not stand a faster rate (?).

What does "lying" in this context mean? The message =

"nand: SDR timing mode 4 not acknowledged by the NAND chip"
implies to me, that the flash device doesn't respond to the mode setting
command. I see 2 possible reasons:
1. The mode setting command is not supported (at least it isn't mentioned
in the data sheet).
2. The selected mode is too fast for the flash/PCB, so the response from
the flash is not correct received by the CPU.

Would it make sense, trying to reapply the current mode (0) first in order
to confirm that the flash supports the mode setting opcode at all?

> > My main question is whether this is "normal variation within the flash
> > market" or a serious issue. In contrast to another device I currently
> > use, the Foresee chip also doesn't support "cached" operations. Is there
> > much value writing a fix for Timing Mode issue, or should I better
> > use another flash device?
> =

> I cannot tell for sure, I hope it is rare enough but we've already seen
> variations between identical devices with the same ID... So it is up to
> you to talk to your NAND vendor in order to know whether there's been a
> change in their line or if this chip is special and decide what's
> best. If you think a quirk is relevant, don't hesitate to submit that
> (and yes, the Macronix NAND flash driver gives you an example of how to
> do that).

I am still waiting for the response of the manufacturer...

> =

> Thanks,
> Miqu=E8l
> =


regards,
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
