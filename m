Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzLlM-00070H-Ap
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 12:57:57 +0000
Date: Mon, 10 Sep 2018 14:57:44 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: prevent harmless warnings
Message-ID: <20180910145744.4a73b068@bbrezillon>
In-Reply-To: <20180907142954.13299-1-miquel.raynal@bootlin.com>
References: <20180907142954.13299-1-miquel.raynal@bootlin.com>
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

On Fri,  7 Sep 2018 16:29:54 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Since the addition of WARN_ON() in nand_subop_get_data/addr_len()
> helpers, this driver will produce harmless warnings (mostly at probe)
> just because it always called the *_data_len() helper in the parsing

			 ^calls

> function (even on non-data instructions, where this value is
> meaningless and unneeded.

			  ^ missing ')'

> 
> Fix these warnings by deriving the length only when it is relevant.
> 
> Fixes: 760c435e0f85 ("mtd: rawnand: make subop helpers return unsigned values")
> Cc: stable@vger.kernel.org

You can drop the above line this 760c435e0f85 was merged in 4.19-rc1.

If you're okay with these changes, no need to send a new version, I'll
fix it when applying.

Thanks,

Boris

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 7af4d6213ee5..bc2ef5209783 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -1547,7 +1547,7 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
>  	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
>  		unsigned int offset, naddrs;
>  		const u8 *addrs;
> -		int len = nand_subop_get_data_len(subop, op_id);
> +		int len;
>  
>  		instr = &subop->instrs[op_id];
>  
> @@ -1593,6 +1593,7 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
>  				nfc_op->ndcb[0] |=
>  					NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW) |
>  					NDCB0_LEN_OVRD;
> +				len = nand_subop_get_data_len(subop, op_id);
>  				nfc_op->ndcb[3] |= round_up(len, FIFO_DEPTH);
>  			}
>  			nfc_op->data_delay_ns = instr->delay_ns;
> @@ -1606,6 +1607,7 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
>  				nfc_op->ndcb[0] |=
>  					NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW) |
>  					NDCB0_LEN_OVRD;
> +				len = nand_subop_get_data_len(subop, op_id);
>  				nfc_op->ndcb[3] |= round_up(len, FIFO_DEPTH);
>  			}
>  			nfc_op->data_delay_ns = instr->delay_ns;
