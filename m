Received: from martinlund.org ([173.255.130.145]
 helo=slmp-550-86.slc.westdc.net)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNceZ-000817-Tx
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 11:51:16 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174]:42604)
 by slmp-550-86.slc.westdc.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <martin.lund@keep-it-simple.com>) id 1gNcdh-00DguH-JY
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 04:50:21 -0700
Received: by mail-oi1-f174.google.com with SMTP id w13so6827273oiw.9
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2018 03:50:21 -0800 (PST)
MIME-Version: 1.0
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Martin Lund <martin.lund@keep-it-simple.com>
Date: Fri, 16 Nov 2018 12:50:10 +0100
Message-ID: <CAB7pii3kx75ajF=8TsU7mWrmrzoHLiy7uAb+PirGw04BH65bZg@mail.gmail.com>
Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
To: naga.sureshkumar.relli@xilinx.com
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, michals@xilinx.com,
 naga sureshkumar <nagasuresh12@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

I've been working on running up the latest kernel (v4.20-rc2) on our
custom Xilinx hw board so that I can test the v12 version of your
Arasan nand driver.

I've managed to get the driver successfully up and running and ready
for testing with a Micron MT29F64G08AFAAAWP device. However, setting
it up I've found a few inaccuracies in the documentation of the device
tree bindings.

This is the device configuration that ended up working for me with
linux v4.20-rc2:

       nfc: nand@ff100000 {
            compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
            reg = <0x0 0xff100000 0x0 0x1000>;
            clock-names = "clk_sys", "clk_flash";
            clocks = <&clk200>, <&clk100>;
            interrupt-parent = <&gic>;
            interrupts = <0 14 4>;
            #address-cells = <1>;
            #size-cells = <0>;

            nand@0 {
                reg = <0>;
                nand-ecc-mode = "hw";
            };
        };

Compared with the example you will notice that "clock-name" should be
"clock-names". reg was missing a "0x0".

I think it is helpful to provide a real-world working example, so you
might also consider changing the example "clocks" configuration to
clk200/clk100 since there is no clk_misc among the clock sources of
any of the xilinx zynqmp board device tree configurations.

Br, Martin

On Fri, Nov 9, 2018 at 6:00 AM Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:
>
> This patch adds the dts binding document for arasan nand flash controller
>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v12:
>  - Removed interrupt-parent description as it is implied as suggested by
>    Rob Herring
>  - Added missing ';' as required
> Changes in v11:
>  - Updated compatible description as suggested by Boris
>  - Removed arasan-has-dma property
> Changes in v10:
>  - None
> Changes in v9:
>  - None
> Changes in v8:
>  - Updated compatible and clock-names as per Boris comments
> Changes in v7:
>  - Corrected the acronyms those should be in caps
> Changes in v6:
>  - Removed num-cs property
>  - Separated nandchip from nand controller
> Changes in v5:
>  - None
> Changes in v4:
>  - Added num-cs property
>  - Added clock support
> Changes in v3:
>  - None
> Changes in v2:
>  - None
> ---
>  .../devicetree/bindings/mtd/arasan_nand.txt        | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> new file mode 100644
> index 0000000..b522daf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> @@ -0,0 +1,32 @@
> +Arasan NAND Flash Controller with ONFI 3.1 support
> +
> +Required properties:
> +- compatible:          Should be "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
> +- reg:                 Memory map for module access
> +- interrupts:          Should contain the interrupt for the device
> +- clock-name:          List of input clocks - "sys", "flash"
> +                       (See clock bindings for details)
> +- clocks:              Clock phandles (see clock bindings for details)
> +
> +Required properties for child node:
> +- nand-ecc-mode: see nand.txt
> +
> +For NAND partition information please refer the below file
> +Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +       nfc: nand@ff100000 {
> +               compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
> +               reg = <0x0 0xff100000 0x1000>;
> +               clock-name = "sys", "flash";
> +               clocks = <&misc_clk &misc_clk>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <0 14 4>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               nand@0 {
> +                       reg = <0>;
> +                       nand-ecc-mode = "hw";
> +               };
> +       };
> --
> 2.7.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
