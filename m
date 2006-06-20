Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsiX9-0003aW-HS
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 16:52:56 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <449819F1.2010104@epico.si>
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
	<4497F1B4.8030702@epico.si>
	<1150809682.6780.172.camel@localhost.localdomain>
	<4497FCA4.1060601@epico.si>
	<1150811833.6780.195.camel@localhost.localdomain>
	<44980505.2000003@epico.si>
	<1150813786.6780.213.camel@localhost.localdomain>
	<449819F1.2010104@epico.si>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 17:53:50 +0200
Message-Id: <1150818830.6780.232.camel@localhost.localdomain>
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

On Tue, 2006-06-20 at 17:53 +0200, Savin Zlobec wrote:
> >
> The problem is in nand_wait, the function is called (when writting files 
> to jffs2) with
> chip->state=FL_READING and state=FL_WRITING and consequently the waiting
> is terminated instantly (chip->state != state) leaving the chip in busy 
> state.

The problem is the calling code. Doh - where is the brown paperbag ?

Thanks for tracking that down.

	tglx

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77406fc..0fd1052 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -501,7 +501,6 @@ static void nand_command(struct mtd_info
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_STATUS:
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE);
 		return;
 
 	case NAND_CMD_RESET:
@@ -1532,7 +1531,7 @@ static int nand_write(struct mtd_info *m
 	if (!len)
 		return 0;
 
-	nand_get_device(chip, mtd, FL_READING);
+	nand_get_device(chip, mtd, FL_WRITING);
 
 	chip->ops.len = len;
 	chip->ops.datbuf = (uint8_t *)buf;
@@ -1659,7 +1658,7 @@ static int nand_write_oob(struct mtd_inf
 		return -EINVAL;
 	}
 
-	nand_get_device(chip, mtd, FL_READING);
+	nand_get_device(chip, mtd, FL_WRITING);
 
 	switch(ops->mode) {
 	case MTD_OOB_PLACE:
