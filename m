Received: from mail-pg0-f66.google.com ([74.125.83.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfuAw-0003iE-8U
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 20:35:28 +0000
Received: by mail-pg0-f66.google.com with SMTP id 123so1436204pga.5
 for <linux-mtd@lists.infradead.org>; Thu, 10 Aug 2017 13:35:06 -0700 (PDT)
Date: Thu, 10 Aug 2017 15:35:02 -0500
From: Rob Herring <robh@kernel.org>
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Message-ID: <20170810203502.5s2evtamkbolluae@rob-hp-laptop>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 06, 2017 at 11:24:02AM -0700, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Device Tree bindinds for Altera ASMI Parallel II IP Core.

s/bindinds/bindings/

> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/altera-asmip2.txt      | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
> new file mode 100644
> index 0000000..3380366
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
> @@ -0,0 +1,22 @@
> +* Altera ASMI Parallel II IP Core
> +
> +Required properties:
> +- compatible : Should be "altr,asmi_parallel2".

s/_/-/

> +- reg : A tuple consisting of a physical address and length.
> +
> +Optional subnodes:
> +Subnodes of the Altera ASMI Paralllel II IP Core are spi slave nodes.

But this is not a general purpose SPI controller?

> +- reg : chip select value
> +- label : optional user friendly label
> +
> +Example:
> +
> +qspi: spi@a0001000 {
> +	compatible = "altr,asmi_parallel2";
> +	reg = <0xa0001000 0x10>;
> +
> +	flash@0 {

This should have a compatible.

> +		reg = <0>;
> +		label = "FPGA Image";
> +	};
> +};
> -- 
> 2.7.4
> 
