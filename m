Received: from mail-yk0-f175.google.com ([209.85.160.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSjbN-0007Pw-04
 for linux-mtd@lists.infradead.org; Sat, 13 Sep 2014 09:26:43 +0000
Received: by mail-yk0-f175.google.com with SMTP id 142so1016556ykq.34
 for <linux-mtd@lists.infradead.org>; Sat, 13 Sep 2014 02:26:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410564239-8411-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1410564239-8411-1-git-send-email-alexandre.belloni@free-electrons.com>
Date: Sat, 13 Sep 2014 10:26:18 +0100
Message-ID: <CAAEAJfD_Kujcf7m9RAbRrjA82A08N81rVwy6sXY_PORdrH0VkA@mail.gmail.com>
Subject: Re: [PATCHv5] mtd: nand: atmel_nand: retrieve NFC clock
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 September 2014 00:23, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
>
> Retrieve the NFC clock to make sure it is enabled. Make that optional to =
ensure
> compatibility with previous device trees but document it as mandatory so =
newer
> device trees will include it.
>
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Acked-by: Josh Wu <josh.wu@atmel.com>
> ---
> Changes in v5:
>  - Added a proper commit log
>
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  2 ++
>  drivers/mtd/nand/atmel_nand.c                      | 25 ++++++++++++++++=
++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Docum=
entation/devicetree/bindings/mtd/atmel-nand.txt
> index c4728839d0c1..6edc3b616e98 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -36,6 +36,7 @@ Optional properties:
>      - reg : should specify the address and size used for NFC command reg=
isters,
>              NFC registers and NFC Sram. NFC Sram address and size can be=
 absent
>              if don't want to use it.
> +    - clocks: phandle to the peripheral clock
>    - Optional properties:
>      - atmel,write-by-sram: boolean to enable NFC write by sram.
>
> @@ -98,6 +99,7 @@ nand0: nand@40000000 {
>                 compatible =3D "atmel,sama5d3-nfc";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> +               clocks =3D <&hsmc_clk>
>                 reg =3D <
>                         0x70000000 0x10000000   /* NFC Command Registers =
*/
>                         0xffffc000 0x00000070   /* NFC HSMC regs */
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.=
c
> index 9c5f717bda54..d1e502f8dbd0 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -27,6 +27,7 @@
>   *
>   */
>
> +#include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -96,6 +97,8 @@ struct atmel_nfc {
>         bool                    use_nfc_sram;
>         bool                    write_by_sram;
>
> +       struct clk              *clk;
> +
>         bool                    is_initialized;
>         struct completion       comp_ready;
>         struct completion       comp_cmd_done;
> @@ -2248,6 +2251,7 @@ static int atmel_nand_nfc_probe(struct platform_dev=
ice *pdev)
>  {
>         struct atmel_nfc *nfc =3D &nand_nfc;
>         struct resource *nfc_cmd_regs, *nfc_hsmc_regs, *nfc_sram;
> +       int ret;
>
>         nfc_cmd_regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         nfc->base_cmd_regs =3D devm_ioremap_resource(&pdev->dev, nfc_cmd_=
regs);
> @@ -2279,8 +2283,28 @@ static int atmel_nand_nfc_probe(struct platform_de=
vice *pdev)
>         nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
>         nfc_readl(nfc->hsmc_regs, SR);  /* clear the NFC_SR */
>
> +       nfc->clk =3D devm_clk_get(&pdev->dev, NULL);
> +       if (!IS_ERR(nfc->clk)) {
> +               ret =3D clk_prepare_enable(nfc->clk);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               dev_warn(&pdev->dev, "NFC clock missing, update your Devi=
ce Tree");

Looks much better now thanks. If the clock is not really optional, you
can consider this a firmware bug. We've used FW_BUG messages for these
cases
(see vim drivers/watchdog/orion_wdt.c), so you could write something like:

dev_warn(..., FW_BUG "devicetree clock missing");

Just a suggestion.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
