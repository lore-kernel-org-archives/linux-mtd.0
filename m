Date: Fri, 29 Jun 2012 11:10:19 +0800
From: Dong Aisheng <aisheng.dong@freescale.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 2/3] ARM: imx6q: add DT node for gpmi nand
Message-ID: <20120629031018.GC5844@shlinux2.ap.freescale.net>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-2-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1340941925-14591-2-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 28, 2012 at 11:52:04PM -0400, Huang Shijie wrote:
> Add the DT node for gpmi nand.
> Add the pinmux support for gpmi nand.
> 
> The gpmi nand may conflicts with other modules, such as MMC.
> So we do not enable the gpmi nand for mx6q-arm2 board, just add the
> node for the board.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Just one minor suggestion, see below.
Otherwise,
Acked-by: Dong Aisheng <dong.aisheng@linaro.org>

Regards
Dong Aisheng

> ---
>  arch/arm/boot/dts/imx6q-arm2.dts |    6 ++++++
>  arch/arm/boot/dts/imx6q.dtsi     |   36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q-arm2.dts b/arch/arm/boot/dts/imx6q-arm2.dts
> index bdab44c..d93a2d9 100644
> --- a/arch/arm/boot/dts/imx6q-arm2.dts
> +++ b/arch/arm/boot/dts/imx6q-arm2.dts
> @@ -22,6 +22,12 @@
>  	};
>  
>  	soc {

> +		gpmi-nand@00112000 {
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_gpmi_nand_1>;
> +			status = "disabled";
It would be better if we add some comment for gpmi pin conflict here.
Easy for understand.

> +		};
> +
>  		aips-bus@02100000 { /* AIPS2 */
>  			ethernet@02188000 {
>  				phy-mode = "rgmii";

Regards
Dong Aisheng
