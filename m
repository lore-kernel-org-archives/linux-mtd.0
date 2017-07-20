Subject: Re: [PATCH] Documentation: mtk-quadspi: update DT bindings
To: Guochun Mao <guochun.mao@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1500539352-9499-1-git-send-email-guochun.mao@mediatek.com>
 <1500539352-9499-2-git-send-email-guochun.mao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8629861c-5da6-2ed3-cc69-e3ee18f48b07@gmail.com>
Date: Thu, 20 Jul 2017 11:55:12 +0200
MIME-Version: 1.0
In-Reply-To: <1500539352-9499-2-git-send-email-guochun.mao@mediatek.com>
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



On 07/20/2017 10:29 AM, Guochun Mao wrote:
> Add "mediatek,mt2712-nor" for nor flash node's compatible.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>   .../devicetree/bindings/mtd/mtk-quadspi.txt        |    1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index 5ded66a..592bb71 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -2,6 +2,7 @@
>   
>   Required properties:
>   - compatible: 	  The possible values are:
> +		  "mediatek,mt2712-nor"

Please sort in alphabetic order.

Thanks,
Matthias

>   		  "mediatek,mt2701-nor"
>   		  "mediatek,mt7623-nor"
>   		  "mediatek,mt8173-nor"
> 
