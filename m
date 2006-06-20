Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsene-0005zK-PD
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 12:53:46 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4497DF09.70404@epico.si>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
	<4497A723.2070006@epico.si>
	<1150790417.6780.107.camel@localhost.localdomain>
	<4497BAE2.3010602@epico.si>
	<1150795093.6780.117.camel@localhost.localdomain>
	<4497D2CE.7070000@epico.si>
	<1150801960.6780.132.camel@localhost.localdomain>
	<4497DF09.70404@epico.si>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 13:55:00 +0200
Message-Id: <1150804501.6780.141.camel@localhost.localdomain>
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

On Tue, 2006-06-20 at 13:42 +0200, Savin Zlobec wrote:
> >Well, we read the manufacturer ID. When we get 98H, how should we know
> >that this is a Samsung part ? And I doubt that this is a quad bit flip.
> > 
> What bothers me is that MTD from 2.6.17 reads manufacturer ID = 0xec,  and
> the latest git MTD reads 0x98. The chip on my board is Samsung.

Thats indeed strange. Whats the exact part number ?

> >Can you please remove the nand_wait_ready() call in nand_command() and
> >test the following patch ? It disables the ready busy pin and uses the
> >chip_delay. Please check, whether the 20us are correct. You can safely
> >set it to 50 without breaking stuff.
> >
> It doesn't work with 20us nor with 50us.

Ok, revert the patch. I really need to know which code path triggers
this behaviour. Can you apply the patch below and compile the kernel
with CONFIG_DEBUG_INFO.

When the chip is not in READY state on entry of nand_command() debug
info is printed. Please decode the kernel addresses of "Last caller" and
"Current caller" with 

addr2line -e vmlinux 0xNNNNNNNNN

Thanks

	tglx

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77406fc..b6e08ea 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -430,6 +430,9 @@ static void nand_wait_ready(struct mtd_i
 	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 
+static void *last_caller;
+static int last_command;
+
 /**
  * nand_command - [DEFAULT] Send command to NAND device
  * @mtd:	MTD device structure
@@ -446,6 +449,20 @@ static void nand_command(struct mtd_info
 	register struct nand_chip *chip = mtd->priv;
 	int ctrl = NAND_CTRL_CLE | NAND_CTRL_CHANGE;
 
+	if (command != NAND_CMD_RESET && command != NAND_CMD_STATUS &&
+	    chip->dev_ready && !chip->dev_ready(mtd)) {
+
+		printk("Chip not ready in nand_command():\n");
+		printk("Last caller: %p\n", last_caller);
+		printk("Last command: 0x%02x\n", last_command);
+		printk("Current caller: %p\n", __builtin_return_address(0););
+		printk("Current command: 0x%02x\n", command);
+
+		nand_wait_ready(mtd);
+	}
+	last_caller = __builtin_return_address(0);
+	last_command = command;
+
 	/*
 	 * Write out the command to the device.
 	 */

 
