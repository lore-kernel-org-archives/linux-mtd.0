Received: from boisdslgw5poolb76.bois.uswest.net ([65.101.73.76] helo=ridgerun-lx.ridgerun.cxm)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Jwrv-0006H6-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2001 13:44:00 +0100
Message-ID: <3B4AF9E1.92E1A0FD@ridgerun.com>
Date: Tue, 10 Jul 2001 06:49:37 -0600
From: Steve Kranz <skranz@ridgerun.com>
MIME-Version: 1.0
To: Anton Todorov <a.todorov@emness.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: MTD on MBX860
References: <01071015225100.01159@ronin>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

> I am using linuxppc_2_4 (2.4.6) with current mtd
> support from cvs tree.  The board is with JEDEC AMD
> 29F016 x4 flash chips (8M Flash space).  Map file which
> I use for this board is attached (I use rpxlite.c and
> tqm8xxl.c (for partitioning) as reference).  The
> problem I found is that mtd says:
>
> "mtd: Failed. Cannot handle unsymetric banking"

Did you mean AMD29F160 (instead of AMD29F016)? If so,
I have a data sheet on my desk here that shows block sizes of:

  #1  8K
  #2  4K
  #3  4K
  #4  16K
  #5  32K
   ....
  #35 32K

--------------

Anton Todorov wrote:

> Hi,
>
> I am using linuxppc_2_4 (2.4.6) with current mtd support from cvs tree.
> The board is with JEDEC AMD 29F016 x4 flash chips (8M Flash space).
> Map file which I use for this board is attached (I use rpxlite.c and
> tqm8xxl.c (for partitioning) as reference).
> The problem I found is that mtd says:
>
> "mtd: Failed. Cannot handle unsymetric banking"
>
> I enabled some debug info in jedec.c (uncommenting some printks and add some)
> and found that it is looking for banked and find bank[0] is 8M bank[1] is 0M
> - realy unsymetric :)
> but I think it is linear flash.
> I worarounded it commentig one condition:
>
> --- jedec.c.orig        Tue Jul 10 10:06:41 2001
> +++ jedec.c     Tue Jul 10 10:07:41 2001
> @@ -159,7 +159,7 @@
>        are empty banks. Note, the last bank does not count here, only the
>        first banks are important. Holes on non-bank boundaries can not exist
>        due to the way the detection algorithm works. */
> -   if (priv.size < my_bank_size)
> +/*   if (priv.size < my_bank_size) */
>        my_bank_size = priv.size;
>     priv.is_banked = 0;
>     //printk("priv.size is %x, my_bank_size is %x\n",priv.size,my_bank_size);
>
> but I think it is not the right action ...
>
> now flash and partitioning(I think ) is working:
> fromm booting kernel:
> <>
> Motorola MBX flash device: 800000 at fe000000
>         MTD Part: MBX flash 4*[AMD Am29F016]
> MTD->erasesize is 40000
> MTD->size is 800000
> mtd: Giving out device 0 to MBX flash
> Creating 3 MTD partitions on "MBX flash":
> 0x00000000-0x00080000 : "MBX flash BOOT partition"
> mtd: Giving out device 1 to MBX flash BOOT partition
> 0x00080000-0x00600000 : "MBX flash DATA partition"
> mtd: Giving out device 2 to MBX flash DATA partition
> 0x00600000-0x00800000 : "MBX flash APPLICATION partition"
> mtd: Giving out device 3 to MBX flash APPLICATION partition
> <>
> sh-2.03# ./mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 8388608 (8M)
> mtd.erasesize = 262144 (256K)
> mtd.oobblock = 0
> mtd.oobsize = 0
> mtd.ecctype = MTD_ECC_NONE
> regions = 0
>
> sh-2.03# ./mtd_debug info /dev/mtd1
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 524288 (512K)
> mtd.erasesize = 262144 (256K)
> mtd.oobblock = 0
> mtd.oobsize = 0
> mtd.ecctype = MTD_ECC_NONE
> regions = 0
>
> sh-2.03# ./mtd_debug info /dev/mtd2
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 5767168 (5M)
> mtd.erasesize = 262144 (256K)
> mtd.oobblock = 0
> mtd.oobsize = 0
> mtd.ecctype = MTD_ECC_NONE
> regions = 0
>
> sh-2.03# ./mtd_debug info /dev/mtd3
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 2097152 (2M)
> mtd.erasesize = 262144 (256K)
> mtd.oobblock = 0
> mtd.oobsize = 0
> mtd.ecctype = MTD_ECC_NONE
> regions = 0
>
> I managed to mount /dev/mtdblock3 as jffs and can create and delete files
> there.
>
> My question is why jedec driver find it as banked?
> maybe it is my fault in mbx860.c map file?
> My patch is not the right solution curently I will add some ifdefs
> to comment patched line when I am using MBX board.
> also I found that the einfo utility is not working on this board
> it says:
> <>
> sh-2.03# ./einfo /dev/mtd0
> Device /dev/mtd0 has 0 erase regions
> <>
> but mtd_debug util is working ass seen above.
> I have RPX Classic board with CFI AMD flash and same binary is working.
>
> comments?
>
> Best Regards,
> Anton Todorov
> Emness Technology
>
>   ------------------------------------------------------------------------
>                Name: mbx860.c
>    mbx860.c    Type: text/x-c
>            Encoding: base64
