Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17thYq-0008W3-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 05:44:37 +0100
Date: Mon, 23 Sep 2002 21:44:34 -0700
From: Marc Singer <elf@buici.com>
To: Charles Manning <manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org, yaffs@toby-churchill.org
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Message-ID: <20020924044434.GA23917@buici.com>
References: <200209231220.12682.ayalon@tadlys.com> <20020924014556.6EC8B43F2@tiger.actrix.co.nz> <20020924034410.GA18915@buici.com> <20020924040150.A1499145FF@dragon.actrix.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020924040150.A1499145FF@dragon.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, Sep 24, 2002 at 03:58:00PM +1200, Charles Manning wrote:
> On Tue, 24 Sep 2002 15:44, Marc Singer wrote:
> > On Tue, Sep 24, 2002 at 12:03:45PM +1200, Charles Manning wrote:
> > > Hi
> > >
> > > I'm considering getting YAFFS working on DOC. I'm trying to gauge
> > > interest to prioritise vs other things.
> > >
> > > If you don't know what YAFFS is, it's a NAND-specific journalling
> > > file system. Ask Google for more info.
> > >
> > > Currently YAFFS works with raw NAND (using software ecc), though
> > > some people have patched it to use hardware ecc, so I figure DOC
> > > support should be relatively simple.
> >
> > Do you know how it boots?  Does grub support it?
> 
> By "it" I assume you mean YAFFS.
> 
> Doing a yaffs-specific bootloader is pretty simple. We have discussed the 
> general approach  on the YAFFS list before. At least two people have done 
> yaffs bootloaders. One of these might be rolled in with grub. Maybe someone 
> else on the yaffs list can answer that.

Some people think that writing a new kernel would be easy.  %^)

The trouble is coming up with a convenient method.  LILO stores a list
of blocks.  GRUB reads filesystems.  GRUB is better in the long run,
but harder to implement.

Nowadays, I'm using syslinux because LILO is such a pain to get right
and GRUB doesn't (last time I checked) like the DOC.  I just got done
working out the kinks in etherboot so it will run with a DOC.  I guess
GRUB is next.
