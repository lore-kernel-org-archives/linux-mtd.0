Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adJMy-0003yW-MD
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 15:16:21 +0000
Date: Tue, 8 Mar 2016 16:15:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com
Subject: Re: [PATCH 1/3] mtd: mediatek: device tree docs for MTK Smart
 Device Gen1 NAND
Message-ID: <20160308161545.4f7cb13f@bbrezillon>
In-Reply-To: <1456938013-8819-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed,  2 Mar 2016 12:00:11 -0500
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds documentation support for Smart Device Gen1 type of
> NAND controllers.
> 
> Mediatek's SoC 2701 is one of the SoCs that implements this controller.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  .../devicetree/bindings/mtd/mtksdg1-nand.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> new file mode 100644
> index 0000000..129d17b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> @@ -0,0 +1,38 @@
> +MTK Smart Device SoCs NAND controller DT binding
> +
> +Required properties:
> +- compatible:          Should be "mediatek,mt2701-nfc".
> +- reg:                 The first contains base physical address and size of
> +                       NAND controller's registers. The second contains base
> +                       physical address and size of NAND ECC engine.

Hm, I'd prefer if you split the ECC engine and NAND controller in two
different NANDs, and then link the NAND controller to the ECC engine
using a phandle.
That's the approach taken by the jz4780 driver [1], and I find it
cleaner than having 2 entries in the reg property.


[1]https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt?id=refs/tags/next-20160308

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
