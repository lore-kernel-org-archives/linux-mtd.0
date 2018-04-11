Date: Wed, 11 Apr 2018 21:13:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <richard@nod.at>, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH 3/8] mtd: rawnand: mtk: Add DT property mtk,fdm-ecc-size
Message-ID: <20180411211308.436d19c0@bbrezillon>
In-Reply-To: <1523418118-57686-4-git-send-email-xiaolei.li@mediatek.com>
References: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
 <1523418118-57686-4-git-send-email-xiaolei.li@mediatek.com>
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

On Wed, 11 Apr 2018 11:41:53 +0800
Xiaolei Li <xiaolei.li@mediatek.com> wrote:

> For some MTK NAND chips, BootROM may access more than one byte
> ECC protected FDM data, but now we fix ECC protected FDM byte as 1.
> This will make some chips be failed to boot up.
> 
> With this DT property setting, different MTK NAND chips with the same
> NAND controller IP can work well.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtk-nand.txt |  6 ++++++
>  drivers/mtd/nand/raw/mtk_nand.c                    | 25 ++++++++++++++++------
>  2 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index ef786568..a8e4136 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -47,6 +47,12 @@ Children nodes properties:
>  - reg:			Chip Select Signal, default 0.
>  			Set as reg = <0>, <1> when need 2 CS.
>  Optional:
> +- mtk,fdm-ecc-size:	Integer representing ECC protected FDM bytes.
> +			Should be in the range [1,8], if not present 1.
> +			On some MTK NAND chips, BootROM may access more than
> +			one byte ECC protected FDM data. Different MTK chips
> +			with the same NAND controller IP will work well with
> +			this properity setting.

Is this something that changes on a per-SoC basis, or can a specific
SoC have a different behavior depending on the version of the BootROM
it embeds (that would be quite tricky to deal with since that would
mean having different dts if you start using newer revisions of the same
SoC).

If it's on a per-SoC basis, I'd recommend defining new compatibles
instead of adding this property.
