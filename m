Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmBSs-0002sI-JE
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 03:43:40 +0000
Received: by mail-wm0-x243.google.com with SMTP id z63so318184wmg.2
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 19:43:18 -0800 (PST)
Subject: Re: [v2, 4/4] dt-bindings: mtd: Add Octal SPI support to Cadence QSPI.
To: Artur Jedrysek <jartur@cadence.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
 <1488960326-13858-1-git-send-email-jartur@cadence.com>
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <132a4818-11d1-263f-aae4-bac4e76c14c8@gmail.com>
Date: Fri, 10 Mar 2017 04:39:27 +0100
MIME-Version: 1.0
In-Reply-To: <1488960326-13858-1-git-send-email-jartur@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/08/2017 09:05 AM, Artur Jedrysek wrote:
> This patch updates Cadence QSPI Device Tree documentation to include
> information about new compatible used to indicate, whether or not
> Octal SPI transfers are supported by the device.
> 
> Signed-off-by: Artur Jedrysek <jartur@cadence.com>
> ---
> Changelog:
> v2: Use new compatible, instead of boolean property, to indicate
> Octal SPI support.
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> index f248056..41d1e98 100644
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -1,7 +1,9 @@
>  * Cadence Quad SPI controller
>  
>  Required properties:
> -- compatible : Should be "cdns,qspi-nor".
> +- compatible : Should be "cdns,{qspi|ospi}-nor".

Please explicitly list all compatibles , ie.
Should be "cdns,qspi-nor" or "cdns,ospi-nor".

But I think the ospi is backward compatible with qspi, right ? So the
binding for ospi should list both, ie.
compatible = "cdns,ospi-nor", "cdns,qspi-nor";

> +  Use "cdns,qspi-nor" for Quad SPI controller.
> +  Use "cdns,ospi-nor" for Octal SPI controller.
>  - reg : Contains two entries, each of which is a tuple consisting of a
>  	physical address and length. The first entry is the address and
>  	length of the controller register set. The second entry is the
> 


-- 
Best regards,
Marek Vasut
