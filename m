Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN79A-0001Te-DX
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 22:59:08 +0000
Received: by mail-pf0-x229.google.com with SMTP id 65so61368887pff.2
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 14:58:47 -0800 (PST)
Date: Sat, 23 Jan 2016 14:58:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v8 5/7] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Message-ID: <20160123225842.GI24744@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-6-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449096466-18064-6-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 04:47:44PM -0600, Han Xu wrote:
> support GPMI NAND on i.MX7D
> 
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 14 +++++++-------
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 10 ++++++----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++++++-----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  7 +++++--
>  4 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> index 05bb91f..53e58bc 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h

...

> @@ -575,6 +581,10 @@ static char *extra_clks_for_mx6q[GPMI_CLK_MAX] = {
>  	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
>  };
>  
> +static char *extra_clks_for_mx7d[GPMI_CLK_MAX] = {
> +	"gpmi_bch_apb",
> +};
> +
>  static int gpmi_get_clks(struct gpmi_nand_data *this)
>  {
>  	struct resources *r = &this->resources;
> @@ -592,6 +602,8 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>  	/* Get extra clocks */
>  	if (GPMI_IS_MX6(this))
>  		extra_clks = extra_clks_for_mx6q;
> +	if (GPMI_IS_MX7(this))
> +		extra_clks = extra_clks_for_mx7d;
>  	if (!extra_clks)
>  		return 0;
>  

...

It looks like these clock names were never documented. Shouldn't this be
part of Documentation/devicetree/bindings/mtd/gpmi-nand.txt?

Otherwise, the patch looks good to me.

Brian
