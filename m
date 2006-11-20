Received: from e31.co.us.ibm.com ([32.97.110.149])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GmAW3-0006AJ-HY
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 09:53:07 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kAKEqYja012966
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 09:52:34 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kAKEqYgP332744
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 07:52:34 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kAKEqYas018203
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 07:52:34 -0700
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: kbaidarov <kbaidarov@dev.rtsoft.ru>
In-Reply-To: <20061117184055.569da7ad@localhost.localdomain>
References: <20061117184055.569da7ad@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 20 Nov 2006 08:52:44 -0600
Message-Id: <1164034364.3574.6.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-17 at 18:40 +0300, kbaidarov wrote:
> +	/* scan for bad block up to where we want */
> +	while (block >= block_scantop) {
> +		/* find a non bad block */
> +		for (i = block_map[block_scantop] + 1; i < block_top; i++)
> +			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
> +				break;
> +
> +		/* exchausted ? */

exhausted

> +static struct mtd_blktrans_ops mtdblock_tr = {
> +	.name		= "mtdblock",
> +	.major		= 258,
> +	.part_bits	= 0,
> +	.readsect	= mtdblock_readsect,
> +	.writesect	= mtdblock_writesect,
> +	.add_mtd	= mtdblock_add_mtd,
> +	.remove_dev	= mtdblock_remove_dev,
> +	.owner		= THIS_MODULE,
> +};

You went to the trouble of getting a new major number assigned... why
not call it something other than mtdblock?

> Index: mips-kernel-2.6/drivers/mtd/Makefile
> ===================================================================
> --- mips-kernel-2.6.orig/drivers/mtd/Makefile
> +++ mips-kernel-2.6/drivers/mtd/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
>  obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
>  obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o mtd_blkdevs.o
>  obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o mtd_blkdevs.o
> +obj-$(CONFIG_MTD_BLOCK_RO_BBFREE)	+= mtdblock_ro_bbfree.o mtd_blkdevs.o
>  obj-$(CONFIG_FTL)		+= ftl.o mtd_blkdevs.o
>  obj-$(CONFIG_NFTL)		+= nftl.o mtd_blkdevs.o
>  obj-$(CONFIG_INFTL)		+= inftl.o mtd_blkdevs.o

All these mtd_blkdevs.o are starting to get ugly.  Why don't we
introduce a CONFIG_MTDBLKDEVS that can be selected by the other Kconfig
options.


> Index: mips-kernel-2.6/drivers/mtd/Kconfig
> ===================================================================
> --- mips-kernel-2.6.orig/drivers/mtd/Kconfig
> +++ mips-kernel-2.6/drivers/mtd/Kconfig
> @@ -197,6 +197,13 @@ config MTD_BLOCK_RO
>  	  You do not need this option for use with the DiskOnChip devices. For
>  	  those, enable NFTL support (CONFIG_NFTL) instead.
> 
> +config MTD_BLOCK_RO_BBFREE
> +	tristate "Readonly bad block free block device access to MTD devices"
> +	depends on MTD_BLOCK!=y && MTD && MTD_BLOCK_RO!=y
> +	help
> +	  Same as readonly block driver, but this allow you to mount read-only file
> +	  systems from an MTD device, containing bad blocks.
> +

This part seems hacky to me...  why can't use use mtdblock or
mtdblock_ro when this is enabled?  And what happens in the module case?

josh
