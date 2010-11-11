Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGbhv-0002FR-8f
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2010 18:17:13 +0000
Received: by ewy19 with SMTP id 19so1266794ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Nov 2010 10:17:09 -0800 (PST)
Message-ID: <4CDC32D1.9030508@mvista.com>
Date: Thu, 11 Nov 2010 21:15:45 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
References: <1289462257-7109-1-git-send-email-savinay.dharmappa@ti.com>
In-Reply-To: <1289462257-7109-1-git-send-email-savinay.dharmappa@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: sshtylyov@ru.mvista.com, Aleksey Makarov <amakarov@ru.mvista.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, dgriego@mvista.com
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

> From: Aleksey Makarov <amakarov@ru.mvista.com>

> Adds platform support for OMAP-L137/AM17x NOR flash driver.

> Also, configures chip select 3 to control NOR flash's upper
> address lines.

> Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>
> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>

    It's not clear why you've dropped my signoff...

>  config MACH_DAVINCI_DA850_EVM
> diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
> index 1bb89d3..c8a5d4b 100644
> --- a/arch/arm/mach-davinci/board-da830-evm.c
> +++ b/arch/arm/mach-davinci/board-da830-evm.c
[...]
> +static void da830_evm_nor_set_window(unsigned long offset, void *data)
> +{
> +	/*
> +	 * CS2 and CS3 address lines are used to address nor flash. Address

    NOR. Please be consistent.

> +	 * line A0-A14 going to the NOR flash are latched using AEMIF address
> +	 * lines B_EMIF_BA0-B_EMIF_A12 on CS2. Address lines A15-A23 of the
> +	 * NOR flash are latched using AEMIF address lines B_EMIF_A0-B_EMIF_A6
> +	 * on CS3. The offset argument received by this function is the offset
> +	 * within NOR flash. Upper address is obtained  by shifting the offset
> +	 * by the number of CS2 address lines used (13) and masking it with
> +	 * complement of 3 (2 address lines used to address banks) and adding
> +	 * the resultant offset value to CS3 base address. Writing a zero to

    Writing anything, not just zero, I guess...

> +	 * this address will latch the upper address lines.
> +	 */
> +	writeb(0, da830_evm_nor.latch.addr +
> +		(~3UL & (offset >> (NOR_WINDOW_SIZE_LOG2 - 2))));
> +}

[...]

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
> +		goto err_clk;
> +	}
> +
> +	da830_evm_nor.aemif.addr = ioremap_nocache(DA8XX_AEMIF_CTL_BASE,
> +						   SZ_32K);
> +	if (da830_evm_nor.aemif.addr == NULL) {
> +		pr_err("%s: could not remap AEMIF control region\n", __func__);
> +		goto err_aemif_region;
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
> +		goto err_aemif_ioremap;
> +	}
> +
> +	da830_evm_nor.latch.addr =
> +		ioremap_nocache(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> +	if (da830_evm_nor.latch.addr == NULL) {
> +		pr_err("%s: could not remap address latch region\n", __func__);
> +		goto err_latch_region;
> +	}
> +	return 0;
> +
> +err_latch_region:
> +	release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> +	da830_evm_nor.latch.res = NULL;

   This assignment is pointless.

> +err_aemif_ioremap:
> +	iounmap(da830_evm_nor.aemif.addr);
> +	da830_evm_nor.aemif.addr = NULL;

    This one likewise...

> +err_aemif_region:
> +	release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
> +	da830_evm_nor.aemif.res = NULL;

    And this one too...

> +err_clk:
> +	clk_disable(da830_evm_nor.clk);
> +	clk_put(da830_evm_nor.clk);
> +	da830_evm_nor.clk  = NULL;

    This one as well...

> +static inline void da830_evm_init_nor(int mux_mode)
> +{
> +	int ret;
> +
> +	if (HAS_MMC) {
> +		pr_warning("WARNING: both MMC/SD and NOR are "
> +				"enabled, but they share AEMIF pins.\n"
> +					"\tDisable MMC/SD for NOR support.\n");
> +		return;
> +	}
> +
> +	ret = davinci_cfg_reg_list(da830_evm_emif25_pins);
> +	if (ret)
> +		pr_warning("da830_evm_init: emif25 mux setup failed: %d\n",

   It's called EMIF 2.5, not "emif25".

WBR, Sergei
