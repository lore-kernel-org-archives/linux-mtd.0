Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvk6B-00061C-OA
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 17:32:48 -0500
Date: Mon, 31 Jan 2005 17:30:26 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1107188578.21196.346.camel@tglx.tec.linutronix.de>
Message-ID: <Pine.LNX.4.61.0501311726300.29562@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
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

On Mon, 31 Jan 2005, Thomas Gleixner wrote:

> On Mon, 2005-01-31 at 11:14 -0500, Robert P. J. Day wrote:
> > > > -p, --pad[=SIZE] Pad output to SIZE bytes with 0xFF. If SIZE is
> > > >                         not specified, the output is padded to the
> > > > 			end of the final erase block
> >
> > at the moment, this is not being followed.  for instance, mkfs.jffs2
> > has the --pad=SIZE option, where a simple number is treated as KiB.
> > anyway, you get idea -- it's pretty confusing.
>
> ???
>
> It's just missing the k and M suffixes. So its easy to fix.

  while this isn't related to MTD, i thought i'd toss it out since i
just tripped over it in looking at the source for mkfs.jffs2.c.  that
utility uses the getopt_long() routine to parse arguments, and the
long_options array that defines the possible args starts with:

static struct option long_options[] = {
    {"pad", 2, NULL, 'p'},
    {"root", 1, NULL, 'r'},
    ....

that first entry ostensibly means that the "pad" parameter has an
optional argument.

  however, i was not aware that, defined that way, you *must* specify
that option as, say, "-p262144" and not "-p 262144".  i had never
noticed that before, and it strikes me as horribly non-intuitive.

  anyway, just an observation.  now i'll shut up and get back to
patching.

rday
