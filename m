Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6Kt3-0001aj-I3
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 16:13:10 +0000
Date: Tue, 8 Dec 2015 17:12:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <linux-mtd@lists.infradead.org>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, <linux-kernel@vger.kernel.org>, Alex Smith
 <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH v9 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20151208171247.7cfdbc98@bbrezillon>
In-Reply-To: <5666FF6B.5090309@imgtec.com>
References: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
 <1449144142-24004-3-git-send-email-harvey.hunt@imgtec.com>
 <20151208151436.11ce72f4@bbrezillon> <5666FF6B.5090309@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Dec 2015 16:03:55 +0000
Harvey Hunt <harvey.hunt@imgtec.com> wrote:

> >
> > static void jz4780_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
> > 				 unsigned int ctrl)
> > {
> > 	struct jz4780_nand_chip *nand = to_jz4780_nand_chip(mtd);
> > 	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(nand->chip.controller);
> > 	struct jz4780_nand_cs *cs;
> >
> > 	if (WARN_ON(nfc->selected < 0))
> > 		return;
> >
> > 	cs = &nfc->cs[nfc->selected];
> >
> > 	if (ctrl & NAND_CTRL_CHANGE) {
> > 		if (cmd != NAND_CMD_NONE) {
> > 			if (ctrl & NAND_ALE)
> > 				writeb(cmd, cs->base + OFFSET_ADDR);
> > 			else if (ctrl & NAND_CLE)
> > 				writeb(cmd, cs->base + OFFSET_CMD);
> > 		}
> >
> > 		jz4780_nemc_assert(nfc->dev, cs->bank, ctrl & NAND_NCE);
> > 	}
> > }
> >
> 
> Okay, I understand your point now. I would also have to implement the 
> read/write functions to replace the defaults, correct? If so, it feels 
> strange to add functions to reimplement the default ones.

I don't think you have to re-implement the {read,write}_{byte,buf,word}
functions, because you'll still assign the ->IO_ADDR_W and ->IO_ADDR_R
fields to cs->base + OFFSET_DATA in jz4780_nand_init_chip(), but maybe
I'm missing something.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
