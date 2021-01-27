Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F5BC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 19:51:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D63764DA1
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 19:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D63764DA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pYEvPguqXseVgBXfa32p1NLqmvHEBlo+FT5n3hyWo78=; b=z1IplslGvBZdPT0U1/a59tEJ1
	vWoeyhnDFFFR3mj1wZsXEgwjCOLibPFmqbMGERkfVxRF9GhDpooillVMDgf5JsTV4d37JN5yRonht
	/MtvwyDhng1fNpR1AZB9NQ9oSVwSen3mzFRMsoIIjAwxwzCHWp8e7Qfzbp4iD2ZUV7hIKW5svaYMQ
	IyZbyzl2tqSvhliukT7i8p08QmC3NtoW+4wbI4POCo+kED7EqjNfjSYTxCH8BHuTWWo+QV1yU4efJ
	EAqLAuDDCh2M8z5D1IaVESPfAlCL/o+NnHB/JfrvYxXUGVGdPd7f4fLLVyFfOe/eDKUwxVyTKF4NJ
	x9i3ZXwLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qpp-0004ox-8o; Wed, 27 Jan 2021 19:50:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qpk-0004nP-N7
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 19:50:33 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C3EAE1C0004;
 Wed, 27 Jan 2021 19:50:26 +0000 (UTC)
Date: Wed, 27 Jan 2021 20:50:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: FIX Re: GPMI IMX6ull timeout on dma
Message-ID: <20210127205025.14ce73a4@xps13>
In-Reply-To: <CAOf5uwmbfwghXe25FxX+6Z6fu9KKkMrZi58c1vR79Pjmr0fTfA@mail.gmail.com>
References: <CAOf5uwku9Nx5-5h77yCtYwNxKHfZSfD+Dk3Fe41Ry45Lf+MdNw@mail.gmail.com>
 <CAOf5uwmZkjF1Xp8vekBYnuBZZJhYk+n+=K7QW_8MAJJ6gw5xWw@mail.gmail.com>
 <CAOf5uwnPnh3ZP932BGJkb_u10-WHwmq5srKaLdKbcFqs4A6mXg@mail.gmail.com>
 <20181029104057.30428a2a@xps13>
 <CAOf5uwmETDH2wz9vGfmETi=as4VtidOPT34-C8ndJiP_sooAZw@mail.gmail.com>
 <20181029105312.1a62628c@xps13>
 <CAOf5uwnSyRF7zTjbsNbJAWu+iabMofthx+gTOL+4wVOPDURJRw@mail.gmail.com>
 <20210127201225.68209646@xps13>
 <CAOf5uwmbfwghXe25FxX+6Z6fu9KKkMrZi58c1vR79Pjmr0fTfA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_145033_076846_510D8583 
X-CRM114-Status: GOOD (  30.72  )
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
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael,

Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
Wed, 27 Jan 2021 20:43:15 +0100:

> Hi
> 
> On Wed, Jan 27, 2021 at 8:12 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > Hi Michael,
> >
> > Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
> > Wed, 27 Jan 2021 18:01:01 +0100:
> >  
> > > Hi all
> > >
> > > On Mon, Oct 29, 2018 at 10:53 AM Miquel Raynal
> > > <miquel.raynal@bootlin.com> wrote:  
> > > >
> > > > Hi Michael,
> > > >
> > > > Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
> > > > Mon, 29 Oct 2018 10:43:05 +0100:
> > > >  
> > > > > Hi
> > > > >
> > > > > On Mon, Oct 29, 2018 at 10:41 AM Miquel Raynal
> > > > > <miquel.raynal@bootlin.com> wrote:  
> > > > > >
> > > > > > Hi Michael,
> > > > > >
> > > > > > Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
> > > > > > Fri, 5 Oct 2018 12:32:18 +0200:
> > > > > >  
> > > > > > > Hi Boris
> > > > > > >
> > > > > > > I have reverted for now
> > > > > > >
> > > > > > > Revert "mtd: rawnand: gpmi: support ->setup_data_interface()"
> > > > > > > This reverts commit 76e1a0086a0c3276b384f77905345e0fcc886fdd.
> > > > > > >
> > > > > > > Revert "mtd: rawnand: gpmi: use core timings instead of an empirical
> > > > > > > derivation"
> > > > > > > This reverts commit b1206122069aadabe1a8c50789277a978aaa4df7.  
> > > > > >
> > > > > > Sorry for the delay, I've been very busy lately.
> > > > > >
> > > > > > Please also Cc: me in your e-mails to the MTD ML.
> > > > > >
> > > > > > AFAIR I'm the author of these patches so I would like to understand and
> > > > > > fix what's wrong there. As a start, can you discriminate which patch
> > > > > > actually makes the timings inconsistent? Are you ready to do more
> > > > > > testing to find what's wrong?  
> > > > >
> > > > > Yes it's on my plan. Now for field I need to revert them but I have
> > > > > them in roadmap.
> > > > > We are testing now an imx6dl. It can be a combination with the micron
> > > > > part number too.  
> > > >
> > > > Sure, let us know about your discoveries, I really want the GPMI driver
> > > > to use core timings and ->setup_data_interface() so if there is
> > > > something wrong there it should be fixed.
> > > >  
> > >
> > > Need to move on lts kernel and  I have time to work and I must work on
> > > this topic. I don't see any update but
> > > another report. Is this supposed to be fixed?  
> >
> > Not at all, this hasn't moved forward.
> >  
> 
> Try to reproduce on a 4.19.y version stable branch.
> There was some difference on register values I have seen last time, did you
> get time to check them?

If you now have time to investigate the differences it would be great.
I can perhaps help you to try understand the meaning of the differences
if you give me precise information.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
