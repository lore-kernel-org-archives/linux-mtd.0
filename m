Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA4CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE68960FC3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE68960FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NRWOhjLEdRUZzos0W8jbxnDxOq/4ajWx02Ia/XgKmg=; b=gX7ppe8gvbzymp
	1ZYmNT9DacstdrQNgCbcW0qv+3bDzOyj9+Z8b6smDbLQ17ss40DLxeF/UhxVS49HWu6KMCP/j03LJ
	z/Uwcg+MX9ruoh59tu+BP5VHyQkupuo1nDFlHWvTz+cTYbWCc2whlGKDctRO0l2drkUneJ728xtwZ
	gs7iwMmz+NwNceFUvLJblUbel67nIvui1kxY98kAywXergAKHuvylxbf48s65Eh1g0wd19/4a2PVH
	ocLeePqVkUmGxqJwkFju0eoTpbo9VOlB9D3Ae6FgP8hW3uBewfUYA+OTaLdmJEu4eDXqOLfkMtSqp
	vtM6JgYS83dKUyhCQl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqFn-002wsk-L0; Fri, 08 Oct 2021 13:49:39 +0000
Received: from mailout07.rmx.de ([94.199.90.95])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqFk-002wsL-OU
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 13:49:38 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout07.rmx.de (Postfix) with ESMTPS id 4HQqLP6y3QzBrpr;
 Fri,  8 Oct 2021 15:49:33 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 4HQqLC030jz2TT1Z;
 Fri,  8 Oct 2021 15:49:23 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.107) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 8 Oct
 2021 15:49:22 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Fri, 8 Oct 2021 15:49:21 +0200
Message-ID: <6364938.4vTCxPXJkl@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211008153631.3f1a09aa@xps13>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211008152905.2fbdcce9@xps13> <20211008153631.3f1a09aa@xps13>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.107]
X-RMX-ID: 20211008-154923-wfyxNjzhQmQQ-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_064936_984566_3BC0B5E6 
X-CRM114-Status: GOOD (  16.87  )
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

On Friday, 8 October 2021, 15:36:31 CEST, Miquel Raynal wrote:
> 
> miquel.raynal@bootlin.com wrote on Fri, 8 Oct 2021 15:29:05 +0200:
> 
> > 
> > If this clock (as I understand) does not prevent us to access the
> > registers but only feeds the external NAND bus part, then there is no
> > need to enable it in the probe, just acquiring it will be enough.

clocks[0] is "gpmi_io" which sounds more like i/o than registers. So lets
try to remove the initial call to clk_set_rate().

> > Then, the first call for an IO operation with ->must_apply_timings
> > should:
> > 
> > 	if (imx6)
> > 		disable_clk();
> > 
> > 	clk_set_rate();
> > 
> > 	if (imx6)
> > 		enable_clk();

Do you think that the need for avoiding clock glitches is i.MX6 specific?
The errata I mentioned is specific for the bootloader software, but (I think)
the requirement for switching off the clocks gates prior changing the dividers
may apply also for other series.

> Actually we should ensure clks are enabled in the !imx6 case anyway,
> but this is needed only once so either we keep enabling the clock in
> the probe or we check here if the clk has already been enabled or not.
The clocks are already enabled (and kept on) in probe. The initial call to
clk_set_rate() is just above this (but the clocks are not disabled at this
stage as all gates have been enabled by the boot loader).

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
