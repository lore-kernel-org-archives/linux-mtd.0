Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CveEa-0007o4-Aw
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:17:05 -0500
Date: Mon, 31 Jan 2005 11:14:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 Jan 2005, Artem B. Bityuckiy wrote:

> On Mon, 31 Jan 2005, Robert P. J. Day wrote:

> >   ah, excellent, but while we're on the subject of parameters, is
> > there any hope of getting some consistency in the way parameter values
> > are supplied across the world of JFFS2 and MTD?
> >
> >   to wit, with "mkfs.jffs2":
> >
> > -p, --pad[=SIZE] Pad output to SIZE bytes with 0xFF. If SIZE is
> >                         not specified, the output is padded to the
> > 			end of the final erase block
> >
> >
> >   so, apparently, you supply an *exact* byte size here (it's not
> > mentioned if you can use KiB or MiB prefixes).
> >
> >   with "--pagesize" and "--eraseblock", the help states that you *can*
> > use those prefixes.
> >
> >   if you check what you can do with the mtdram module, you get:
> >
> > $ modinfo mtdram
> > filename:
> > /lib/modules/2.6.10-1.741_FC3/kernel/drivers/mtd/devices/mtdram.ko
> > parm:           total_size:Total device size in KiB
> > parm:           erase_size:Device erase block size in KiB
> >
> >   so the values here are ... what?  strictly in KiB?  so i'd supply
> > something like
> >
> >   total_size=16384
> >
> > to specify 16M?  it's just a bit painful to jump around between the
> > various utilities and have to keep remembering what the standard is.
> >
> >   thoughts?

> My thought that if you sent patch that fixes this inconsistency it
> will be nice. :-)

first, it's necessary to define a simple standard, so what about
something like the following?  any size values in *any* of the
JFFS2-related programs shall be in one of the following formats:

  ###		(interpreted as bytes)
  ###KiB	(obvious)
  ###MiB	(obvious)

at the moment, this is not being followed.  for instance, mkfs.jffs2
has the --pad=SIZE option, where a simple number is treated as KiB.
anyway, you get idea -- it's pretty confusing.

so, do we at least have some agreement on a standard?  which would
hold across *all* programs and modules?  i'm not even going to
*consider* looking at patches to do this unless i'm convinced everyone
agrees, since changes like this will clearly force people to change
the way they do some things.  and i know how fond some people are of
*that* idea. :-)

rday
