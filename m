Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2frn-0006Cz-AT
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 08:26:04 +0000
Date: Thu, 24 Mar 2011 08:25:21 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: Hit BUG_ON in dma-mapping.c:425 (RFC)
Message-ID: <20110324082521.GB9844@n2100.arm.linux.org.uk>
References: <4D24A108.2080609@atmel.com> <4D8AFE45.8050609@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D8AFE45.8050609@atmel.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Hong XU <hong.xu@atmel.com>, dedekind1@gmail.com,
	Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 24, 2011 at 04:18:13PM +0800, Nicolas Ferre wrote:
> diff --git a/drivers/spi/atmel_spi.c b/drivers/spi/atmel_spi.c
> --- a/drivers/spi/atmel_spi.c
> +++ b/drivers/spi/atmel_spi.c
> @@ -647,6 +647,22 @@ static void atmel_spi_next_message(struct spi_master *master)
>  	atmel_spi_next_xfer(master, msg);
>  }
>  
> +static void *adjust_buffer_location(struct device *dev, void *buf)
> +{
> +	if (likely(buf < high_memory)) {
> +		return buf;
> +	} else {
> +		struct page *pg;
> +
> +		pg = vmalloc_to_page(buf);
> +		if (pg == 0) {
> +			dev_err(dev, "failed to vmalloc_to_page\n");
> +			return NULL;
> +		}
> +		return page_address(pg) + ((size_t)buf & ~PAGE_MASK);
> +	}
> +}
> +

This really doesn't fix the problem.  If the page is read or written via
the vmalloc mapping, you'll have stale data.

DMA to vmalloc areas is dodgy at best.
