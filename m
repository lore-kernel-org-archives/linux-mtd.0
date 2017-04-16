Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cznQu-00058Y-1k
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 16:53:54 +0000
Received: from player714.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 5EA6F511E2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 18:53:22 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] dt-bindings: Document the STM32 QSPI bindings
To: Ludovic Barre <ludovic.Barre@st.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <b62272c9-027c-9c9b-42f0-1056d88aac7c@wedev4u.fr>
Date: Sun, 16 Apr 2017 18:53:06 +0200
MIME-Version: 1.0
In-Reply-To: <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Rob, is this version ok for you? If so, I can take it into the
github/spi-nor tree.

Best regards,

Cyrille

Le 13/04/2017 à 19:15, Ludovic Barre a écrit :
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch adds documentation of device tree bindings for the STM32
> QSPI controller.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-quadspi.txt      | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> new file mode 100644
> index 0000000..ddd18c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> @@ -0,0 +1,43 @@
> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
> +
> +Required properties:
> +- compatible: should be "st,stm32f469-qspi"
> +- reg: the first contains the register location and length.
> +       the second contains the memory mapping address and length
> +- reg-names: should contain the reg names "qspi" "qspi_mm"
> +- interrupts: should contain the interrupt for the device
> +- clocks: the phandle of the clock needed by the QSPI controller
> +- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
> +
> +Optional properties:
> +- resets: must contain the phandle to the reset controller.
> +
> +A spi flash must be a child of the nor_flash node and could have some
> +properties. Also see jedec,spi-nor.txt.
> +
> +Required properties:
> +- reg: chip-Select number (QSPI controller may connect 2 nor flashes)
> +- spi-max-frequency: max frequency of spi bus
> +
> +Optional property:
> +- spi-rx-bus-width: see ../spi/spi-bus.txt for the description
> +
> +Example:
> +
> +qspi: spi@a0001000 {
> +	compatible = "st,stm32f469-qspi";
> +	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
> +	reg-names = "qspi", "qspi_mm";
> +	interrupts = <91>;
> +	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
> +	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_qspi0>;
> +
> +	flash@0 {
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <108000000>;
> +		...
> +	};
> +};
> 
