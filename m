Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxBVU-0004sO-KN
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 13:36:38 +0000
Received: by mail-oi0-f67.google.com with SMTP id x197-v6so6701382oix.5
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2018 06:36:26 -0700 (PDT)
Message-ID: <5b8e8a58.1c69fb81.12eaa.f292@mx.google.com>
From: Rob Herring <robh@kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: mtd: describe BCM963XX ImageTag format
 and usage
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
 <20180828111944.5956-5-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828111944.5956-5-jonas.gorski@gmail.com>
Date: Mon, 3 Sep 2018 19:30:32 -0500
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 28, 2018 at 01:19:43PM +0200, Jonas Gorski wrote:
> Describe how to use the BCM963XX ImageTag format in a mixed flash layout
> environment.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../mtd/partitions/brcm,bcm963xx-imagetag.txt      | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
> new file mode 100644
> index 000000000000..f4a444d69d9a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
> @@ -0,0 +1,78 @@
> +Broadcom BCM963XX ImageTag Partition Container
> +==============================================
> +
> +Some Broadcom BCM63XX SoC based devices contain additional, non discoverable
> +partitions or non standard bootloader partition sizes. For these a mixed layout
> +needs to be used with an explicit firmware partition.
> +
> +The BCM963XX ImageTag is a simple firmware header describing the offsets and
> +sizes of the rootfs and kernel parts contained in the firmware.
> +
> +Required properties:
> +- compatible : must be "brcm,bcm963xx-imagetag"
> +
> +Examples:
> +
> +flash@1e000000 {
> +	compatible = "cfi-flash";
> +	reg = <0x1e000000 0x2000000>;
> +	bank-width = <2>;
> +
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		cfe@0 {
> +			reg = <0x0 0x10000>;
> +			read-only;
> +		};
> +
> +		firmware@10000 {
> +			reg = <0x10000 0x7d0000>;
> +			compatible = "brcm,bcm963xx-imagetag";
> +		};
> +
> +		caldata@7e0000 {
> +			reg = <0x7e0000 0x10000>;
> +			read-only;
> +		};
> +
> +		nvram@7f0000 {
> +			reg = <0x7f0000 0x10000>;
> +		};
> +	};
> +};
> +
> +
> +flash@1e000000 {
> +	compatible = "cfi-flash";
> +	reg = <0x1e000000 0x2000000>;
> +	bank-width = <2>;
> +
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		/*
> +		 * Some devices use a flash chip with 64k erase blocks, some
> +		 * use one with 128k erase blocks, so the vendor decided to
> +		 * always use 128k as the firmware offset.
> +		 */

That's a interesting piece of info, but not really a reason to have a 
second example.

> +
> +		cfe@0 {
> +			reg = <0x0 0x20000>;
> +			read-only;
> +		};
> +
> +		firmware@20000 {
> +			reg = <0x20000 0x7c0000>;
> +			compatible = "brcm,bcm963xx-imagetag";
> +		};
> +
> +		nvram@7e0000 {
> +			reg = <0x7e0000 0x20000>;
> +		};
> +	};
> +};
> -- 
> 2.13.2
> 
