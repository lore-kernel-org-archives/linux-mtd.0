Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160Uqt-0004zQ-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 21:30:48 +0000
Date: Sun, 4 Nov 2001 21:40:04 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Rothwell <rothwell@holly-springs.nc.us>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2, CF, PCMCIA adapter, ATA
In-Reply-To: <1004909648.1728.53.camel@gromit.house>
Message-ID: <Pine.LNX.4.33.0111042135220.28157-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 4 Nov 2001, Michael Rothwell wrote:

> On Sun, 2001-11-04 at 16:16, David Woodhouse wrote:
> > # dd if=jffs2-image of=/dev/hda (or hda1, hda2, etc.) 
> > # insmod blkmtd device=/dev/hda
> > # mount -t jffs2 /dev/mtdblock0 /mnt/jffs2
> 
> ... followed by a litany of "argh, block not erased" type messages in
> the syslog. Mount then returns. 

That bit's expected.

> Then, I try to copy some files into the mounted jffs2 filesystem ... 
>  "cp" causes an oops and the interrupt handler gets killed.

That bit isn't. Backtrace etc. please.

> > You may want partitioning if you want to boot from this too, not just use 
> > it as filesystem.
> 
> Am I correct in assuming that I can make partitions with fdisk, then 
> 
>  # dd if=flash.jffs2 of=/dev/hde1
>  # modprobe blkmtd device=/dev/hde1
>  # mount -t jffs2 /dev/mtdblock0 /mnt/flash

> What would this look like in lilo and /etc/fstab on the device that will
> hopefully be booting from the jffs2 image?

LILO isn't going to boot a kernel on a JFFS2 file system. You'll need to 
make a separate partition to hold your kernel.

The above mount command translates to /etc/fstab just as you'd expect. 
You have to load the module first though. I think the new version of 
blkmtd allows you to specify the device to use on the kernel command line.

> Maybe the updates won't oops... :)

Maybe :)

> Do you use mtdram to create jffs2 filesystems? Or some other method?

No, I use mkfs.jffs2. It produces a more compact image. 

-- 
dwmw2
