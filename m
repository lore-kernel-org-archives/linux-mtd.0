Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvPpO-00039m-Sx
 for linux-mtd@lists.infradead.org; Tue, 04 Apr 2017 14:53:04 +0000
Received: by mail-oi0-f68.google.com with SMTP id b187so25145251oif.3
 for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2017 07:52:42 -0700 (PDT)
Date: Tue, 4 Apr 2017 09:52:40 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Paul Burton <paul.burton@imgtec.com>, james.hogan@imgtec.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 02/14] dt/bindings: Document gpio-ingenic
Message-ID: <20170404145240.z3vx24svh4dduo2o@rob-hp-laptop>
References: <20170125185207.23902-2-paul@crapouillou.net>
 <20170402204244.14216-1-paul@crapouillou.net>
 <20170402204244.14216-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170402204244.14216-3-paul@crapouillou.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 02, 2017 at 10:42:32PM +0200, Paul Cercueil wrote:
> This commit adds documentation for the devicetree bindings of the
> gpio-ingenic driver, which handles GPIOs of the Ingenic SoCs
> currently supported by the Linux kernel.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/gpio/ingenic,gpio.txt      | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
> 
>  v2: New patch
>  v3: No changes
>  v4: Update for the v4 version of the gpio-ingenic driver
> 
> diff --git a/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt b/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
> new file mode 100644
> index 000000000000..f54af444f7c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
> @@ -0,0 +1,48 @@
> +Ingenic jz47xx GPIO controller
> +
> +That the Ingenic GPIO driver node must be a sub-node of the Ingenic pinctrl
> +driver node.
> +
> +Required properties:
> +--------------------
> +
> + - compatible: Must contain one of:
> +    - "ingenic,jz4740-gpio"
> +    - "ingenic,jz4770-gpio"
> +    - "ingenic,jz4780-gpio"
> +	And one of:
> +	- "ingenic,gpio-bank-a"
> +	- "ingenic,gpio-bank-b"
> +	- "ingenic,gpio-bank-c"
> +	- "ingenic,gpio-bank-d"
> +	- "ingenic,gpio-bank-e" (for SoC version > jz4740)
> +	- "ingenic,gpio-bank-f" (for SoC version > jz4740)

This is quite strange. Why do you need the bank? Doesn't gpio-ranges 
give you that info? Maybe use reg property here instead.

> + - interrupt-controller: Marks the device node as an interrupt controller.
> + - interrupts: Interrupt specifier for the controllers interrupt.
> + - #interrupt-cells: Should be 2. Refer to
> +   ../interrupt-controller/interrupts.txt for more details.
> + - gpio-controller: Marks the device node as a GPIO controller.
> + - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
> +    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
> +    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
> + - gpio-ranges: Range of pins managed by the GPIO controller. Refer to
> +   'gpio.txt' in this directory for more details.
> +
> +Example:
> +--------
> +
> +&pinctrl {
> +	gpa: gpio-controller@0 {

gpio@...

> +		compatible = "ingenic,gpio-bank-a", "ingenic,jz4740-gpio";
> +
> +		gpio-controller;
> +		gpio-ranges = <&pinctrl 0 0 32>;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <28>;
> +	};
> +};
> -- 
> 2.11.0
> 
