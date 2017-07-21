Subject: Re: [PATCH] Documentation: mtk-quadspi: update DT bindings
To: Guochun Mao <guochun.mao@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1500607619-21969-1-git-send-email-guochun.mao@mediatek.com>
 <1500607619-21969-2-git-send-email-guochun.mao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3c0fcf5e-8b2d-6db3-b436-0cfba37dcbae@gmail.com>
Date: Fri, 21 Jul 2017 13:49:12 +0200
MIME-Version: 1.0
In-Reply-To: <1500607619-21969-2-git-send-email-guochun.mao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/21/2017 05:26 AM, Guochun Mao wrote:
> Add "mediatek,mt2712-nor" and "mediatek,mt7622-nor"
> for nor flash node's compatible.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/mtd/mtk-quadspi.txt        |    2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index 5ded66a..9845ff4 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -3,6 +3,8 @@
>   Required properties:
>   - compatible: 	  The possible values are:
>   		  "mediatek,mt2701-nor"
> +		  "mediatek,mt2712-nor"
> +		  "mediatek,mt7622-nor"
>   		  "mediatek,mt7623-nor"
>   		  "mediatek,mt8173-nor"
>   		  For mt8173, compatible should be "mediatek,mt8173-nor".
> 
