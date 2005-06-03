Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1De7I2-0000MO-OZ
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 04:12:33 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Derek Jones <DJones@Interalia.ca>
In-Reply-To: <083AB380E3924D4795740AAE9A27DCAB6BDE06@cgy2000.interalia.ca>
References: <083AB380E3924D4795740AAE9A27DCAB6BDE06@cgy2000.interalia.ca>
Content-Type: text/plain
Date: Fri, 03 Jun 2005 10:12:36 +0200
Message-Id: <1117786356.20785.95.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD support for Samsung K9K4G08U0M 4G 8bit NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-02 at 17:05 -0600, Derek Jones wrote:
> The device is detected correctly (ID is EC, DC, C1, 15). However, code
> in nand_bbt.c is calling read_oob that issues a read OOB (0x50) command
> that is not supported by the Samsung device.

static void nand_command_lp (struct mtd_info *mtd, unsigned command, int
column, int page_addr)
{
	register struct nand_chip *this = mtd->priv;

	/* Emulate NAND_CMD_READOOB */
	if (command == NAND_CMD_READOOB) {
		column += mtd->oobblock;
		command = NAND_CMD_READ0;
	}


> I have poked around in nand_bbt.c, but don't see anything obvious. Any
> suggestions?

There's nothing to poke there :)

Can you provide more detailed information what is not working and which
problems you have ? 


tglx
