Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3buH-0007cl-GW
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2005 11:57:25 -0400
Date: Fri, 12 Aug 2005 19:57:43 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Message-Id: <20050812195743.2a179745.vwool@ru.mvista.com>
In-Reply-To: <1123860984.23647.95.camel@tglx.tec.linutronix.de>
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
	<20050812191146.2e38ed1c.vwool@ru.mvista.com>
	<1123860984.23647.95.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > P. S. Is it reasonable to send the use case (i. e. the NAND driver I'm
> > working at that uses the simple framework introduced)?
> 
> Sure

Here it is (no cleanup, work in progress... ;) :

/*
 *  drivers/mtd/nand/pnx4008.c
 *
 *  Copyright (c) 2005 MontaVista <sources@mvista.com> 
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  Overview:
 *   This is a device driver for the NAND flash device found on the
 *   PNX4008 board. It supports 16-bit 32MiB Samsung k9f5616 chip.
 *
 */

#include <linux/slab.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/pm.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/dma-mapping.h>

#include <asm/io.h>
#include <asm/sizes.h>
#include <asm/dma.h>

#include <asm/arch/hardware.h>
#include <asm/arch/dma.h>
#include <asm/arch/gpio_new.h>

#include "pnx4008.h"

#define MAX_DMA_TRANSFER_SIZE 0x7FF

struct pnx4008_mtd_s {
    struct mtd_info 	mtd;
    struct nand_chip 	nand;
    int 		dma;
    struct completion 	done;
    u32			flashclk_reg;
    struct device *	dev;
};

static struct pnx4008_mtd_s *pnx4008_nand_data = NULL;
static int mlc_flash_dma = 1;

static int pnx4008_nand_ready(struct mtd_info *mtd);
static void pnx4008_nand_command ( struct mtd_info *mtd, unsigned command,
		                   int column, int page_addr);
static void pnx4008_nand_hwcontrol( struct mtd_info* mtd, int hwc );

#define MLC_WRITE( nand, offset, what ) __raw_writel( what, (u8*)( ((struct nand_chip*)nand)->IO_ADDR_R) + offset )
#define MLC_READ( nand, offset ) __raw_readl( (u8*)( ((struct nand_chip*)nand)->IO_ADDR_R) + offset )
#define MLC_READ2( nand, offset ) __raw_readb( (u8*)( ((struct nand_chip*)nand)->IO_ADDR_W) + offset ) 
#define MLC_WRITE2( nand, offset, what ) __raw_writeb( what, (u8*)( ((struct nand_chip*)nand)->IO_ADDR_W) + offset )

static inline u8 pnx4008_read_data( struct nand_chip* this )
{
	while( ! (MLC_READ( this, MLC_ISR ) & MLC_ISR_READY ) ) {
		continue;
	}
	return MLC_READ2( this, 0 );
}

static u8 pnx4008_nand_read_byte( struct mtd_info *mtd ) 
{
	return pnx4008_read_data( mtd->priv );
}

static void pnx4008_nand_write_byte( struct mtd_info* mtd, u8 byte )
{
	MLC_WRITE2( mtd->priv, 0, byte );
}

static void pnx4008_nand_dma_handler( int irq, void* context, struct pt_regs* regs)
{
	struct pnx4008_mtd_s* data = context;
	complete( &data->done );
}

