Date: Mon, 24 Jul 2017 11:14:11 -0500
From: Rob Herring <robh@kernel.org>
To: Guochun Mao <guochun.mao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: mtk-quadspi: update DT bindings
Message-ID: <20170724161411.6fjl7eee4auvco5z@rob-hp-laptop>
References: <1500607619-21969-1-git-send-email-guochun.mao@mediatek.com>
 <1500607619-21969-2-git-send-email-guochun.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500607619-21969-2-git-send-email-guochun.mao@mediatek.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 21, 2017 at 11:26:59AM +0800, Guochun Mao wrote:
> Add "mediatek,mt2712-nor" and "mediatek,mt7622-nor"
> for nor flash node's compatible.

The subject could be improved because it is exactly the same as the last 
patch adding the 2701 and 7623. Also, use "dt-bindings: mtd: ..." for 
the subject prefix.

> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>  .../devicetree/bindings/mtd/mtk-quadspi.txt        |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index 5ded66a..9845ff4 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -3,6 +3,8 @@
>  Required properties:
>  - compatible: 	  The possible values are:
>  		  "mediatek,mt2701-nor"
> +		  "mediatek,mt2712-nor"
> +		  "mediatek,mt7622-nor"
>  		  "mediatek,mt7623-nor"
>  		  "mediatek,mt8173-nor"
>  		  For mt8173, compatible should be "mediatek,mt8173-nor".
> -- 
> 1.7.9.5
> 
