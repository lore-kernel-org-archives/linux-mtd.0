Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvdk5-00079j-0P
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 10:45:34 -0500
Date: Mon, 31 Jan 2005 10:43:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1107184897.7567.20.camel@windu.rchland.ibm.com>
Message-ID: <Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
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

On Mon, 31 Jan 2005, Josh Boyer wrote:

> On Mon, 2005-01-31 at 10:14 -0500, Robert P. J. Day wrote:
> >   just for curiosity's sake, after i build a JFFS2 image using
> > mkfs.jffs2, i want to mount out to verify its contents.  to do
> > that, i use a recipe i patched together a while back involving
> > loading the appropriate modules, creating /dev/mtdblock/0, dd'ing
> > the image to that device, then mounting it.
> >
> >   however, this morning, in trying this with a larger-than-normal
> > JFFS2 image, i get:
> >
> >   # dd bs=4096 if=soefsimage of=/dev/mtdblock/0
> >   # dd: writing `/dev/mtdblock/0': No space left on device
> >   1025+0 records in
> >   1024+0 records out
> >
> > IOW, it dies after 4M.  is this a limit imposed by the ramdisk
> > limit in the kernel configuration?  is this a configurable
> > parameter at module load time?  thanks for any pointers.
>
> If you are using mtdram.c, it should be a module parameter.  Try
> setting total_size to something larger.

  ah, excellent, but while we're on the subject of parameters, is
there any hope of getting some consistency in the way parameter values
are supplied across the world of JFFS2 and MTD?

  to wit, with "mkfs.jffs2":

-p, --pad[=SIZE] Pad output to SIZE bytes with 0xFF. If SIZE is
                        not specified, the output is padded to the
			end of the final erase block


  so, apparently, you supply an *exact* byte size here (it's not
mentioned if you can use KiB or MiB prefixes).

  with "--pagesize" and "--eraseblock", the help states that you *can*
use those prefixes.

  if you check what you can do with the mtdram module, you get:

$ modinfo mtdram
filename:
/lib/modules/2.6.10-1.741_FC3/kernel/drivers/mtd/devices/mtdram.ko
parm:           total_size:Total device size in KiB
parm:           erase_size:Device erase block size in KiB

  so the values here are ... what?  strictly in KiB?  so i'd supply
something like

  total_size=16384

to specify 16M?  it's just a bit painful to jump around between the
various utilities and have to keep remembering what the standard is.

  thoughts?

rday
