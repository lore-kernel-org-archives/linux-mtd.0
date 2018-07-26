Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiowK-0005uL-Vd
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 22:41:02 +0000
Date: Fri, 27 Jul 2018 00:40:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180727004032.5b42b62e@bbrezillon>
In-Reply-To: <4c4a20c8496b60ab051a0756f150ee7a@agner.ch>
References: <20180718231234.8534-1-miquel.raynal@bootlin.com>
 <20180718231234.8534-3-miquel.raynal@bootlin.com>
 <cf9e65608733ecf1d0e3728e42df1acc@agner.ch>
 <20180726201259.3dda70ec@bbrezillon>
 <4c4a20c8496b60ab051a0756f150ee7a@agner.ch>
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

On Fri, 27 Jul 2018 00:20:50 +0200
Stefan Agner <stefan@agner.ch> wrote:

> On 26.07.2018 20:12, Boris Brezillon wrote:
> > On Thu, 26 Jul 2018 18:22:10 +0200
> > Stefan Agner <stefan@agner.ch> wrote:  
> >> > +/**
> >> > + * struct nand_controller_ops - Controller operations
> >> > + *
> >> > + * @attach_chip: Callback that will be called between nand_detect() and
> >> > + *		 nand_scan_tail() during nand_scan() (optional).
> >> > + * @detach_chip: Callback that will be called from nand_cleanup() or if
> >> > + *		 nand_scan_tail() fails (optional).  
> >>
> >> This documentation reads not very helpful to me.
> >>
> >> It would be useful if it is written more from the driver developers
> >> perspective, e.g. what those callbacks ideally are supposed to do...
> >>  
> > 
> > Indeed. How about:
> > 
> > 	@attach_chip: this method is called between after the NAND  
> 
> I guess just after.

Yep.

> 
> > 		      detection phase to let controller driver
> > 		      tweak/customize the configuration based on the
> > 		      NAND properties (page size, OOB size, ECC
> > 		      requirements, ...).  
> 
> Maybe explicitly state that NAND flash parameters are available in this
> call, e.g.
> 
> 	@attach_chip: this method is called after the NAND detection 
> 		      phase after flash ID and MTD fields such as
> 		      erase size, page size and OOB size have been
> 		      set up. ECC requirements are available if
> 		      provided by the NAND chip or device tree.
> 		      Typically used to chose the appropriate ECC

					^ choose

> 		      config and allocate associated resources.
> 		      This hook is optional.
> 

Sounds good.

> 
> > 	@detach_chip: free all resources allocated/claimed in
> > 		      nand_controller_ops->detach_chip().  
> 
> That probably should read nand_controller_ops->attach_chip().

And yes, I meant attach_chip().

> 
> > 		      This hook is optional.  
> 
> --
> Stefan
