Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8CBC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 09:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 976ED206B6
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 09:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LD+txomt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 976ED206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uazDJy7cSX8/9XINzMuH/3FBAHK0zz7+8RtsxTxnkr8=; b=LD+txomt2kFDtd
	/xvnsg7fVX3q+dZXNXvka8Jd9V4+Y7LYW4ahzQVAoeeRBGa9MZZGlCd0qU9owQX85owVbPryxZwCo
	h+lemolkZsI2hQnLRA7he93I6Rz/9D8B24CafWSa6WOv+b0zVZkXFRgXOxDrml2TfeVsFrekYW+nP
	a2+2MQBSQW5peET40YvZN1MevkGui92Fk0WSZRSTe6SnDCLMIQRQyJVeV/SSZTmKAiiL8SCm9sVAP
	o+6XJffoUks/kGagY6wNJvw1pq/kCeH0kfW9CAKMyLFzHe3fywQ5Bxcp01fTolqfcrZLSQ3mRLT+G
	2CJbUcIkDsBqw+ipI0MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSzsM-0004En-6F; Mon, 27 Apr 2020 09:16:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSzsJ-0004E0-QJ
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 09:16:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 553DC2A09BA;
 Mon, 27 Apr 2020 10:16:26 +0100 (BST)
Date: Mon, 27 Apr 2020 11:16:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200427111623.5f93842d@collabora.com>
In-Reply-To: <20200401094148.1786d48a@xps13>
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com>
 <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_021627_980468_1CDA4864 
X-CRM114-Status: GOOD (  25.40  )
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
Cc: ron minnich <rminnich@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

On Wed, 1 Apr 2020 09:41:48 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi ron,
> 
> ron minnich <rminnich@gmail.com> wrote on Mon, 30 Mar 2020 08:53:22
> -0700:
> 
> > On Mon, Mar 30, 2020 at 12:27 AM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> >   
> > > Would it be hard to support an extra ':' after the MTD device name?
> > > This way would would allow anything inside the optional '(' ')' but
> > > would keep the trailing ':'.
> > >
> > > toTay:
> > >         mtdparts=name:part1,part2
> > >
> > > So:
> > >         mtdparts=(0000:00:1f.5):25165824(BIOS),-(squashfs)    
> > 
> > 
> > I thought about that ':' too. It does add a bit more to the code, and
> > a bit more in the way of error cases. I always worry, when code is
> > going into flash,
> > about errors where something looks close to right but is wrong. (says
> > the person who just typed it instead of is a few times :-)
> > 
> > What if we did this:
> > mtdparts=[0000:00:1f.5]25165824(BIOS),-(squashfs)
> > 
> > Is the "]" 'enough different' that we do not need the ':'?
> > 
> > I kind of like the [] better anyway as it makes the mtdid stand out a
> > bit more from the part names? But is it enough that we don't need the
> > ':'? Would you still prefer the () as opposed to the []?  
> 
> I like the [] as well, maybe more than () because at least it does not
> conflict with the partition names. But I really prefer keeping the : if
> the code is still readable.
> 
> It is much easier to explain to people : "if you have a : in the name,
> enclose it with []".

Sorry to chime in so late in the discussion, but I wonder if any of
that is necessary. Can't we just split the string per device (split
strings every time we see a ';'), and then find the last ':' in each of
those strings and consider everything before that last ':' to be the MTD
name. That should work even if the MTD name contains one or more ':'.

Don't get me wrong, I'm perfectly fine with intel enclosing the PCI
address in [] to make it clearer, but I see that other drivers use ':'
in their MTD device names (the atmel raw NAND controller driver to name
one), so I think it'd be good to make the mtd part parsing robust to
this use case.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
