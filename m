Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAKpq-0004GC-Ij
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 11:03:27 +0000
In-Reply-To: <1288004487.26820.58.camel@i7.infradead.org>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1287965485.5674.25.camel@macbook.infradead.org>
	<1287993709.2224.6.camel@localhost>	
	<1288004208.26820.57.camel@i7.infradead.org>
	<OF4C8420E7.4D35D741-ONC12577C7.003C4CDC-C12577C7.003C7659@transmode.se>
	<1288004487.26820.58.camel@i7.infradead.org>
Subject: Re: [PATCH] jffs2: Do not assume erase will fail
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF31271535.A37B9F46-ONC12577C7.003CAFBC-C12577C7.003CBC6B@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 25 Oct 2010 13:03:23 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote on 2010/10/25 13:01:27:
>
> On Mon, 2010-10-25 at 13:00 +0200, Joakim Tjernlund wrote:
> > David Woodhouse <dwmw2@infradead.org> wrote on 2010/10/25 12:56:48:
> > >
> > > On Mon, 2010-10-25 at 11:01 +0300, Artem Bityutskiy wrote:
> > > >
> > > > there are 2 patches which you seem to miss. I've re-based my l2 tree
> > > > against your today's mtd tree, and applied them on top. I've also
> > > > preserved this patch. Please, look at those.
> > >
> > > The 'fix NAND pwrite in raw mode' patch is redundant -- the problem is
> > > fixed by Jon Povey's patch in commit cdcf12b2, which looks almost
> > > identical to the way I suggested it be fixed.
> > >
> > > The callback from m25p80 was dropped by its author, and rightly so.
> > >
> > > Thanks, again, for keeping track.
> >
> > But jffs2: Fix serious write stall due to erase
> > from me remains :)
>
> http://git.infradead.org/mtd-2.6.git/commitdiff/81cfc9f1

Oh, you had already taken it. Thanks

    Jocke
