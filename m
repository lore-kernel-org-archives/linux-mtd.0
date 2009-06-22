Date: Mon, 22 Jun 2009 07:14:57 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Ryan Mallon <ryan@bluewatersys.com>
Subject: Re: [spi-devel-general] [PATCH] SST25L (non JEDEC) SPI Flash driver
Message-ID: <20090622041457.GC6027@tarshish>
References: <4A3F017B.2010409@bluewatersys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A3F017B.2010409@bluewatersys.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux kernel <linux-kernel@vger.kernel.org>,
	mike@steroidmicros.com, spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ryan,

On Mon, Jun 22, 2009 at 03:58:51PM +1200, Ryan Mallon wrote:
> +static int sst25l_erase_block(struct sst25l_flash *flash, u32 offset)
> +{
> +	u8 command[4];
> +	int err;
> +
> +	err = sst25l_write_enable(flash, 1);

Is this enable/disable strictly required for each write/erase? Can't we just 
enable write once?

> +	if (err)
> +		return err;
> +
> +	command[0] = SST25L_CMD_BLOCK_ERASE;
> +	command[1] = offset >> 16;
> +	command[2] = offset >> 8;
> +	command[3] = offset;
> +	err = spi_write(flash->spi, command, 4);
> +	if (err)
> +		return err;
> +
> +	err = sst25l_wait_till_ready(flash);
> +	if (err)
> +		return err;
> +
> +	return sst25l_write_enable(flash, 0);
> +}

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
