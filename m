Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCluN-0004eq-19
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 11:53:56 +0000
Date: Mon, 22 May 2017 13:53:28 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jan Glauber <jan.glauber@caviumnetworks.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170522135328.3468a523@bbrezillon>
In-Reply-To: <20170522113537.GA15301@hc>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
 <20170519095140.2a5f9e5c@bbrezillon> <20170522113537.GA15301@hc>
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

On Mon, 22 May 2017 13:35:37 +0200
Jan Glauber <jan.glauber@caviumnetworks.com> wrote:

> Hi Boris,
> 
> On Fri, May 19, 2017 at 09:51:40AM +0200, Boris Brezillon wrote:
> > Hi Jan,
> > 
> > A few more comments.
> > 
> > On Mon, 27 Mar 2017 18:05:24 +0200
> > Jan Glauber <jglauber@cavium.com> wrote:
> >   
> > > +
> > > +struct ndf_nop_cmd {
> > > +	u16 opcode	: 4;
> > > +	u16 nop		: 12;
> > > +};
> > > +
> > > +struct ndf_wait_cmd {
> > > +	u16 opcode	: 4;
> > > +	u16 r_b		: 1;	/* wait for one cycle or PBUS_WAIT deassert */
> > > +	u16		: 3;
> > > +	u16 wlen	: 3;	/* timing parameter select */  
> > 
> > Can you clearly describe what this timing is? According to the code,
> > it's tWB, but I'd prefer to have it documented here.  
> 
> It is until PBUS_WAIT deasserts, if that condition is already false it
> waits for one cycle.

I guess PBUS_WAIT is directly related to the R/B pin. So I guess this
timing is tRR.

> 
> > BTW, it's not clear at first glance that the value you put here is
> > actually encoding the tm_par slot.  
> 
> Yes. All the timings use this schematic, so maybe a more prominent
> comment in the header file would help.

It's still easier if the comment is appearing next to the struct
definition. So maybe you can add a generic comment at the beginning of
the file and then refer to it.

> 
> > > +	u16		: 5;
> > > +};  
> > 
> > Hm, are you sure you want to trust the compiler for bitfield placement?
> > AFAIK, bitfield ordering is not standardized and is thus
> > implementation specific. I'd recommend that you switch to plain
> > u16/u32/u64 fields and use macros to define bitfields:
> > 
> > #define NFD_CMD_OPCODE(x)	(x)
> > #define NFD_WAIT_CMD_WAIT_RB	BIT(5)
> > #define NFD_WAIT_CMD_TPAR(x)	((x) << 8)
> > ...  
> 
> Well, I had that discussion before :) Contrary to common wisdom I've not
> seen a problem with bitfields yet. Personaly I would prefer the bitfield
> notation as I found it more readable, but I don't mind converting it.

I'd still prefer to get rid of bitfields, to be consistent with how
Linux deals with bitfields in general.

> 
> > > +
> > > +struct ndf_bus_cmd {
> > > +	u16 opcode	: 4;
> > > +	u16 direction	: 4;	/* 1 = acquire, 0 = release */  
> > 
> > Not sure why this is named direction if the only thing you can do is
> > acquire or release the bus.  
> 
> I'm using the names from the official documentation. I know that this
> might not help everyone as it is not public, but for maintaining the
> driver or fixing bugs I find it more convenient. Sometimes the names
> are sub-optimal though, then I try to add comments as above.

Okay for using datasheet names, but please document their meanings just
before the struct or macro definition (it's done here, but it's not the
case for all fields).

> 
> > > +	u16		: 8;
> > > +};
> > > +
> > > +struct ndf_chip_cmd {
> > > +	u16 opcode	: 4;
> > > +	u16 chip	: 3;	/* select chip, 0 = disable */
> > > +	u16 enable	: 1;	/* 1 = enable, 0 = disable */
> > > +	u16 bus_width	: 2;	/* 10 = 16 bit, 01 = 8 bit */
> > > +	u16		: 6;
> > > +};
> > > +
> > > +struct ndf_cle_cmd {
> > > +	u32 opcode	: 4;
> > > +	u32		: 4;
> > > +	u32 cmd_data	: 8;	/* command sent to the PBUS AD pins */
> > > +	u32 clen1	: 3;	/* time between PBUS CLE and WE asserts */
> > > +	u32 clen2	: 3;	/* time WE remains asserted */
> > > +	u32 clen3	: 3;	/* time between WE deassert and CLE */  
> > 
> > Can you re-use the names defined here [1]?
> > AFAICS, clen2 == tWP, clen3 == tCLH, clen1 == tCLS - tWP.  
> 
> Again, naming is to match the documentation. I found it incredible
> hard to get the timing parameters right, as the Cavium hardware
> adds another abstraction (PBUS), with often uses completely different
> timing names. Not sure what is the best to do here, if I only use
> the 'official' names I would ignore the PBUS layer.

I'm fine with cavium specific names as long as their conversion to
generic timings is clearly explained.
