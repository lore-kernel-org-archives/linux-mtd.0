Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtNs-0000oa-Ms
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:05:33 -0400
Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BheTL-0006eP-5P
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 02:10:11 +0100
Date: Mon, 5 Jul 2004 21:09:59 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: dkey <dk.dbox2@gmx.net>
In-Reply-To: <200407042312.26606.dk.dbox2@gmx.net>
Message-ID: <Pine.LNX.4.44.0407052107170.18865-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Robert Lippmann <rlippmann@imsventures.com>, linux-mtd@lists.infradead.org
Subject: Re: unresoved symbol __ffs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 4 Jul 2004, dkey wrote:

> On Friday 02 July 2004 05:32, Nicolas Pitre wrote:
> > On Thu, 1 Jul 2004, Robert Lippmann wrote:
> > > hi all,
> > >
> > > haven't seen this covered before, but when i try to use recent snapshots
> > > (late june-ish), i get this unresolved symbol when building a 2.4.26
> > > kernel using linux-mips.  i assume it's because the compiler
> > > sets --disable-builtins when compiling.  it occurs in cfi_cmdset_0001.c
> > > oddly, the file compiles without warnings.  oh, and i'm using gcc 3.3.2
> >
> > __ffs should be defined in linux/asm/bitops.h.  It is defined for MIPS as
> > follows in 2.6.7:
> >
> 
> but in 2.4.x kernels, it is defined as ffs (without leading underscores), so 

Did you read my previous mail?

	ffs() != __ffs()


Nicolas
