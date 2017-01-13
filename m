Date: Fri, 13 Jan 2017 15:13:26 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Guochun Mao <guochun.mao@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King
 <linux@armlinux.org.uk>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] Documentation: mtk-quadspi: update DT bindings
Message-ID: <20170113151326.11e9451a@bbrezillon>
In-Reply-To: <1484291609-20195-2-git-send-email-guochun.mao@mediatek.com>
References: <1484291609-20195-1-git-send-email-guochun.mao@mediatek.com>
 <1484291609-20195-2-git-send-email-guochun.mao@mediatek.com>
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

On Fri, 13 Jan 2017 15:13:28 +0800
Guochun Mao <guochun.mao@mediatek.com> wrote:

> Add "mediatek,mt2701-nor" for nor flash node's compatible.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>  .../devicetree/bindings/mtd/mtk-quadspi.txt        |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index fb314f0..f83d31d 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -1,7 +1,9 @@
>  * Serial NOR flash controller for MTK MT81xx (and similar)
>  
>  Required properties:
> -- compatible: 	  should be "mediatek,mt8173-nor";
> +- compatible: 	  should contain:
> +		  "mediatek,mt2701-nor" for MT2701,
> +		  "mediatek,mt8173-nor" for MT8173.

Do you need to define a new compatible? If the IPs are exactly the same
in both SoCs it shouldn't be needed.

>  - reg: 		  physical base address and length of the controller's register
>  - clocks: 	  the phandle of the clocks needed by the nor controller
>  - clock-names: 	  the names of the clocks