static inline int  
pnx4008_nand_config_dma( int channel, u32 dma_buf, int len, int mode )
{
        pnx4008_dma_config_t cfg;
        pnx4008_dma_ch_config_t ch_cfg;
        pnx4008_dma_ch_ctrl_t ch_ctrl;
	int peripheral_id = 12;
	int err;
		
	if( mode == DMA_MODE_WRITE ) {
		ch_cfg.flow_cntrl = FC_MEM2PER_DMA;
                cfg.src_addr = dma_buf;
                ch_cfg.src_per = 0;
                cfg.dest_addr = PNX4008_FLASH_DATA;
                ch_cfg.dest_per = peripheral_id;
                ch_ctrl.di = 0;
                ch_ctrl.si = 1;
	} else if ( mode == DMA_MODE_READ ) {
		ch_cfg.flow_cntrl = FC_PER2MEM_DMA;
		cfg.dest_addr = dma_buf;
		ch_cfg.dest_per = 0;
		cfg.src_addr = PNX4008_FLASH_DATA;
		ch_cfg.src_per = peripheral_id;
		ch_ctrl.si = 0;
		ch_ctrl.di = 1;
	} else {
		return -EFAULT;
	}
	ch_cfg.halt = 0;
	ch_cfg.active = 1;
	ch_cfg.lock = 0;
	ch_cfg.itc = 1;
	ch_cfg.ie = 1;
	
	ch_ctrl.tc_mask = 1;
	ch_ctrl.cacheable = 0;
	ch_ctrl.bufferable = 0;
	ch_ctrl.priv_mode = 1;
	ch_ctrl.dest_ahb1 = 0;
	ch_ctrl.src_ahb1 = 0;
	ch_ctrl.dwidth = ch_ctrl.swidth = WIDTH_WORD;
	ch_ctrl.dbsize = 1;
	ch_ctrl.sbsize = 1;
	ch_ctrl.tr_size = len;

	if( 0 > ( err = pnx4008_dma_pack_config( &ch_cfg, &cfg.ch_cfg ))) {
		goto out;
	}
	if( 0 > (err = pnx4008_dma_pack_control(&ch_ctrl, &cfg.ch_ctrl))) {
		goto out;
	}
	err = pnx4008_config_channel( channel, &cfg ); 
out:	
	return err;
}

static void pnx4008_nand_write_buf( struct mtd_info *mtd, const u8 *buf, int len)
{
	struct nand_chip* this = mtd->priv;
	struct pnx4008_mtd_s* ctx = this->priv;
	dma_addr_t dma_addr;
	void* vaddr;
	int dma_len;

	if( mlc_flash_dma ) {
		do {
			dma_len = min( MAX_DMA_TRANSFER_SIZE, len );
			vaddr = dma_alloc_coherent( ctx->dev, dma_len, &dma_addr, GFP_KERNEL );
			memcpy( vaddr, buf, dma_len );
			pnx4008_nand_config_dma( ctx->dma, dma_addr, dma_len, DMA_MODE_WRITE );
			init_completion( &ctx->done );
			pnx4008_dma_ch_enable( ctx->dma );
			wait_for_completion( &ctx->done );		
			pnx4008_dma_ch_disable( ctx->dma );
			dma_free_coherent( ctx->dev, dma_len, vaddr, dma_addr );
			len -= dma_len; buf += dma_len;
		} while( len > 0 );
	} else {
    		while( len -- ) 
			pnx4008_nand_write_byte( mtd, *buf++ );
		while( !this->dev_ready( mtd ) ) 
			continue;
	}
}

static void pnx4008_nand_read_buf(struct mtd_info *mtd, u8 * buf, int len)
{
	struct nand_chip* this = mtd->priv;
	struct pnx4008_mtd_s* ctx = this->priv;
	dma_addr_t dma_addr;
	void* vaddr;
	int dma_len;

	if( mlc_flash_dma ) {	
		do {
			dma_len = min( MAX_DMA_TRANSFER_SIZE, len );
			vaddr = dma_alloc_coherent( ctx->dev, dma_len, &dma_addr, GFP_KERNEL );
			pnx4008_nand_config_dma( ctx->dma, dma_addr, dma_len, DMA_MODE_READ );
			init_completion( &ctx->done );
			pnx4008_dma_ch_enable( ctx->dma );
			wait_for_completion( &ctx->done );		
			pnx4008_dma_ch_disable( ctx->dma );
			memcpy( buf, vaddr, dma_len );
 			dma_free_coherent( ctx->dev, dma_len, vaddr, dma_addr );
			len -= dma_len; buf += dma_len;
		} while( len > 0 );
	} else {
		while( len -- ) 
			*buf ++ = pnx4008_nand_read_byte( mtd );
	}
}

