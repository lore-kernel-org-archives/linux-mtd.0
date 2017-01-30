Received: from mail-io0-f174.google.com ([209.85.223.174])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY8bl-0004rJ-S4
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 09:50:47 +0000
Received: by mail-io0-f174.google.com with SMTP id v96so6981290ioi.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jan 2017 01:50:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1485534846-28111-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1485534846-28111-1-git-send-email-boris.brezillon@free-electrons.com>
 <1485534846-28111-2-git-send-email-boris.brezillon@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jan 2017 10:49:23 +0100
Message-ID: <CACRpkdYsE_3twu6ZxTUD2A=YddU-Lq+0L+g12p7Ws99Aqjz97g@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: Add the devm_get_index_gpiod_from_child() helper
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Courbot <gnurou@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 27, 2017 at 5:34 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> devm_get_gpiod_from_child() currently allows GPIO users to request a GPIO
> that is defined in a child fwnode instead of directly in the device
> fwnode. Extend this API by adding the devm_get_index_gpiod_from_child()
> helpers which does the same except you can also specify an index in case
> the 'xx-gpios' property describe several GPIOs.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Cc Russell who faced this problem in the mvebu PCI driver (IIRC).

(...)

> +struct gpio_desc *devm_get_index_gpiod_from_child(struct device *dev,
> +                                                 const char *con_id,
> +                                                 int index,
> +                                                 struct fwnode_handle *child)
>  {
>         static const char * const suffixes[] = { "gpios", "gpio" };
>         char prop_name[32]; /* 32 is max size of property name */
> @@ -154,7 +157,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>                         snprintf(prop_name, sizeof(prop_name), "%s",
>                                                                suffixes[i]);
>
> -               desc = fwnode_get_named_gpiod(child, prop_name);
> +               desc = fwnode_get_named_gpiod(child, prop_name, index);
>                 if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
>                         break;
>         }
> @@ -168,6 +171,23 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>
>         return desc;
>  }
> +EXPORT_SYMBOL(devm_get_index_gpiod_from_child);

Rename this devm_fwnode_get_index_gpiod_from_child()
so that it fits the namespace of the other fwnode functions.

> + * devm_get_gpiod_from_child - get a GPIO descriptor from a device's child node
> + * @dev:       GPIO consumer
> + * @con_id:    function within the GPIO consumer
> + * @child:     firmware node (child of @dev)
> + *
> + * GPIO descriptors returned from this function are automatically disposed on
> + * driver detach.
> + */
> +struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
> +                                           const char *con_id,
> +                                           struct fwnode_handle *child)
> +{
> +       return devm_get_index_gpiod_from_child(dev, con_id, 0, child);
> +}

Take the opportunity to rename this devm_fwnode_get_gpiod_from_child()
as well.

I don't remember exactly why this wasn't added earlier, there was some
problem with referencing nodes that do not have devices.

Yours,
Linus Walleij
