Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsg9C-00086b-5x
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 14:20:03 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4497F1B4.8030702@epico.si>
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
Content-Type: text/plain
Date: Tue, 20 Jun 2006 15:21:22 +0200
Message-Id: <1150809682.6780.172.camel@localhost.localdomain>
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

On Tue, 2006-06-20 at 15:01 +0200, Savin Zlobec wrote:
> Chip not ready in nand_command():
> Last caller: c012afa8 (nand_base.c:736)
> Last command: 0x70
> Current caller: c012bf8c (nand_base.c:1374)
> Current command: 0x80
> 
> 716     static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip, int state)
> ...
> 733             if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
> 734                     chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
> 735             else
> 736                     chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> 
> 1367    static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> 1368                               const uint8_t *buf, int page, int cached)
> 1369    {
> 1370            int status;
> 1371
> 1372            chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> 1373
> 1374            chip->ecc.write_page(mtd, chip, buf);
> 
> Chip not ready in nand_command():
> Last caller: c012afa8 (nand_base.c:736)
> Last command: 0x70
> Current caller: c012b644 (nand_base.c:988)
> Current command: 0x00
> 
> 953     static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
> ...
> 987                             if (likely(sndcmd)) {
> 988                                     chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> 989                                     sndcmd = 0;
> 990                             }

This gets even more mysterious. I both cases the previous function was
nand_wait(), which blocks in the wait function until ready state is
reached. 

I really have no clue, how the chip gets into busy state between the
return from nand_wait() and the next commmand. 

Is there anything playing with the enable pin of the nand chip between
those commands ? Those chips have an autoread feature on power on. Is
the power switched off ?

Have you any other modifications to at91_nand.c I'm not aware of ?

	tglx
