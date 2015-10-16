Date: Fri, 16 Oct 2015 12:16:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: nand: sunxi: add randomizer support
Message-ID: <20151016121614.0686ec42@bbrezillon>
In-Reply-To: <1444929443-25537-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1444929443-25537-1-git-send-email-boris.brezillon@free-electrons.com>
 <1444929443-25537-4-git-send-email-boris.brezillon@free-electrons.com>
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

On Thu, 15 Oct 2015 19:17:23 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Add support for the randomizer engine available in Allwinner's NFC IP.
> 
> Randomization is useful to support modern NAND chips which are sensible to
> repeated patterns. On such NANDs you might experience an unexpectedly high
> number of bitflips when you repeat the same pattern all over a given NAND
> block.
> Randomizing input data mitigate this problem by avoiding such repeated
> patterns.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/sunxi_nand.c | 274 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 250 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index ef46ac6..5508ce8 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -60,6 +60,7 @@
>  #define NFC_REG_ECC_ERR_CNT(x)	((0x0040 + (x)) & ~0x3)
>  #define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
>  #define NFC_REG_SPARE_AREA	0x00A0
> +#define NFC_REG_PAT_ID		0x00A4
>  #define NFC_RAM0_BASE		0x0400
>  #define NFC_RAM1_BASE		0x0800
>  
> @@ -225,6 +226,7 @@ struct sunxi_nand_hw_ecc {
>   * @node:		used to store NAND chips into a list
>   * @nand:		base NAND chip structure
>   * @mtd:		base MTD structure
> + * @randomize:		randomize data
>   * @clk_rate:		clk_rate required for this NAND chip
>   * @timing_cfg		TIMING_CFG register value for this NAND chip
>   * @selected:		current active CS
> @@ -235,6 +237,7 @@ struct sunxi_nand_chip {
>  	struct list_head node;
>  	struct nand_chip nand;
>  	struct mtd_info mtd;
> +	bool randomize;

This variable is a leftover from a previous version, I'll drop it for
the next version.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
