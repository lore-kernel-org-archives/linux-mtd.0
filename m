Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlHz6-0002QW-5u
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 12:43:20 +0000
Date: Tue, 26 Nov 2013 09:42:52 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Message-ID: <20131126124251.GB2344@localhost>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131125125647.GF2408@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
 <20131125145217.GA14485@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4ECB8@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA4ECB8@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "David Woodhouse \(dwmw2@infradead.org\)" <dwmw2@infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Tue, Nov 26, 2013 at 07:59:07AM +0000, Gupta, Pekon wrote:
> 
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> [...]
> > My point is: why don't we *remove* the devicetree property nand-bus-
> > width and 
> > 
> We cannot remove DT property like this, we can only deprecate its use,
> while not breaking the functionality, which is what I'm trying here..

Of course, by "remove" the property I meant make it meaningless in the
driver.

> > the NAND_BUSWIDTH_16 entirely, together with this patch?
> > 
> We need this Macros, as may driver use this after nand_scan_ident()
> to configure their custom callbacks like:
> 	if (chip->options & NAND_BUSWIDTH_16)
> 		chip->read_buf = omap_read_buf16;
> 	else 
> 		chip->read_buf = omap_read_buf8;
> 
> 
> > Sounds like the user shouldn't need to mess with any of these, since we
> > are able to auto-configure things for him.
> > 
> Yes, end-user is free.. But driver still needs to x16 and x8 information
> to do some controller level optimizations..
> 

Right. So, we should keep it but remove the effect on the initial
configuration. AFAICS, the bus width should be *reported* by the NAND
core and then each driver will have access to that information to set
any additional configuration.

On the other side, no driver should *advise* the bus width.

Right?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
