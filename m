Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dO7Yr-0001qK-Qr
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 19:14:40 +0000
Date: Thu, 22 Jun 2017 21:14:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Tom Rini <trini@konsulko.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dt-bindings: mtd: elm: Correct compatible string
 requirement
Message-ID: <20170622211412.2c9729ab@bbrezillon>
In-Reply-To: <1498047726-31398-1-git-send-email-trini@konsulko.com>
References: <1498047726-31398-1-git-send-email-trini@konsulko.com>
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

On Wed, 21 Jun 2017 08:22:06 -0400
Tom Rini <trini@konsulko.com> wrote:

> The binding says that the compatible string must be "ti,am33xx-elm"
> but the code checks only for, and all functioning users set, this as
> "ti,am3352-elm" so correct the binding.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>

Applied.

Thanks,

Boris

> ---
> I have submitted a separate patch that correct the dm816x.dtsi to set
> the compatible string there for the elm from ti,816-elm to ti,am3352-elm
> and tested it on the hardware, where it works.  It is quite likely that
> dm814x.dtsi can be trivially corrected as it came after dm816x and
> before am335x but as I cannot test the hardware, I did not update that.
> ---
>  Documentation/devicetree/bindings/mtd/elm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
> index 8c1528c421d4..59ddc61c1076 100644
> --- a/Documentation/devicetree/bindings/mtd/elm.txt
> +++ b/Documentation/devicetree/bindings/mtd/elm.txt
> @@ -1,7 +1,7 @@
>  Error location module
>  
>  Required properties:
> -- compatible: Must be "ti,am33xx-elm"
> +- compatible: Must be "ti,am3352-elm"
>  - reg: physical base address and size of the registers map.
>  - interrupts: Interrupt number for the elm.
>  
