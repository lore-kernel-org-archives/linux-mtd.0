Subject: Re: [PATCH] mtd: m25p80: make command buffer DMA-safe
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johannes Stezenbach <js@sig21.net>
In-Reply-To: <20091028132137.GA17813@sig21.net>
References: <20091028132137.GA17813@sig21.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 08:36:05 +0200
Message-Id: <1257230165.21596.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	David Brownell <dbrownell@users.sourceforge.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-28 at 14:21 +0100, Johannes Stezenbach wrote:
> spi_write() requires the buffer to be DMA-safe, kmalloc()
> it seperately to ensure this.
> 
> Signed-off-by: Johannes Stezenbach <js@sig21.net>
> 
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 4c19269..21dd4d9 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -79,7 +79,7 @@ struct m25p {
>  	struct mtd_info		mtd;
>  	unsigned		partitioned:1;
>  	u8			erase_opcode;
> -	u8			command[CMD_SIZE + FAST_READ_DUMMY_BYTE];
> +	u8			*command;
>  };
>  
>  static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> @@ -770,6 +770,11 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  	flash = kzalloc(sizeof *flash, GFP_KERNEL);
>  	if (!flash)
>  		return -ENOMEM;
> +	flash->command = kmalloc(CMD_SIZE + FAST_READ_DUMMY_BYTE, GFP_KERNEL);
> +	if (!flash->command) {
> +		kfree(flash);
> +		return -ENOMEM;
> +	}

Even though it is just 4 or 5 bytes it can do DMA? Does not sound too
sane to use DMA in that case. Does this patch fix a real error?

I do not know much about SPI, but for me it sounds like there should be
a method to ask SPI to avoid using DMA, and you should use that method.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
