Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEbVS-0001F1-Hh
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:07:15 +0000
Date: Sun, 19 Jun 2016 14:06:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: maxime.ripard@free-electrons.com, wens@csie.org, robh+dt@kernel.org,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] mtd: nand: sunxi: add reset line support
Message-ID: <20160619140652.07ab03c9@bbrezillon>
In-Reply-To: <20160619113739.30362-2-icenowy@aosc.xyz>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
 <20160619113739.30362-2-icenowy@aosc.xyz>
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

+Philipp

On Sun, 19 Jun 2016 19:37:39 +0800
Icenowy Zheng <icenowy@aosc.xyz> wrote:

> The NAND controller on some sun8i chips needs its reset line to be deasserted
> before they can enter working state. This commit added the reset line process
> to the driver.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index a83a690..1502748 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -39,6 +39,7 @@
>  #include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/reset.h>
>  
>  #define NFC_REG_CTL		0x0000
>  #define NFC_REG_ST		0x0004
> @@ -269,6 +270,7 @@ struct sunxi_nfc {
>  	void __iomem *regs;
>  	struct clk *ahb_clk;
>  	struct clk *mod_clk;
> +	struct reset_control *reset;
>  	unsigned long assigned_cs;
>  	unsigned long clk_rate;
>  	struct list_head chips;
> @@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_ahb_clk_unprepare;
>  
> +	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
> +	if (PTR_ERR(nfc->reset) == -EPROBE_DEFER)
> +		return PTR_ERR(nfc->reset);

Actually you should test for != -ENOENT, because all error codes except
this one should stop the ->probe().

BTW, this devm_reset_control_get_optional() is really weird. While most
_optional() methods return NULL when the element is not defined in the
DT, this one returns -ENOTENT, which makes it impossible to
differentiate a real error from a undefined reset line (which is a
valid case for _optional()).

Philipp, is there a good reason for doing that?

> +
> +	if (!IS_ERR(nfc->reset)) {
> +		ret = reset_control_deassert(nfc->reset);
> +		if (ret) {
> +			dev_err(dev, "reset err %d\n", ret);
> +			goto out_mod_clk_unprepare;
> +		}
> +	}
> +
