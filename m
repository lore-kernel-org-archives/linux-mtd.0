Subject: Re: [PATCH v2 3/3] ARM: dts: at91: sama5d2: use sama5d2 compatible
 string for SMC
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <lee.jones@linaro.org>,
 <alexandre.belloni@free-electrons.com>, <boris.brezillon@free-electrons.com>,
 <computersforpeace@gmail.com>, <romain.izard.pro@gmail.com>
References: <20170718132220.25018-1-ludovic.desroches@microchip.com>
 <20170718132220.25018-4-ludovic.desroches@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <c51be7a7-01c1-87e1-5ec9-54650021df7d@microchip.com>
Date: Tue, 18 Jul 2017 15:39:42 +0200
MIME-Version: 1.0
In-Reply-To: <20170718132220.25018-4-ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/07/2017 at 15:22, Ludovic Desroches wrote:
> A new compatible string has been introduced for sama5d2 SMC to allow to
> manage the registers mapping change.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>  arch/arm/boot/dts/sama5d2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> index cc06da394366..3e6e2dbc2595 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -1048,7 +1048,7 @@
>  			};
>  
>  			hsmc: hsmc@f8014000 {
> -				compatible = "atmel,sama5d3-smc", "syscon", "simple-mfd";
> +				compatible = "atmel,sama5d2-smc", "syscon", "simple-mfd";
>  				reg = <0xf8014000 0x1000>;
>  				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 6>;
>  				clocks = <&hsmc_clk>;
> 


-- 
Nicolas Ferre
