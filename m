Received: from mail-ot0-f193.google.com ([74.125.82.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8BN1-0006m2-C5
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2018 21:09:04 +0000
Received: by mail-ot0-f193.google.com with SMTP id a14-v6so19048492otf.6
 for <linux-mtd@lists.infradead.org>; Mon, 16 Apr 2018 14:08:53 -0700 (PDT)
Date: Mon, 16 Apr 2018 16:08:51 -0500
From: Rob Herring <robh@kernel.org>
To: Alban Bedel <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Message-ID: <20180416210851.shu73nlincslxlde@rob-hp-laptop>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-3-git-send-email-albeu@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521933899-362-3-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 25, 2018 at 12:24:58AM +0100, Alban Bedel wrote:
> Config data for drivers, like MAC addresses, is often stored in MTD.
> Add a binding that define how such data storage can be represented in
> device tree.
> 
> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
> Changelog:
> v2: * Added a "Required properties" section with the nvmem-provider
>       property
> v3: * Fixed my name in From and Signed-off-by
>     * Moved to the new nvmem binding with the nvmem-cells subnode
> ---
>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> new file mode 100644
> index 0000000..c819a69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> @@ -0,0 +1,27 @@
> += NVMEM in MTD =
> +
> +Config data for drivers, like MAC addresses, is often stored in MTD.
> +An MTD device, or one of its partition, can be defined as a NVMEM provider
> +by having an 'nvmem-cells' subnode as defined in nvmem.txt.
> +
> +Example:
> +
> +	flash@0 {
> +		...
> +
> +		partition@2 {

This unit address is not correct...

> +			label = "art";
> +			reg = <0x7F0000 0x010000>;

Lowercase hex.

> +			read-only;
> +
> +			nvmem-cells {
> +				compatible = "nvmem-cells";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				eeprom@1000 {

"eeprom" isn't specific data. The purpose of the nvmem binding is to 
provide specific data fields like MAC addresseses.

Plus "eeprom" is the node name for EEPROM devices.

> +					reg = <0x1000 0x1000>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.7.4
> 
