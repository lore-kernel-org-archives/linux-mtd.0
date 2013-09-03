Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGoEd-0003iK-2l
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2013 10:53:24 +0000
Date: Tue, 3 Sep 2013 07:53:14 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] of_mtd: Add no-op stubs to support CONFIG_OF=n
Message-ID: <20130903105313.GA2355@localhost>
References: <1378175873-2763-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130903053642.GA364@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130903053642.GA364@norris.computersforpeace.net>
Cc: devicetree@vger.kernel.org, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 02, 2013 at 10:36:58PM -0700, Brian Norris wrote:
> On Mon, Sep 02, 2013 at 11:37:53PM -0300, Ezequiel Garcia wrote:
> > Just like the rest of the subsystems, let's add the required no-op
> > functions to implement stubs when CONFIG_OF=n.
> > 
> > This prevents MTD drivers from having ugly ifdefs in their code,
> > and instead hide the ifdef monster in the header closet (far away
> > from people's sight).
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  include/linux/of_mtd.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> > index ed7f267..66f173e 100644
> > --- a/include/linux/of_mtd.h
> > +++ b/include/linux/of_mtd.h
> > @@ -14,6 +14,21 @@
> >  int of_get_nand_ecc_mode(struct device_node *np);
> >  int of_get_nand_bus_width(struct device_node *np);
> >  bool of_get_nand_on_flash_bbt(struct device_node *np);
> > +#else
> 
> I would include an extra line on either side of #else.
> 
> > +static inline int of_get_nand_ecc_mode(struct device_node *np)
> > +{
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline int of_get_nand_bus_width(struct device_node *np)
> > +{
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline bool of_get_nand_on_flash_bbt(struct device_node *np)
> > +{
> > +	return false;
> > +}
> >  #endif
> 
> Although we are "hiding" the #ifdef's here in the header, we can still
> help to make them extra clear; I think the typical style is to include
> /* CONFIG_OF_MTD */ markers to show which #ifdef/#else/#endif block it
> belongs to.
> 

Right, forgot about those markers!

> >  
> >  #endif /* __LINUX_OF_MTD_H */
> 
> With this trivial changes, I amended your patch and pushed to
> l2-mtd.git. Thanks! I look forward to the following patches to remove
> some of the driver #ifdef's.
> 

Great, thanks for fixing it!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
