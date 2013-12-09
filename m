Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq8DI-0002Jt-S0
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 21:18:02 +0000
Date: Mon, 9 Dec 2013 18:17:51 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: gpio: Remove unneeded CONFIG_OF
Message-ID: <20131209211750.GC31944@localhost>
References: <1386430609-2910-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131209203105.GU27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131209203105.GU27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Mon, Dec 09, 2013 at 12:31:05PM -0800, Brian Norris wrote:
> On Sat, Dec 07, 2013 at 12:36:49PM -0300, Ezequiel Garcia wrote:
> > Since the of_mtd header provides dummy stubs for !CONFIG_OF, it's safe
> > to remove the #ifdef CONFIG_OF. Also remove the of_match_ptr guard as
> > it's no longer required. Build tested only.
> > 
> > Cc: Alexander Shiyan <shc_work@mail.ru>
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 
> Just because we can compile with and without CONFIG_OF doesn't mean the
> behavior is equivalent now.
> 
> Take a look at gpio_nand_get_io_sync_of(): we allocate and throw away
> memory (it's only cleaned up at device removal time):
> 
> static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
> {
> 	struct resource *r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
> 	u64 addr;
> 
> 	if (!r || of_property_read_u64(pdev->dev.of_node,
> 				       "gpio-control-nand,io-sync-reg", &addr))
> 		return NULL;
> ...
> 
> But I guess this should be fixed anyway, to do this:
> 
> static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
> {
> 	struct resource *r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
> 	u64 addr;
> 
> 	if (of_property_read_u64(pdev->dev.of_node,
> 				 "gpio-control-nand,io-sync-reg", &addr))
> 		return NULL;
> 
> 	r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
> 	if (!r)
> 		return NULL; /* Probably should be PTR_ERR(-ENOMEM), with callee-error-checking */
> ...
> 
> I think we might as well fix this before forcing this quirk onto !OF
> builds.
> 

Ah, I missed that spot! Yes, I think you're right, so let's hold this one
until the above gets fixed.

By the way, has anyone actually *tried* this driver with !OF lately?
I guess I'm missing something but it seems to me it won't probe:

static inline int gpio_nand_get_config_of(const struct device *dev,
                                          struct gpio_nand_platdata *plat)
{
	return -ENOSYS;
}

static inline int gpio_nand_get_config(const struct device *dev,
                                       struct gpio_nand_platdata *plat)
{
	int ret = gpio_nand_get_config_of(dev, plat);
	if (!ret)
		return ret;
	[..]
}

static int gpio_nand_probe(struct platform_device *pdev)
{
	[..]
	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
	if (ret)
		return ret;
}
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
