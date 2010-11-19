Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJPOA-0005iQ-8G
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2010 11:44:23 +0000
Received: by ewy19 with SMTP id 19so2560389ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Nov 2010 03:44:19 -0800 (PST)
Message-ID: <4CE662A4.6060204@mvista.com>
Date: Fri, 19 Nov 2010 14:42:28 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH v3 2/2] davinci: Platform support for OMAP-L137/AM17x
	NOR flash driver
References: <1290160488-10344-1-git-send-email-savinay.dharmappa@ti.com>
In-Reply-To: <1290160488-10344-1-git-send-email-savinay.dharmappa@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Aleksey Makarov <amakarov@ru.mvista.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 19-11-2010 12:54, Savinay Dharmappa wrote:

> From: Aleksey Makarov <amakarov@ru.mvista.com>

> Adds platform support for OMAP-L137/AM17x NOR flash driver.

> Also, configures chip select 3 to control NOR flash's upper
> address lines.

> Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>
[...]

> diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
> index b52a3a1..c807c1b 100644
> --- a/arch/arm/mach-davinci/board-da830-evm.c
> +++ b/arch/arm/mach-davinci/board-da830-evm.c
> @@ -20,6 +20,8 @@
>   #include<linux/i2c/at24.h>
>   #include<linux/mtd/mtd.h>
>   #include<linux/mtd/partitions.h>
> +#include<linux/mtd/latch-addr-flash.h>
> +#include<linux/clk.h>
>
>   #include<asm/mach-types.h>
>   #include<asm/mach/arch.h>
> @@ -429,6 +431,220 @@ static inline void da830_evm_init_nand(int mux_mode)
>   static inline void da830_evm_init_nand(int mux_mode) { }
>   #endif
>
> +#ifdef CONFIG_DA830_UI_NOR
> +/*
> + * Number of lines going to the NOR flash that are latched using
> + * AEMIF address lines B_EMIF_BA0-B_EMIF_A12 on CS2.

    You still left the words about latching the low address bytes...

> + */
> +#define NOR_WINDOW_SIZE_LOG2     15
> +#define NOR_WINDOW_SIZE         (1<<  NOR_WINDOW_SIZE_LOG2)
> +
> +static struct {
> +	struct clk *clk;
> +	struct {
> +		void __iomem *addr;
> +	} latch, aemif;

    Don't need a structure here anymore.

> +static void da830_evm_nor_set_window(unsigned long offset, void *data)
> +{
> +	/*
> +	 * CS2 and CS3 address lines are used to address NOR flash. Address
> +	 * line

    Only "lines".

> A0-A14 going to

    Rather "from"...

> the NOR flash are connected to AEMIF address
> +	 * lines B_EMIF_BA0-B_EMIF_A12 on CS2. Address lines A15-A23 of the
> +	 * NOR flash are connected to AEMIF address lines B_EMIF_A0-B_EMIF_A6
> +	 * on CS3.

    They are not connected but latched from B_EMIF_A0-B_EMIF_A6 on CS3.

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
> +	res = request_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE,
> +				"DA830 UI NOR address latch");
> +	if (res == NULL) {
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
> +
> +err_aemif_ioremap:
> +	iounmap(da830_evm_nor.aemif.addr);
> +
> +err_aemif_region:
> +	release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
> +
> +err_clk:
> +	clk_disable(da830_evm_nor.clk);
> +	clk_put(da830_evm_nor.clk);
> +
> +	return -EBUSY;

    You should return -ENOMEM for ioremap() failures...

WBR, Sergei
