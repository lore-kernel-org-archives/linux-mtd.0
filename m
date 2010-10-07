Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3s3F-00056O-49
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 15:06:41 +0000
Received: by bwz2 with SMTP id 2so349204bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 08:06:20 -0700 (PDT)
Message-ID: <4CADE1B8.50800@mvista.com>
Date: Thu, 07 Oct 2010 19:05:28 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
References: <1286451272-12988-1-git-send-email-savinay.dharmappa@ti.com>
In-Reply-To: <1286451272-12988-1-git-send-email-savinay.dharmappa@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Aleksey Makarov <amakarov@ru.mvista.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, David Griego <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Savinay Dharmappa wrote:

> From: David Griego <dgriego@mvista.com>

    And that's after I have told you this code is not authored by David, but by 
Aleksey Makarov... :-(

> Adds platform support for OMAP-L137/AM17x NOR flash driver.

> Also, configures chip select 3 to control NOR flash's upper
> address lines.

> Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>

    Moreover, I'm seeing that you've done some incorrect changes to the 
previously correct code. NAK.

[...]

>  config MACH_DAVINCI_DA850_EVM
> diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
> index 1bb89d3..9f18efc 100644
> --- a/arch/arm/mach-davinci/board-da830-evm.c
> +++ b/arch/arm/mach-davinci/board-da830-evm.c
[...]
> @@ -429,6 +431,226 @@ static inline void da830_evm_init_nand(int mux_mode)
[...]
> +static void da830_evm_nor_done(void *data)
> +{
> +	clk_disable(da830_evm_nor.clk);
> +	clk_put(da830_evm_nor.clk);
> +	iounmap(da830_evm_nor.latch.addr);
> +	release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> +	iounmap(da830_evm_nor.aemif.addr);
> +	release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
> +}

    Why you've changed this function which was useful also for the error cleanup 
before?

> +static int da830_evm_nor_init(void *data, int cs)
> +{
> +	/* Turn on AEMIF clocks */
> +	da830_evm_nor.clk = clk_get(NULL, "aemif");
> +	if (IS_ERR(da830_evm_nor.clk)) {
> +		pr_err("%s: could not get AEMIF clock\n", __func__);
> +		da830_evm_nor.clk = NULL;
> +		return -ENODEV;
> +	}
> +	clk_enable(da830_evm_nor.clk);
> +
> +	da830_evm_nor.aemif.res = request_mem_region(DA8XX_AEMIF_CTL_BASE,
> +						     SZ_32K, "AEMIF control");
> +	if (da830_evm_nor.aemif.res == NULL) {
> +		pr_err("%s: could not request AEMIF control region\n",
> +			__func__);
> +		goto err_aemif_region;

    I wonder why you used goto's at all. Anyway, the error cleanup code is 
completely broken now.

> +	}
> +
> +	da830_evm_nor.aemif.addr = ioremap_nocache(DA8XX_AEMIF_CTL_BASE,
> +						   SZ_32K);
> +	if (da830_evm_nor.aemif.addr == NULL) {
> +		pr_err("%s: could not remap AEMIF control region\n", __func__);
> +		goto err_aemif_ioremap;
> +	}
> +
> +	/* Setup AEMIF -- timings, etc. */
> +
> +	/* Set maximum wait cycles */
> +	davinci_aemif_setup_timing(&da830_evm_norflash_timing,
> +						da830_evm_nor.aemif.addr, cs);
> +
> +	davinci_aemif_setup_timing(&da830_evm_norflash_timing,
> +					da830_evm_nor.aemif.addr, cs + 1);
> +
> +	/* Setup the window to access the latch */
> +	da830_evm_nor.latch.res =
> +		request_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE,
> +				   "DA830 UI NOR address latch");
> +	if (da830_evm_nor.latch.res == NULL) {
> +		pr_err("%s: could not request address latch region\n",
> +			__func__);
> +		goto err_latch_region;
> +	}
> +
> +	da830_evm_nor.latch.addr =
> +		ioremap_nocache(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> +	if (da830_evm_nor.latch.addr == NULL) {
> +		pr_err("%s: could not remap address latch region\n", __func__);
> +		goto err_latch_ioremap;
> +	}
> +	return 0;
> +
> +err_aemif_region:
> +	release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);

    Why release what you've just failed to request?!

> +	da830_evm_nor.aemif.res = NULL;

    Useless assignment.

> +	return -EBUSY;

    And you're not calling clk_disable().

> +err_aemif_ioremap:
> +	iounmap(da830_evm_nor.aemif.addr);

    Why unmap what you've just failed to map?! da830_evm_nor.aemif.addr is NULL.

> +	da830_evm_nor.aemif.addr = NULL;

    Useless assignment.

> +	return -ENOMEM;

    You're not calling release_mem_region() and clk_disable().

> +err_latch_region:
> +	release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);

    Why release what you've just failed to request?!

> +	da830_evm_nor.latch.res = NULL;

    Useless assginment.

> +	return -EBUSY;

    You're not calling iounmap() and release_mem_region() for the NOR flash 
region and also not calling clk_disable().

> +
> +err_latch_ioremap:
> +	iounmap(da830_evm_nor.latch.addr);

    Why unmap what you've just failed to map?! da830_evm_nor.latch.addr is NULL.

> +	da830_evm_nor.latch.addr = NULL;

    Useless assginment.

> +	return -ENOMEM;

    You're not release_mem_region() for the latch region, not calling iounmap() 
and release_mem_region() for the NOR flash region and also not calling 
clk_disable().

> +}
[...]

    Your changes made me doubt that you actually understood the code well enough 
before doing them...

WBR, Sergei
