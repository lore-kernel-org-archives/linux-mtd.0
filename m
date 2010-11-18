Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ34E-0007qF-Li
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 11:54:19 +0000
Received: by eyd9 with SMTP id 9so1833651eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2010 03:54:17 -0800 (PST)
Message-ID: <4CE5137A.8060507@mvista.com>
Date: Thu, 18 Nov 2010 14:52:26 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH v2 2/2] davinci: Platform support for OMAP-L137/AM17x
	NOR flash driver
References: <1289548975-21296-1-git-send-email-savinay.dharmappa@ti.com>
In-Reply-To: <1289548975-21296-1-git-send-email-savinay.dharmappa@ti.com>
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

On 12-11-2010 11:02, Savinay Dharmappa wrote:

> From: Aleksey Makarov<amakarov@ru.mvista.com>

> Adds platform support for OMAP-L137/AM17x NOR flash driver.

> Also, configures chip select 3 to control NOR flash's upper
> address lines.

    Please add back my signoff, omitted in this version. Some of the code, 
including bug fixes, was authored by me.

> Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>

Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>

> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>

> diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
> index 1bb89d3..cd35198 100644
> --- a/arch/arm/mach-davinci/board-da830-evm.c
> +++ b/arch/arm/mach-davinci/board-da830-evm.c
[...]
> @@ -429,6 +431,221 @@ static inline void da830_evm_init_nand(int mux_mode)
>   static inline void da830_evm_init_nand(int mux_mode) { }
>   #endif
>
> +#ifdef CONFIG_DA830_UI_NOR
> +/*
> + * Number of Address line

    Only "lines".

> going to the NOR flash that are latched using
> + * AEMIF address lines  B_EMIF_BA0-B_EMIF_A12  on CS2.
> +#define NOR_WINDOW_SIZE_LOG2     15
> +#define NOR_WINDOW_SIZE         (1 << NOR_WINDOW_SIZE_LOG2)
> +
> +static struct {
> +	struct clk *clk;
> +	struct {
> +		struct resource *res;

    You're not using this field outside da830_evm_nor_init() now, so there's 
not much point in keeping it...

> +		void __iomem *addr;
> +	} latch, aemif;
> +} da830_evm_nor;

> +static void da830_evm_nor_set_window(unsigned long offset, void *data)
> +{
> +	/*
> +	 * CS2 and CS3 address lines are used to address NOR flash. Address
> +	 * line A0-A14 going to the NOR flash are latched using AEMIF address
> +	 * lines B_EMIF_BA0-B_EMIF_A12 on CS2.

    Are they really latched, and not just used live when the NOR chip is 
accessed? What's the point of latching them?

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

    No need to store it -- you don't use it afterwards.

> +	if (da830_evm_nor.aemif.res == NULL) {
> +		pr_err("%s: could not request AEMIF control region\n",
> +			__func__);
> +		goto err_clk;
> +	}

[...]

> +	/* Setup the window to access the latch */
> +	da830_evm_nor.latch.res =
> +		request_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE,
> +				   "DA830 UI NOR address latch");

    Same comment here...

> +	if (da830_evm_nor.latch.res == NULL) {
> +		pr_err("%s: could not request address latch region\n",
> +			__func__);
> +		goto err_aemif_ioremap;
> +	}

[...]

> +static inline void da830_evm_init_nor(int mux_mode)
> +{
> +	int ret;
> +
> +	if (HAS_MMC) {
> +		pr_warning("WARNING: both MMC/SD and NOR are "
> +				"enabled, but they share AEMIF pins.\n"
> +					"\tDisable MMC/SD for NOR support.\n");

    This line is over-indented.

WBR, Sergei