static int pnx4008_nand_verify_buf( struct mtd_info *mtd, const u8 *buf, int len)
{
	int err = 0;

	while( len -- ) {
		if( *buf ++ != pnx4008_nand_read_byte( mtd ) ) {
			err = -EFAULT;
			break;
		}
	}
	return err;
}

static int pnx4008_nand_suspend(struct device *dev, u32 state, u32 level)
{
	int retval = 0;

#ifdef CONFIG_PM
	struct mtd_info *mtd = dev_get_drvdata(dev);
	if (mtd && mtd->suspend && level == SUSPEND_SAVE_STATE) {
		retval = mtd->suspend(mtd);
		if (retval == 0) {
			pnx4008_nand_data->flashclk_reg = __raw_readl(IO_ADDRESS(PNX4008_FLASHCLK_CTRL_BASE));
			__raw_writel(0, IO_ADDRESS(PNX4008_FLASHCLK_CTRL_BASE));
			udelay(1);
		}
	}
#endif
	return retval;
}

static int pnx4008_nand_resume(struct device *dev, u32 level)
{
#ifdef CONFIG_PM
	struct mtd_info *mtd = dev_get_drvdata(dev);

	if (mtd && mtd->resume && level == RESUME_RESTORE_STATE) {
		mtd->resume(mtd);
		__raw_writel(pnx4008_nand_data->flashclk_reg, IO_ADDRESS(PNX4008_FLASHCLK_CTRL_BASE));	
		udelay(1);
	}
#endif
	return 0;
}

#ifdef CONFIG_MTD_PARTITIONS
static struct mtd_partition static_partition[] = {
	{ .name = "Booting Image",
	  .offset =	0,
	  .size = 64 * 1024,
	  .mask_flags =	MTD_WRITEABLE  /* force read-only */
 	},
	{ .name = "U-Boot",
	  .offset =	MTDPART_OFS_APPEND,
	  .size = 256 * 1024,
          .mask_flags = MTD_WRITEABLE  /* force read-only */
 	},
	{ .name = "U-Boot Environment",
	  .offset =	MTDPART_OFS_APPEND,
	  .size = 192 * 1024
	},
	{ .name = "Kernel",
	  .offset =	MTDPART_OFS_APPEND,
	  .size = 2 * SZ_1M
	},
	{ .name = "File System",
	  .size = MTDPART_SIZ_FULL,
	  .offset =	MTDPART_OFS_APPEND,
	},
};

const char *part_probes[] = { 
	"cmdlinepart", 
	NULL,  
};

#endif

