Received: from 205-158-62-53.outblaze.com ([205.158.62.53] helo=ws1-6.us4.outblaze.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xnen-0001rR-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 19:48:13 +0100
Message-ID: <20020725184738.26475.qmail@mail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Mike Schumi" <schumi@techie.com>
To: dwmw2@infradead.org
Cc: "Mike Schumi" <schumi@techie.com>, linux-mtd@lists.infradead.org
Date: Thu, 25 Jul 2002 13:47:38 -0500
Subject: Re: jffs2_do_reserve_space
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

David,

 The Flash starts at 0x0 phys and has a firmware bootloader pre-configured in (has its own header too). 
Then the Flash Loader I'm using adds a 0x40 header to the beginning of every binary image loaded to flash. It adds 0x40 to the Linux Loader (blob), Kernel, and jffs2.  

I got confused by your emails!?! is this causing the problem we are seeing or its only causing the printks and sanity checks?! 
 If its only causing the sanity checks to appear, its fine for now (I'll fix the loader later on). But if its the cause of the kernel panic let me know.  
 When I add your patch (stable) I get:
Further such events for this erase block will not be printed
Node at 0x003dfd54 with
length 0x000002e6 would run over the end of the erase block
Perhaps the file system
was created with the wrong erase size?<5>jffs2_scan_eraseblock(): Magic bitmask 0x1985 notdjffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0004: 0xe200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0008: 0x109a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e000c: 0x2008 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0010: 0x3da4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0014: 0x900e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0018: 0x35d2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e001c: 0xa404 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0020: 0x04f4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0024: 0x4801 instead
Further such events for this erase block will not be printed
Node at 0x003ffc80 with
length 0x000003bc would run over the end of the erase block
Perhaps the file system
was created with the wrong erase size?<5>jffs2_scan_eraseblock(): Magic bitmask 0x1985 notdjffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400004: 0x2c17 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400008: 0x684f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0040000c: 0x0804 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400010: 0x5f3c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400014: 0x614c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400018: 0x0984 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0040001c: 0xe791 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400020: 0xb477 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400024: 0xb7f5 instead
Further such events for this erase block will not be printed
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K
Kernel panic: Attempted to kill init!

Another question? why does the jffs do a sanity check on all flash when I'm only loading /dev/mtdblock2? Is there a way to make it not do so and only do so on the jffs2 image which I can download later without a 0x40 header?



----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 25 Jul 2002 18:16:50 +0100 
To: 
Subject: Re: jffs2_do_reserve_space 


> 
> dwmw2@infradead.org said:
> >  Can you try this?
> 
> Or this version if you're using the stable branch...
> 
> As I said in private mail, I suspect you've written your jffs2 image to the 
> flash 0x40 bytes out of place, and the printk in this sanity check isn't 
> actually correct for you, although it will be for most people who trigger 
> it.
> 
> Index: scan.c
> ===================================================================
> RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
> retrieving revision 1.51.2.2
> diff -u -p -r1.51.2.2 scan.c
> --- scan.c	23 Feb 2002 13:34:31 -0000	1.51.2.2
> +++ scan.c	25 Jul 2002 17:15:16 -0000
> @@ -261,6 +261,16 @@ static int jffs2_scan_eraseblock (struct
>  			continue;
>  		}
>  
> +		if (ofs + node.totlen > jeb->offset + c->sector_size) {
> +			/* Eep. Node goes over the end of the erase block. */
> +			printk(KERN_WARNING "Node at 0x%08x with length 0x%08x would run over the end of the erase block\n",
> +			       ofs, node.totlen);
> +			printk(KERN_WARNING "Perhaps the file system was created with the wrong erase size?");
> +			DIRTY_SPACE(4);
> +			ofs += 4;
> +			continue;
> +		}
> +
>  		switch(node.nodetype | JFFS2_NODE_ACCURATE) {
>  		case JFFS2_NODETYPE_INODE:
>  			err = jffs2_scan_inode_node(c, jeb, &ofs);
> 
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

Get 4 DVDs for $.49 cents! plus shipping & processing. Click to join. 
http://oas-central.realmedia.com/RealMedia/ads/click_lx.ads/mail.com/columbiahouse/1112745096/x09/ExactAdv/ColumbiaHouse_IO473_7.19_8.19/blank.gif/636632633232383133383736634333430
