Received: from h1462.serverkompetenz.net ([81.169.155.122])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CGyE7-0002Gx-H2
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 07:20:28 -0400
Date: Mon, 11 Oct 2004 13:20:17 +0200
From: cdlinux@koala.de
To: Linux-mtd ML <linux-mtd@lists.infradead.org>
Message-ID: <20041011112017.GA22376@koala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Loosing grub mbr after mounting jffs2 image with loop0 and mtdblock0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list!

I'm relatively new to linux-mtd and have the following problem:

I'm using 128MB-Cf-Cards with an ext2 and a jffs2 partition.

The image i write to the cf-card has a grub-loader on it that will boot the
jffs2-image on (eg) /dev/hde2...

Now, when I want to change the image-partition, i mount it with

  modprobe loop
  losetup /dev/loop0 imagefile.img
  modprobe mtdcore
  modprobe blkmtd device=/dev/loop0 erasesz=64
  mount -t jffs2 /dev/mtdblock0 /mnt/cfdisk

I then work on the filesystem and unmount everything after the changes are
done.

However, when I write the new image to a cfdisk (dd), I loose the grub info
and booting reports "no valid filesystem" / bootimage...

I suppose, it has to do with the way I mount the jffs2 partition (as I'm
actually mounting the entire image as loopdev/jffs2)...?
I'm unsure about what would be the right way to do this.

Any ideas, on how to proceed working on the 2nd partition of hde as jffs2
w/o loosing the grub mbr?

Thanks for any answers or pointers in the right direction, 
and sorry if this has been asked before, i couldn't find an appropriate 
answer yet..

Greetings
chris
