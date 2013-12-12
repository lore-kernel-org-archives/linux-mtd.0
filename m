Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vr17w-0004Da-Cm
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 07:56:09 +0000
Received: by mail-pb0-f48.google.com with SMTP id md12so65045pbc.7
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 23:55:46 -0800 (PST)
Date: Thu, 12 Dec 2013 15:55:37 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2 07/10] drivers: mtd: m25p80: Adapt driver to support
 memory mapped read.
Message-ID: <20131212075536.GA1596@gmail.com>
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <1386339891-32717-8-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386339891-32717-8-git-send-email-sourav.poddar@ti.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 balbi@ti.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, bcousson@baylibre.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 06, 2013 at 07:54:48PM +0530, Sourav Poddar wrote:
> Adapt driver to do a memory mapped read.
> @@ -109,6 +109,7 @@ struct m25p {
>  	u8			program_opcode;
>  	u8			*command;
>  	enum read_type		flash_read;
> +	void __iomem *mem_addr;

I think we can remove this field.
You can use a local variable in the m25p80_read.

>  };
>  
>  static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> @@ -515,6 +516,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	size_t *retlen, u_char *buf)
>  {
>  	struct m25p *flash = mtd_to_m25p(mtd);
> +	struct spi_master *master = flash->spi->master;
>  	struct spi_transfer t[2];
>  	struct spi_message m;
>  	uint8_t opcode;
> @@ -523,6 +525,20 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
>  			__func__, (u32)from, len);
>  
> +	if (master->mmap) {
> +		mutex_lock(&flash->lock);
> +		/* Wait till previous write/erase is done. */
> +		if (wait_till_ready(flash)) {
> +			mutex_unlock(&flash->lock);
> +			return 1;
> +		}
> +		flash->mem_addr = master->get_buf(master);
> +		memcpy(buf, flash->mem_addr + from, len);
> +		master->put_buf(master);
> +		*retlen = len;
> +		goto out;
> +	}
> +
>  	spi_message_init(&m);
>  	memset(t, 0, (sizeof t));
>  
> @@ -558,6 +574,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  
>  	*retlen = m.actual_length - m25p_cmdsz(flash) - dummy;
>  
> +out:
>  	mutex_unlock(&flash->lock);
>  
>  	return 0;
> @@ -1286,6 +1303,9 @@ static int m25p_probe(struct spi_device *spi)
>  		flash->addr_width = 3;
>  	}
>  
> +	if (spi->master->configure_from_slave)
> +		m25p80_fill_flash_information(flash);
> +
You have add a configure_from_slave hook in the SPI, why you also need 
a same hook in the SPI-NOR framework?

And i think the enable_mmap/disable_mmap is not needed too.

All the three hooks are used to set the SPI bus controller.

And the SPI-NOR framework only handles the issues between the 
SPI bus controller and the SPI-NOR, or the SPI-NOR controller and the
SPI-NOR.

thanks
Huang Shijie
