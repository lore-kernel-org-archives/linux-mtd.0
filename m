Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dJqu-00010A-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 23:39:16 +0000
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: "Ian" <Relativity@HumanHeuristic.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Kerlen 2.4.13 and ramdisks
Date: Tue, 19 Feb 2002 18:50:38 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKOEJBCDAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200202192342.JAA25261@singularity.tronunltd.com>
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

So far so good.  zlib provides the CRC funtionality.  As a test after I
download, decompressed, and decrypted the file, I tftd'ed it back to my
development bx for analysis.  Yep it was an ext2 file systemall right.
Mountable too.  My earlier versions was like my prototype.  The only change
was a version from 2.2.16 to 2.4.7 kernel.  In the 2.4.X I found that if I
did the following:


dd if=fs.img of=/dev/ram5
mount /dev/ram5 /mnt
umount /dev/ram5
mount /dev/ram5 /mnt

The 2nd mount would sometimes fail and sometims succeed.  If it failed and I
looked at the device its as if there was no ext2 partiton at all.  Only
garbage.

This random failure leads me to beleive there is an issue in ramdisks
support.  How many people use 3 ramdisks?   I only use them in the embedded
devices.
Development box uses loop back devices.


-----Original Message-----
From: Ian [mailto:Relativity@HumanHeuristic.com]
Sent: Tuesday, February 19, 2002 6:43 PM
To: Chris Fowler
Cc: linux-mtd@lists.infradead.org
Subject: RE: Kerlen 2.4.13 and ramdisks




What about and md5sum on the two images .. flash and ftp ...?

  ----- Original Message -----
>From: "Chris Fowler" <cfowler@outpostsentinel.com>
>To: "Ian" <Relativity@HumanHeuristic.com>
>Subject:  RE: Kerlen 2.4.13 and ramdisks
>Date: Tue, 19 Feb 2002 18:36:21 -0500
>
> Yea.  I had to bump it up once.  The funny thing is that the package is
the
> same size.  8mb on flash.  8mb via tftp.  It just seems that by using
> a ramfs temp storage area cause major memory problems during initrd
> execution.  I have my ramdisk size set to 16mb.  In case I need to grow in
> the
> future.
>
>
> -----Original Message-----
> From: Ian [mailto:Relativity@HumanHeuristic.com]
> Sent: Tuesday, February 19, 2002 6:34 PM
> To: Chris Fowler
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: Kerlen 2.4.13 and ramdisks
>
>
>
> The only thing I can think to suggest is that you verify the max size of
the
> ramdisks
> in either your kernel config, or your kernel boot params.  This will also
> cause you
> problems if its not set correctly.
>
>
>
>   ----- Original Message -----
> >From: "Chris Fowler" <cfowler@outpostsentinel.com>
> >To: "Ian" <Relativity@humanheuristic.com>
> >Subject:  RE: Kerlen 2.4.13 and ramdisks
> >Date: Tue, 19 Feb 2002 17:50:58 -0500
> >
> >
> > the image bein dd'ed is an ext2 file system image.  I eliminated most my
> > problems with
> > using 1 ram disk and no more.  2.2.X I used 3 ram disks.  In 2.4.X Im
> > linmited to 1.
> >
> > The mount comand was an example.  If I used loopback, I would need to
> mount
> > it rw.  That would cause
> > problems during power failure.  That is whay I take a software image, dd
> it
> > to memory and mount as the rootfs.
> > If you lost power than you would only loose contents of memory.  If you
> > failed to issue "save" for the config, you would loose
> > working config too.
> >
> > My unit requires no shutdown nor supports.  "restart" simply tells the
> > kernel to toggle the reset line
> > on the machine no processes is killed in the restart.  They just don't
> exist
> > anymore.  I want a rootfs that
> > is writable and not volatile.  If I loose it I do not care.  It is
setting
> > on flash as an encrytped file.
> >
> >
> > ]-----Original Message-----
> > From: Ian [mailto:Relativity@HumanHeuristic.com]
> > Sent: Tuesday, February 19, 2002 5:41 PM
> > To: Chris Fowler
> > Cc: linux-mtd@lists.infradead.org
> > Subject: RE: Kerlen 2.4.13 and ramdisks
> >
> >
> > > loopback would not allow me to write to the image while running it.
> > Making
> > loopback allows you to make modifications without dd'ing it in and out
of
> > ramdisks (I used to use both methods for my initrd creation).
> >
> > > the flash (upgrade) process more difficult.  The FS is ext2 and I do
not
> > use
> > > mount.
> > I don't understand - you originally said;
> >                   "mount /dev/ram6  fails."
> >
> > . but that said, I was mistaken too .. I meant the "-t" option ...
> > Ie; mount -t ext2 /dev/ram6 /tmp/flash
> >
> >
> > > The only way the kernel can mount this is by me putting it in memory
> > first.
> > > The only way to do that is with initrd.  It owkrs when initrd only
> places
> > > that data there.  When I try to download the *same* data from the
> network
> > > and put there it craps out.  I have to download the data first before
I
> > can
> > If this is the case, where you download it and try to treat it like an
> > initrd, then
> > I'd be quicker to blame that process, than the ramdisk driver in
2.4.x --
> > particularly
> > when you say that it works as a straight initrd process (which is only
> > running
> > in ram anyway, as you know).
> >
> > > place it in /dev/ram7.  TO do that I mount a ram fs at a upper limit
of
> > > 32mb.  Download the file there then place it in /dev/ram7.  Just by
> using
> > > that memory as temporary storeage I'm haing problems.  I've read posts
> > that
> > > state that certain 2.4.X kernels have problems repecting the
boundaries
> of
> > a
> > > ramdisk.  They tend to overwrite those areas when needing memory.
> > In all the work we did with ramdisks, I don't think we ever dd'd the img
> > directly
> > to the ramx device ... we always dd'd /dev/zero out to the size we
wanted,
> > mke2fs'd it, then untar'd our package ... and we never had any problems
> with
> > that (in high 2.2.x's and low 2.4.x's too).
> >
> >
> > >
> > >
> > > lilo.conf:
> > > ....
> > >    root=/dev/ram7
> > >
> > > -----Original Message-----
> > > From: linux-mtd-admin@lists.infradead.org
> > > [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ian
> > > Sent: Tuesday, February 19, 2002 4:51 PM
> > > To: Chris Fowler
> > > Cc: linux-mtd@lists.infradead.org
> > > Subject: Re:Kerlen 2.4.13 and ramdisks
> > >
> > >
> > >
> > > If you have loopback support compiled in you can mount it directly
> through
> > > the loopback driver, without creating a ramdisk ...
> > >
> > > What was the error that mount gave?  You probably only need to specify
> > > the "-o" parameter ... mount doesn't usually detect fancy filesystems
> ...
> > >
> > >
> > >   ----- Original Message -----
> > > >From: "Chris Fowler" <cfowler@outpostsentinel.com>
> > > >To: <linux-mtd@lists.infradead.org>
> > > >Subject:  Kerlen 2.4.13 and ramdisks
> > > >Date: Tue, 19 Feb 2002 10:33:33 -0500
> > > >
> > > > You guys might have ran across a ramdisk problem.  I have a feeling
> that
> > > kernel 2.4.13 is
> > > not respecting my ramdisks.
> > > >
> > > >
> > > > dd if=/etc/user.img of=/dev/ram6
> > > >
> > > > mount /dev/ram6  fails.
> > > >
> > > >
> > > > Is this a problem?
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > ______________________________________________________
> > > > Linux MTD discussion mailing list
> > > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > > >
> > >
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > >
> > >
> > >
> >
> >
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
>
>
>
