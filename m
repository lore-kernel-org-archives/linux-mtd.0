Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpPv-0004Dm-TK
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 10:07:41 +0000
From: Marek Vasut <marex@denx.de>
To: grmoore@altera.com
Subject: Re: [PATCH] Add support for flag status register on Micron chips.
Date: Wed, 9 Apr 2014 12:06:45 +0200
References: <1396973570-13995-1-git-send-email-grmoore@altera.com>
 <1396973570-13995-2-git-send-email-grmoore@altera.com>
In-Reply-To: <1396973570-13995-2-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091206.45967.marex@denx.de>
Cc: ggrahammoore@gmail.com, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, April 08, 2014 at 06:12:50 PM, grmoore@altera.com wrote:
> From: Graham Moore <grmoore@altera.com>
> 
> Some new Micron flash chips require reading the flag
> status register to determine when operations have completed.
> 
> Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> require reading the status register before reading the flag status
> register.
> 
> This patch adds support for the flag status register in the n25q512a1 and
> n25q00 Micron QSPI flash chips.

[...]

> +static int read_fsr(struct m25p *flash)
> +{
> +	ssize_t retval;
> +	u8 code = OPCODE_RDFSR;
> +	u8 val;
> +
> +	retval = spi_write_then_read(flash->spi, &code, 1, &val, 1);
> +
> +	if (retval < 0) {
> +		dev_err(&flash->spi->dev, "error %d reading FSR\n",
> +				(int) retval);

Is the type-cast really needed here? Why ?

> +		return retval;
> +	}
> +
> +	return val;
> +}
> +/*
>   * Read configuration register, returning its value in the
>   * location. Return the configuration register value.
>   * Returns negative if error occured.
> @@ -233,7 +259,7 @@ static inline int set_4byte(struct m25p *flash, u32
> jedec_id, int enable) * Service routine to read status register until
> ready, or timeout occurs. * Returns non-zero if error.
>   */
> -static int wait_till_ready(struct m25p *flash)
> +static int _wait_till_ready(struct m25p *flash)

Please avoid using function names that start with underscore .
[...]

Thanks!

Best regards,
Marek Vasut
