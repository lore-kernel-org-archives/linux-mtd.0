MIME-Version: 1.0
In-Reply-To: <0df42247c3348e7f6aed945e5669cec87f96f7ac.1476951078.git-series.maxime.ripard@free-electrons.com>
References: <cover.bb1e4a568bc16ada5254cad063f4afbaa1ca5906.1476951078.git-series.maxime.ripard@free-electrons.com>
 <0df42247c3348e7f6aed945e5669cec87f96f7ac.1476951078.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 20 Oct 2016 22:10:03 +0800
Message-ID: <CAGb2v66w0sTzn_SWH4rrpWKOosSxALV8ot3CBQbGhwLxvX1vxw@mail.gmail.com>
Subject: Re: [PATCH 5/8] ARM: gr8: Add missing pwm channel 1 pin
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 20, 2016 at 4:12 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The PWM controller has two different channels, but only the first pin was
> exposed in the DTSI. Add the other one.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  arch/arm/boot/dts/ntc-gr8.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8.dtsi
> index 74aff795e723..fad7381630f3 100644
> --- a/arch/arm/boot/dts/ntc-gr8.dtsi
> +++ b/arch/arm/boot/dts/ntc-gr8.dtsi
> @@ -854,6 +854,13 @@
>                                 allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>                         };
>
> +                       pwm1_pins_a: pwm1@0 {

Nit: really don't need "_a" and "@0" here.

> +                               allwinner,pins = "PG13";
> +                               allwinner,function = "pwm1";
> +                               allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +                               allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +                       };
> +
>                         spdif_tx_pins_a: spdif@0 {
>                                 allwinner,pins = "PB10";
>                                 allwinner,function = "spdif";
> --
> git-series 0.8.10
