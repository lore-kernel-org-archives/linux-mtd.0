Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8C03-0006gu-76
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 22:21:41 +0000
Date: Fri, 5 Oct 2018 00:21:25 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 10/10] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
Message-ID: <20181005002125.12fd229f@bbrezillon>
In-Reply-To: <20181004142942.11887-2-ricardo.ribalda@gmail.com>
References: <20181004142942.11887-1-ricardo.ribalda@gmail.com>
 <20181004142942.11887-2-ricardo.ribalda@gmail.com>
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

Hi Ricardo,

On Thu,  4 Oct 2018 16:29:42 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Allow creating gpio-addr-flash via device-tree and not just via platform
> data.
> 
> Mimic what physmap_of_versatile and physmap_of_gemini does to reduce
> code duplicity.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/maps/Kconfig           |  8 +++
>  drivers/mtd/maps/Makefile          |  3 +-
>  drivers/mtd/maps/gpio-addr-flash.c | 95 +++++++++++++++++++-----------
>  drivers/mtd/maps/gpio-addr-flash.h | 34 +++++++++++
>  drivers/mtd/maps/physmap_of_core.c |  5 ++
>  drivers/mtd/maps/physmap_of_gpio.c | 21 +++++++
>  6 files changed, 129 insertions(+), 37 deletions(-)
>  create mode 100644 drivers/mtd/maps/gpio-addr-flash.h
>  create mode 100644 drivers/mtd/maps/physmap_of_gpio.c
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index afb36bff13a7..427143d42168 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -94,6 +94,14 @@ config MTD_PHYSMAP_OF_GEMINI
>  	  platforms, some detection and setting up parallel mode on the
>  	  external interface.
>  
> +config MTD_PHYSMAP_OF_GPIO
> +	bool "GPIO-assisted OF-based physical memory map handling"
> +	depends on MTD_PHYSMAP_OF
> +	depends on MTD_GPIO_ADDR
> +	help
> +	  This provides some extra DT physmap parsing for flashes that are
> +	  partially physically addressed and assisted by GPIOs.
> +

Hm, so now we have the physmap_of driver which uses a function exposed
by the gpio-addr-flash module, but this module is also declaring a
platform_driver. It's probably working fine, but it's hard to follow.

So, I decided to give it a try and started to rework a bit the physmap,
physmap_of and gpio-addr-flash drivers. Here is the result [1] (it's
only been compile tested). With this rework we now have a single
driver which supports DT and !DT init and can also use GPIOs to
extend the physical memory range in case it's not large enough to
address the whole memory dev.

Let me know what you think of this approach.

Regards,

Boris

[1]https://github.com/bbrezillon/linux-0day/commits/mtd/physmap-cleanup
