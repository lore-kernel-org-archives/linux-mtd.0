Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJ0mt-0001zj-UR
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2005 23:01:07 -0400
Message-ID: <42534BCC.3080106@setabox.com>
Date: Wed, 06 Apr 2005 10:39:08 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <424BFC76.8020101@setabox.com> <4252BB42.6010907@yandex.ru>
In-Reply-To: <4252BB42.6010907@yandex.ru>
Content-Type: multipart/mixed; boundary="------------060801040105040505060207"
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]  NAND I/O instruction support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060801040105040505060207
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Artem,

Artem B. Bityuckiy wrote:
> 
> 
> William J Beksi wrote:
> 
>> This patch is to implement reading and writing nand flash by I/O 
>> instructions. I have only been able to test on the x86 architecture.
>>
>> Questions, comments, criticisms are welcome.
> 
> Why didn't you use request_region()/release_region() to allocate IO ports?
> 
> I wonder, for what do you need this? 
Because I want to use the *same* I/O port range as that used by the IDE 
interface on a PC. I think a look at my driver below will make things 
clearer ;)

> Shouldn't you redefine nand_read_byte() and the like *in your driver* instead.
Sure, it can be done like that. I am just not sure if this feature would 
be useful to other driver writers in the future, that is why I tried to 
make it as general as possible.

Thomas, should read/write using inb/outb be in my driver, or should this 
be in nand_base.c?

Thanks for your comments.
--
William



--------------060801040105040505060207
Content-Type: text/x-csrc;
 name="ide.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ide.c"

/* drivers/mtd/nand/ide.c
 *
 * Copyright (C) 2004  William J Beksi <wjbeksi@users.sourceforge.net> 
 *
 * Overview:
 *  This device driver allows a NAND flash device to be accessed from
 *  an IDE interface.  
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or 
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111, USA.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/delay.h>
#include <asm/io.h>

/*
 * Values specific to the IDE
 */
#define IDE_IO_BASE_1 0x1F0		/* IDE1 NAND flash I/O base address */
#define IDE_IO_BASE_2 0x170		/* IDE2 NAND flash I/O base address */

#define IDE_IO_BASE IDE_IO_BASE_1

/*
 * IDE MTD structure
 */
static struct mtd_info *ide_mtd = NULL;

/*
 * Define partitions for flash device
 */
const static struct mtd_partition partition_info[] = {
	{ 
		.name   = "IDE flash partition 1", 
		.offset = 0,  
		.size   = 4*1024*1024 
	},
	{
		.name   = "IDE flash partition 2",
		.offset = 4*1024*1024,
		.size   = 4*1024*1024
	}
};
#define NUM_PARTITIONS  2 

static void ide_hwcontrol(struct mtd_info *mtd, int cmd) 
{
	struct nand_chip *this = (struct nand_chip *) mtd->priv;

	switch (cmd) {
		case NAND_CTL_SETCLE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE+1; break;
		case NAND_CTL_CLRCLE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE;   break;
		case NAND_CTL_SETALE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE+2; break;	
		case NAND_CTL_CLRALE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE;   break;
	}
}

/*
 * Main initialization routine
 */
int __init ide_init(void)
{
	struct nand_chip *this;
	int err = 0;

	/* Allocate memory for MTD device structure and private data */
	ide_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
	if (!ide_mtd) {
		printk("Unable to allocate IDE NAND MTD structure\n");
		err = -ENOMEM; 
		goto out;
	}

	/* Initialize structures */
	memset((char *) ide_mtd, 0, sizeof(struct mtd_info) + sizeof(struct nand_chip));

	/* Get pointer to private data */
	this = (struct nand_chip *) (&ide_mtd[1]);
	/* Link the private data with the MTD structure */
	ide_mtd->priv = this;

	/* Set address of NAND IO lines */
	this->IO_ADDR_R  = (void __iomem *) IDE_IO_BASE;
	this->IO_ADDR_W  = (void __iomem *) IDE_IO_BASE;
	/* Reference hardware control function */
	this->hwcontrol = ide_hwcontrol;
	/* Set command delay time */
	this->chip_delay = 20;
	/* Assign the device ready function */
	this->dev_ready = NULL;
	/* Set the ECC generator mode */
	this->eccmode = NAND_ECC_SOFT;

	/* Scan to find existance of the device */
	if (nand_scan(ide_mtd, 1)) {
		err = -ENXIO;
		goto out_mtd;
	}

	/* Register the partitions */
	add_mtd_partitions(ide_mtd, partition_info, NUM_PARTITIONS);
	goto out;

out_mtd:
	kfree(ide_mtd);
out:
	return err;
}
module_init(ide_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit ide_cleanup (void)
{
	/* Release resources, unregister the device */
	nand_release(ide_mtd);	

	/* Free the MTD device structure */
	kfree(ide_mtd);
}
module_exit(ide_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_AUTHOR("William J Beksi <wjbeksi@users.sourceforge.net>");
MODULE_DESCRIPTION("Glue layer for NAND flash through an IDE interface");

--------------060801040105040505060207--
