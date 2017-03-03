Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjlNN-0006xh-R5
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 11:27:59 +0000
Received: by mail-wr0-x234.google.com with SMTP id l37so71672630wrc.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Mar 2017 03:27:37 -0800 (PST)
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
To: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-2-git-send-email-albeu@free.fr>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Moritz Fischer <moritz.fischer@ettus.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6d5ef869-a1d5-c8d2-847d-1c7aaafa74cf@linaro.org>
Date: Fri, 3 Mar 2017 11:27:34 +0000
MIME-Version: 1.0
In-Reply-To: <1488484223-844-2-git-send-email-albeu@free.fr>
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



On 02/03/17 19:50, Alban wrote:
> Add the binding to expose MTD partitions as nvmem providers.

It would be nice to see more description of this patch, explaining the 
real use case.
>
> Signed-off-by: Alban <albeu@free.fr>
> ---
>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>
> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> new file mode 100644
> index 0000000..47602f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> @@ -0,0 +1,29 @@
> += NVMEM in MTD =
> +
> +Config data for drivers is often stored in MTD devices. This binding
> +define how such data can be represented in device tree.
> +
> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
We should prefix this property with "mtd" to make it more explicit that 
this is specific to mtd devices.

May be we should put this under "Required Properties" section, marking 
it as mandatory for mtd nvmem providers.

> +property to their node. Data cells can then be defined as child nodes
> +of the partition as defined in nvmem.txt.
> +
> +Example:
> +
> +	flash@0 {
> +		...
> +
> +		partition@2 {
> +			label = "art";
> +			reg = <0x7F0000 0x010000>;
> +			read-only;
> +
> +			nvmem-provider;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			eeprom@1000 {
> +				label = "wmac-eeprom";
> +				reg = <0x1000 0x1000>;
> +			};
> +		};
> +	};
>
