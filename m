Received: from [210.8.246.199] (helo=singularity.tronunltd.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dImI-0000t8-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 22:30:26 +0000
Date: Wed, 20 Feb 2002 08:41:06 +1000
Message-Id: <200202192241.IAA25078@singularity.tronunltd.com>
To: "Chris Fowler" <cfowler@outpostsentinel.com>
Subject: RE: Kerlen 2.4.13 and ramdisks
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: <linux-mtd@lists.infradead.org>
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Content-type: text/plain; charset="us-ascii"
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

> loopback would not allow me to write to the image while running it.  Making
loopback allows you to make modifications without dd'ing it in and out of 
ramdisks (I used to use both methods for my initrd creation).

> the flash (upgrade) process more difficult.  The FS is ext2 and I do not use
> mount.
I don't understand - you originally said;
                  "mount /dev/ram6  fails."

.. but that said, I was mistaken too .. I meant the "-t" option ...
Ie; mount -t ext2 /dev/ram6 /tmp/flash


> The only way the kernel can mount this is by me putting it in memory first.
> The only way to do that is with initrd.  It owkrs when initrd only places
> that data there.  When I try to download the *same* data from the network
> and put there it craps out.  I have to download the data first before I can
If this is the case, where you download it and try to treat it like an initrd, then
I'd be quicker to blame that process, than the ramdisk driver in 2.4.x -- particularly
when you say that it works as a straight initrd process (which is only running
in ram anyway, as you know).

> place it in /dev/ram7.  TO do that I mount a ram fs at a upper limit of
> 32mb.  Download the file there then place it in /dev/ram7.  Just by using
> that memory as temporary storeage I'm haing problems.  I've read posts that
> state that certain 2.4.X kernels have problems repecting the boundaries of a
> ramdisk.  They tend to overwrite those areas when needing memory.
In all the work we did with ramdisks, I don't think we ever dd'd the img directly
to the ramx device ... we always dd'd /dev/zero out to the size we wanted,
mke2fs'd it, then untar'd our package ... and we never had any problems with
that (in high 2.2.x's and low 2.4.x's too).


> 
> 
> lilo.conf:
> ....
>    root=/dev/ram7
> 
> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ian
> Sent: Tuesday, February 19, 2002 4:51 PM
> To: Chris Fowler
> Cc: linux-mtd@lists.infradead.org
> Subject: Re:Kerlen 2.4.13 and ramdisks
> 
> 
> 
> If you have loopback support compiled in you can mount it directly through
> the loopback driver, without creating a ramdisk ...
> 
> What was the error that mount gave?  You probably only need to specify
> the "-o" parameter ... mount doesn't usually detect fancy filesystems ...
> 
> 
>   ----- Original Message -----
> >From: "Chris Fowler" <cfowler@outpostsentinel.com>
> >To: <linux-mtd@lists.infradead.org>
> >Subject:  Kerlen 2.4.13 and ramdisks
> >Date: Tue, 19 Feb 2002 10:33:33 -0500
> >
> > You guys might have ran across a ramdisk problem.  I have a feeling that
> kernel 2.4.13 is
> not respecting my ramdisks.
> >
> >
> > dd if=/etc/user.img of=/dev/ram6
> >
> > mount /dev/ram6  fails.
> >
> >
> > Is this a problem?
> >
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
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
