Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctckf-0007r6-9C
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 16:16:47 +0000
Date: Thu, 30 Mar 2017 18:16:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v3 26/37] mtd: nand: denali: fix bank reset function
Message-ID: <20170330181623.5b595827@bbrezillon>
In-Reply-To: <1490856383-31560-27-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-27-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 30 Mar 2017 15:46:12 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The function denali_nand_reset() is called during the driver probe,
> and polls the INTR__RST_COMP and INTR__TIME_OUT bits.  However,
> INTR__RST_COMP is set anyway even if no NAND device is connected to
> that bank.
> 
> This can be a problem for ONFi devices.  The nand_scan_ident()
> iterates over maxchips, and calls nand_reset() for each chip.

Actually, maxchips is a bad name. What should be passed in argument to
nand_scan_ident() is not the maximum number of CS-line the controller
has, it's the expected number of CS-lines provided by a chip.

If you're using DT, this information should be retrieved from the DT. If
you look at this binding doc [1] you'll see that each NAND chip has a
reg property encoding the CS line. When a chip exposes more than one
CS-line, the reg property should contain 2 entries describing which
controller-side CS lines are connected to the chip CS-lines.

For non-DT cases, this should be exposed by some other means (for
example pdata, but I'm not sure it works well with PCI where everything
is discoverable).

So normally, you shouldn't have a timeout, or something is wrong with
the DT/board description.

Note that you might have different NAND models connected to the same
NAND controller. If you call nand_scan_ident() only once and pass
controllers->max_cs_lines to it, you will only have one chip detected,
which is not what you expect.


> Now, this driver implements ->setup_data_interface() method, so
> nand_setup_data_interface() issues Set Features (0xEF) command to
> each chip.  This can cause time-out error since denali_nand_reset()
> did not check the chip existence.  If no chip there, the controller
> will wait long for R/B# response, which we know never happens.
> (The timeout error is correctly handled in this driver, so the
> driver will be successfully probed anyway, but it will take longer
> than needed.)
> 
> The Reset (0xFF) command also toggles the R/B# pin, and it sets
> INTR__INT_ACT bit.  The driver should check this bit to see if the
> chip has responded, then it can update denali->max_banks.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/denali.c | 52 +++++++++++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 86b7c75..e4f2699 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -85,33 +85,6 @@ static void index_addr(struct denali_nand_info *denali,
>  	iowrite32(data, denali->flash_mem + 0x10);
>  }
>  
> -/* Reset the flash controller */
> -static uint16_t denali_nand_reset(struct denali_nand_info *denali)
> -{
> -	int i;
> -
> -	for (i = 0; i < denali->max_banks; i++)
> -		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
> -		denali->flash_reg + INTR_STATUS(i));
> -
> -	for (i = 0; i < denali->max_banks; i++) {
> -		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
> -		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
> -			(INTR__RST_COMP | INTR__TIME_OUT)))
> -			cpu_relax();
> -		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
> -			INTR__TIME_OUT)
> -			dev_dbg(denali->dev,
> -			"NAND Reset operation timed out on bank %d\n", i);
> -	}
> -
> -	for (i = 0; i < denali->max_banks; i++)
> -		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
> -			  denali->flash_reg + INTR_STATUS(i));
> -
> -	return PASS;
> -}
> -
>  /*
>   * Use the configuration feature register to determine the maximum number of
>   * banks that the hardware supports.
> @@ -999,7 +972,28 @@ static int denali_setup_data_interface(struct mtd_info *mtd,
>  	return 0;
>  }
>  
> -/* Initialization code to bring the device up to a known good state */
> +static void denali_reset_banks(struct denali_nand_info *denali)
> +{
> +	int i;
> +
> +	denali_clear_irq_all(denali);
> +
> +	for (i = 0; i < denali->max_banks; i++) {
> +		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
> +		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
> +			(INTR__RST_COMP | INTR__TIME_OUT)))
> +			cpu_relax();
> +		if (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
> +		      INTR__INT_ACT))
> +			break;
> +	}
> +
> +	dev_dbg(denali->dev, "%d chips connected\n", i);
> +	denali->max_banks = i;
> +
> +	denali_clear_irq_all(denali);
> +}
> +
>  static void denali_hw_init(struct denali_nand_info *denali)
>  {
>  	/*
> @@ -1019,7 +1013,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
>  	denali->bbtskipbytes = ioread32(denali->flash_reg +
>  						SPARE_AREA_SKIP_BYTES);
>  	detect_max_banks(denali);
> -	denali_nand_reset(denali);
> +	denali_reset_banks(denali);
>  	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
>  	iowrite32(CHIP_EN_DONT_CARE__FLAG,
>  			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
