Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq8YG-0002wJ-Ss
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 21:39:41 +0000
Date: Mon, 9 Dec 2013 18:39:31 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: gpio: Remove unneeded CONFIG_OF
Message-ID: <20131209213930.GE31944@localhost>
References: <1386430609-2910-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131209203105.GU27149@ld-irv-0074.broadcom.com>
 <20131209211750.GC31944@localhost>
 <20131209212236.GW27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131209212236.GW27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 01:22:36PM -0800, Brian Norris wrote:
> On Mon, Dec 09, 2013 at 06:17:51PM -0300, Ezequiel Garcia wrote:
> > By the way, has anyone actually *tried* this driver with !OF lately?
> > I guess I'm missing something but it seems to me it won't probe:
> > 
> > static inline int gpio_nand_get_config_of(const struct device *dev,
> >                                           struct gpio_nand_platdata *plat)
> > {
> > 	return -ENOSYS;
> > }
> > 
> > static inline int gpio_nand_get_config(const struct device *dev,
> >                                        struct gpio_nand_platdata *plat)
> > {
> > 	int ret = gpio_nand_get_config_of(dev, plat);
> > 	if (!ret)
> 
> ^^^ if (! (-ENOSYS)) ====> if (0)
> 

Ah.. yes...

> > 		return ret;
> > 	[..]
> > }
> > 
> > static int gpio_nand_probe(struct platform_device *pdev)
> > {
> > 	[..]
> > 	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
> > 	if (ret)
> > 		return ret;
> [..]
> > }
> 
> Looks OK to me, but I haven't tested it. What do you see? Perhaps you
> were incorrectly reading the line I pointed to?
> 

I knew I was missing something! Yes, that line confused me.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
