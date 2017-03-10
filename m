Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmB4b-0000te-DY
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 03:18:35 +0000
Received: by mail-wm0-x242.google.com with SMTP id u132so277974wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 19:18:12 -0800 (PST)
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
To: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Moritz Fischer <moritz.fischer@ettus.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
Date: Fri, 10 Mar 2017 04:17:57 +0100
MIME-Version: 1.0
In-Reply-To: <1488875164-30440-2-git-send-email-albeu@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/07/2017 09:26 AM, Alban wrote:
> Config data for drivers, like MAC addresses, is often stored in MTD.
> Add a binding that define how such data storage can be represented in
> device tree.
> 
> Signed-off-by: Alban <albeu@free.fr>
> ---
> Changelog:
> v2: * Added a "Required properties" section with the nvmem-provider
>       property
> ---
>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> new file mode 100644
> index 0000000..8ed25e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> @@ -0,0 +1,33 @@
> += NVMEM in MTD =
> +
> +Config data for drivers, like MAC addresses, is often stored in MTD.
> +This binding define how such data storage can be represented in device tree.
> +
> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
> +property to their node. Data cells can then be defined as child nodes
> +of the partition as defined in nvmem.txt.

Why don't we just read the data from MTD and be done with it ? What's
the benefit of complicating things by using nvmem ?

> +Required properties:
> +nvmem-provider:	Indicate that the device should be registered as
> +		NVMEM provider
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


-- 
Best regards,
Marek Vasut
