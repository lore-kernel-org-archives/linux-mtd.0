Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8vup-0007mB-56
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 18:00:40 +0000
Received: by mail-ob0-f177.google.com with SMTP id wp18so3822745obc.22
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2014 10:00:18 -0800 (PST)
Date: Thu, 30 Jan 2014 10:00:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Message-ID: <20140130180013.GG8919@ld-irv-0074>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <20140130121704.GA11285@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140130121704.GA11285@localhost>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 30, 2014 at 09:17:04AM -0300, Ezequiel Garcia wrote:
> On Wed, Jan 29, 2014 at 02:18:28PM -0800, Brian Norris wrote:
> > The NAND command helpers tend to automatically shift the column address
> > for x16 bus devices, since most commands expect a word address, not a
> > byte address. The Read ID command, however, expects an 8-bit address
> > (i.e., 0x00, 0x20, or 0x40 should not be translated to 0x00, 0x10, or
> > 0x20).
> > 
> > This fixes the column address for a few drivers which imitate the
> > nand_base defaults. Note that I don't touch sh_flctl.c, since it already
> > handles this problem slightly differently (note its comment "READID is
> > always performed using an 8-bit bus").
> > 
> > I have not tested this patch, as I only have x8 parts up for testing at
> > this point. Hopefully that can change soon...
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> I applied both patches and tested on my AM335x board (omap2-nand driver).
> Both 8-bit and 16-bit devices get ONFI-probed and pass a nandtest round.
> 
> Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Thanks for the quick testing!

> [..]
> > +
> > +/**
> > + * Check if the opcode's address should be sent only on the lower 8 bits
> > + * @command: opcode to check
> > + */
> > +static inline int nand_opcode_8bits(unsigned int command)
> > +{
> > +	return command == NAND_CMD_READID;
> > +}
> > +
> >  #endif /* __LINUX_MTD_NAND_H */
> 
> With the introduction of this function, I think all the problems we've
> discussed.

I think so too.

But I forgot to pose this question: are there any other commands which
should be treated similarly? NAND_CMD_PARAM only takes column address 0,
and I think Change Read Column (or NAND_CMD_RNDOUT, used for extended
parameter pages) takes a full buswidth address, according to the spec; I
suppose ONFI presumes the host has read the full parameter page and
determined the bus width by the time it wants to skip to the extended
parameter pages; or else it just continues to read out bytes
sequentially).

> The solution looks good to me so. Nice job!

Thanks. Glad to get it out of the way.

Brian
