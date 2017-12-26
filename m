Received: from mail-pf0-f193.google.com ([209.85.192.193])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eTyZU-00083c-9R
 for linux-mtd@lists.infradead.org; Tue, 26 Dec 2017 23:23:46 +0000
Received: by mail-pf0-f193.google.com with SMTP id j28so19158252pfk.8
 for <linux-mtd@lists.infradead.org>; Tue, 26 Dec 2017 15:23:33 -0800 (PST)
Date: Tue, 26 Dec 2017 17:23:30 -0600
From: Rob Herring <robh@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, broonie@kernel.org, vigneshr@ti.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 nicolas.ferre@microchip.com, radu.pirea@microchip.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: atmel-quadspi: add an optional
 property 'dmacap,memcpy'
Message-ID: <20171226232330.trljk2ofyvu4ly3n@rob-hp-laptop>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <143542c61ca674d53da4985bbabc142e8e6ebefc.1514087323.git.cyrille.pitchen@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143542c61ca674d53da4985bbabc142e8e6ebefc.1514087323.git.cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 24, 2017 at 05:36:05AM +0100, Cyrille Pitchen wrote:
> The optional 'dmacap,memcpy' DT property tells the Atmel QSPI controller
> driver to reserve some DMA channel then to use it to perform DMA
> memcpy() during data transfers. This feature relies on the generic
> bounce buffer helper from spi-nor.c.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-quadspi.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> index b93c1e2f25dd..002d3f0a445b 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> @@ -12,6 +12,10 @@ Required properties:
>  - #address-cells: Should be <1>.
>  - #size-cells:    Should be <0>.
>  
> +Optional properties:
> +- dmacap,memcpy:  Reserve a DMA channel to perform DMA memcpy() between the
> +                  system memory and the QSPI mapped memory.

How is this a h/w property? Why would I not want to always enable DMA if 
possible?

Furthermore, you are reusing a property, but giving it a different 
meaning. The current definition is an indication whether a DMA 
controller supports memcpy operations or not. It is not a flag for 
clients to use memcpy channels.

Why don't you use "dmas" property to point to the DMA controller.

> +
>  Example:
>  
>  spi@f0020000 {
> @@ -24,6 +28,7 @@ spi@f0020000 {
>  	#size-cells = <0>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_spi0_default>;
> +	dmacap,memcpy;
>  
>  	m25p80@0 {
>  		...
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
