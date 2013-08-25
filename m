Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDG43-0001gM-Gp
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 15:47:48 +0000
Received: by mail-pd0-f180.google.com with SMTP id y10so1794401pdj.39
 for <linux-mtd@lists.infradead.org>; Sat, 24 Aug 2013 08:47:21 -0700 (PDT)
Date: Sat, 24 Aug 2013 23:52:02 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/9] mtd: nand: rename the cellinfo to bits_per_cell
Message-ID: <20130825035159.GA9911@gmail.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-2-git-send-email-b32955@freescale.com>
 <20130824054913.GA32074@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130824054913.GA32074@brian-ubuntu>
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 10:49:13PM -0700, Brian Norris wrote:
> On Mon, Aug 19, 2013 at 10:31:10AM +0800, Huang Shijie wrote:
> > +static int nand_get_bits_per_cell(u8 data)
> 
> Maybe make the parameter name 'cellinfo' to make it clearer? And maybe
> a short comment to say that it extracts this information from the 3rd
> byte of the extended ID de-facto standard?
yes, the "cellinfo" is better.

> 
> > +{
> > +	int bits;
> > +
> > +	bits = data & NAND_CI_CELLTYPE_MSK;
> > +	bits >>= NAND_CI_CELLTYPE_SHIFT;
> > +	return bits + 1;
> > +}
> > +
> >  /*
> >   * Many new NAND share similar device ID codes, which represent the size of the
> >   * chip. The rest of the parameters must be decoded according to generic or
> 
> [...]
> 
> > @@ -3224,6 +3232,7 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
> >  	mtd->oobsize = mtd->writesize / 32;
> >  	*busw = type->options & NAND_BUSWIDTH_16;
> >  
> > +	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
> 
> This is wrong. The NAND covered by nand_decode_id() do not have an
> extended ID, so the third ID byte is not meaningful. But all of these
> should be SLC, so just:
> 
> 	/* All legacy ID NAND are small-page, SLC */
> 	chip->bits_per_cell = 1;

it is okay to me. Use this in the next version.

thanks
Huang Shijie
