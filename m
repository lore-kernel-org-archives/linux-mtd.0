Received: from msr30.hinet.net ([168.95.4.130] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c1XH-0005uW-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 11:25:55 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Thomas Gleixner'" <tglx@linutronix.de>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration
Date: Tue, 6 Aug 2002 18:25:47 +0800
Message-ID: <001b01c23d33$a254d450$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1028627141.19592.5.camel@thomas.tec.linutronix.de>
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

I use GPIO to control NCE, ALE and CLE. RE and WE are connected to CS of
ROM bank 1 and ROM bank 2.
The test program are work fine to do read/write and it seems work fine
also when I did not use CONFIG_JFFS2_FS_NAND. Thanks.


Steve Tsai



================================================================
Change in nand.c for our board.
=================================================================

#undef readb
#undef writeb

#define readb(a)  (*(volatile unsigned char *)(a))

/* Use function call for more delay in write cycle */
void writeb(unsigned char v, unsigned int a)
{
	*(volatile unsigned char *)(a) = v;
}


================================================================
Netpower.c for our board - board-specific glue layer.
=================================================================


#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>

/*
 * MTD structure for .NETpower board
 */
static struct mtd_info *dnp_mtd = NULL;

/*
 * Values specific to the .NETpower board (used with S3C4510 processor)
 */
#define DNP_FIO_BASE	0x2000000


#define   NCE   0x100
#define   ALE   0x400
#define   CLE   0x200 


/*
 * Module stuff
 */

static int dnp_fio_base = DNP_FIO_BASE;

#if 0
MODULE_PARM(dnp_fio_base, "i");

__setup("dnp_fio_base=",dnp_fio_base);
#endif

/*
 * Define partitions for flash device
 */
const static struct mtd_partition partition_info[] = {
	{ name: "DNP flash partition 1",
	  offset: 0,
	  size: 2*1024*1024 },
	{ name: "DNP flash partition 2",
	  offset: 2*1024*1024,
	  size: 6*1024*1024 }
};
#define NUM_PARTITIONS 2

/* 
 *	hardware specific access to control-lines
*/
void dnp_hwcontrol(int cmd){
    switch(cmd){

	case NAND_CTL_SETCLE: (*(volatile unsigned int *) (IOPDATA)) |=
CLE; break;
	case NAND_CTL_CLRCLE: (*(volatile unsigned int *) (IOPDATA)) &=
~CLE; break;

	case NAND_CTL_SETALE: (*(volatile unsigned int *) (IOPDATA)) |=
ALE; break;
	case NAND_CTL_CLRALE: (*(volatile unsigned int *) (IOPDATA)) &=
~ALE; break;

	case NAND_CTL_SETNCE: (*(volatile unsigned int *) (IOPDATA)) &=
~NCE; break;
	case NAND_CTL_CLRNCE: (*(volatile unsigned int *) (IOPDATA)) |=
NCE; break;
    }
}

/*
 * Main initialization routine
 */
int __init dnp_init (void)
{
	struct nand_chip *this;

	/* Allocate memory for MTD device structure and private data */
	dnp_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct
nand_chip),
				GFP_KERNEL);
	if (!dnp_mtd) {
		printk ("Unable to allocate DNP NAND MTD device
structure.\n");
		return -ENOMEM;
	}

	/* Get pointer to private data */
	this = (struct nand_chip *) (&dnp_mtd[1]);

	/* Initialize structures */
	memset((char *) dnp_mtd, 0, sizeof(struct mtd_info));
	memset((char *) this, 0, sizeof(struct nand_chip));

	/* Link the private data with the MTD structure */
	dnp_mtd->priv = this;

	/*
	 * Set GPIO Port register so that the pins are configured
	 * to be outputs for controlling the NAND flash.
	 */
	*(volatile unsigned int *)(IOPMOD)  |= (CLE|ALE|NCE);
	*(volatile unsigned int *)(IOPDATA) |= (NCE);

	/* Set address of NAND IO lines */
	/* 0x2000000 for ROM bank 1, 0x2200000 form ROM bank 2 */
	/* Above 0x4000000 is noncachable area
*/
	this->IO_ADDR_W = (dnp_fio_base | 0x4000000);
	this->IO_ADDR_R = ((dnp_fio_base+0x200000) | 0x4000000);
	/* Set address of hardware control function */
	this->hwcontrol = dnp_hwcontrol;
	this->dev_ready = NULL;
	/* 15 us command delay time */
	this->chip_delay = 15;		
	

	/* Scan to find existance of the device */
	if (nand_scan (dnp_mtd)) {
		kfree (dnp_mtd);
		return -ENXIO;
	}

	/* Allocate memory for internal data buffer */
	this->data_buf = kmalloc (sizeof(u_char) * (dnp_mtd->oobblock +
dnp_mtd->oobsize), GFP_KERNEL);
	if (!this->data_buf) {
		printk ("Unable to allocate NAND data buffer for
DNP.\n");
		kfree (dnp_mtd);
		return -ENOMEM;
	}

	/* Register the partitions */
	add_mtd_partitions(dnp_mtd, partition_info, NUM_PARTITIONS);

	/* Return happy */
	return 0;
}
module_init(dnp_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit dnp_cleanup (void)
{
	struct nand_chip *this = (struct nand_chip *) &dnp_mtd[1];

	/* Unregister the device */
	del_mtd_device (dnp_mtd);

	/* Free internal data buffer */
	kfree (this->data_buf);

	/* Free the MTD device structure */
	kfree (dnp_mtd);
}
module_exit(dnp_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Steve Tsai <steve@synso.com");
MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on DNP
board");








-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of Thomas
Gleixner
Sent: Tuesday, August 06, 2002 5:46 PM
To: Steve Tsai
Cc: Linux MTD mailing list
Subject: Re: NAND Configuration


On Tue, 2002-08-06 at 09:25, Steve Tsai wrote:
Could you send me your hardware driver ? 

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

nix.de



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
