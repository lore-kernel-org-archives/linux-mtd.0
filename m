Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iuA-0000aU-WB
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 15:17:40 +0000
Date: Wed, 3 Oct 2018 17:17:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>, open list
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 6/8] mtd: maps: gpio-addr-flash: Convert to gpiod
Message-ID: <20181003171727.145e7e41@bbrezillon>
In-Reply-To: <20181003171114.51ab47b8@bbrezillon>
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
 <20181001124351.31615-6-ricardo.ribalda@gmail.com>
 <20181003171114.51ab47b8@bbrezillon>
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

On Wed, 3 Oct 2018 17:11:14 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hi Ricardo,
> 
> On Mon,  1 Oct 2018 14:43:49 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> 
> > @@ -248,14 +252,19 @@ static int gpio_flash_probe(struct platform_device *pdev)
> >  
> >  	i = 0;
> >  	do {
> > -		if (devm_gpio_request(&pdev->dev, state->gpio_addrs[i],
> > -				      DRIVER_NAME)) {
> > +		unsigned int *gpio_id = (unsigned int *)gpios->start;
> > +
> > +		if (devm_gpio_request_one(&pdev->dev, gpio_id[i], GPIOD_OUT_LOW,
> > +					DRIVER_NAME)) {
> >  			dev_err(&pdev->dev, "failed to request gpio %d\n",
> > -				state->gpio_addrs[i]);
> > +				gpio_id[i]);
> >  			return -EBUSY;
> >  		}
> > -		gpio_direction_output(state->gpio_addrs[i], 0);
> > -	} while (++i < state->gpio_count);
> > +
> > +		state->gpios->desc[i] = gpio_to_desc(gpio_id[i]);
> > +		if (!state->gpios->desc[i])
> > +			return -EINVAL;
> > +	} while (++i < state->gpios->ndescs);  
> 
> Actually, I was thinking about using devm_gpiod_get_array() here and
> defining a gpio lookup table in the board file registering the device.
> This way, adding support for DT based parsing is transparent.

It's actually easier than I thought since no one is registering such a
device, so all you have to do is call devm_gpiod_get_array() and have a
struct gpio_descs pointer in struct async_state.
