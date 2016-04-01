Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am68Y-0003gf-GP
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 20:57:50 +0000
Received: by mail-pa0-x235.google.com with SMTP id td3so98780761pab.2
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 13:57:25 -0700 (PDT)
Date: Fri, 1 Apr 2016 13:57:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Harvey Hunt <harvey.hunt@imgtec.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v2] mtd: nand: document the NAND controller/NAND chip DT
 representation
Message-ID: <20160401205722.GA10227@localhost>
References: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 01, 2016 at 02:26:35PM +0200, Boris Brezillon wrote:
> Standardize the NAND controller/NAND chip DT representation. Now, all new
> NAND controller drivers should comply with this representation, even if
> they are only supporting a single NAND chip.
> 
> Existing drivers can keep support for the old representation (where only
> the NAND chip was described), but are encouraged to also support the new
> one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - fix typo
> ---

Thanks for doing this. This mostly looks pretty good.

>  Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index b53f92e..a17662b 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -1,4 +1,23 @@
> -* MTD generic binding
> +* NAND chip and NAND controller generic binding
> +
> +NAND controller/NAND chip representation:

You're starting with an assumption that there is a difference. I suppose
that's usually the case, but is there ever a case that there isn't
really? For instance, what about gpio.c? It's just a few GPIOs wired
directly to a NAND chip. Or perhaps, does it make sense still, even
there? For instance, if you wanted to wire multiple chips but share most
of the lines, you'd need to coordinate this in a "controller" node
somehow.

All-in-all, looks good though, and we can patch this up with any other
additions. (It's not exactly a formal specification, after all, but just
guidelines.) So:

Acked-by: Brian Norris <computersforpeace@gmail.com>

> +The NAND controller should be represented with its own DT node, and all
> +NAND chips attached to this controller should be defined as children nodes
> +of the NAND controller. This representation should be enforced even for
> +simple controllers supporting only one chip.
> +
> +Mandatory NAND controller properties:
> +- #address-cells: depends on your controller. Should at least be 1 to
> +		  encode the CS line id.
> +- #size-cells: depends on your controller. Put zero unless you need a
> +	       mapping between CS lines and dedicated memory regions
> +
> +Optional NAND controller properties
> +- ranges: only needed if you need to define a mapping between CS lines and
> +	  memory regions
> +
> +Optional NAND chip properties:
>  
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> @@ -19,3 +38,19 @@ errors per {size} bytes".
>  The interpretation of these parameters is implementation-defined, so not all
>  implementations must support all possible combinations. However, implementations
>  are encouraged to further specify the value(s) they support.
> +
> +Example:
> +
> +	nand-controller {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* controller specific properties */
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-ecc-mode = "soft_bch";
> +
> +			/* controller specific properties */
> +		};
> +	};
> -- 
> 2.5.0
> 
