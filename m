Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Co7lH-00054o-Rp
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 17:11:45 -0500
Date: Mon, 10 Jan 2005 17:10:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1105380565.17584.4.camel@weaponx.rchland.ibm.com>
Message-ID: <Pine.LNX.4.61.0501101703110.22288@localhost.localdomain>
References: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>
	<1105380565.17584.4.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how to loopback mount a JFFS2 filesystem on my linux box?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 Jan 2005, Josh Boyer wrote:

> On Mon, 2005-01-10 at 11:49, Robert P. J. Day wrote:
> >   i swear i once knew how to do this, but it's lost in the mists of
> > time.  i used "mkfs.jffs2" to create a simple JFFS2 image, and now i
> > just want to mount it on my fedora core 3 system using a loopback
> > mount.
> >
> >   i have the jffs2 and mtdcore modules currently loaded, and normally,
> > what i would try is:
> >
> >   # mkdir m
> >   # mount -o loop -t jffs2 <jffs2.img file> m
> >
> > but what i get is:
> >
> > # mount -o loop -t jffs2 hello.img m
> > mount: wrong fs type, bad option, bad superblock on /dev/loop0,
> >        or too many mounted file systems
> >        (could this be the IDE device where you in fact use
> >        ide-scsi so that sr0 or sda or so is needed?)
> >
> >   i *vaguely* recall needing to do a bit more work, like loading
> > another module or two.  any pointers to a URL for this?  thanks.
>
> You can't do that AFAIK because JFFS2 needs an MTD device.  Instead, use
> mtdram to create a fake MTD device, dd the image to it, and do:
>
> # mount -t jffs2 /dev/mtdblock0 <mnt/point>

  ah, found a good summary on the net:

	http://www.lsweb.de/HOWTO/InstallationNotes.html

and it seems to work.  and now, one followup question, to which i
*thought* i knew the answer.

  the whole reason for building this JFFS2 image is to embed it in a
single flashable image we can hand to production.  we've got a unit
with 2 16M flash chips that we're treating as a single 32M address
space, and partitioning it into several logical filesystems.  my job
is to create the JFFS2 filesystem image that corresponds to one of
those /dev/mtd/? devices.  i've been told its offset in the 32M
address space, so i can just use "dd" to transfer the filesystem image
to the right address in the final 32M production image.

  it all sounded pretty straightforward, except that there are a
couple people here who are convinced it won't work.  they seem to
think that the image i get from mkfs.jffs2 won't be mountable once
it's on the unit.  something about the clearmarker being wrong, or
that the JFFS2 has an embedded address that won't match where it's
being installed, or something weird like that.

  is there something here i need to know about?  is there any reason i
can't just build a JFFS2 filesystem on my linux host, copy it byte for
byte to the unit, and mount it there?

rday