static int __init pnx4008_nand_probe (struct device *dev)
{
	struct nand_chip *this;
	struct mtd_info *mtd;
#ifdef CONFIG_MTD_PARTITIONS
	struct mtd_partition *dynamic_partition = 0;
#endif
	int err = 0;
	u32 flashclk_init = FLASHCLK_MLC_CLOCKS | FLASHCLK_MLC_SELECT;

	pnx4008_nand_data = kmalloc( sizeof( struct pnx4008_mtd_s ), GFP_KERNEL );
	if (!pnx4008_nand_data) {
		printk (KERN_ERR "%s: failed to allocate mtd_info\n", __FUNCTION__ );
		err = -ENOMEM;
		goto out;
	}
	memset( pnx4008_nand_data, 0, sizeof( struct pnx4008_mtd_s ) );
	pnx4008_nand_data->dma = -1;

	pnx4008_nand_data->dev = dev;

	/* structures must be linked */
	this = &pnx4008_nand_data->nand;
	mtd = &pnx4008_nand_data->mtd;
	mtd->priv = this;
	this->priv = pnx4008_nand_data;

	this->chip_delay = 30;
	this->IO_ADDR_R = (void __iomem*)IO_ADDRESS( PNX4008_MLC_FLASH_BASE );
        this->IO_ADDR_W = (void __iomem*)IO_ADDRESS( PNX4008_FLASH_DATA );
        this->options = NAND_SAMSUNG_LP_OPTIONS;
        this->hwcontrol = pnx4008_nand_hwcontrol;
	this->dev_ready = pnx4008_nand_ready;
        this->eccmode = NAND_ECC_SOFT;
	this->cmdfunc = pnx4008_nand_command;
	this->read_byte = pnx4008_nand_read_byte;
	this->write_byte = pnx4008_nand_write_byte;
	this->write_buf = pnx4008_nand_write_buf;
	this->read_buf = pnx4008_nand_read_buf;
	this->verify_buf = pnx4008_nand_verify_buf;
	
	if( mlc_flash_dma ) {
		pnx4008_nand_data->dma = pnx4008_request_channel( 
				"MLC Flash", -1, 
				pnx4008_nand_dma_handler, pnx4008_nand_data );
		if( pnx4008_nand_data->dma <= 0 ) {
			printk( KERN_ERR"%s: cannot request DMA channel (%d), falling back to non-DMA mode.\n", __FUNCTION__, pnx4008_nand_data->dma );
			mlc_flash_dma = 0;
		} else {
			flashclk_init |= FLASHCLK_NAND_RnB_REQ_E;
		}
	}	
	__raw_writel( flashclk_init, IO_ADDRESS( PNX4008_FLASHCLK_CTRL_BASE ) );
	pnx4008_nand_data->flashclk_reg = flashclk_init;	
	
	MLC_WRITE( this, MLC_LOCK_PR, MLC_UNLOCK_MAGIC );
	/* Setting Buswidth for controller */
	MLC_WRITE( this, MLC_ICR, 
	  	MLC_ICR_WIDTH8 | MLC_ICR_AWC3 | 
	  	MLC_ICR_SMALLBLK | MLC_ICR_WP_DISABLED ); 

    	/* remove the write protection (/WP), by setting GPO_01 to high */
    	__raw_writel( GPIO_FLASH_WP, 
			IO_ADDRESS( PNX4008_PIO_BASE ) + GPIO_OUTP_SET);

	MLC_WRITE( this, MLC_LOCK_PR, MLC_UNLOCK_MAGIC );
	MLC_WRITE( this, MLC_TIME, 
			FLASH_MLC_TIME_tWP( 4 )  |
			FLASH_MLC_TIME_tWH( 7 )  |
			FLASH_MLC_TIME_tRP( 6 )  |
			FLASH_MLC_TIME_tREH( 2 ) |
			FLASH_MLC_TIME_tRHZ( 3 ) |
			FLASH_MLC_TIME_tRWB( 3 ) |
			FLASH_MLC_TIME_tCEA( 0 ) );  /* 104 Hz */
	/* wait 6 uSeconds for device to become ready */
	udelay(6);

	if( nand_scan( mtd, 1 ) ) {
		goto out_1;
	}

#ifdef CONFIG_MTD_PARTITIONS
        err = parse_mtd_partitions( mtd, part_probes,
                                    &dynamic_partition, 0);
        if (err > 0)
             err = add_mtd_partitions( mtd,
				       dynamic_partition, err);
        else 
             err = add_mtd_partitions( mtd,
				       static_partition, 
				       ARRAY_SIZE( static_partition ) );
	if( err < 0 ) {
		goto out_2;
	}

#endif
	dev_set_drvdata(dev, mtd);
	return 0;

#ifdef CONFIG_MTD_PARTITIONS
out_2:
	nand_release( mtd );
#endif

out_1:	
	kfree ( pnx4008_nand_data );
out:
	return err;
}

static void __exit pnx4008_nand_remove (struct device *dev)
{
	dev_set_drvdata(dev, NULL);

	nand_release ( &pnx4008_nand_data->mtd);
	if( pnx4008_nand_data->dma >=0 ) {
		pnx4008_free_channel( pnx4008_nand_data->dma );
	}
	kfree ( pnx4008_nand_data );
	
	__raw_writel( 0, IO_ADDRESS( PNX4008_FLASHCLK_CTRL_BASE ) );
}


