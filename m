Received: from 209-87-231-114.storm.ca ([209.87.231.114] helo=[10.0.1.163])
	by pentafluge.infradead.org with esmtpsa (Exim 4.60 #1 (Red Hat Linux))
	id 1FRAQt-0002hF-Dj
	for linux-mtd@lists.infradead.org; Wed, 05 Apr 2006 17:00:35 +0100
Message-ID: <4433E9A1.1030807@netwinder.org>
Date: Wed, 05 Apr 2006 12:00:33 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: FAQ entry for loopback mounting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After struggling with loopback mounting jffs2 files for a while, here is 
a suggestion to update the FAQ entry "I cannot loop mount a JFFS2 image"
found at http://www.linux-mtd.infradead.org/faq/jffs2.html

Caveat: I am not a MTD guru, what I document here was learned by trial 
and error, and coaching by joern, tglx and dwmw2.  I hope it is useful 
and not entirely incorrect ;)  Feedback welcome, and if you want a 
HTML-ized version for the webpage, let me know.


Loopback mounting a JFFS2 image

Currently, it is not possible to mount a JFFS2 image via loopback (eg. 
"mount -oloop -tjffs2 file.jffs2 /mnt/foo" does not work).  There are 
several close approximations: mtdram and block2mtd.  An older method, 
blkmtd, has recently been deprecated.


METHOD mtdram:

The mtdram method (CONFIG_MTD_MTDRAM in your kernel config, not to be 
confused with the CONFIG_MTD_RAM option!) creates a MTD device in RAM. 
You can copy your JFFS2 image there and then mount it, just like you 
would do with a real MTD device in flash.  The only downside is that it 
eats up a lot of memory (eg. don't try making a 1GiB mtdram device).

	# modprobe mtdram total_size=8192 erase_size=128

This creates a MTD device 8MiB big, with an erase size of 128kiB.  Note 
the implied units are kilobytes.  Check in /proc/mtd to see the 
newly-created device (your numbers will vary!)

	# cat /proc/mtd
	dev:    size   erasesize  name
	mtd0: 00800000 00020000 "mtdram test device"

Now it can be operated like any other MTD device.  To "fill" it with 
your JFFS2 image, just copy that image to /dev/mtd0.  Then mount the 
device somewhere.

	# cp file.jffs2 /dev/mtd0
	# mount -tjffs2 /dev/mtdblock0 /mnt/foo

The contents are now visible under /mnt/foo.


METHOD block2mtd:

The block2mtd method (CONFIG_MTD_BLOCK2MTD in your kernel config) can be 
used to transform a block device into an MTD device.  Combined with the 
standard loopback device (CONFIG_BLK_DEV_LOOP), this can be used to 
"mount" a JFFS2 image without the RAM overhead of the mtdram method.

You must ensure that the JFFS2 image file is padded to a multiple of the 
block size when using this method, otherwise your filesystem will be 
truncated to the next-to-last block, and some data will be lost.  Note 
that the mkfs.jffs2 utility has a -p option that will add the padding.

The first step is to create a block device from the image file using the 
standard loop method.

	# modprobe loop    (if necessary)
	# losetup /dev/loop0 /path/to/file.jffs2

Now that we have a block device, it is "made into" a MTD device using 
block2mtd module:

	# modprobe block2mtd block2mtd=/dev/loop0,128ki

Here the "128ki" is the erase block size.  Only "ki" is accepted, due to 
bugs in the parsing code.  The code understands "M" and "G" but will 
barf on subsequent arguments.  You cannot add the logical-seeming "B", 
for example, "128kiB" is not accepted.  If you use no letters, then the 
value is interpreted in BYTES (unlike the mtdram which assumes kiB).

There are additional options that can be passed (comma-separated): "ro" 
makes the device read-only, and "sync" presumably makes it synchronous.

At this point, a new MTD device is created and can be mounted like any 
other MTD device.

	# cat /proc/mtd
	dev:    size   erasesize  name
	mtd0: 00800000 00020000 "block2mtd: /dev/loop0"

	# mount -tjffs2 /dev/mtdblock0 /mnt/foo

The contents are now accessible under /mnt/foo.  Note there is no need 
to copy the image file into the mtd device in this case!

Note: there was an "embarrassing typo" in block2mtd in kernel 2.6.12 and 
earlier, which makes it unusable.  It was fixed in 2.6.13 and beyond. 
And the units parsing problems described above are present in 2.6.16 but 
will presumably be fixed.

-R
