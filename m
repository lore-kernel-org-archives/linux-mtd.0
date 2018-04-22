Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fA7uD-00049H-6K
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 05:51:23 +0000
Date: Sun, 22 Apr 2018 07:51:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Uniform way to pass a NAND ID table to the core
Message-ID: <20180422075106.76c249a9@bbrezillon>
In-Reply-To: <20180422033600.014f53c5@xps13>
References: <20180321131235.9822-1-miquel.raynal@bootlin.com>
 <20180327091737.7d09b189@bbrezillon>
 <20180421201900.6c6e4a33@xps13>
 <20180421212853.34bf15b9@bbrezillon>
 <20180422033600.014f53c5@xps13>
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

On Sun, 22 Apr 2018 03:36:00 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> On Sat, 21 Apr 2018 21:28:53 +0200, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> 
> > On Sat, 21 Apr 2018 20:19:00 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > On Tue, 27 Mar 2018 09:17:37 +0200, Boris Brezillon
> > > <boris.brezillon@bootlin.com> wrote:
> > >     
> > > > Hi Miquel,
> > > > 
> > > > On Wed, 21 Mar 2018 14:12:33 +0100
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > >       
> > > > > Hello,
> > > > > 
> > > > > As part of the work of migrating all the drivers to nand_scan(), and
> > > > > because nand_scan() does not provide a way to pass any ID table, create
> > > > > a field in NAND chip so a controller driver can expose its ID table to
> > > > > the core through it and stop using the last parameter of
> > > > > nand_scan_ident() for that.        
> > > > 
> > > > I'm not a big fan of adding yet another field to the nand_chip struct.
> > > > Could we instead create a nand_scan_with_ids() function that takes an
> > > > extra ID table in argument and then make nand_scan() a wrapper around
> > > > this new function?
> > > > 
> > > > int nand_scan_with_ids(struct mtd_info *mtd, int max_chips,
> > > > 		       struct nand_flash_dev *ids);
> > > > 
> > > > static inline int nand_scan(struct mtd_info *mtd, int max_chips)
> > > > {
> > > > 	return nand_scan_with_ids(mtd, max_chips, NULL);
> > > > }      
> > > 
> > > Sure I can do that, but I found too impacting the fact that we should
> > > patch all the drivers to call nand_scan_with_ids() from your example.    
> > 
> > Nope we don't have to do that, see the nand_scan() wrapper proposed
> > above.  
> 
> Actually I was embarrassed by the 'static' keyword, I'll just drop
> it off.

It's "static inline" and that's because I was suggesting to define the
nand_scan() wrapper directly in rawnand.h instead of exporting a symbol
for a one line function.
