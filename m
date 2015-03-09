From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2 3/6] mtd: nand: vf610_nfc: add device tree bindings
References: <1425919132-13827-1-git-send-email-stefan@agner.ch>
 <1425919132-13827-4-git-send-email-stefan@agner.ch>
Date: Mon, 09 Mar 2015 16:11:59 -0400
Message-ID: <87385eue0g.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On  9 Mar 2015, stefan@agner.ch wrote:

> Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> .../devicetree/bindings/mtd/vf610-nfc.txt | 39 ++++++++++++++++++++++
> 1 file changed, 39 insertions(+) create mode 100644
> Documentation/devicetree/bindings/mtd/vf610-nfc.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> new file mode 100644
> index 0000000..312c872
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt

[snip]

> +- reg: Address range of the mtd chip 
> +- interrupts: Should contain the STMMAC interrupts 

What is 'STMMAC'?  Is that something I cribbed from another file?  Ah, I
see 'spear_smi.txt' which is an NAND driver with a 'clock-frequency'
parameter (probably before 'assigned-clocks' support).

 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/spear_smi.txt

I don't think 'STMMAC' makes sense.

  +- interrupts: irq to be used

Maybe?  Same as mxc-nand.txt.  It is not so helpful though.

> +- nand-bus-width: see nand.txt
> +- nand-ecc-mode: see nand.txt
> +- nand-on-flash-bbt: see nand.txt 
> +- clock-frequency : Optional clock rate to NFC in Hz

I guess this changed?  We might want to put a note about what kind of
impact this might have on the bus.  Ie,

 assigned-clocks: Input SOC clock to the NAND controller.
 assigned-clock-rates: The NAND bus timing is derived from this clock
    rate and should not exceed maximum timing for any NAND memory chip
    in a board stuffing.  Typical NAND memory timings derived from this
    clock are found in the SOC hardware reference manual.
 
Originally, the reason I made this file was because the
'clock-frequency' was non-standard.  I guess it is nice to have it
anyways.

Fwiw,
Bill Pringlemeir.
