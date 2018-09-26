Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g59ic-0002qt-GE
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2018 13:19:08 +0000
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12403214FE
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2018 13:18:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id y26-v6so1709931wma.2
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2018 06:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1537878031-22253-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1537878031-22253-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Sep 2018 08:18:21 -0500
Message-ID: <CABGGiszo3BO9LrSPT7tRey9g6jMZkB_0oXJA7ebsk-toud0EGw@mail.gmail.com>
Subject: Re: [LINUX PATCH v11 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
To: naga.sureshkumar.relli@xilinx.com
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, michals@xilinx.com,
 nagasuresh12@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DT bindings should be sent to DT list.

On Tue, Sep 25, 2018 at 7:21 AM Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:
>
> This patch adds the dts binding document for arasan nand flash controller
>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v11:
>  - Updated compatible description as suggested by Boris
>  - Removed arasan-has-dma property
> Changes in v10:
> - None
> Changes in v9:
> - None
> Changes in v8:
> - Updated compatible and clock-names as per Boris comments
> Changes in v7:
> - Corrected the acronyms those should be in caps
> Changes in v6:
> - Removed num-cs property
> - Separated nandchip from nand controller
> Changes in v5:
> - None
> Changes in v4:
> - Added num-cs property
> - Added clock support
> Changes in v3:
> - None
> Changes in v2:
> - None
> ---
>  .../devicetree/bindings/mtd/arasan_nand.txt        | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> new file mode 100644
> index 0000000..546ed98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> @@ -0,0 +1,33 @@
> +Arasan NAND Flash Controller with ONFI 3.1 support
> +
> +Required properties:
> +- compatible:          Should be "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
> +- reg:                 Memory map for module access
> +- interrupt-parent:    Interrupt controller the interrupt is routed through

Drop this. It is implied.

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
> +               compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10"

Missing ;

> +               reg = <0x0 0xff100000 0x1000>;
> +               clock-name = "sys", "flash"

Missing ;

> +               clocks = <&misc_clk &misc_clk>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <0 14 4>;
> +               #address-cells = <1>;
> +               #size-cells = <0>

Missing ;

> +
> +               nand@0 {
> +                       reg = <0>

Missing ;

> +                       nand-ecc-mode = "hw";
> +               };
> +       };
> --
> 2.7.4
>
