Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ptgV-0008BY-00
	for mtd-list@infradead.org; Thu, 11 May 2000 15:11:27 +0100
Date: Thu, 11 May 2000 16:16:52 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@Matrox.COM>
cc: mtd@infradead.org, dwmw2@infradead.org
Subject: Re: ext2_lookup() and i_count 
In-Reply-To: <30252.958050596@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000511160915.11688A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 11 May 2000, David Woodhouse wrote:

> 
> scote1@Matrox.COM said:
> >  Btw, is there any document indicating how to use the mtdram.o module
> > ?  Now I can insert every module without a glitch, including jffs, and
> > I'm ready for testing!  
> 
> You load it and it behaves just like a normal flash device. You presumably 
> stick an empty JFFS filesystem on it with something like 
> 'jffs_format /dev/mtd0', then 'mount /dev/mtdblock0 /mnt/jffs -tjffs'

Almost.

First create your to be filesystem in a directory (call it e.g. img_dir),
then run "mkfs.jffs img_dir > fs.jffs", this creates an image fs.jffs that
you can copy to your flash (in the case of an mtdram flash, just do "cat
fs.jffs > /dev/mtd0". Then mount the flash "mount -t jffs /dev/mtdblock0
/mnt/jffs".

Then just go to /mnt/jffs and play around with the filesystem. Not
everything works well right now, rename isn't implemented, and unlink
seems to have some problems.

Also note that the default size of the mtdram device is 2 meg, if you want
a different size you have to change a define in the mtdram.c code.

/ Alex







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
