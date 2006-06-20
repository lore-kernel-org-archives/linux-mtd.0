Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsfhB-0007Y9-Uq
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 13:51:06 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <1150807480.6780.157.camel@localhost.localdomain>
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
	<1150804501.6780.141.camel@localhost.localdomain>
	<4497E9D4.9040307@epico.si>
	<1150807480.6780.157.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 14:52:11 +0200
Message-Id: <1150807931.6780.160.camel@localhost.localdomain>
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

On Tue, 2006-06-20 at 14:44 +0200, Thomas Gleixner wrote:
> Savin,
> 
> On Tue, 2006-06-20 at 14:28 +0200, Savin Zlobec wrote:
> > Chip not ready in nand_command():
> > Last caller: c012aa04 (nand_base.c:389)
> > Last command: 0x70
> > Current caller: c012c0e8 (nand_base.c:1720)
> > Current command: 0x60
> > 
> > 384     static int nand_check_wp(struct mtd_info *mtd)
> > 385     {
> > 386             struct nand_chip *chip = mtd->priv;
> > 387             /* Check the WP bit */
> > 388             chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> > 389             return (chip->read_byte(mtd) & NAND_STATUS_WP) ? 0 : 1;
> > 390     }
> >
> > 1715    static void single_erase_cmd(struct mtd_info *mtd, int page)
> > 1716    {
> > 1717            struct nand_chip *chip = mtd->priv;
> > 1718            /* Send commands to erase a block */
> > 1719            chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
> > 1720            chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
> > 1721    }
> 
> The status command does not influence ready/busy. The one before that
> nand_check_wp() call, is a chip reset command, but we wait for the chip
> to become ready again.
> 
> Please give me the exact part number, so I can lookup the data sheet.

Oops, looked at the wrong place. The culprit is elsewhere.

Please replace the debug patch by the one below.

	tglx

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77406fc..b61a534 100644
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
@@ -446,6 +449,22 @@ static void nand_command(struct mtd_info
 	register struct nand_chip *chip = mtd->priv;
 	int ctrl = NAND_CTRL_CLE | NAND_CTRL_CHANGE;
 
+	if (command != NAND_CMD_RESET && command != NAND_CMD_STATUS) {
+
+		if (chip->dev_ready && !chip->dev_ready(mtd)) {
+			printk("Chip not ready in nand_command():\n");
+			printk("Last caller: %p\n", last_caller);
+			printk("Last command: 0x%02x\n", last_command);
+			printk("Current caller: %p\n",
+			       __builtin_return_address(0););
+			printk("Current command: 0x%02x\n", command);
+
+			nand_wait_ready(mtd);
+		}
+		last_caller = __builtin_return_address(0);
+		last_command = command;
+	}
+
 	/*
 	 * Write out the command to the device.
 	 */
