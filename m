Received: from web52710.mail.yahoo.com ([206.190.39.161])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgpa5-0000S9-PO
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 14:22:10 -0500
Message-ID: <20041221192139.20491.qmail@web52710.mail.yahoo.com>
Date: Tue, 21 Dec 2004 11:21:39 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: Fillod Stephane <stephane.fillod@thomson.net>
In-Reply-To: <1CFEB358338412458B21FAA0D78FE86D4F0CA7@rennsmail02.eu.thmulti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: RE: Rootfs choice ideas
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi.  Thanks for your feedback, it is appreciated.

--- Fillod Stephane <stephane.fillod@thomson.net> wrote:

> One basic idea is to have partitioned flashed, for example, 
> one partition for kernel, one for "base" files (libc,
> busybox,..),
> and a couple for the application. The problem with this approach
> is that space is wasted because partitions tend to be static.
> Note: bootloader will always have to be in a separate partition.

Yes, I agree.  However, space is _definitely not an issue for me. 
The bootloader is less than 16KiB, the kernel is around 800KiB, and
the rootfs currently has 8MiB allocated. (and is using half that)

The smallest flash chip we can get is 32MiB, but we'll likely be
going with a 64MiB.

> A solution to this problem is to have cramfs images on top
> of loop devices, ie. files stored in a jffs2 big partition. 
> Ok, it may waste some RAM, but the page cache do it nice 
> with this stack.

> The /tmp and /var directories are tmpfs.
> I would not recomand using initrd for rootfs as it wastes 
> memory on non-used files.

Yes, we've been using tmpfs for /tmp and /var for a while now.  And
I think I could overcome much of that shortcoming by using symbolic
links to files on a cramfs.

> Instead, I have a patch witch let 
> Linux take its rootfs from an image (ex: cramfs,..) stored 
> in a file of a filesystem (here jffs2). 
> I've called this "init loopback", or initlo for short.
> initlo is setup from the Linux command line. Once rootfs
> is mounted, supplemental images can be mounted for application,
> etc.

So instead of mtd partitioning, you're using jffs2 to dynamically
partition the space (i.e. store files).  That makes sense.

The downside of this is that I want to be able to verify and update
separate from the jffs2 partition.  I suppose I don't necessarily
need to, but I thought it would be nice to do all this verification
in the bootloader.

A couple potential problems for me, though:  I don't think I want
to read a jffs2 filesystem in my bootloader.  It may be simpler
than I imagine, but the way I'm thinking of doing it is about the
most straightforward you can get.  As well, I was thinking of
decreasing the boot time by minimizing the partition scanning that
jffs2 does on mounting.

> Corollary: you have to reboot to "change" file of rootfs image,
> but as long as care is taken to choose what goes in "base",
> it's not a problem. Besides, soft links to /var files get away 
> with files in need of updating.

That's a good point; I'll run into this as well.  If I want to
modify the cramfs image, then I'll need to stop using it somehow.
(perhaps by pivot_root'ing to a ram based FS)

> 
> The CRC of cramfs images can be verified. Monitors like U-Boot
> are able to read and verify CRC of kernel image from a jffs2 fs. 
> Any addition of a firmware part (=file copy) is safe thanks to
> jffs2.
> No partition means any number (space permitting) of version of 
> firmwares, ex: one per directory, + a file or a link to tell the 
> version to use.

> Configuration files are stored in the jffs2 fs.
> Most of the time, the jffs2 fs is mounted RO. It is remounted RW
> only when adding a firmware or changing a config file.

I also want some persistent storage, to save configuration and
such.  I was thinking of using it mounted read/write the whole
time.

> All this brings unbreakability and peace of mind :-)

Yes, this was my exact motivation.  That, and simple, unbreakable
updating.

> IMHO, I don't think storing logs in flash is a good idea. For
> designs 
> having a NVRAM, it's better to store logs there, without JFFS2,
> just a simple mapped circular buffer like in busybox syslog.
> I haven't found an off-the-shelf solution yet, but something like
> a flight-recorder would be great here.

Is that because of the potential wearing?  Or the speed?  We like
this because we only need one memory device for our board (reduced
cost, which is important), and we have lots of spare space in NAND.

> REM: jffs2 can be changed in favor of yaffs. 
>      cramfs can be changed in favor of squashfs.

Do you have any experience with yaffs?  I've heard good things
about it, but from my impressions, I think jffs2 either better or
more suitable for me.
I recently read a short report about SquashFS.1.  It looked good to
me, especially with some of the reduced overhead.  I would consider
this, but I don't need the extra space it provides, and I like the
fact that cramfs is in the kernel and is probably simpler. (less
can go wrong)

> Comments are welcome on these ideas.

Ditto.  And, well, you got them.  =]

Thanks,
Mike
