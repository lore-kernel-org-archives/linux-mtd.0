Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK97I-0004Iw-A5
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 17:56:41 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V6 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Tue, 28 Jul 2015 19:56:13 +0200
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Vikas MANOCHA <vikas.manocha@st.com>, linux-kernel@vger.kernel.org,
 Alan Tull <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>
References: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507281956.13994.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 07:38:02 PM, Graham Moore wrote:

A commit message would be really nice :-)

> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> ---
> V2: Add cdns prefix to driver-specific bindings.
> V3: Use existing property "is-decoded-cs" instead of creating a duplicate,
> "ext-decoder".  Timing parameters are in nanoseconds, not master reference
> clocks.  Remove bus-num completely.
> V4: Add new properties fifo-width and trigger-address
> ---
>  .../devicetree/bindings/mtd/cadence_quadspi.txt    |   54
> ++++++++++++++++++++ 1 file changed, 54 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt new file mode
> 100644
> index 0000000..d7e6fdd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> @@ -0,0 +1,54 @@
> +* Cadence Quad SPI controller
> +
> +Required properties:
> +- compatible : Should be "cdns,qspi-nor".
> +- reg : Contains two entries, each of which is a tuple consisting of a
> +	physical address and length.  The first entry is the address and
> +	length of the controller register set.  The second entry is the
> +	address and length of the QSPI Controller data area.
> +- interrupts : Unit interrupt specifier for the controller interrupt.
> +- clocks : phandle to the Quad SPI clock.
> +- fifo-depth : Size of the data FIFO in words.

This and the following two are absolutelly Cadence specific, so prefix
them that way please:

cdns,fifo-depth

> +- fifo-width: Bus width of the data FIFO in bytes.

cdns,fifo-width

> +- trigger-address : 32-bit indirect AHB trigger address.

cdns,trigger-address

What is this address exactly? Is this documented somewhere what the value
should be precisely ?

[...]
