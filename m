Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aL74o-0007ox-Mw
 for linux-mtd@lists.infradead.org; Mon, 18 Jan 2016 10:30:23 +0000
Date: Mon, 18 Jan 2016 11:29:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 cernekee@gmail.com, sboyd@codeaurora.org, andy.gross@linaro.org,
 dehrenberg@google.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/3] mtd: nand: don't select chip in nand_chip's
 block_bad op
Message-ID: <20160118112959.573ec33d@bbrezillon>
In-Reply-To: <1453110634-25995-2-git-send-email-architt@codeaurora.org>
References: <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1453110634-25995-1-git-send-email-architt@codeaurora.org>
 <1453110634-25995-2-git-send-email-architt@codeaurora.org>
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

Hi Archit,

On Mon, 18 Jan 2016 15:20:32 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> One of the arguments passed to struct nand_chip's block_bad op is
> 'getchip', which, if true, is supposed to get and select the nand device,
> and later unselect and release the device.
> 
> This op is intended to be replaceable by drivers. The drivers shouldn't
> be responsible for selecting/unselecting chip. Like other ops, the chip
> should already be selected before the block_bad op is called.
> 
> Remove the getchip argument from the block_bad op and
> nand_block_checkbad. Move the chip selection to nand_block_isbad, since it
> is the only caller to nand_block_checkbad which requires chip selection.
> 
> Modify nand_block_bad (the default function for the op) such that it
> doesn't select the chip.
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
> v6: As suggested by Boris, remove getchip arg altogether and select the
>     chip in nand_block_isbad
> 
>  drivers/mtd/nand/nand_base.c | 41 +++++++++++++++++++----------------------
>  include/linux/mtd/nand.h     |  2 +-
>  2 files changed, 20 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 928081b..1809c20 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -317,9 +317,9 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
>   *
>   * Check, if the block is bad.
>   */
> -static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
> +static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)

You also have to update the dummy ->block_bad() implementations in the
cafe_nand, diskonchip and docg4 drivers.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
