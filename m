Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq8ID-0002Y4-Ht
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 21:23:06 +0000
Received: by mail-ie0-f170.google.com with SMTP id qd12so7263465ieb.29
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 13:22:42 -0800 (PST)
Date: Mon, 9 Dec 2013 13:22:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2] mtd: nand: gpio: Remove unneeded CONFIG_OF
Message-ID: <20131209212236.GW27149@ld-irv-0074.broadcom.com>
References: <1386430609-2910-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131209203105.GU27149@ld-irv-0074.broadcom.com>
 <20131209211750.GC31944@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131209211750.GC31944@localhost>
Cc: linux-mtd@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 06:17:51PM -0300, Ezequiel Garcia wrote:
> By the way, has anyone actually *tried* this driver with !OF lately?
> I guess I'm missing something but it seems to me it won't probe:
> 
> static inline int gpio_nand_get_config_of(const struct device *dev,
>                                           struct gpio_nand_platdata *plat)
> {
> 	return -ENOSYS;
> }
> 
> static inline int gpio_nand_get_config(const struct device *dev,
>                                        struct gpio_nand_platdata *plat)
> {
> 	int ret = gpio_nand_get_config_of(dev, plat);
> 	if (!ret)

^^^ if (! (-ENOSYS)) ====> if (0)

> 		return ret;
> 	[..]
> }
> 
> static int gpio_nand_probe(struct platform_device *pdev)
> {
> 	[..]
> 	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
> 	if (ret)
> 		return ret;
[..]
> }

Looks OK to me, but I haven't tested it. What do you see? Perhaps you
were incorrectly reading the line I pointed to?

Brian
