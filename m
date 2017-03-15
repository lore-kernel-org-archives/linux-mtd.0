Received: from mail-pf0-f194.google.com ([209.85.192.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coCex-0005l0-34
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 17:24:28 +0000
Received: by mail-pf0-f194.google.com with SMTP id o126so2821247pfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 15 Mar 2017 10:24:04 -0700 (PDT)
Date: Wed, 15 Mar 2017 12:24:01 -0500
From: Rob Herring <robh@kernel.org>
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
Message-ID: <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488875164-30440-2-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 07, 2017 at 09:26:03AM +0100, Alban wrote:
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
> +
> +Required properties:
> +nvmem-provider:	Indicate that the device should be registered as
> +		NVMEM provider

I think we should use a compatible string here (perhaps with a 
generic fallback), and that can imply it is an nvmem provider. The 
reason is then the compatible can also imply other information that 
isn't defined in DT.

Rob
