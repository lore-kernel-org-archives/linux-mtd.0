Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFIq2-0002Qg-TN
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 07:42:03 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 0/3] mtd: nand: omap: fix ecc-layout
Date: Mon, 17 Feb 2014 13:11:22 +0530
Message-ID: <1392622885-8415-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Felipe Balbi <balbi@ti.com>,
 u-boot@lists.denx.de, Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v2 -> v3*
 - re-ordered the patch-set so that eccpos[] is fixed before 'oobfree'
 - marked for stable 3.13.x+


*changes v1 -> v2*
[PATCH 1/3] fix oobfree->offset calculation + adjust for reserved-marker of last sector
[PATCH 2/3] <new patch>
[PATCH 3/3] refactor code as suggested by Brian Norris <computersforpeace@gmail.com>

 
*original v1*
[PATCH 1/2] http://lists.infradead.org/pipermail/linux-mtd/2013-December/050946.html
[PATCH 2/2] http://lists.infradead.org/pipermail/linux-mtd/2013-December/050945.html

This patch-set is tested on AM335x-EVM using following end-to-end boot sequence
with appropriate u-boot configs [1]

    (BCH8_HW)      (HAM1_HW)         (HAM1_HW)         (HAM1_HW)  (UBIFS)
ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-System

    (BCH8_HW)      (BCH8_SW)         (BCH8_SW)         (BCH8_SW)  (UBIFS)
ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-System

    (BCH8_HW)      (BCH8_HW)         (BCH8_HW)         (BCH8_HW)  (UBIFS)
ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-System


Test1: flash ubi image from u-boot and boot the kernel
   u-boot> mw 0x82000000 0xff <u-boot.img size aligned to NAND block boundary>
   u-boot> fatload mmc 0 0x82000000 u-boot.img
   u-boot> nand erase <u-boot_offset> <u-boot.img size>
   u-boot> nand write 0x82000000  <u-boot_offset> <u-boot.img size>
   u-boot> setenv bootargs 'console=ttyO0,115200n8 noinitrd mem=256M \
                root=ubi0 rw rootfstype=ubifs ubi.mtd=<mtdpart-of-rootfs>,\
                <page-size> ip=off init=/init'
   u-boot> bootm <kernel_offset>

Test2: update u-boot.img from kernel and re-boot
   kernel> flash_erase /dev/<mtdpart-of-u-boot>  0 0
   kernel> nandwrite -s 0  /dev/<mtdpart-of-u-boot>   u-boot.img
   kernel> reboot

[1] u-boot configurations to match above ecc-layout are documented at
    https://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide


Pekon Gupta (3):
  mtd: nand: omap: fix ecclayout to be in sync with u-boot NAND driver
  mtd: nand: omap: fix ecclayout->oobfree->offset
  mtd: nand: omap: fix ecclayout->oobfree->length

 drivers/mtd/nand/omap2.c | 61 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 21 deletions(-)

-- 
1.8.5.1.163.gd7aced9
