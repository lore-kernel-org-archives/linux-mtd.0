Received: from saturn.open-widgets.com ([209.251.101.200] helo=saturn.billgatliff.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184PXB-00017A-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 18:43:09 +0100
Date: Wed, 23 Oct 2002 13:13:51 -0500
From: "William A. Gatliff" <bgat@billgatliff.com>
To: Eugene Surovegin <ebs@innocent.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock_ro and ext2 yields panic: block not locked
Message-ID: <20021023131351.C9783@saturn.billgatliff.com>
Reply-To: bgat@billgatliff.com
References: <5.1.0.14.2.20021023101127.03ed2df0@pop.prodigy.net> <20021023104957.G8758@saturn.billgatliff.com> <5.1.0.14.2.20021023101127.03ed2df0@pop.prodigy.net> <20021023121843.A9783@saturn.billgatliff.com> <5.1.0.14.2.20021023102143.03ec1de0@mail.attbi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20021023102143.03ec1de0@mail.attbi.com>; from ebs@innocent.com on Wed, Oct 23, 2002 at 10:22:57AM -0700
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

Eugene:


That looks like it fixed the problem:

 ...
 ttyS03 at 0xb1400000 (irq = 3) is a 16550
 mtdblock_open
 ok
 mtdblock_open
 ok
 mtdblock_release
 ok
 VFS: Mounted root (ext2 filesystem) readonly.
 Freeing unused kernel memory: 196k freed
 Algorithmics/MIPS FPU Emulator v1.5
 init started:  BusyBox v0.60.4 (2002.10.16-16:11+0000) multi-call binary
 Running rc.S... done
 eth0: link up

 Please press Enter to activate this console.


 BusyBox v0.60.4 (2002.10.16-16:11+0000) Built-in shell (ash)
 Enter 'help' for a list of built-in commands.

 #


Thanks!!  Yay!  :^) :^)


b.g.

On Wed, Oct 23, 2002 at 10:22:57AM -0700, Eugene Surovegin wrote:
> Bill,
> 
> At 10:18 AM 10/23/2002, you wrote:
> >Care to post the patch?  I'd love to see if it fixes my problem...
> 
> Sure :)
> Here it is:
> 
> diff -ur a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
> --- a/drivers/mtd/mtdblock_ro.c
> +++ b/drivers/mtd/mtdblock_ro.c
> @@ -138,10 +138,11 @@
>         }
> 
>         if (current_request->sector << 9 > mtd->size ||
> -         (current_request->sector + current_request->nr_sectors) << 9 > 
> mtd->size)
> +         (current_request->sector + current_request->current_nr_sectors) 
> << 9 > mtd->size)
>         {
>           printk("mtd: Attempt to read past end of device!\n");
> -        printk("size: %x, sector: %lx, nr_sectors %lx\n", mtd->size, 
> current_request->sector, current_request->nr_sectors);
> +        printk("size: %x, sector: %lx, nr_sectors %lx\n", mtd->size, 
> current_request->sector,
> +               current_request->current_nr_sectors);
>           end_request(0);
>           continue;
>         }
> @@ -162,7 +163,7 @@
> 
>           case READ:
>           if (MTD_READ(mtd,current_request->sector<<9,
> -                     current_request->nr_sectors << 9,
> +                     current_request->current_nr_sectors << 9,
>                        &retlen, current_request->buffer) == 0)
>              res = 1;
>           else
> @@ -184,7 +185,7 @@
> 
>           // Do the write
>           if (MTD_WRITE(mtd,current_request->sector<<9,
> -                      current_request->nr_sectors << 9,
> +                      current_request->current_nr_sectors << 9,
>                         &retlen, current_request->buffer) == 0)
>              res = 1;
>           else
> @@ -287,7 +288,7 @@
>   static void __exit cleanup_mtdblock(void)
>   {
>          unregister_blkdev(MAJOR_NR,DEVICE_NAME);
> -       blksize_size[MAJOR_NR] = NULL;
> +       blk_size[MAJOR_NR] = NULL;
>          blk_cleanup_queue(BLK_DEFAULT_QUEUE(MAJOR_NR));
>   }
> 
> 
> 
> 
> 
>   Eugene Surovegin <mailto:ebs@innocent.com>
> 
-- 
Bill Gatliff
I'm an embedded GNU developer first, GNU instructor second.
See http://billgatliff.com for details.
