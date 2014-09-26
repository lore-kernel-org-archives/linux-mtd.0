Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXTLo-0005Gp-JK
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 11:06:14 +0000
Date: Fri, 26 Sep 2014 12:05:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v1 2/2] mtd: docg3: add device-tree documentation
Message-ID: <20140926110546.GA7422@leverpostej>
References: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
 <1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 25, 2014 at 11:33:16PM +0100, Robert Jarzmik wrote:
> Add documentation for the sandisk docg3 chip.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mtd/docg3.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/docg3.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/docg3.txt b/Documentation/devicetree/bindings/mtd/docg3.txt
> new file mode 100644
> index 0000000..3fcc163
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/docg3.txt
> @@ -0,0 +1,14 @@
> +Sandisk docg3 device
> +====================
> +
> +The Sandisk (former MSystems) docg3 is a nand device of 64M to 256MB.

I think that should be: "(formerly M-Systems)".

I'd rather we used the full name (DiskOnChip G3), as "docg3" is a
Linux-specific abbreviation. So I think the compatible string should be
something like "sandisk,diskonchip-g3". Arguably we should have
M-Systems as the vendor.

Are we able to detect the particular variant by reading registers on the
device? Are there any differences that we can probe dynamically (even if
we don't care about those at the moment)?

> +
> +Required properties:
> + - compatible: Should be "sandisk,docg3"
> + - reg: register base and size
> +
> +Example:
> +	docg3 {
> +		compatible = "sandisk,docg3";
> +		reg = <0x0 0x2000>;

There should be a unit-address on the node to match the address in the
first reg entry.

Mark.
