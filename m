Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp6bm-0004eh-IG
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 10:10:00 -0500
Date: Thu, 13 Jan 2005 16:09:27 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jared Hulbert <jaredeh@gmail.com>
Message-ID: <20050113150927.GA18864@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0501121430471e55a8@mail.gmail.com>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 14:30:32 -0800, Jared Hulbert wrote:
> 
> Retiring blocks/pages was an idea for the more lossy flash NAND, AND
> etc.  If your media goes bad with NOR you probably can't boot anyway.
> 
> I'm thinking the opposite conclusion.  If I understand this correctly
> most CRC's on NOR are wasted effort.  I don't claim to quite
> understand JFFS2 architecture yet but it seems to me the data CRC's
> are not needed for NOR, perhaps some of the other CRC's are not needed
> as well.

I thought the same, but Josh convinced me.  NOR *should* just work and
never have problems.  Checksums *should* be a wasted effort.  But for
some reason, both the flash vendor and quality assurance messed up and
broken flashes got were soldered into products.  Nasty.

So at this point, checksums are quite nice because they effectively do
the job that quality assurance should have done.

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
