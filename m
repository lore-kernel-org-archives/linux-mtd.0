Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7771BC28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 08:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB9E20714
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 08:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pT6sI4P1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="XaMEP0ty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB9E20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdT+SozYjlIujJ+P75eU2bcPKG561jlPEFvL70QsIII=; b=pT6sI4P1Yz9bU8
	SEYO3a42dm4iSPlo+ozJDz1bcVgI+XuvmiGDB3OBtvFoBXAs+vsMSIE2NwOpN97NUjedeHNHZk6sY
	wwkZfghE3bQuxiGafiem+NQbChbfjTVAGvbAUoG+m/Zxa85BRpwQAWQCy//deOMhbIxd4PT5vV6Hz
	ypetlzYgoslaTAuNl5qArWovde2XcQy7mbGddUgMnAiOqm8aU6x0TUq2SHnbbbgy5w2sa/mQyRzGl
	02P5BNm3g8L3VUGsu0dzR+vyvgP4YeFS7lG5cFsTt+AQ50A+CzlwmwqRIsGdiMF6benyNbdTOY5w+
	6TYXIpnzXFt+IO0wRPdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFYt-0008OH-Fo; Wed, 06 May 2020 08:37:51 +0000
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com
 ([40.107.243.56] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFYq-0008Md-0j
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 08:37:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHPyhBDO7h6kl5KQWOJ7IdIOjXgRxwXTVXkRGV58KtPNR+HeLF7ycLgMyT8005bZoDnKGe8nlVhjd0b/KgX4gtwFYPRKIhn0LBNS2stkq15Mfta72Glv6MYUUxKUzjQ71WFmRhvtGXSQ29tPag4Oxyi4Y9tGnLNMwr3CMgRjy9Qn4H2kDPDeM3zAMSl21qJcMzMCt2AaTYhGJ2VCiDRzyfA/Cvo4OZFInDq/ZrYjAxkQqxAsDnF0s4lufhFkz5syAvZRMyIuOSbiCOcnBMGhEVpSYlX1iK+jEcF4oDks/TlypyS/96CU+iVH0ZGqFxdxr20wdGYC09dKhoRtmx7nHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NYRAUM0EgVOrPwQkk7PtVkj33j+cancIiou2u1jyyY=;
 b=Vk4r5OFyh8jeirSrmNDUpfrGpLibwBm1E7XVSMzIc69ZEwhio7m6uQwtk80InT98msPd66PUSrkCs7U8VJZPkBRt53Uyvwa5DiZQ/NTqx3tw7Y8CI/pYC/wYzvH3hES7/GzFcNYNsBaqRUgHJjndh3JL+k2fOYgxVVpa3jwW5nMbvyQNSb4rJ8YwNH0XCQG1mcjTz3/39FWV2ASSwH42XTMRWuP8dxiz4yPYX+iN7WnTLgxq7CmjfubID3CMJgvqQM+XvxC5VJ4PgKgEdQ+3b8g2Ds+KhKLdcluPHdC3sStV8471Y0TIcmMXjMdBRx7nRz/7fblg4JZWdKAubLoMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NYRAUM0EgVOrPwQkk7PtVkj33j+cancIiou2u1jyyY=;
 b=XaMEP0tyn3TSns/JNhKnMUA3j+Ce+R7n1qsOU2FG4jhgNqqe4u93/dRPwGszjcWyz0nxHD62BE7RUn76c/b8nWzpOqGogPQtQaFVAe+LMsrGFtmkS2Ob28EMqkcfprH9J9kajYcLL+i4HiGBcDomwiWJy1Hi+hHX7buMOZk9j3A=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB3953.namprd08.prod.outlook.com (2603:10b6:406:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Wed, 6 May
 2020 08:37:45 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 08:37:45 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Steve deRosier <derosier@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [PATCH v2 3/3] mtd: rawnand: micron: Address the
 shallow erase issue
Thread-Topic: [EXT] Re: [PATCH v2 3/3] mtd: rawnand: micron: Address the
 shallow erase issue
Thread-Index: AQHWIWVsiqRSf9dVhUG7nYqD1d0ynqiWjyMAgAA4HwCAA/c8sA==
Date: Wed, 6 May 2020 08:37:45 +0000
Message-ID: <BN7PR08MB5684D16F4CFB0BDD89E8860DDBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <CALLGbRJU5Hj0gxs_4WG0UUYYMDSF1MAiEjkqn0G-zenhVhnSFQ@mail.gmail.com>
 <20200503183616.2a8a8d6a@xps13>
 <CALLGbR+Yqo31Oh0gnZS=URd15qjz2urROo8NM3K7-jvf7FFA1w@mail.gmail.com>
In-Reply-To: <CALLGbR+Yqo31Oh0gnZS=URd15qjz2urROo8NM3K7-jvf7FFA1w@mail.gmail.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWRhMDU1ZGYzLThmNzQtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFxkYTA1NWRmNC04Zjc0LTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjY0NzIiIHQ9IjEzMjMzMjI3ODYzNTcwMjczOSIgaD0iY2ZZQVBOaW42VTZvK2hIbWhwdGVBWlFWTldVPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFEVEtXYWNnU1BXQVZuaFhXMHhLM1owV2VGZGJURXJkblFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b7aaa30-978c-4891-6aee-08d7f198c00a
x-ms-traffictypediagnostic: BN7PR08MB3953:|BN7PR08MB3953:|BN7PR08MB3953:|BN7PR08MB3953:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB395358689BE4933E34A4B937DBA40@BN7PR08MB3953.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2tVrP8+jYBaL8vS9QL9CmmcQvuYhdWHxnRJcTY465/h37vvv3slbw7U1yOB1+3TTJ6o7sy1oUE9umegGj/lUpnJMxh6VRIgsnqVmtLCDpkgqQTQM0baoz7fjtWhHSKG+/U8APhG/M2Ra4mNztmSiC3S4ZCehLJ8Y0Wa8MFVqp0yAZJCU0gvTuBK/gMmm/WMhKuZdH7LoKIZM7Kaca7x4R/w03VOM7+7icjFk5vqgSpr0B8CbVtaA43QmI4urRJ7+YMJ1Zy4hT+dHCpN86ytKcr14Qddb8rR+bkGEJnj7LQfyAnB8b0MmP5lMbtuFIEtyob5vw3wxbLpbuRQqWrmWDNz08ZUmmL2qEl+kf9IvbduyK3meTBP85/E5pRoLJzP+8QCBsSAX4v4pnVqRnc/uMaeZImFWqd/mlmrxPp4fAupXn0c/egYT0VsVOJvQCJYqs+6G9UbS1w1PkovWhishQmY9uzdiMixwlEOWs1wbetv6EAP+6sGPx4zcSqnZITZaUyF8FUrkf77vXGuT7y3wPhPXv3OXpmQw2WdVA0D1qk+LX2p+yh6crDd+n2Wn+1tfUet8hADLB2bu2KbllQ7E+VrNPZeYh4TArdnbIqfAhE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(33430700001)(966005)(33656002)(66476007)(76116006)(110136005)(64756008)(66556008)(66446008)(186003)(26005)(7416002)(33440700001)(6506007)(316002)(8676002)(7696005)(54906003)(66946007)(55236004)(8936002)(52536014)(5660300002)(86362001)(9686003)(55016002)(45080400002)(478600001)(71200400001)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: N8asxWVn/zTQeT6xgmo7J8MPHJqiH3LIBi9MSHLWNjMmo9LTpjbUa99E+9BUIE68M4F49LYeO9aEE9OkIDAoAkc5cIykXg3KaGUu/KMlMURFW0hMAQtbf1HPQLO7j87SQbwaZWwuLTLpxlbTXxJoE+EV2kWNur4nYVovDQANdPh6gqDu8BFrRDhpBKGGns0IGyuXHqB+yKAoNeZo2OrlA5rNrNIpUilxIkQ2p8Ttl/0StTifwNk3pAQryYloX/iBXVljKhcvmmRS7iZe2E+4vNBWXkecNZB3WmfZJVxLeG0j5Nw+6VptJqmlSkt+r2yajN40eLq+RHM+ljiKl4rnjhV80kyhVbp29BuJzlOp7q5uOYaS7Nc0mC3Ox1Gih55dSRpo1ehrPKw//ut9HQ+/gncqP9cr9RFpSu5IlEJwate8a6/6uGbIZXraSlST+gm8MNtrpEA/vo4dwA3SzyHWDH8ho9u5SeXugcYfXx3MmZJAGEOi+vlCJkeU8SMArbq1IokJUkuaE3lqwCJnbm1KZY0pUn+k3F0WnuUbX6UrHy4tcXMrRsWKO4KfbiGV8J9oOCbtV1srgoyU33jBeeIMYpOgXrf+sG+Iv6QX+43VC/vIxABK+Fw8d4d8kbUPqrUc8qWvqWjqkqd1xJDussQxL9VeE3qO2kEXBFWCWF8uQVLMxpucNa7/uGD7JKqIgnkZAtWupFclv3ZItZhVvk0728W/UjAirrizvyYESVaw2dTO/58kJXjQPnQPsDxu1uLri6b6xqMObR3puU8onKAhEscXCwTViJDDnCGXW/Z0Kkw=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7aaa30-978c-4891-6aee-08d7f198c00a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 08:37:45.3586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKPIVSHI9Wzdu9U7jYtYStmlycpVzGJrDTb+bmE2r4WFDM1tldfX5w8IMUzzRASd+fbgGoz8cdzC1qHRiYW+rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB3953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_013748_120295_FB920A67 
X-CRM114-Status: GOOD (  34.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Steve

I have fixed this issue in my patch https://patchwork.ozlabs.org/project/linux-mtd/patch/BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com/
But it's mainlined in the upstream Linux.  


Thanks,

Bean

> >
> 
> 
> I apologize.  And to clarify - I am not calling you (nor Boris, nor the MTD
> community) lazy. As a long-time member of this list, I know that's far from the
> case. Maybe more in this case Micron deserves to be called lazy now that I
> understand the history. Though that I know is an oversimplification too. In any
> case, perhaps _I_ was lazy with my phrasing and by not looking up the history
> here.
> 
> Again, I apologize.
> 
> > > We put this in and the resulting discussions for embedded systems
> > > designers for the next decade are going to be one of two things:
> > > * Oh, you want to use that SLC NAND from Micron? Well then don't use
> > > Linux because it performs crappy on Micron SLC NANDs.
> > > OR
> > > * Oh, you want to use Linux? Well, don't use a Micron SLC NAND then
> > > because they perform crappy on Linux.
> > >
> > > Let's get a list of all chip that have this bug (and let's be clear
> > > - it's a bug, not a "quirk") and enable it for those chips specifically.
> > > Even better if there was something in the chipinfo itself that made
> > > it obvious which ones had the problem (because realistically it's
> > > probably specific to a particular geometry). In any case, it's in
> > > the best interest of Micron to identify to us exactly which chips
> > > have or are likely to have this issue and for us to be specific on
> > > which get assigned this quirk. It is probably listed in an errata
> > > app-note, and if not it should be.
> > >
> > > Strong NAK to defaulting all Micron SLC NANDs to this - unless it
> > > truly is the case that _all_ Micron SLC NANDs in the past and in the
> > > future likely have this problem.
> >
> 
> From your description then, there's enough denial in Micron within Micron that
> my statement does apply - that at least all future Micron parts will have this
> problem. Simple logic -> if engineering won't admit there is a problem, they're
> not going to get funding to fix the problem. And it's not just going to go away in
> the next part, because we all know that new part designs usually start by
> borrowing the old part design and since you can't admit there's an issue it's likely
> the problem will come along in the next part.
> 
> > I am open to alternatives.
> >
> 
> This may sound extreme, but if the point here is to force the manufacturer to
> give us the information that is required to support their devices, I'd even suggest
> we pull the support and either drop the driver entirely, move it to staging, or
> some other extremely obvious move that says, "we are unable to properly
> support this without the manufacturers help and the manufacturer doesn't care
> about it's customers." Personally, when I upgrade my kernel, I want the kernel to
> SHOUT to me that there's a problem with this driver rather than have a
> performance issue that I might spend the next six months trying to figure out
> why.
> 
> When I start a new project, one of the first things I do is check to see if the parts
> that we want to use are supported by Linux. I'd like it when I check if a Micron
> SLC NAND part is supported that it is clear there's a big issue with that part. It
> showing up in staging instead in the main tree would be a clear signal.
> 
> A message to Micron and other chip vendors:  Do not attempt to hide your bugs,
> we will find out and hiding this stuff simply pisses us off. Bugs happen, we get it,
> expect it, and can work around or fix them. Responsible companies do not
> dismiss their users and will quickly and actively investigate reported problems
> and then disclose via errata. This used to be common, even as little as 10 or 20
> years ago - there was rarely a chip that I'd use that didn't have a few errata
> documents associated with it. Now, good luck getting them (even if you can get
> a datasheet).
> 
> We in the embedded Linux community want to work with the vendors to get
> good solid upstream support. And vendors, seriously, why the hell are you
> resisting it? You've got a large number of people not on your payroll that are
> invested in spending time in making you succeed because it makes things better
> for them too. And note the use of the word "upstream" - I no longer use vendor
> drivers. They're generally of horribly low quality and either make me stuck on a
> particular 8 year old kernel or require me to rewrite them for current versions
> anyway.
> 
> Tomorrow I'm calling my CMs and will start the process to remove Micron as an
> approved vendor and will start qualifying alternatives.
> While AFAIK (and I intend to find out for sure), we don't have a problem with the
> parts we've been using, I don't want to work with a company that is technically
> dishonest like Micron.
> 
> To Miquel - I appreciate your work in finding and working around the issue.  And
> I appreciate the pragmatic approach to fixing it.  But perhaps it's time to say
> enough is enough.
> 
> I withdraw my NAK (for what it's worth), but can we find something to very
> clearly mark "you may be using a broken device, but we don't know because
> Micro won't tell us and so we've conservitavely setup a workaround for all
> devices that affects performance"?
> 
> I'll suggest several alternative things, from most forceful to least:
> 1. Drop the driver.
> 2. Move the driver to staging.
> 3. Make it a kconfig option that is on by default, with strong wording along the
> way of "if you know you're using a device without this problem, you can turn this
> off".
> 4. Shove a printk of warning level in there so it's clear in the logs for those of use
> who look at the logs when we upgrade.
> 5. Keep it on by default, and add a white-list of known devices that are OK to not
> use it. Add a big comment of why (which is there) and instructions of how to test
> if your device has the problem and that if you test and know it's clean how to
> send a patch to add to the whitelist.
> 
> At a minimum, I'd like to see a combo of #3 and #4.
> 
> Thanks,
> - Steve
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
