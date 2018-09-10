Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzMSX-0008DX-Rd
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 13:42:35 +0000
Date: Mon, 10 Sep 2018 15:42:19 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: partitions: fix of_node_get/put balance in parser
Message-ID: <20180910154219.30fddb7a@bbrezillon>
In-Reply-To: <20180910153831.0f426ada@xps13>
References: <20180907143554.13496-1-miquel.raynal@bootlin.com>
 <20180907163824.6cec1a43@xps13>
 <20180910145312.3b9ae4ad@bbrezillon>
 <20180910151423.2944aca6@xps13>
 <20180910152551.23ffa474@bbrezillon>
 <20180910153831.0f426ada@xps13>
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

On Mon, 10 Sep 2018 15:38:31 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep 2018
> 15:25:51 +0200:
> 
> > On Mon, 10 Sep 2018 15:14:23 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep 2018
> > > 14:53:12 +0200:
> > >     
> > > > Hi Miquel,
> > > > 
> > > > On Fri, 7 Sep 2018 16:38:24 +0200
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > >       
> > > > > Hello,
> > > > > 
> > > > > I forgot to add Rafal which I know worked a lot on the parsers.
> > > > > 
> > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri,  7 Sep 2018
> > > > > 16:35:54 +0200:
> > > > >         
> > > > > > While at first mtd_part_of_parse() would just call
> > > > > > of_get_chil_by_name(), it has been edited to first try to get the OF
> > > > > > node thanks to mtd_get_of_node() and fallback on
> > > > > > of_get_child_by_name().
> > > > > > 
> > > > > > A of_node_put() was a bit below in the code, to balance the
> > > > > > of_get_child_by_name(). However, despite its name, mtd_get_of_node()
> > > > > > does not take a reference on the OF node.        
> > > > 
> > > > That's probably something we should patch at some point, but that
> > > > implies patching all mtd_get_of_node() users at the same time, so let's
> > > > keep that for later.
> > > > 
> > > > BTW, if mtd_get_of_node() was actually retaining a reference, you
> > > > would miss an of_node_put() in the !mtd_is_partition(master) case.      
> > > 
> > > I think there is a misunderstanding here: mtd_get_of_node() is not
> > > retaining a reference, and I do not think it should! It is by design a
> > > helper to shortcut from the MTD device to the related FW node. Maybe
> > > calling it differently than "get" would be definitely less prone to
> > > errors. Maybe mtd_to_of_node() would be better?    
> > 
> > Yes, the name is misleading for sure. But consistency is good, and
> > (almost?) all DT helpers that return a device_node retain a reference
> > to this node before returning it, so I think it would be a good thing
> > to do the same in the MTD framework.  
> 
> Fine by me, I'll patch all the places where it's used, but you can
> still take this patch as a fix for now.
> 
> > 
> > Also, I'm not a big fan of the mtd_to_of_node() for this kind of
> > function. It seems to imply that the mtd device is inheriting from
> > device_node, which is not really the case, it's just an association
> > relationship.  
> 
> Ok
> 
> >   
> > >     
> > > >       
> > > > > > It is a simple helper hiding
> > > > > > some pointer logic to retrieve the OF node related to an MTD
> > > > > > device. People often used it this way:
> > > > > > 
> > > > > >     of_node_put(mtd_get_of_node(<mtd>)).        
> > > > 
> > > > I don't get your point. Are you saying other places in the code are
> > > > doing the wrong thing? Should we fix them too?      
> > > 
> > > No, other places are doing the right thing.    
> > 
> > Hm, okay. Then your example is not well chosen, because you seem to put
> > the return of mtd_get_of_node(<mtd>), which contradicts what you
> > explain in the previous sentence. I guess somewhere in the same path you
> > have an of_node_get(mtd_get_of_node(<mtd>)) which retains the reference
> > and explains why calling of_node_put(mtd_get_of_node(<mtd>)) is
> > required.
> > 
> > Maybe you can just drop this example.  
> 
> Mhhh. Maybe I should s/of_node_put/of_node_get/ in the example? I
> want to show why (currently) no of_node_put() is needed after a mtd_get_of_node().
> 
> This examples shows what people do with this helper, ie. calling
> of_node_get() on the returned OF node to actually retain a reference
> of the retrieve object.

Or you just say that mtd_get_of_node() does not retain a reference to
the device_node object it returns and that should be enough ;-).
