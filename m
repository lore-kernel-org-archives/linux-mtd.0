MIME-Version: 1.0
In-Reply-To: <1356307280-8323-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1356307280-8323-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1356307280-8323-3-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Sun, 23 Dec 2012 21:50:52 -0300
Message-ID: <CALF0-+VHp+V=d114r_OT8baht_hSi9apmdYrJ3eVQRtEzjDZAw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm: omap2: gpmc: add DT bindings for OneNAND
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: linux-omap@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 martinez.javier@gmail.com, matthias.bgg@googlemail.com, eballetbo@gmail.com,
 Ezequiel Garcia <ezequiel@free-electrons.com>, zonque@gmail.com,
 grant.likely@secretlab.ca, linux-mtd@lists.infradead.org, jon-hunter@ti.com,
 linux-arm-kernel@lists.infradead.org, b-cousson@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 23, 2012 at 9:01 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> This patch adds device tree bindings for OMAP OneNAND devices.
> Tested on an OMAP3 3430 IGEPv2 board.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/gpmc-onenand.txt       |   44 ++++++++++++++++++++
>  arch/arm/mach-omap2/gpmc.c                         |   44 ++++++++++++++++++++
>  2 files changed, 88 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> new file mode 100644
> index 0000000..4108f18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> @@ -0,0 +1,44 @@
> +Device tree bindings for GPMC connected OneNANDs
> +
> +GPMC connected OneNAND (found on OMAP boards) are represented as child nodes of
> +the GPMC controller with a name of "onenand".
> +
> +All timing relevant properties as well as generic gpmc child properties are
> +explained in a separate documents - please refer to
> +Documentation/devicetree/bindings/bus/ti-gpmc.txt
> +
> +Required properties:
> +
> + - reg:                        The CS line the peripheral is connected to
> +
> +Optional properties:
> +
> + - dma-channel:                DMA Channel index
> +
> +For inline partiton table parsing (optional):
> +
> + - #address-cells: should be set to 1
> + - #size-cells: should be set to 1
> +
> +Example for an OMAP3430 board:
> +
> +       gpmc: gpmc@6e000000 {
> +               compatible = "ti,omap3430-gpmc";
> +               ti,hwmods = "gpmc";
> +               reg = <0x6e000000 0x1000000>;
> +               interrupts = <20>;
> +               gpmc,num-cs = <8>;
> +               gpmc,num-waitpins = <4>;
> +               #address-cells = <2>;
> +               #size-cells = <1>;
> +

Before anyone complains, this is wrong:

> +               onenand@0 {
> +                       reg = <0>;
> +

It should be "reg = <0 0 0>" of course.

Also, IMHO, I don't like the node to be matched by his name.
Shouldn't we add a "compatible" tag instead?

That way we could describe the device like

flash@xxx {
    compatible = "nand";
}

or

flash@xxx {
    compatible = "onenand";
}

Does this make sense?

Regards,

    Ezequiel
