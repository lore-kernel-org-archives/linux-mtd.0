Subject: Re: [PATCH] mtd: nand: lpc32xx: fix invalid error handling of a
 requested irq
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard
 Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20161205014710.2015-1-vz@mleia.com>
References: <20161205014710.2015-1-vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Dec 2016 13:09:25 -0500
Message-ID: <1481134165.9248.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-12-05 at 03:47 +0200, Vladimir Zapolskiy wrote:
> Semantics of NR_IRQS is different on machines with SPARSE_IRQ option
> disabled or enabled, in the latter case IRQs are allocated starting
> at least from the value specified by NR_IRQS and going upwards, so
> the check of (irq >= NR_IRQ) to decide about an error code returned by
> platform_get_irq() is completely invalid, don't attempt to overrule
> irq subsystem in the driver.
> 
> The change fixes LPC32xx NAND MLC driver initialization on boot.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  drivers/mtd/nand/lpc32xx_mlc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
