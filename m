Received: from hotwww5.hotwww.com ([161.58.242.233])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D5wtq-0001EL-O5
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2005 21:14:15 -0500
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 28 Feb 2005 19:14:07 -0700
Message-Id: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Can you really write a jffs2 image with nandwrite?
Reply-To: pgrayson@realmsys.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using a PowerPC 405 based Linux system running 2.6.10 kernel with
CVS head of mtd patched in. The board has a 256MB Samsung NAND flash
part with 2048 byte page size, 64 spare bytes per page, and 64 pages per
eraseblock (128kB eraseblock).

I want to use jffs2 partitions on this flash part. I can mount an empty
partition with jffs2 and that works well, but I have been unable to
weild mkfs.jffs2 and nandwrite to successfully write jffs2 images to
flash.

>From reading the mkfs.jffs2 code, it seems that mkfs.jffs2 has no
concept of out-of-bounds data. Consequently, it appears that the
nandwrite expects to find out-of-bounds data immediately after the in-
bounds data for every page. I have looked at the bits of the jffs2 image
produced by mkfs.jffs2 and I can see that it does not really produce out
of bounds data.

Below is the mkfs.jffs2 command line I am using. I have tried many other
combinations of options, but they do not yield appreciably different
results.

mkfs.jffs2
 	--pagesize=2048 \
	--eraseblock=128 \
	--pad \
	--output=image.jffs2 \
	--compression-mode none \
	--no-cleanmarkers \
	--big-endian \
	--squash \
	--verbose \
	--root=$ROOT_DIR

When I try using this image with "nandwrite -j", the image appears to be
written successfully, but when I try to mount the new filesystem, mount
fails with the following error message:

  mount: Mounting /dev/mtdblock0 on /mnt failed: Invalid argument

If I try to use "nandwrite -j -o", nandwrite complains about the image
not being aligned:

  Input file is not page aligned: Success
  Data did not fit into device, due to bad blocks
  : Success

In this case, nandwrite bails out early and does not write anything to
flash.

Is there something obvious I am missing? I have read the FAQ at:

  http://www.linux-mtd.infradead.org/tech/faq.html

so I know that the working theory is that this should work, but it is
not working for me. Has anyone else had a similar experience?

Thanks in advance for any help you can offer.

- Pete
