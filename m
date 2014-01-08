Received: from 16.mo3.mail-out.ovh.net ([188.165.56.217]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0v5u-0000j7-2w
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 15:30:58 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 9D04BFF9FE0
 for <linux-mtd@lists.infradead.org>; Wed,  8 Jan 2014 16:30:37 +0100 (CET)
Message-ID: <52CD6EFC.9050303@overkiz.com>
Date: Wed, 08 Jan 2014 16:30:04 +0100
From: boris brezillon <b.brezillon@overkiz.com>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC PATCH 9/9] ARM: sunxi/dt: enable NAND on cubietruck board
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389194891-26771-1-git-send-email-b.brezillon@overkiz.com>
In-Reply-To: <1389194891-26771-1-git-send-email-b.brezillon@overkiz.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/01/2014 16:28, Boris BREZILLON wrote:
> Enable the NFC and describe the NAND flash connected to this controller.
>
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> ---
>   arch/arm/boot/dts/sun7i-a20-cubietruck.dts |   33 ++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> index 8a1009d..08ee7d3 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -18,7 +18,40 @@
>   	model = "Cubietech Cubietruck";
>   	compatible = "cubietech,cubietruck", "allwinner,sun7i-a20";
>   
> +	chosen {
> +		bootargs = "console=ttyS0,115200 earlyprintk root=/dev/ram0 rootfstype=ext2 rw";
> +	};
> +

Sorry, I messed up with the bootargs.
I'll remove it in the next version.

>   	soc@01c00000 {
> +		nfc: nand@01c03000 {
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
> +			status = "okay";
> +
> +			nand@0 {
> +				reg = <0>;
> +				allwinner,rb = <0>;
> +				nand-ecc-mode = "soft_bch";
> +
> +				/* nand timings */
> +				tCLS-min = <6>;
> +				tCLH-min = <3>;
> +				tCS-min = <20>;
> +				tCH-min = <5>;
> +				tWP-min = <8>;
> +				tWH-min = <6>;
> +				tALS-min = <6>;
> +				tDS-min = <6>;
> +				tDH-min = <2>;
> +				tRR-min = <20>;
> +				tALH-min = <3>;
> +				tRP-min = <8>;
> +				tREH-min = <6>;
> +				tRC-min = <16>;
> +				tWC-min = <16>;
> +			};
> +		};
> +
>   		pinctrl@01c20800 {
>   			led_pins_cubietruck: led_pins@0 {
>   				allwinner,pins = "PH7", "PH11", "PH20", "PH21";
