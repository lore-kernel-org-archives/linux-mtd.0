Received: from avon.wwwdotorg.org ([2001:470:1f0f:bd7::2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWBvr-0006RJ-0s
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2012 20:09:03 +0000
Message-ID: <509ABFD9.8090704@wwwdotorg.org>
Date: Wed, 07 Nov 2012 13:08:57 -0700
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [RFC v2 PATCH 2/2] mtd: davinci - remove DaVinci architecture
 depedency
References: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com>
 <1352238427-26085-3-git-send-email-m-karicheri2@ti.com>
In-Reply-To: <1352238427-26085-3-git-send-email-m-karicheri2@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com, mikedunn@newsguy.com,
 linux-doc@vger.kernel.org, artem.bityutskiy@linux.intel.com,
 devicetree-discuss@lists.ozlabs.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, rob.herring@calxeda.com,
 grant.likely@secretlab.ca, linux-mtd@lists.infradead.org, rob@landley.net,
 gregkh@linuxfoundation.org, santosh.shilimkar@ti.com, hs@denx.de,
 dwmw2@infradead.org, hdoyu@nvidia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/06/2012 02:47 PM, Murali Karicheri wrote:
> DaVinci NAND driver is a controller driver based on the AEMIF hardware
> IP found on TI SoCs. It is also used on SoCs that are not DaVinci based. This
> patch removes the driver dependency on DaVinci architecture so that it
> can be used on other architectures such as c6x, keystone etc.
> 
> Also migrate the driver to use the new AEMIF platform driver API and
> moving Documentation to Documentation/devicetree/bindings/mtd/davinci-nand.txt
> as this is expected to be used outside of arm/davinci.

>  delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.txt
>  create mode 100644 include/linux/platform_data/davinci-nand.h

Using "git format-patch -M" might show this as a file move/rename rather
than a delete/add, which would be useful to highlight any changes you
made at the same time.

> diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt

> +Example (enbw_cmc board):
> +aemif@60000000 {
> +	compatible = "ti,davinci-aemif";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +	reg = <0x68000000 0x80000>;
> +	ranges = <2 0 0x60000000 0x02000000
> +		  3 0 0x62000000 0x02000000
> +		  4 0 0x64000000 0x02000000
> +		  5 0 0x66000000 0x02000000
> +		  6 0 0x68000000 0x02000000>;
> +	nand@3,0 {

Here, isn't 3,0 the aemif chip-select ID that is decoding the NAND accesses?

> +		compatible = "ti,davinci-nand";
> +		reg = <3 0x0 0x807ff
> +			6 0x0 0x8000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ti,davinci-chipselect = <1>;

So I don't understand why that chipselect property is needed, or has a
different value. Is this muxing the AEMIF output chip-selects onto
different SoC package pins or something? Seems like a job for pinctrl
perhaps?
