Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jyK8-0004OZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2001 08:32:40 +0100
Date: Thu, 20 Sep 2001 08:38:27 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: "Kim, Sanghun" <shkim@fdma.snu.ac.kr>
cc: <linux-mtd@lists.infradead.org>,  <sjhill@cotw.com>
Subject: Re: NAND Flash Hardware configuration?
In-Reply-To: <AEECKHHDHJAAFPKILIGNKEIICAAA.shkim@fdma.snu.ac.kr>
Message-ID: <Pine.LNX.4.33.0109200821360.24651-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 20 Sep 2001, Kim, Sanghun wrote:

> M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.

You don't need a DiskOnChip driver. The DiskOnChip uses NAND flash, but 
has other magic too. There's a separate driver for standalone NAND flash 
chips.

> Linux how to know what GPIO maped to "ALE,CLE,CE"???

Yes, you're right - you'll have to write a small piece of code to teach 
Linux how to drive the control lines.

drivers/mtd/nand/nand.c is a generic driver for NAND flash chips. It needs
to be coupled with a board-specific module, as you noticed. So far, I
believe that it's only been used with the 'spia' driver, which you can use
as an example for your own code.

Before invoking the generic NAND driver, the board-specific module 
fills in the 'nand_chip' data structure with the virtual address of 
the data port, the virtual address of the GPIO register containing the 
control lines, and the three bits in that register which are connected to 
each of the CLE, ALE and CE pins:

        /* Set address of NAND IO lines */
        this->IO_ADDR = spia_fio_base;
        this->CTRL_ADDR = spia_io_base + spia_pedr;
        this->CLE = 0x01;
        this->ALE = 0x02;
        this->NCE = 0x04;

Currently the CTRL_ADDR is treated as an 8-bit wide register. The generic 
NAND code will do things like

	*(volatile unsigned char *)this->CTRL_ADDR |= this->CLE;

	*(volatile unsigned char *)this->CTRL_ADDR &= ~this->CLE;

This can be a little suboptimal because it means there's no locking, and
it's not very flexible - if you need a 32-bit wide register, if your
output pins are inverted, or if your three control lines are actually
spread across more than one register it can't express that.

We may need to rethink the abstraction between the generic NAND driver and 
the board-specific code. I wonder how much performance would be affected 
if we made it an out-of-line function call?


BTW, Steve: nand_deselect() has a superfluous '~', afaict. 

#define nand_select()   NAND_CTRL &= ~this->NCE; \
                        nand_command(mtd, NAND_CMD_RESET, -1, -1); \
                        udelay (10);
#define nand_deselect() NAND_CTRL |= ~this->NCE;


-- 
dwmw2
