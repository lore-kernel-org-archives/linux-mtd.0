Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmA2a-0001ou-3E
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2011 19:45:13 +0000
Date: Wed, 27 Jul 2011 14:45:01 -0500
From: Scott Wood <scottwood@freescale.com>
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
Message-ID: <20110727144501.7e0420cd@schlenkerla.am.freescale.net>
In-Reply-To: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Jul 2011 15:03:30 +0100
Jamie Iles <jamie@jamieiles.com> wrote:

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> new file mode 100644
> index 0000000..98cb152
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> @@ -0,0 +1,43 @@
> +GPIO assisted NAND flash
> +
> +Required properties:
> +- compatible : "gpio-nand"
> +- reg : should specify localbus chip select and size used for the chip.  For
> +  ARM platforms where a dummy read is needed to provide synchronisation with
> +  regards to bus reordering, an optional second resource describes the
> +  location to read from.

I don't see how a pure "gpio nand" device would have any memory mapped
I/O.  I think you need a more specific compatible for this.

> +Optional properties:
> +- bank-width : Width (in bytes) of the bank.  Equal to the device width times
> +  the number of interleaved chips.

Interleaved NAND chips?  Is that actually done?

> +Examples:
> +
> +gpio-nand@1,0 {
> +	compatible = "gpio-nand";
> +	reg = <1 0x0000 0x1000>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	gpios = <&banka 1 0	/* rdy */
> +		 &banka 2 0 	/* nce */
> +		 &banka 3 0 	/* ale */
> +		 &banka 4 0 	/* cle */
> +		 0		/* nwp */>;
> +
> +	flash {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "...";
> +
> +		partition@0 {
> +			...
> +		};
> +	};
> +};

Here you have a separate flash node underneath the gpio-nand node, but
earlier in the patch comment you show the partitions being directly under
gpio-nand, and from a quick glance it appears the latter is what the code
supports.

-Scott
