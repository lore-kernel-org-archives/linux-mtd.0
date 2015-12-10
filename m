Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a75ES-0003z4-Tq
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 17:42:21 +0000
Received: by obciw8 with SMTP id iw8so64408292obc.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2015 09:42:00 -0800 (PST)
Subject: Re: [PATCH linux-next] mtd: part: Add BCM962368 CFE partitioning
 support
To: Simon Arlott <simon@fire.lp0.eu>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <5668A33E.4040405@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5669B965.5030105@gmail.com>
Date: Thu, 10 Dec 2015 09:41:57 -0800
MIME-Version: 1.0
In-Reply-To: <5668A33E.4040405@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 09/12/2015 13:55, Simon Arlott a écrit :
> Add partitioning support for BCM963268 boards with CFE bootloaders.
> The following partitions are defined:
>   "boot":           CFE and nvram data
>   "rootfs":         Currently selected rootfs
>   "data":           Configuration data
>   "rootfs1_update": Container for the whole flash area used
>                     for the first rootfs to allow it to be
>                     updated.
>   "rootfs2_update": Container for the whole flash area used
>                     for the second rootfs to allow it to be
>                     updated.
>   "rootfs_other":   The other (not currently selected) rootfs
> 
> Example:
> [    1.904302] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
> [    1.911000] nand: Macronix NAND 128MiB 3,3V 8-bit
> [    1.915855] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> [    1.923797] bcm6368_nand 10000200.nand: detected 128MiB total, 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, Hamming ECC
> [    1.936994] Bad block table found at page 65472, version 0x01
> [    1.944121] Bad block table found at page 65408, version 0x01
> [    1.951166] nand_read_bbt: bad block at 0x000007480000
> [    1.990043] bcm963268part: rootfs1: CFE boot tag found at 0x20000 with version 6, board type 963168VX and sequence number 2
> [    2.003060] bcm963268part: rootfs2: CFE boot tag found at 0x4000000 with version 6, board type 963168VX and sequence number 1
> [    2.015159] bcm963268part: CFE bootline selected latest image rootfs1
> [    2.022080] 6 bcm963268part partitions found on MTD device brcmnand.0
> [    2.042659] Creating 6 MTD partitions on "brcmnand.0":
> [    2.048025] 0x000000000000-0x000000020000 : "boot"
> [    2.062134] 0x000000040000-0x000001120000 : "rootfs"
> [    2.077632] 0x000007b00000-0x000007f00000 : "data"
> [    2.091363] 0x000000020000-0x000003ac0000 : "rootfs1_update"
> [    2.106228] 0x000004000000-0x000007ac0000 : "rootfs2_update"
> [    2.121093] 0x000004020000-0x000005060000 : "rootfs_other"
> 
> The nvram contains the offset and size of the boot, rootfs1, rootfs2
> and data partitions. The presence of CFE and nvram is verified by
> reading from the boot partition which is assumed to be at offset 0
> and the process aborts if the nvram read indicates that this is not
> the case.
> 
> There is bcm_tag information at the start of each rootfs that is used
> to determine which rootfs is newer and what its real offset/size is.
> 
> The CFE bootline or nvram partition number is used to select a rootfs.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> I'm aware that this is not compatible with the mtd partition/device tree
> reorganisation patches and will rework the patch when this is committed.
> 
> Should I try to put the "struct bcm963268_nvram" in a common header file
> for all 63xx SoCs? It's hard to know if there is only one purpose for
> each byte in the nvram across all SoCs or whether it would be a complex
> type involving unions for different SoCs.

Even harder is knowing what vendors ended up using in the reserved
fields when they decided on a particular reference design and started to
build their product...

I would look at what exists in the OpenWrt tree and create e.g:
include/uapi/linux/bcm963xx_nvram.h or something along these lines so we
have at least a central location where the (potentially) different NVRAM
formats for imagetag are there.

> 
> The partitioning needs to match what exists already for this board so
> that it's practical to swap between an flash image released by the
> manufacturer/distributor of the hardware, and a custom image based on
> the latest vanilla kernel.
> 
>  drivers/mtd/Kconfig         |  21 +++
>  drivers/mtd/Makefile        |   1 +
>  drivers/mtd/bcm963268part.c | 373 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 395 insertions(+)
>  create mode 100644 drivers/mtd/bcm963268part.c

What motivated created a separate partition parser rather then using the
extended the existing one?

I would imagine that, at some point, the partition parser could know
what kind of flash it needs to parse: SPI/P-NOR or NAND, and based on
that, do an appropriate definition?
-- 
Florian
