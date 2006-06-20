Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fse8u-0004AH-CN
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 12:11:37 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4497D2CE.7070000@epico.si>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
	<4497A723.2070006@epico.si>
	<1150790417.6780.107.camel@localhost.localdomain>
	<4497BAE2.3010602@epico.si>
	<1150795093.6780.117.camel@localhost.localdomain>
	<4497D2CE.7070000@epico.si>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 13:12:39 +0200
Message-Id: <1150801960.6780.132.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Savin,

On Tue, 2006-06-20 at 12:49 +0200, Savin Zlobec wrote:

Patch is correct, applied. Thanks

> And managed to erase the nand flash  and mount JFFS2 on it, but writting 
> still
> didn't work -  got  errors like :
> 
> Data CRC d507eb40 != calculated CRC 2e617dde for node at 00e4f700
> 
> The I put a call to nand_wait_ready at the top of nand_command function and
> as far as I could test everything worked (exept that the flash is still 
> recognized as Toshiba (0x98) not Samsung (0xec)).

Well, we read the manufacturer ID. When we get 98H, how should we know
that this is a Samsung part ? And I doubt that this is a quad bit flip.

> It looks (to me) that there are still some parts of the code that should 
> wait for nand to get ready before sending commands.

The only point where this really matters is, when we read data from
those chips. They have a horrible feature, which automatically loads the
next page into the internal buffer. There are only two places where we
actually read from the device. On has the check at the correct place
already, the other fixed you up.

Can you please remove the nand_wait_ready() call in nand_command() and
test the following patch ? It disables the ready busy pin and uses the
chip_delay. Please check, whether the 20us are correct. You can safely
set it to 50 without breaking stuff.

	tglx


Index: mtd/drivers/mtd/nand/at91_nand.c
===================================================================
--- mtd.orig/drivers/mtd/nand/at91_nand.c
+++ mtd/drivers/mtd/nand/at91_nand.c
@@ -141,7 +141,6 @@ static int __init at91_nand_probe(struct
 	nand_chip->IO_ADDR_R = host->io_base;
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = at91_nand_cmd;
-	nand_chip->dev_ready = at91_nand_device_ready;
 	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
