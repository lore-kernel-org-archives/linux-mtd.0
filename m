Received: from mail-dm3nam03on0057.outbound.protection.outlook.com
 ([104.47.41.57] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCldF-0006Jw-28
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 11:36:15 +0000
Date: Mon, 22 May 2017 13:35:37 +0200
From: Jan Glauber <jan.glauber@caviumnetworks.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170522113537.GA15301@hc>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
 <20170519095140.2a5f9e5c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170519095140.2a5f9e5c@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, May 19, 2017 at 09:51:40AM +0200, Boris Brezillon wrote:
> Hi Jan,
> 
> A few more comments.
> 
> On Mon, 27 Mar 2017 18:05:24 +0200
> Jan Glauber <jglauber@cavium.com> wrote:
> 
> > +
> > +struct ndf_nop_cmd {
> > +	u16 opcode	: 4;
> > +	u16 nop		: 12;
> > +};
> > +
> > +struct ndf_wait_cmd {
> > +	u16 opcode	: 4;
> > +	u16 r_b		: 1;	/* wait for one cycle or PBUS_WAIT deassert */
> > +	u16		: 3;
> > +	u16 wlen	: 3;	/* timing parameter select */
> 
> Can you clearly describe what this timing is? According to the code,
> it's tWB, but I'd prefer to have it documented here.

It is until PBUS_WAIT deasserts, if that condition is already false it
waits for one cycle.

> BTW, it's not clear at first glance that the value you put here is
> actually encoding the tm_par slot.

Yes. All the timings use this schematic, so maybe a more prominent
comment in the header file would help.

> > +	u16		: 5;
> > +};
> 
> Hm, are you sure you want to trust the compiler for bitfield placement?
> AFAIK, bitfield ordering is not standardized and is thus
> implementation specific. I'd recommend that you switch to plain
> u16/u32/u64 fields and use macros to define bitfields:
> 
> #define NFD_CMD_OPCODE(x)	(x)
> #define NFD_WAIT_CMD_WAIT_RB	BIT(5)
> #define NFD_WAIT_CMD_TPAR(x)	((x) << 8)
> ...

Well, I had that discussion before :) Contrary to common wisdom I've not
seen a problem with bitfields yet. Personaly I would prefer the bitfield
notation as I found it more readable, but I don't mind converting it.

> > +
> > +struct ndf_bus_cmd {
> > +	u16 opcode	: 4;
> > +	u16 direction	: 4;	/* 1 = acquire, 0 = release */
> 
> Not sure why this is named direction if the only thing you can do is
> acquire or release the bus.

I'm using the names from the official documentation. I know that this
might not help everyone as it is not public, but for maintaining the
driver or fixing bugs I find it more convenient. Sometimes the names
are sub-optimal though, then I try to add comments as above.

> > +	u16		: 8;
> > +};
> > +
> > +struct ndf_chip_cmd {
> > +	u16 opcode	: 4;
> > +	u16 chip	: 3;	/* select chip, 0 = disable */
> > +	u16 enable	: 1;	/* 1 = enable, 0 = disable */
> > +	u16 bus_width	: 2;	/* 10 = 16 bit, 01 = 8 bit */
> > +	u16		: 6;
> > +};
> > +
> > +struct ndf_cle_cmd {
> > +	u32 opcode	: 4;
> > +	u32		: 4;
> > +	u32 cmd_data	: 8;	/* command sent to the PBUS AD pins */
> > +	u32 clen1	: 3;	/* time between PBUS CLE and WE asserts */
> > +	u32 clen2	: 3;	/* time WE remains asserted */
> > +	u32 clen3	: 3;	/* time between WE deassert and CLE */
> 
> Can you re-use the names defined here [1]?
> AFAICS, clen2 == tWP, clen3 == tCLH, clen1 == tCLS - tWP.

Again, naming is to match the documentation. I found it incredible
hard to get the timing parameters right, as the Cavium hardware
adds another abstraction (PBUS), with often uses completely different
timing names. Not sure what is the best to do here, if I only use
the 'official' names I would ignore the PBUS layer.

> > +	u32		: 7;
> > +};
> > +
> > +/* RD_EDO_CMD uses the same layout as RD_CMD */
> > +struct ndf_rd_cmd {
> > +	u32 opcode	: 4;
> > +	u32 data	: 16;	/* data bytes */
> > +	u32 rlen1	: 3;
> > +	u32 rlen2	: 3;
> > +	u32 rlen3	: 3;
> > +	u32 rlen4	: 3;
> 
> Ditto: please document the timings and/or use better names.

Same as above.

> > +};
> > +
> > +struct ndf_wr_cmd {
> > +	u32 opcode	: 4;
> > +	u32 data	: 16;	/* data bytes */
> > +	u32		: 4;
> > +	u32 wlen1	: 3;
> > +	u32 wlen2	: 3;
> 
> Ditto.
> 
> > +	u32		: 3;
> > +};
> > +
> > +struct ndf_set_tm_par_cmd {
> > +	u64 opcode	: 4;
> > +	u64 tim_mult	: 4;	/* multiplier for the seven paramters */
> > +	u64 tm_par1	: 8;	/* --> Following are the 7 timing parameters that */
> > +	u64 tm_par2	: 8;	/*     specify the number of coprocessor cycles.  */
> > +	u64 tm_par3	: 8;	/*     A value of zero means one cycle.		  */
> > +	u64 tm_par4	: 8;	/*     All values are scaled by tim_mult	  */
> > +	u64 tm_par5	: 8;	/*     using tim_par * (2 ^ tim_mult).		  */
> 
> Can you put this comment above the struct def (this comment applies to
> the whole driver)?

Sure, good idea.

Thanks for reviewing,
--Jan

> > +	u64 tm_par6	: 8;
> > +	u64 tm_par7	: 8;
> > +};
> 
> [1]http://elixir.free-electrons.com/linux/latest/source/include/linux/mtd/nand.h#L607
