Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7kX4-0003UU-4K
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 17:01:54 +0000
Date: Wed, 3 Oct 2018 19:01:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 8/8] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
Message-ID: <20181003190130.4c9e509f@bbrezillon>
In-Reply-To: <20181001124351.31615-8-ricardo.ribalda@gmail.com>
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
 <20181001124351.31615-8-ricardo.ribalda@gmail.com>
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

On Mon,  1 Oct 2018 14:43:51 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> +static int gpio_flash_probe_gpios(struct platform_device *pdev,
> +				  struct async_state *state)
> +{
> +	struct physmap_flash_data *pdata;
> +	struct device_node *dn;
> +	struct resource *gpios = NULL;
> +	int i;
> +
> +	dn = pdev->dev.of_node;
> +	if (dn) {
> +		state->gpios = devm_gpiod_get_array(&pdev->dev, NULL,
> +						    GPIOD_OUT_LOW);

Did you consider using gpiod_set_array_value() to update the gpio vals
instead of having your own update loop (the for loop in the
gf_set_gpios() func)?
