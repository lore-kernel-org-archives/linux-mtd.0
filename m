Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cor0b-000498-Nl
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 17:30:34 -0500
Received: by wproxy.gmail.com with SMTP id 36so637052wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 14:30:32 -0800 (PST)
Message-ID: <6934efce0501121430471e55a8@mail.gmail.com>
Date: Wed, 12 Jan 2005 14:30:32 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Clarification on NOR technology.  Remember that the ability to run
> > code XIP is effectively a requirement for a NOR chip.  This means no
> > read errors can leave the chip.  I don't see this changing in the
> > foreseeable future.  Any read errors that do occur would probably be
> > caused by a failed/incomplete program
> >
> > We probably do want to be able to easily retire, reprogram, and/or
> > test those blocks/pages that get read errors.  That would have to be
> > done in the filesystem and the chip driver needs to be able report a
> > read error occured.
> 
> What would you conclude from this (in the context of disscussion)? That
> CRC *must* be *always* checked in case of NOR?

Retiring blocks/pages was an idea for the more lossy flash NAND, AND
etc.  If your media goes bad with NOR you probably can't boot anyway.

I'm thinking the opposite conclusion.  If I understand this correctly
most CRC's on NOR are wasted effort.  I don't claim to quite
understand JFFS2 architecture yet but it seems to me the data CRC's
are not needed for NOR, perhaps some of the other CRC's are not needed
as well.
