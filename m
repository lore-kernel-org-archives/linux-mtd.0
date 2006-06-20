Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsb8Y-0007at-RB
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 08:59:03 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4497A723.2070006@epico.si>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
	<4497A723.2070006@epico.si>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 10:00:17 +0200
Message-Id: <1150790417.6780.107.camel@localhost.localdomain>
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

On Tue, 2006-06-20 at 09:43 +0200, Savin Zlobec wrote:
> I'am working on this right now. I've changed the at91 driver and I'am 
> going to
> test it when I finish the changes on YAFFS - read/write_ecc and oobblock are
> not part of mtd_info any more...
> 
> I'am attaching the at91_nand.c changes.

Sorry, I doubt that any of these changes will actually work. The patch
below might save your time.

	tglx


Index: mtd/drivers/mtd/nand/at91_nand.c
===================================================================
--- mtd.orig/drivers/mtd/nand/at91_nand.c
+++ mtd/drivers/mtd/nand/at91_nand.c
@@ -37,33 +37,22 @@ struct at91_nand_host {
 };
 
 /*
- * Hardware specific access to control-lines
+ * Hardware specific way to write commands and address bytes to
+ * the chip.
  */
-static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd)
+static void at91_nand_cmd(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct at91_nand_host *host = nand_chip->priv;
 
-	switch(cmd) {
-		case NAND_CTL_SETCLE:
-			nand_chip->IO_ADDR_W = host->io_base + (1 << host->board->cle);
-			break;
-		case NAND_CTL_CLRCLE:
-			nand_chip->IO_ADDR_W = host->io_base;
-			break;
-		case NAND_CTL_SETALE:
-			nand_chip->IO_ADDR_W = host->io_base + (1 << host->board->ale);
-			break;
-		case NAND_CTL_CLRALE:
-			nand_chip->IO_ADDR_W = host->io_base;
-			break;
-		case NAND_CTL_SETNCE:
-			break;
-		case NAND_CTL_CLRNCE:
-			break;
-	}
-}
+	if (cmd == NAND_CMD_NONE)
+		return;
 
+	if (ctrl & NAND_CLE)
+		writeb(cmd, host->io_base + (1 << host->board->cle));
+	else
+		writeb(cmd, host->io_base + (1 << host->board->ale));
+}
 
 /*
  * Read the Device Ready pin.
@@ -89,11 +78,12 @@ static void at91_nand_enable(struct at91
 	at91_sys_write(AT91_EBI_CSA, csa | AT91_EBI_CS3A_SMC_SMARTMEDIA);
 
 	/* set the bus interface characteristics */
-	at91_sys_write(AT91_SMC_CSR(3), AT91_SMC_ACSS_STD | AT91_SMC_DBW_8 | AT91_SMC_WSEN
-				| AT91_SMC_NWS_(5)
-				| AT91_SMC_TDF_(1)
-				| AT91_SMC_RWSETUP_(0)	/* tDS Data Set up Time 30 - ns */
-				| AT91_SMC_RWHOLD_(1)	/* tDH Data Hold Time 20 - ns */
+	at91_sys_write(AT91_SMC_CSR(3), AT91_SMC_ACSS_STD | AT91_SMC_DBW_8
+		       | AT91_SMC_WSEN
+		       | AT91_SMC_NWS_(5)
+		       | AT91_SMC_TDF_(1)
+		       | AT91_SMC_RWSETUP_(0)	/* tDS Data Set up Time 30 - ns */
+		       | AT91_SMC_RWHOLD_(1)	/* tDH Data Hold Time 20 - ns */
 	);
 
 	if (host->board->enable_pin)
@@ -145,13 +135,14 @@ static int __init at91_nand_probe(struct
 
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
+	mtd->owner = THIS_MODULE;
 
 	/* Set address of NAND IO lines */
 	nand_chip->IO_ADDR_R = host->io_base;
 	nand_chip->IO_ADDR_W = host->io_base;
-	nand_chip->hwcontrol = at91_nand_hwcontrol;
+	nand_chip->cmd_ctrl = at91_nand_cmd;
 	nand_chip->dev_ready = at91_nand_device_ready;
-	nand_chip->eccmode = NAND_ECC_SOFT;	/* enable ECC */
+	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
 	platform_set_drvdata(pdev, host);
@@ -173,28 +164,30 @@ static int __init at91_nand_probe(struct
 
 #ifdef CONFIG_MTD_PARTITIONS
 	if (host->board->partition_info)
-		partitions = host->board->partition_info(mtd->size, &num_partitions);
+		partitions = host->board->partition_info(mtd->size,
+							 &num_partitions);
 
 	if ((!partitions) || (num_partitions == 0)) {
-		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported device.\n");
+		printk(KERN_ERR "at91_nand: No parititions defined, "
+		       "or unsupported device.\n");
 		res = ENXIO;
-		goto out;
+		goto release;
 	}
 
 	res = add_mtd_partitions(mtd, partitions, num_partitions);
 #else
 	res = add_mtd_device(mtd);
 #endif
+	if (!res)
+		return res;
 
-out:
-	if (res) {
-		at91_nand_disable(host);
-		platform_set_drvdata(pdev, NULL);
-	
-		iounmap(host->io_base);
-		kfree(host);
-	}
-
+ release:
+	nand_release(mtd);
+ out:
+	at91_nand_disable(host);
+	platform_set_drvdata(pdev, NULL);
+	iounmap(host->io_base);
+	kfree(host);
 	return res;
 }
 
@@ -206,8 +199,7 @@ static int __devexit at91_nand_remove(st
 	struct at91_nand_host *host = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = &host->mtd;
 
-	del_mtd_partitions(mtd);
-	del_mtd_device(mtd);
+	nand_release(mtd);
 
 	at91_nand_disable(host);
 
