Received: from hotwww5.hotwww.com ([161.58.242.233])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6Bql-0005Fx-7a
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 13:12:04 -0500
From: Peter Grayson <pgrayson@realmsys.com>
To: tglx@linutronix.de
In-Reply-To: <1109645229.3805.11.camel@tglx.tec.linutronix.de>
References: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
	<1109645229.3805.11.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Tue, 01 Mar 2005 11:11:51 -0700
Message-Id: <1109700711.5043.53.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can you really write a jffs2 image with nandwrite?
Reply-To: pgrayson@realmsys.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-03-01 at 03:47 +0100, Thomas Gleixner wrote:
> On Mon, 2005-02-28 at 19:14 -0700, Peter Grayson wrote:
> > From reading the mkfs.jffs2 code, it seems that mkfs.jffs2 has no
> > concept of out-of-bounds data. Consequently, it appears that the
> > nandwrite expects to find out-of-bounds data immediately after the in-
> > bounds data for every page. I have looked at the bits of the jffs2 image
> > produced by mkfs.jffs2 and I can see that it does not really produce out
> > of bounds data.
> 
> nandwrite does not expect oob data for jffs2 images.

But it appears nandwrite can accept oob data. It does have the --oob
option and when this option is set nandwrite reads the oob data from the
image and does an ioctl() to the mtd character device to write it.

> 
> > Below is the mkfs.jffs2 command line I am using. I have tried many other
> > combinations of options, but they do not yield appreciably different
> > results.
> > 
> > mkfs.jffs2
> >  	--pagesize=2048 \
> > 	--eraseblock=128 \
> 			
> This one if definitely wrong. You meant 128kiB or 131072. 

mkfs.jffs2 interprets "128" as "128KiB", but I should be more explicit.

> 	
> > 	--pad \
> > 	--output=image.jffs2 \
> > 	--compression-mode none \
> 
> Why do you switch off compression ?

I have made images both ways -- in this case I was looking at hex dumps
of images and sans compression the dumps were a little more human-
readable. In the end, I do want to use compression.

> 
> > 	--no-cleanmarkers \
> > 	--big-endian \
> > 	--squash \
> > 	--verbose \
> > 	--root=$ROOT_DIR
> > 
> > When I try using this image with "nandwrite -j", the image appears to be
> > written successfully, but when I try to mount the new filesystem, mount
> > fails with the following error message:
> > 
> >   mount: Mounting /dev/mtdblock0 on /mnt failed: Invalid argument
> 
> Did you ?
> mount -t jffs2 /dev/mtdblock0 /mnt

Yes.

> 
> > If I try to use "nandwrite -j -o", nandwrite complains about the image
> > not being aligned:
> 
> JFFS2 has no oob data. nandwrite -j is correct.
> 
> > Is there something obvious I am missing? I have read the FAQ at:
> > 
> >   http://www.linux-mtd.infradead.org/tech/faq.html
> 
> I'm happy that somebody actually read it :)
> 
> > so I know that the working theory is that this should work, but it is
> > not working for me. Has anyone else had a similar experience?
> 
> Before using nandwrite please erase the flash with 
> flash_eraseall -j /dev/mtd0 .
> 

This was definitely useful. I am now able to write images with
nandwrite. Here are the magic steps I am taking:


1) mkfs.jffs2 \
	--eraseblock=128KiB \
	--pad \
	--output=image.jffs2 \
	--compression-mode=priority \
	--no-cleanmarkers \
	--big-endian \
	--squash \
	--verbose \
	--root=$ROOT_DIR
2) flash_eraseall -j /dev/mtd0
3) nandwrite /dev/mtd0 image.jffs2

With mkfs.jffs2, I had some confusion about the pagesize option. I was
thinking that it corresponded to the NAND pagesize, but that is not
correct, it sets the jffs2 filesystem page size.

With nandwrite, the -j option causes things to not work. This was a
great stumbling block for me. It proved to be critical to _not_ use the
-j (or -o) option with nandwrite. This is in direct conflict with
instructions in the FAQ.

Thanks for the help, this definitely got me jumpstarted.
