Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882F9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 16:07:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507CE60E90
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 16:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 507CE60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvPbHDDbBM0UKTaNHxgNLvcGMdWGVclXGw7sq2chqpA=; b=E8viFlCAArHJAk
	90MlQDWsjXQO/16dE0PwahMY/khM6AcGV4su8yx8VlBD+ZEFA9Hfu1U36QXl32n8abcIa8EUIEmBA
	cO0q8OMyn/tySheQgJaJeV5JBn3+wqiRRxcOitjmD7uKtE1xFey3nEa0NPAqgVV0xioBJHIJvswSm
	3mj8RrPgfA3OqcEBXqhCgZlDkoec9sBUVmZqIfXY+Vi8ug3mxscJLVUqpAzOL4VwqxuBsg4WwE32U
	93LUDOdu64+fWZB8eDh4CDggaSLAcKayMYdXynJIfs7U5a5uT1+dWtcCrol4lxK9UP7TRwb9ECgkQ
	5VCYZMUalxb0gvcY3GOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXQUG-0071BC-BN; Mon, 04 Oct 2021 16:06:44 +0000
Received: from mail-eopbgr20040.outbound.protection.outlook.com ([40.107.2.40]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXQUC-00717C-1G
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 16:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbPmGE1ziCBqVGYCAKNVbep5r0F20UeVU7tLSqrW+kfP9KH8+yRHRZm+s4hubKpo/J71DNMY+tqROe6RzmHDNNAGyXZICL2gm4rNOL52hu54YZoIjW8dw4cS47y2hVrYwaTDMX2s8xArgVogKhY7Vo8yO7jXbxic8ocxK/daPxy6ptujQtAf5odPY+Fgs+JmO4qpTbn5TGqp2AX/shL2u/ifkqiFkZQKxlSNoRurXoAVy9xjusZfRVEBxsoSaFOcqHN3mBvOp1mlygYq1VjXiKZ1iJBfnfeUO+7xqsPobQ0p3yrsJ3B5AHGo1yAjbQjB6jCta7FurAbi9kQjyVMX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRpPD0n6gOFgi5Quox8PSx6AuX19zVbt1CC2w+XAf9s=;
 b=fWR+3FnJ5sonkSaaCrg3mk4xVDOh+EU+cPd2colXYpIv951TMWTHdn1ulhcIidcTHElz8gvyOalMn/Cytcaa5Genlc0DMOhKEVP54eGYz6woLXgBt40RXoDuLLmrSawln/th826obGPgbNg9y8Nuj9b6SUKPZLxjlXxeA/HEpou7AD2M/Q6gwNxuUeNS54GZsLdSR0AJTJ/1VRJ7aKhPdKMtL7om9xUvX73AaLE5yGo8u1KZu36nN2yDAJyabvb7mxdOe4MOgZbfj6FoKpc14x6oPKhPRCTlEnfh+EZD6me4sscr90IpXrOlbzn69nxpvw4T32bJg3GilpSh/bQDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRpPD0n6gOFgi5Quox8PSx6AuX19zVbt1CC2w+XAf9s=;
 b=YhWItgWrBJMgb0WxC+DjvUWRJBJ2mXF8GqrzZ/UmqyHuN9sDWOXC4In8NwzhCvai6EMB5vlAlDRc3tRAvijGM1jLq8TUKWKG42S721slFFzU5Phr5Ac3863DvraT237lxR2yhFm43KbsoJlK7tMpevDfsFx+NkweOhG3AsdRfpQ=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 16:06:31 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 16:06:31 +0000
Date: Mon, 4 Oct 2021 11:06:20 -0500
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Christian Eggers <ceggers@arri.de>, linux-mtd@lists.infradead.org,
 Greg Ungerer <gerg@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211004160620.3guajv5vvtfjrl7c@umbrella>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <3160469.44csPzL39Z@n95hx1g2>
 <CAOf5uwk3XLtTgoMuRU+hP29xQzPUj9NEuV58V5QdXXigQ0waVQ@mail.gmail.com>
 <20211004173351.36a66ccb@xps13>
Content-Disposition: inline
In-Reply-To: <20211004173351.36a66ccb@xps13>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: BYAPR01CA0029.prod.exchangelabs.com (2603:10b6:a02:80::42)
 To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
Received: from localhost (70.112.23.252) by
 BYAPR01CA0029.prod.exchangelabs.com (2603:10b6:a02:80::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Mon, 4 Oct 2021 16:06:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2717131f-3913-41f0-ca90-08d98750edff
X-MS-TrafficTypeDiagnostic: DB9PR04MB8464:
X-Microsoft-Antispam-PRVS: <DB9PR04MB8464A395123D46405F1DDFE497AE9@DB9PR04MB8464.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0wSJ9e8H64QVhTXc4aajXHgaFHgToXO777oi1AIeJWtLq2iLb73hxpUyPyh1o8t3K6F3j/wdwUF6W3WSIBvDGkVuEXWPdiVSWqoBylytQcuA8ZtgDg8WyuPADtv9MP53l3Qp6Nyi+Ohd0vprvA4cNfC92o1j2hhqe7v2vQjuQZesvBy0MhTrYizTQoVJX8liCeSXkNSabTodql313xiu/2/6XznZMAAS7zIaqwxJuhSQpWwWNKlSUjFCKRyGnlRUk7sE5GQMtNfG/SAH4f9ri6iD1YtarBlz57A9YHYj43dSNfYo0oY8L+K+L2kXskMP3ZkAn7KcNiwyPKqXsbXsGvh5uB6ji4viI8Dln6RhYLlr22jAoA+8RxNqHfAEBe3P7TSI82VjHCkxARBAfZs9rhvRqiZb4g7R6sjnR+K6jfWG1VYNRNC8BODKysQkpR9p8iBxLGzNbF3nLom9gI7u5SEeV7Psng4pq/344hEDyIjCBUPsavwarJx5gqcnDMl5SR0NqBGVkGk0DTZ3Z12e9Wml19BbMypNNIqNdXwNrHIv7b9yWsYJ+Gzt/dtULX8B3Hryb7MXooGd0EfTFhISp9BxeNiPncaZi04zIAT5XCBJuziMYQ7UetBa1kIAgZT9PI7+ANn18lMM9YxhZzOepvKOhzxU0+2C3amDl3a7C3poq8pJpgtueV7uBkbrAEKY5kFxCYxTvypgqa/pemKN3v42aQMbLKSfOdLbvlMg6El5L5GAgGVE6ETuHXy8A5NWyynvEiNJecsTOBlNfT+u3rzW5HSvj9ZZc+xyWK8jpp4zaLPnHF6WHEGxYAIAAjDW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(6496006)(83380400001)(52116002)(5660300002)(66574015)(508600001)(966005)(6666004)(44832011)(54906003)(45080400002)(6916009)(316002)(86362001)(1076003)(2906002)(53546011)(66556008)(38100700002)(38350700002)(66476007)(66946007)(26005)(186003)(8676002)(9686003)(4326008)(6486002)(33716001)(956004)(8936002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?63ZbWuROBFAMTvq08/AiZmjffh7pwQ7DrNGPHWrJTOCcvNBK8eoRTyx38X?=
 =?iso-8859-1?Q?zvgdIMA4SA/Lb75UDjonFrnwknR8DQ9Qr1ld5szrqN0oNJySQwBsRz5ve/?=
 =?iso-8859-1?Q?L0QeS2v1ADuMPmqcD4RN+2FQccOwG2yuDQYToxdGMAmByFEIQmZp/Rs14c?=
 =?iso-8859-1?Q?2QiiY6UID7wwj8TybNoKjcUKfvRuuLH1h935yqPN6O2eOYu+fNcsiCU7kR?=
 =?iso-8859-1?Q?g3sMxbep2qus14KVYuUwdJFBEyOv9bRrGHKsOKqJ09qvG0bubhIK2bcX36?=
 =?iso-8859-1?Q?uyfVQebLaosF2lbecB4XXMGRXoNhPcb6YJ7bX8u4zUgX6htKC8kCeVGGAT?=
 =?iso-8859-1?Q?734Y3HqxLVhWj9Dxyic/Qg+QCZq1YANWMO7PTI+2N2JhmzhrwL/09CT58c?=
 =?iso-8859-1?Q?8RRiUSNYZ1ql8FeepEZ/rKI5/8PTspTUWX/NZJ1W1hGog3cHKX7gagEnLN?=
 =?iso-8859-1?Q?8cmonycWNp8IkW0+fjJwQy8ysu1Qo1+A52JIrpWoNjrAZG9b9gYFBwdx+Q?=
 =?iso-8859-1?Q?u5kRcooHZzwNKvii6UQfj3VYq0emocWBtBftlhn3zIPXidzVH/HtHzSdFS?=
 =?iso-8859-1?Q?JrUCujZidmv2FPMDhLfRADBbZSENPAh2gY+5tKNrnAjC/SjtuKr37Wrn74?=
 =?iso-8859-1?Q?KLVrP7+Y36BuODT/IwUJ6/sOnBKlE6jSP9cZFs06VeTm8bUPG/m+zWjGtF?=
 =?iso-8859-1?Q?MOKu0rp4HK4k5a0+zPj6ZHtoEbJti1gm5LcZE7xu2kAWU2ap5cOmt9ZETH?=
 =?iso-8859-1?Q?G1o3dtCBJLYaIqS/Ewt2/XgtOA3hhxQGyy5NlQR2nXTJMOqCGgrh5ki18U?=
 =?iso-8859-1?Q?LynGTRZ0utAlX6hV3nBL3zfXeZwrMfELFGGbp+wlkRd1aJmEKpZRXOTT0T?=
 =?iso-8859-1?Q?zRhXxwjzGqYX7hazBjpcTU3pA1CpMXxOS60Lq6ZzaMkwoAuvBN/QGP+gxX?=
 =?iso-8859-1?Q?FrvbI/D13HUx9i60AD6AdakZPZLNlObNLzcje/VbmjaK+w+osUT/C3Aui+?=
 =?iso-8859-1?Q?L2bT9HahGeLW43ZlWKF8YUe5mEhfw7P9EuDIf/oCGG0doz68UlAb0raPc6?=
 =?iso-8859-1?Q?j6e7DAksYYXYG5FewrAGpzP2tjjt63tGwWefG+MyxxbVcPomW/Uc0/TSpg?=
 =?iso-8859-1?Q?TqbItqikh4akTbKv7j04RszxB8QDh2+3Q925rXK4rNXH5bwXNX58CT3KIY?=
 =?iso-8859-1?Q?1XgGWsTy0OiX+KABlm1AlwJNzLS07q/hTb9KJtHwy2B8tjZKyUQPNPc3ox?=
 =?iso-8859-1?Q?3NIzydmFEj7htnZamLOvIsummxS5XtJDPyoL78Vt6v6r+tunyNYV8ngUMa?=
 =?iso-8859-1?Q?odWvl4y4+AvgNQ7vwT3ldOok/Dye6/wBO2jDO6YcyUfjKTVWMLmdIWaG02?=
 =?iso-8859-1?Q?hryqh0GIBt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2717131f-3913-41f0-ca90-08d98750edff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 16:06:31.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXtAveRZiHczhtULklIAXPVvbXVAyM3OaXFb8OgqE0BrVPsv/1++WVRlGJtKnze0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_090640_290475_3E9CCB9E 
X-CRM114-Status: GOOD (  38.75  )
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

On 21/10/04 05:33PM, Miquel Raynal wrote:
> Hi Michael, Christian,
> =

> michael@amarulasolutions.com wrote on Mon, 4 Oct 2021 08:27:54 +0200:
> =

> > Hi Christian
> > =

> > On Mon, Oct 4, 2021 at 7:54 AM Christian Eggers <ceggers@arri.de> wrote:
> > >
> > > On Monday, 29 July 2019, 08:41:51 CEST, Greg Ungerer wrote:  =

> > > > Hi Miquel,
> > > >
> > > > I am experiencing a problem with NAND flash DMA timeouts on
> > > > iMX6ull based boards. The problem is very similar to that
> > > > described in:
> > > >
> > > >    https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flinux-mtd.infradead.narkive.com%2FJIUulfFB%2Fgpmi-imx6ull-timeout-on-dm=
a&amp;data=3D04%7C01%7Chan.xu%40nxp.com%7C278d7b93edbb4b72923408d9874c5ffe%=
7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637689584362563293%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;sdata=3DuSkVTsEF9yhHt5ZstJMbPIjUQbHzjhiHMjO9eDgFSg0%3D&amp;=
reserved=3D0
> > > >
> > > > That didn't come to any specific resolution that I could see
> > > > in that thread.  =

> > >
> > > Hi all,
> > >
> > > I am joining this thread because I am also affected by this problem. =
I use
> > > kernel 5.10.65-rt53 but I have seen this issue on many previous versi=
ons. In the
> > > past I only recognized this on my development setup but now this has =
been found
> > > by our testing team.
> > >
> > > In our test setup we simply perform a reboot every 30s. After 5 to 20=
0 cycles
> > > the test stops due to this error.
> > >
> > > The kernel version I use already includes:
> > >  =

> > > > Han Xu <han.xu@nxp.com>
> > > > mtd: rawnand: gpmi: Fix the random DMA timeout issue  =

> > >
> > > Additionally I tried ...
> > >  =

> > > > Michael Trimarchi <michael@amarulasolutions.com>
> > > > mtd: nand: Calculate the clock before enable it  =

> > >
> > > ... but the problem still persists.
> > >
> > > In my case, some registers show different values (annotated below):
> > >  =

> > > >
> > > > The boot trace on the console for me looks like this:
> > > >
> > > > nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda  =

> > >   nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc  =

> > > > nand: Micron MT29F2G08ABAEAWP  =

> > >   nand: Micron MT29F4G08ABADAH4  =

> > > > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size:=
 64
> > > > gpmi-nand 1806000.gpmi-nand: DMA timeout, last DMA
> > > > gpmi-nand 1806000.gpmi-nand: Show GPMI registers :
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x20830002
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x01c6800c
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00010101
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0xe0000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x23023336
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x000001ee
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0xff000001
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x00000001  =

> > >   gpmi-nand 1806000.nand-controller: offset 0x0c0 : 0x00000202  =

> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x05020000
> > > > gpmi-nand 1806000.gpmi-nand: Show BCH registers :
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x00000100  =

> > >   gpmi-nand 1806000.nand-controller: offset 0x000 : 0x00000000  =

> > > > gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000010
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0x030a2080  =

> > >   gpmi-nand 1806000.nand-controller: offset 0x080 : 0x070a4080  =

> > > > gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x083e2080  =

> > >   gpmi-nand 1806000.nand-controller: offset 0x090 : 0x10da4080  =

> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x070a4080
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0x10da4080
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x070a4080
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x10da4080
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0e0 : 0x070a4080
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x0f0 : 0x10da4080
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x100 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x110 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x120 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x130 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x140 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x150 : 0x20484342
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x160 : 0x01000000
> > > > gpmi-nand 1806000.gpmi-nand: offset 0x170 : 0x00000000
> > > > gpmi-nand 1806000.gpmi-nand: BCH Geometry :
> > > > GF length              : 13
> > > > ECC Strength           : 8
> > > > Page Size in Bytes     : 2110
> > > > Metadata Size in Bytes : 10
> > > > ECC Chunk0 Size in Bytes: 512
> > > > ECC Chunkn Size in Bytes: 512  =

> > >   ECC Chunk Size in Bytes: 512  =

> > > > ECC Chunk Count        : 4
> > > > Payload Size in Bytes  : 2048
> > > > Auxiliary Size in Bytes: 16
> > > > Auxiliary Status Offset: 12
> > > > Block Mark Byte Offset : 1999
> > > > Block Mark Bit Offset  : 0  =

> > >
> > > Please let me know if further information is required.  =


Could you please try to add clock dis/enable when setting clock rate, in ca=
se
clock glitches.

clk_disable_unprepare(r->clock[0]);
clk_set_rate(r->clock[0], hw->clk_rate);
clk_prepare_enable(r->clock[0]);

> > =

> > I need to continue on it, during the following days. I have stopped
> > moving to LTS 4.19.y and with my partial revert.
> > The problem as usual was to go to production on some devices. Anyway I
> > have the device that has this problem. I can
> > restart next weekend. One of the thing I notice that make not work on i=
mx28 is:
> > =

> >        if (sdr->tRC_min >=3D 30000) {
> >                /* ONFI non-EDO modes [0-3] */
> >                hw->clk_rate =3D 22000000;
> >                wrn_dly_sel =3D BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
> >        } else if (sdr->tRC_min >=3D 25000) {
> >                /* ONFI EDO mode 4 */
> >                hw->clk_rate =3D 80000000;
> >                wrn_dly_sel =3D BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> >        } else {
> >                /* ONFI EDO mode 5 */
> >                hw->clk_rate =3D 100000000;
> >                wrn_dly_sel =3D BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> >        }
> > =

> > Here there is an assumption that your clk_rate can be set to that rate
> > but on imx28, the parent clock of the NAND one can not
> > let it go to those speed. Changing it let it really set to the wrong
> > value, so imx28 was totally broken. The other computation was based
> > not on fixed clock rate but I think even on clk_get_rate
> =

> Interesting finding. I guess we should try to apply the desired block
> rate and if the final clock rate is too far from what is achievable and
> works we should refuse the requested configuration. The core will
> automatically try the slowest -but perhaps working- modes.
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
