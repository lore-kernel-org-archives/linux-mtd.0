Received: from mail-lb0-f181.google.com ([209.85.217.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG44p-00069d-1m
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 11:45:15 +0000
Received: by lblf12 with SMTP id f12so59707543lbl.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2015 04:44:52 -0700 (PDT)
Subject: Re: [PATCH 6/7] Documentation: atmel-quadspi: add binding file for
 Atmel QSPI driver
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, nicolas.ferre@atmel.com,
 broonie@kernel.org, linux-spi@vger.kernel.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, zajec5@gmail.com, beanhuo@micron.com,
 juhosg@openwrt.org, marex@denx.de, shijie.huang@intel.com,
 ben@decadent.org.uk
References: <cover.1437059658.git.cyrille.pitchen@atmel.com>
 <f4bb1c68fcc19b3642110ab0ef9850d6eeca3112.1437059658.git.cyrille.pitchen@atmel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, galak@codeaurora.org,
 linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <55A8EAAE.6010506@cogentembedded.com>
Date: Fri, 17 Jul 2015 14:44:46 +0300
MIME-Version: 1.0
In-Reply-To: <f4bb1c68fcc19b3642110ab0ef9850d6eeca3112.1437059658.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 7/16/2015 6:27 PM, Cyrille Pitchen wrote:

> This patch documents the DT bindings for the driver of the Atmel QSPI
> controller embedded inside sama5d2x SoCs.

> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>   .../devicetree/bindings/mtd/atmel-quadspi.txt      | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt

> diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> new file mode 100644
> index 000000000000..a0d60ac7ae10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> @@ -0,0 +1,29 @@
> +* Atmel Quad Serial Peripheral Interface (QSPI)
> +
> +Required properties:
> +  - compatible : Should be "atmel,sama5d2-qspi"
> +  - reg : the first contains the register location and length,
> +          the second contains the memory mapping address and length
> +  - interrupts : Should contain the interrupt for the device
> +  - clocks : The clock needed by the QSPI controller
> +  - #address-cells : should be 1
> +  - #size-cells : should be 0
> +
> +Example:
> +
> +qspi0: qspi@f0020000 {

     Once again, the ePAPR standard tells up to call the node just "spi", not 
"qspi".

> +	compatible = "atmel,sama5d2-qspi";
> +	reg = <0xf0020000 0x100>,
> +	      <0xd0000000 0x08000000>;

    Either you use the leading zeroes or you don't. :-)

[...]

MBR, Sergei