static struct device_driver pnx4008_nand_driver = {
	.name		= "pnx4008-flash",
	.bus		= &platform_bus_type,
	.probe		= pnx4008_nand_probe,
	.remove		= __exit_p(pnx4008_nand_remove),
	.suspend	= pnx4008_nand_suspend,
	.resume		= pnx4008_nand_resume,
};

static int __init pnx4008_nand_init(void)
{
	return driver_register(&pnx4008_nand_driver);
}

static void __exit pnx4008_nand_exit(void)
{
	driver_unregister(&pnx4008_nand_driver);
}

module_exit(pnx4008_nand_exit);
module_init(pnx4008_nand_init);

static int pnx4008_nand_ready(struct mtd_info *mtd)
{	
    const u32 mask = MLC_ISR_READY | MLC_ISR_IFREADY | MLC_ISR_ECCREADY;
    return ( ( MLC_READ( mtd->priv, MLC_ISR ) & mask ) == mask ) ? 1 : 0;
}

static void pnx4008_nand_hwcontrol( struct mtd_info* mtd, int hwc )
{
}

static void pnx4008_nand_command ( struct mtd_info *mtd, unsigned command,
		                   int column, int page_addr)
{
    struct nand_chip *this = mtd->priv;

    /* Emulate NAND_CMD_READOOB */
    if (command == NAND_CMD_READOOB) {
        column += mtd->oobblock;
        command = NAND_CMD_READ0;
    }
    
    /* Write out the command to the device. */
    MLC_WRITE( this, MLC_CMD, command );

    if (column != -1 || page_addr != -1) {
        /* Serially input address */
        if (column != -1) {
            /* Adjust columns for 16 bit buswidth */
            if (this->options & NAND_BUSWIDTH_16)
                column >>= 1;
            MLC_WRITE( this, MLC_ADDR, column & 0xff);
            MLC_WRITE( this, MLC_ADDR, (column >> 8) & 0xff);
        }
        if (page_addr != -1) {
            MLC_WRITE( this, MLC_ADDR, page_addr & 0xff );
            MLC_WRITE( this, MLC_ADDR, (page_addr >> 8) & 0xff);

            /* One more address cycle for devices > 128MiB */
            if (this->chipsize > (128 << 20)) {
		MLC_WRITE( this, MLC_ADDR, (page_addr >> 16) & 0xff);
	    }
        }
    }
    /*
     * program and erase have their own busy handlers
     * status and sequential in needs no delay
    */
    switch (command) 
    {
    case NAND_CMD_CACHEDPROG:
    case NAND_CMD_PAGEPROG:
    case NAND_CMD_ERASE1:
    case NAND_CMD_ERASE2:
    case NAND_CMD_SEQIN:
    case NAND_CMD_STATUS:
        return;
    case NAND_CMD_RESET:
        if (this->dev_ready)
            break;
        udelay(this->chip_delay);
        MLC_WRITE( this, MLC_CMD, NAND_CMD_STATUS );
	while(( pnx4008_read_data( this ) & 0x40 ) == 0 ) 
	    continue;
        return;
    case NAND_CMD_READ0:
        /* Write out the start read command */
        MLC_WRITE( this, MLC_CMD, NAND_CMD_READSTART);
	/* fall down */
    default:
        /*
         * If we don't have access to the busy pin, we apply the given
         * command delay
        */
        if (!this->dev_ready) {
            udelay (this->chip_delay);
            return;
        }
    }
    /* Apply this short delay always to ensure that we do wait tWB in
     * any case on any machine. */
    ndelay (100);
    /* wait until command is processed */
    while (!this->dev_ready(mtd)) {
	continue;
    }
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("dmitry pervushin <dpervushin@ru.mvista.com>");
MODULE_PARM( mlc_flash_dma, "i" );
