Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsakZ-00038w-Ad
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 03:34:28 -0400
Message-ID: <4497A723.2070006@epico.si>
Date: Tue, 20 Jun 2006 09:43:31 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] AT91RM9200 NAND support
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
In-Reply-To: <1150787823.15614.297.camel@fuzzie.sanpeople.com>
Content-Type: multipart/mixed; boundary="------------000903040101060502040904"
Cc: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000903040101060502040904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andrew Victor wrote:

>hi Thomas,
>
>  
>
>>As I pointed out in my previous mail, the driver needs to be updated to
>>work with the latest changes in the nand driver.
>>    
>>
I'am working on this right now. I've changed the at91 driver and I'am 
going to
test it when I finish the changes on YAFFS - read/write_ecc and oobblock are
not part of mtd_info any more...

I'am attaching the at91_nand.c changes.
 
--
savin

--------------000903040101060502040904
Content-Type: text/x-patch;
 name="at91_nand.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="at91_nand.diff"

--- drivers/mtd.old/nand/at91_nand.c	2006-06-20 09:09:21.000000000 +0200
+++ drivers/mtd/nand/at91_nand.c	2006-06-20 09:33:21.000000000 +0200
@@ -39,12 +39,13 @@
 /*
  * Hardware specific access to control-lines
  */
-static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd)
+static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct at91_nand_host *host = nand_chip->priv;
 
-	switch(cmd) {
+	if (ctrl & NAND_CTRL_CHANGE) {
+		switch(cmd) {
 		case NAND_CTL_SETCLE:
 			nand_chip->IO_ADDR_W = host->io_base + (1 << host->board->cle);
 			break;
@@ -61,7 +62,10 @@
 			break;
 		case NAND_CTL_CLRNCE:
 			break;
+		}
 	}
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, chip->IO_ADDR_W);
 }
 
 
@@ -145,13 +149,14 @@
 
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
+	mtd->owner = THIS_MODULE;
 
 	/* Set address of NAND IO lines */
 	nand_chip->IO_ADDR_R = host->io_base;
 	nand_chip->IO_ADDR_W = host->io_base;
-	nand_chip->hwcontrol = at91_nand_hwcontrol;
+	nand_chip->cmd_ctrl = at91_nand_hwcontrol;
 	nand_chip->dev_ready = at91_nand_device_ready;
-	nand_chip->eccmode = NAND_ECC_SOFT;	/* enable ECC */
+	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
 	platform_set_drvdata(pdev, host);
@@ -170,6 +175,7 @@
 		res = -ENXIO;
 		goto out;
 	}
+	nand_release(mtd);
 
 #ifdef CONFIG_MTD_PARTITIONS
 	if (host->board->partition_info)

--------------000903040101060502040904--
