Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsfa1-0007Dv-Pu
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 13:43:42 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4497E9D4.9040307@epico.si>
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
Content-Type: text/plain
Date: Tue, 20 Jun 2006 14:44:40 +0200
Message-Id: <1150807480.6780.157.camel@localhost.localdomain>
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

On Tue, 2006-06-20 at 14:28 +0200, Savin Zlobec wrote:
> Chip not ready in nand_command():
> Last caller: c012aa04 (nand_base.c:389)
> Last command: 0x70
> Current caller: c012c0e8 (nand_base.c:1720)
> Current command: 0x60
> 
> 384     static int nand_check_wp(struct mtd_info *mtd)
> 385     {
> 386             struct nand_chip *chip = mtd->priv;
> 387             /* Check the WP bit */
> 388             chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> 389             return (chip->read_byte(mtd) & NAND_STATUS_WP) ? 0 : 1;
> 390     }
>
> 1715    static void single_erase_cmd(struct mtd_info *mtd, int page)
> 1716    {
> 1717            struct nand_chip *chip = mtd->priv;
> 1718            /* Send commands to erase a block */
> 1719            chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
> 1720            chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
> 1721    }

The status command does not influence ready/busy. The one before that
nand_check_wp() call, is a chip reset command, but we wait for the chip
to become ready again.

Please give me the exact part number, so I can lookup the data sheet.

	tglx
