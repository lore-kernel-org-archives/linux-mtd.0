Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5xPl-0001TO-S9
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2005 21:47:14 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: pgrayson@realmsys.com
In-Reply-To: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
References: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
Content-Type: text/plain
Date: Tue, 01 Mar 2005 03:47:09 +0100
Message-Id: <1109645229.3805.11.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can you really write a jffs2 image with nandwrite?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-28 at 19:14 -0700, Peter Grayson wrote:
> From reading the mkfs.jffs2 code, it seems that mkfs.jffs2 has no
> concept of out-of-bounds data. Consequently, it appears that the
> nandwrite expects to find out-of-bounds data immediately after the in-
> bounds data for every page. I have looked at the bits of the jffs2 image
> produced by mkfs.jffs2 and I can see that it does not really produce out
> of bounds data.

nandwrite does not expect oob data for jffs2 images.

> Below is the mkfs.jffs2 command line I am using. I have tried many other
> combinations of options, but they do not yield appreciably different
> results.
> 
> mkfs.jffs2
>  	--pagesize=2048 \
> 	--eraseblock=128 \
			
This one if definitely wrong. You meant 128kiB or 131072. 
	
> 	--pad \
> 	--output=image.jffs2 \
> 	--compression-mode none \

Why do you switch off compression ?

> 	--no-cleanmarkers \
> 	--big-endian \
> 	--squash \
> 	--verbose \
> 	--root=$ROOT_DIR
> 
> When I try using this image with "nandwrite -j", the image appears to be
> written successfully, but when I try to mount the new filesystem, mount
> fails with the following error message:
> 
>   mount: Mounting /dev/mtdblock0 on /mnt failed: Invalid argument

Did you ?
mount -t jffs2 /dev/mtdblock0 /mnt

> If I try to use "nandwrite -j -o", nandwrite complains about the image
> not being aligned:

JFFS2 has no oob data. nandwrite -j is correct.

> Is there something obvious I am missing? I have read the FAQ at:
> 
>   http://www.linux-mtd.infradead.org/tech/faq.html

I'm happy that somebody actually read it :)

> so I know that the working theory is that this should work, but it is
> not working for me. Has anyone else had a similar experience?

Before using nandwrite please erase the flash with 
flash_eraseall -j /dev/mtd0 .

tglx
