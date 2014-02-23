Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHhzj-00021E-HB
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 22:58:00 +0000
Received: by mail-pb0-f51.google.com with SMTP id un15so5711344pbc.10
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 14:57:38 -0800 (PST)
Date: Sun, 23 Feb 2014 14:57:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v3 0/3] mtd: nand: omap: fix ecc-layout
Message-ID: <20140223225734.GD16834@norris-Latitude-E6410>
References: <1392622885-8415-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392622885-8415-1-git-send-email-pekon@ti.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Felipe Balbi <balbi@ti.com>,
 u-boot@lists.denx.de, Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Mon, Feb 17, 2014 at 01:11:22PM +0530, Pekon Gupta wrote:
> *changes v2 -> v3*
>  - re-ordered the patch-set so that eccpos[] is fixed before 'oobfree'
>  - marked for stable 3.13.x+
> 
> 
> *changes v1 -> v2*
> [PATCH 1/3] fix oobfree->offset calculation + adjust for reserved-marker of last sector
> [PATCH 2/3] <new patch>
> [PATCH 3/3] refactor code as suggested by Brian Norris <computersforpeace@gmail.com>
> 
>  
> *original v1*
> [PATCH 1/2] http://lists.infradead.org/pipermail/linux-mtd/2013-December/050946.html
> [PATCH 2/2] http://lists.infradead.org/pipermail/linux-mtd/2013-December/050945.html
> 
> This patch-set is tested on AM335x-EVM using following end-to-end boot sequence
> with appropriate u-boot configs [1]
> 
>     (BCH8_HW)      (HAM1_HW)         (HAM1_HW)         (HAM1_HW)  (UBIFS)
> ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-System
> 
>     (BCH8_HW)      (BCH8_SW)         (BCH8_SW)         (BCH8_SW)  (UBIFS)
> ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-System
> 
>     (BCH8_HW)      (BCH8_HW)         (BCH8_HW)         (BCH8_HW)  (UBIFS)
> ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-System
> 
> 
> Test1: flash ubi image from u-boot and boot the kernel
>    u-boot> mw 0x82000000 0xff <u-boot.img size aligned to NAND block boundary>
>    u-boot> fatload mmc 0 0x82000000 u-boot.img
>    u-boot> nand erase <u-boot_offset> <u-boot.img size>
>    u-boot> nand write 0x82000000  <u-boot_offset> <u-boot.img size>
>    u-boot> setenv bootargs 'console=ttyO0,115200n8 noinitrd mem=256M \
>                 root=ubi0 rw rootfstype=ubifs ubi.mtd=<mtdpart-of-rootfs>,\
>                 <page-size> ip=off init=/init'
>    u-boot> bootm <kernel_offset>
> 
> Test2: update u-boot.img from kernel and re-boot
>    kernel> flash_erase /dev/<mtdpart-of-u-boot>  0 0
>    kernel> nandwrite -s 0  /dev/<mtdpart-of-u-boot>   u-boot.img
>    kernel> reboot
> 
> [1] u-boot configurations to match above ecc-layout are documented at
>     https://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide

Pushed to linux-mtd.git. I plan to send this to Linus in the 3.14-rc.
Thanks!

If you get the time, can you submit some documentation for
Documentation/mtd/nand/?

Brian
