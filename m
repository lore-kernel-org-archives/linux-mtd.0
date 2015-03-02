Date: Mon, 2 Mar 2015 13:24:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 1/2] mtd: nand: dt binding documentation for
 digicolor NFC
Message-ID: <20150302132446.5ee40c87@bbrezillon>
In-Reply-To: <fb9907fecb8b57d1b44ce03b97eb62225555de9f.1425295703.git.baruch@tkos.co.il>
References: <fb9907fecb8b57d1b44ce03b97eb62225555de9f.1425295703.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Baruch,

On Mon,  2 Mar 2015 13:28:22 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The CX92755 SoC is one of Conexant Digicolor series of SoCs. This devicetree
> binding document describes the NAND flash controller the is shared by some SoCs
> in the Digicolor series.
> 
> Not all of the properties are currently actually used by the driver.
> Specifically, the driver doesn't make use of interrupts. This may change in the
> future.
> 
> Also worth noting that the only supported ECC mode is "hw_syndrome". In the
> future the driver may add support for additional modes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../devicetree/bindings/mtd/digicolor-nand.txt     | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/digicolor-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/digicolor-nand.txt b/Documentation/devicetree/bindings/mtd/digicolor-nand.txt
> new file mode 100644
> index 000000000000..60e2d9085b7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/digicolor-nand.txt
> @@ -0,0 +1,71 @@
> +Conexant Digicolor NAND Flash Controller (NFC)
> +
> +Required properties:
> +- compatible : "cnxt,cx92755-nfc".
> +- reg : shall contain registers location and length for data and reg.
> +- interrupts : shall define the nand controller interrupt.
> +- #address-cells: shall be set to 1. Encode the nand CS.
> +- #size-cells : shall be set to 0.
> +- clocks : shall reference nand controller clocks.
> +
> +Optional children nodes:
> +Children nodes represent the available nand chips.
> +
> +Required children properties:
> +- nand-ecc-mode : must be "hw_syndrome".

You could fallback to hw_syndrome when this property is not provided.
That would make it optional (and if you ever want to support other
modes, you'll just have to explicitly specify nand-ecc-mode).

> +- nand-ecc-strength : must be one of 6, 7, 8, 24, 28, 30.
> +- nand-ecc-step-size : must be either 512 or 1024.

Those 2 properties are no longer mandatory (you fallback to values
stored in _ds if they are missing).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
