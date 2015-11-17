Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyld6-0001kE-Cj
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 19:09:25 +0000
Date: Tue, 17 Nov 2015 20:09:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <linux-mtd@lists.infradead.org>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, <linux-kernel@vger.kernel.org>, Alex Smith
 <alex.smith@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v7, 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20151117200901.675b9c58@bbrezillon>
In-Reply-To: <564B55CB.5050106@imgtec.com>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-3-git-send-email-harvey.hunt@imgtec.com>
 <20151104111818.4e292921@bbrezillon> <564B55CB.5050106@imgtec.com>
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

Hi Harvey,

On Tue, 17 Nov 2015 16:28:59 +0000
Harvey Hunt <harvey.hunt@imgtec.com> wrote:


> >> +/* Timeout for BCH calculation/correction in microseconds. */
> >> +#define BCH_TIMEOUT			100000
> >
> > Suffixing the macro name with _MS would make it clearer.
> 
> Do you mean _US?

Yes.



> >> +static void jz4780_nand_select_chip(struct mtd_info *mtd, int chipnr)
> >> +{
> >> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> >> +	struct jz4780_nand_chip *chip;
> >> +
> >> +	if (chipnr == -1) {
> >> +		/* Ensure the currently selected chip is deasserted. */
> >> +		if (nand->selected >= 0) {
> >> +			chip = &nand->chips[nand->selected];
> >> +			jz4780_nemc_assert(nand->dev, chip->bank, false);
> >> +		}
> >> +	} else {
> >> +		chip = &nand->chips[chipnr];
> >> +		nand->chip.IO_ADDR_R = chip->base + OFFSET_DATA;
> >> +		nand->chip.IO_ADDR_W = chip->base + OFFSET_DATA;
> >
> > How about providing helper functions that would use the nand->selected
> > + chips information to access the correct set of registers instead of
> > adapting IO_ADDR_R/IO_ADDR_W values?
> 
> I'm not sure what you mean - are you suggesting something such as:
> 
> u8 *jz4780_nand_read_io_line(struct jz4780_nand *nand, unsigned int off)
> {
> 	return readb(&nand->chips[nand->selected]->base + off);
> }
> 
> Does the NAND core code not make use of IO_ADDR_{W,R}?

Right, I missed that. It's used to implement the default
nand_read/write_buf/byte/word() functions, but I still think it would be
preferable to implement your own read/write_xxx() functions than using
those fields, but that's up to you.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
