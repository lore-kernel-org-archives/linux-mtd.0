Date: Thu, 7 Dec 2017 21:20:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: RogerCC Lin <rogercc.lin@mediatek.com>
Cc: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <xiaolei.li@mediatek.com>, <srv_heupstream@mediatek.com>,
 <bayi.cheng@mediatek.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: mtk: update DT bindings
Message-ID: <20171207212017.466842e6@bbrezillon>
In-Reply-To: <1512051045-24026-2-git-send-email-rogercc.lin@mediatek.com>
References: <1512051045-24026-1-git-send-email-rogercc.lin@mediatek.com>
 <1512051045-24026-2-git-send-email-rogercc.lin@mediatek.com>
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

On Thu, 30 Nov 2017 22:10:43 +0800
RogerCC Lin <rogercc.lin@mediatek.com> wrote:

> From: RogerCC Lin <rogercc.lin@mediatek.com>
> 
> Add MT7622 NAND Flash Controller dt bindings documentation.
> 

Applied the series.

Thanks,

Boris

> Signed-off-by: RogerCC Lin <rogercc.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtk-nand.txt | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index dbf9e05..0025bc4 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -12,8 +12,10 @@ tree nodes.
>  
>  The first part of NFC is NAND Controller Interface (NFI) HW.
>  Required NFI properties:
> -- compatible:			Should be one of "mediatek,mt2701-nfc",
> -				"mediatek,mt2712-nfc".
> +- compatible:			Should be one of
> +				"mediatek,mt2701-nfc",
> +				"mediatek,mt2712-nfc",
> +				"mediatek,mt7622-nfc".
>  - reg:				Base physical address and size of NFI.
>  - interrupts:			Interrupts of NFI.
>  - clocks:			NFI required clocks.
> @@ -142,7 +144,10 @@ Example:
>  ==============
>  
>  Required BCH properties:
> -- compatible:	Should be one of "mediatek,mt2701-ecc", "mediatek,mt2712-ecc".
> +- compatible:	Should be one of
> +		"mediatek,mt2701-ecc",
> +		"mediatek,mt2712-ecc",
> +		"mediatek,mt7622-ecc".
>  - reg:		Base physical address and size of ECC.
>  - interrupts:	Interrupts of ECC.
>  - clocks:	ECC required clocks.
