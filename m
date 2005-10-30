Received: from smtp102.biz.mail.mud.yahoo.com ([68.142.200.237])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EW4w0-0003F9-EM
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2005 00:36:51 -0400
From: Pete Popov <ppopov@embeddedalley.com>
To: Sergei Shtylylov <sshtylyov@ru.mvista.com>
In-Reply-To: <4363DF17.6080906@ru.mvista.com>
References: <4363DF17.6080906@ru.mvista.com>
Content-Type: text/plain
Date: Sat, 29 Oct 2005 21:36:50 -0700
Message-Id: <1130647010.12171.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
Reply-To: ppopov@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergey,

You are using the db1550 board, correct? 

I'll test this on the db1550 and the db1200 to make sure it works on
both boards - it's the same nand controller. 


Pete

On Sun, 2005-10-30 at 00:44 +0400, Sergei Shtylylov wrote:
> Hello.
> 
>           (This is a follow-up to the older thread:
> http://lists.infradead.org/pipermail/linux-mtd/2005-October/013983.html)
> 
>           Reintroducing the problem: the static bus controller fails to keep
> -CE asserted during chip ready delay on read commands (the NAND chip being
> used requires this). So, the current driver allows nand_base.c to drive -CE
> manually (during the whole sector read). When the PCMCIA driver is enabled
> however, occasionally the ECC errors occur on NAND reads. This happens because
> PCMCIA driver polls sockets periodically and reads one of the board's
> control/status regs (BCSRs) which are accessible via the same static bus
> as the NAND flash using the different chip select (and the NOR flash is
> accessible the same way), so as the NAND driver forces NAND chip select
> asserted and the -RE signal is shared, there's a contention on the static
> bus when BCSR or NOR flash is read while we're reading from NAND.
>           So, we either can't keep interrupts enabled during the whole NAND
> sector read (which is hardly acceptable), or have to implement some
> interlocking scheme between multiple drivers (which is painful, and makes
> me shudder :-).
>           There's a third way which proved to work: to force -CE asserted only
> while we're waiting for NAND chip to become ready after a read command,
> disabling interrupts for a maximum of 25 microsecs (according to Toshiba
> TC58DVM92A1FT00 flash chip datasheet). So, here's the initial patch which
> I'm hoping to have made looking more decently...
> 
> WBR, Sergei
> 
> 
> plain text document attachment (Au1550-NAND-chip-select.patch)
> Signed-off-by: Konstantin Baydarov <kbaidarov@ru.mvista.com>
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> 
> Index: drivers/mtd/nand/au1550nd.c
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/nand/au1550nd.c,v
> retrieving revision 1.12
> diff -a -u -p -r1.12 au1550nd.c
> --- drivers/mtd/nand/au1550nd.c	23 Sep 2005 01:44:55 -0000	1.12
> +++ drivers/mtd/nand/au1550nd.c	29 Oct 2005 20:04:23 -0000
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/interrupt.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/mtd/partitions.h>
> @@ -313,6 +314,141 @@ int au1550_device_ready(struct mtd_info 
>  	return ret;
>  }
>  
> +/**
> + * au1550_select_chip - control -CE line
> + *	Forbid driving -CE manually permitting the NAND controller to do this.
> + *	Keeping -CE asserted during the whole sector reads interferes with the
> + *	NOR flash and PCMCIA drivers as it causes contention on the static bus.
> + *	We only have to hold -CE low for the NAND read commands since the flash
> + *	chip needs it to be asserted during chip not ready time but the NAND
> + *	controller keeps it released.
> + *
> + * @mtd:	MTD device structure
> + * @chip:	chipnumber to select, -1 for deselect
> + */
> +static void au1550_select_chip(struct mtd_info *mtd, int chip)
> +{
> +}
> +
> +/**
> + * au1550_command - Send command to NAND device
> + * @mtd:	MTD device structure
> + * @command:	the command to be sent
> + * @column:	the column address for this command, -1 if none
> + * @page_addr:	the page address for this command, -1 if none
> + */
> +static void au1550_command(struct mtd_info *mtd, unsigned command, int column, int page_addr)
> +{
> +	register struct nand_chip *this = mtd->priv;
> +	int ce_override = 0, i;
> +	ulong flags;
> +
> +	/* Begin command latch cycle */
> +	this->hwcontrol(mtd, NAND_CTL_SETCLE);
> +	/*
> +	 * Write out the command to the device.
> +	 */
> +	if (command == NAND_CMD_SEQIN) {
> +		int readcmd;
> +
> +		if (column >= mtd->oobblock) {
> +			/* OOB area */
> +			column -= mtd->oobblock;
> +			readcmd = NAND_CMD_READOOB;
> +		} else if (column < 256) {
> +			/* First 256 bytes --> READ0 */
> +			readcmd = NAND_CMD_READ0;
> +		} else {
> +			column -= 256;
> +			readcmd = NAND_CMD_READ1;
> +		}
> +		this->write_byte(mtd, readcmd);
> +	}
> +	this->write_byte(mtd, command);
> +
> +	/* Set ALE and clear CLE to start address cycle */
> +	this->hwcontrol(mtd, NAND_CTL_CLRCLE);
> +
> +	if (column != -1 || page_addr != -1) {
> +		this->hwcontrol(mtd, NAND_CTL_SETALE);
> +
> +		/* Serially input address */
> +		if (column != -1) {
> +			/* Adjust columns for 16 bit buswidth */
> +			if (this->options & NAND_BUSWIDTH_16)
> +				column >>= 1;
> +			this->write_byte(mtd, column);
> +		}
> +		if (page_addr != -1) {
> +			this->write_byte(mtd, (u8)(page_addr & 0xff));
> +
> +			if (command == NAND_CMD_READ0 ||
> +			    command == NAND_CMD_READ1 ||
> +			    command == NAND_CMD_READOOB) {
> +				/*
> +				 * NAND controller will release -CE after
> +				 * the last address byte is written, so we'll
> +				 * have to forcibly assert it. No interrupts
> +				 * are allowed while we do this as we don't
> +				 * want the NOR flash or PCMCIA drivers to
> +				 * steal our precious bytes of data...
> +				 */
> +				ce_override = 1;
> +				local_irq_save(flags);
> +				this->hwcontrol(mtd, NAND_CTL_SETNCE);
> +			}
> +
> +			this->write_byte(mtd, (u8)(page_addr >> 8));
> +
> +			/* One more address cycle for devices > 32MiB */
> +			if (this->chipsize > (32 << 20))
> +				this->write_byte(mtd, (u8)((page_addr >> 16) & 0x0f));
> +		}
> +		/* Latch in address */
> +		this->hwcontrol(mtd, NAND_CTL_CLRALE);
> +	}
> +
> +	/*
> +	 * Program and erase have their own busy handlers.
> +	 * Status and sequential in need no delay.
> +	 */
> +	switch (command) {
> +
> +	case NAND_CMD_PAGEPROG:
> +	case NAND_CMD_ERASE1:
> +	case NAND_CMD_ERASE2:
> +	case NAND_CMD_SEQIN:
> +	case NAND_CMD_STATUS:
> +		return;
> +
> +	case NAND_CMD_RESET:
> +		break;
> +
> +	case NAND_CMD_READ0:
> +	case NAND_CMD_READ1:
> +	case NAND_CMD_READOOB:
> +		/* Check if we're really driving -CE low (just in case) */
> +		if (unlikely(!ce_override))
> +			break;
> +
> +		/* Apply a short delay always to ensure that we do wait tWB. */
> +		ndelay(100);
> +		/* Wait for a chip to become ready... */
> +		for (i = this->chip_delay; !this->dev_ready(mtd) && i > 0; --i)
> +			udelay(1);
> +
> +		/* Release -CE and re-enable interrupts. */
> +		this->hwcontrol(mtd, NAND_CTL_CLRNCE);
> +		local_irq_restore(flags);
> +		return;
> +	}
> +	/* Apply this short delay always to ensure that we do wait tWB. */
> +	ndelay(100);
> +
> +	while(!this->dev_ready(mtd));
> +}
> +
> +
>  /*
>   * Main initialization routine
>   */
> @@ -437,6 +573,9 @@ int __init au1xxx_nand_init (void)
>  	/* Set address of hardware control function */
>  	this->hwcontrol = au1550_hwcontrol;
>  	this->dev_ready = au1550_device_ready;
> +	this->select_chip = au1550_select_chip;
> +	this->cmdfunc = au1550_command;
> +
>  	/* 30 us command delay time */
>  	this->chip_delay = 30;		
>  	this->eccmode = NAND_ECC_SOFT;
> 
> 
> 
