From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/3] MTD : add helper functions library and header
	files for GPMI NAND driver
Date: Fri, 26 Aug 2011 17:15:17 +0200
References: <1314171204-25458-1-git-send-email-b32955@freescale.com>
	<1314171204-25458-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1314171204-25458-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201108261715.17398.marek.vasut@gmail.com>
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, w.sang@pengutronix.de,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, shijie8@gmail.com, s.hauer@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, August 24, 2011 09:33:23 AM Huang Shijie wrote:
> bch-regs.h : registers file for BCH module
> gpmi-regs.h: registers file for GPMI module
> gpmi-lib.c: helper functions library.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

[...]

> +/* Returns the Ready/Busy status of the given chip. */
> +int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
> +{
> +	struct resources *r = &this->resources;
> +	uint32_t mask;
> +	uint32_t reg;
> +
> +	if (GPMI_IS_MX23(this)) {
> +		mask = MX23_BM_GPMI_DEBUG_READY0 << chip;
> +		reg = readl(r->gpmi_regs + HW_GPMI_DEBUG);
> +	} else if (GPMI_IS_MX28(this)) {
> +		mask = MX28_BF_GPMI_STAT_READY_BUSY(1 << chip);
> +		reg = readl(r->gpmi_regs + HW_GPMI_STAT);
> +	} else
> +		BUG();
> +	return !!(reg & mask);

Maybe you don't need that double negation here ?

> +}

[...]

> +#define HW_GPMI_TIMING1					0x00000080
> +#define HW_GPMI_TIMING2					0x00000090
> +#define HW_GPMI_DATA					0x000000a0
> +/*============================ MX28 uses this to detect READY
> ==============*/ +#define HW_GPMI_STAT					0x000000b0
> +#define MX28_BP_GPMI_STAT_READY_BUSY			24
> +#define MX28_BM_GPMI_STAT_READY_BUSY	(0xff <<
> MX28_BP_GPMI_STAT_READY_BUSY) +#define MX28_BF_GPMI_STAT_READY_BUSY(v)		
\
> +	(((v) << MX28_BP_GPMI_STAT_READY_BUSY) & MX28_BM_GPMI_STAT_READY_BUSY)
> +/*============================ MX23 uses this to detect READY
> ==============*/ +#define HW_GPMI_DEBUG					0x000000c0
> +#define MX23_BP_GPMI_DEBUG_READY0			28
> +#define MX23_BM_GPMI_DEBUG_READY0	(1 << MX23_BP_GPMI_DEBUG_READY0)
> +#endif

Maybe remove those "==========" above.

Minor things,

Acked-by: Marek Vasut <marek.vasut@gmail.com>
