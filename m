Subject: Re: [PATCH v4 1/4] mtd: nand: mediatek: update DT bindings
To: Xiaolei Li <xiaolei.li@mediatek.com>, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 rogercc.lin@mediatek.com, yt.shen@mediatek.com, srv_heupstream@mediatek.com
References: <1496201877-34373-1-git-send-email-xiaolei.li@mediatek.com>
 <1496201877-34373-2-git-send-email-xiaolei.li@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e9286a90-8829-8b37-476a-ac8bd057d341@gmail.com>
Date: Tue, 6 Jun 2017 12:55:48 +0200
MIME-Version: 1.0
In-Reply-To: <1496201877-34373-2-git-send-email-xiaolei.li@mediatek.com>
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



On 31/05/17 05:37, Xiaolei Li wrote:
> Add MT2712 NAND Flash Controller dt bindings documentation.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Subject line should be something like;
dt-bindings: mtd: Update mediatek bindings.

>   Documentation/devicetree/bindings/mtd/mtk-nand.txt | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index 069c192..dbf9e05 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -12,7 +12,8 @@ tree nodes.
>   
>   The first part of NFC is NAND Controller Interface (NFI) HW.
>   Required NFI properties:
> -- compatible:			Should be "mediatek,mtxxxx-nfc".
> +- compatible:			Should be one of "mediatek,mt2701-nfc",
> +				"mediatek,mt2712-nfc".
>   - reg:				Base physical address and size of NFI.
>   - interrupts:			Interrupts of NFI.
>   - clocks:			NFI required clocks.
> @@ -141,7 +142,7 @@ Example:
>   ==============
>   
>   Required BCH properties:
> -- compatible:	Should be "mediatek,mtxxxx-ecc".
> +- compatible:	Should be one of "mediatek,mt2701-ecc", "mediatek,mt2712-ecc".
>   - reg:		Base physical address and size of ECC.
>   - interrupts:	Interrupts of ECC.
>   - clocks:	ECC required clocks.
> 
