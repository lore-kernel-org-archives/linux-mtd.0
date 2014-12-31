Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6Mf7-0002WX-Se
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 17:02:22 +0000
Date: Wed, 31 Dec 2014 18:01:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3 2/3] mtd: nand: add asm9260-nand devicetree
 documentation
Message-ID: <20141231180156.26248676@bbrezillon>
In-Reply-To: <1420030733-10374-2-git-send-email-linux@rempel-privat.de>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <1420030733-10374-2-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 Dec 2014 13:58:52 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

Please add a commit message.

> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  .../devicetree/bindings/mtd/asm9260-nand.txt       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/asm9260-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/asm9260-nand.txt b/Documentation/devicetree/bindings/mtd/asm9260-nand.txt
> new file mode 100644
> index 0000000..07bfdac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/asm9260-nand.txt
> @@ -0,0 +1,25 @@
> +* Alphascales's asm9260_nand
> +
> +Required properties:
> +- compatible: "alphascale,asm9260-nand"
> +- reg: address range of the nfc block
> +- interrupts: irq to be used
> +- clocks: clock ids.
> +- clock-names: only "sys" and "ahb" should be used.

The following are optional properties

> +- nand-ecc-strength: see nand.txt
> +- nand-ecc-mode: see nand.txt
> +- nand-on-flash-bbt: see nand.txt
> +- nand-max-chips: maximal number of attached chips. asm9260 support max 2.
expect for this one ^

But again, since your NAND controller supports several NAND chips I
think the binding should be reworked to represent it.
How about making the controller a parent node and then each NAND chip a
child of this controller node?
Something similar to this binding [1].

Regards,

Boris

[1]https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/sunxi-nand.txt?id=refs/tags/v3.19-rc2
-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
