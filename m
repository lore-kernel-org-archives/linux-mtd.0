Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqqRH-0007ww-Jh
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 20:31:24 +0000
Date: Wed, 11 Dec 2013 17:31:12 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131211203111.GD5461@localhost>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131211190313.GS27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 Pekon Gupta <pekon@ti.com>, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 11:03:13AM -0800, Brian Norris wrote:
> On Wed, Dec 11, 2013 at 09:54:54PM +0800, Huang Shijie wrote:
> > On Mon, Dec 09, 2013 at 12:09:12PM -0800, Brian Norris wrote:
> > > + * nand_set_read_retry - [INTERN] Set the READ RETRY mode
> > > + * @mtd: MTD device structure
> > > + * @retry_mode: the retry mode to use
> > > + *
> > > + * Some vendors supply a special command to shift the Vt threshold, to be used
> > > + * when there are too many bitflips in a page (i.e., ECC error). After setting
> > > + * a new threshold, the host should retry reading the page.
> > > + */
> > > +static int nand_set_read_retry(struct mtd_info *mtd, int retry_mode)
> > > +{
> > > +	struct nand_chip *chip = mtd->priv;
> > > +	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
> > > +
> > This can cause a DMA warning.
> 
> ...on GPMI NAND, but not on most (any?) other drivers. Why does GPMI try
> to use DMA on *every* operation? That doesn't even make sense for a 4 or
> 5 byte transfer. Plus, we don't give a guarantee that buffers will be
> DMA-able in MTD (UBI uses vmalloc() buffers, for instance), so I'm sure
> you'll hit problems other places. I can fix this one (use
> chip->buffers->databuf instead?) but I think GPMI is a bad citizen in
> this regard, given that you have no guarantee. You need to fix MTD
> systematically if you expect this guarantee.
> 
> (For one, nand_default_block_markbad() uses stack-allocated buffers; but
> I see that GPMI overrides this callback.)
> 

Isn't completely bloated to setup a DMA operation just to transfer a
bunch of bytes? Wouldn't that seriously hurt performance?

Or maybe it doesn't matter because those commands are scarcely
invoked...
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
