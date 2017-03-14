Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cntX3-00060m-PV
 for linux-mtd@lists.infradead.org; Tue, 14 Mar 2017 20:59:05 +0000
Date: Tue, 14 Mar 2017 21:58:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] mtd: nand: use .read_oob() instead of .cmdfunc() for
 bad block check
Message-ID: <20170314215839.1df07d13@bbrezillon>
In-Reply-To: <1489513548-3248-1-git-send-email-yamada.masahiro@socionext.com>
References: <1489513548-3248-1-git-send-email-yamada.masahiro@socionext.com>
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

On Wed, 15 Mar 2017 02:45:48 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The nand_default_block_markbad() is the default implementation of
> chip->block_markbad().  This is called for marking a block as bad.
> It invokes nand_do_write_oob(), then calls a higher level accessor
> ecc->write_oob().
> 
> On the other hand, when reading BBM from the OOB, chip->block_bad()
> is called, and nand_block_bad() is the default implementation.  This
> function calls a lower level chip->cmdfunc().  If a driver wants to
> re-use nand_block_bad(), it is required to support NAND_CMD_READOOB
> in its cmdfunc().

This is part of the basic/mandatory operations that should be supported
by all drivers.

> This is strange.  If the controller supports
> optimized read operation and the driver has its own ecc->read_oob(),
> it should be able to use it.

I agree with this one. I guess the idea behind this default
implementation was to avoid reading the whole OOB area, or maybe this
function was implemented before we had ECC support. Anyway, the
overhead should be negligible with your approach.

> Besides, NAND_CMD_READOOB (0x50) is
> not a real command for large page devices.  So, recent drivers may
> not be happy to handle this command.

Well, that's the whole problem with the ->cmdfunc() hook, even if it's
passed raw NAND command identifiers, these are actually encoding NAND
operations, and not necessarily the exact command that should be sent to
the NAND.

See what's done in nand_command_lp(), and how some commands are
actually generating a sequence of 2 commands [1], or how
NAND_CMD_READOOB is transformed into NAND_CMD_READ0 [2].

My plan was to add a ->exec_op() hook that would be passed the whole
operation description (cmds+addrs+data info) and progressively get rid
of ->cmdfunc(), but I never had time to finish the implementation[3].

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> At first, I tried to call nand_do_read_oob() from nand_block_bad()
> in order to make to make things symmetry, but it did not work.
> chip->select_chip() is handled outside of nand_block_bad(), so
> nand_do_read_oob() can not be used there.
> 
> 
>  drivers/mtd/nand/nand_base.c | 38 +++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a3c0f47..78c5cd6 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -354,9 +354,9 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
>   */
>  static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
>  {
> -	int page, res = 0, i = 0;
> +	int page, res = 0, ret = 0, i = 0;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	u16 bad;
> +	u8 bad;
>  
>  	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
>  		ofs += mtd->erasesize - mtd->writesize;
> @@ -364,30 +364,26 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
>  	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
>  
>  	do {
> -		if (chip->options & NAND_BUSWIDTH_16) {
> -			chip->cmdfunc(mtd, NAND_CMD_READOOB,
> -					chip->badblockpos & 0xFE, page);
> -			bad = cpu_to_le16(chip->read_word(mtd));
> -			if (chip->badblockpos & 0x1)
> -				bad >>= 8;
> +		res = chip->ecc.read_oob(mtd, chip, page);
> +		if (!res) {
> +			bad = chip->oob_poi[chip->badblockpos];

Hm, even if the current code is only testing one byte, I wonder
if we shouldn't test the 2 bytes here when we're dealing with 16bits
NANDs.

> +
> +			if (likely(chip->badblockbits == 8))
> +				res = bad != 0xFF;
>  			else
> -				bad &= 0xFF;
> -		} else {
> -			chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
> -					page);
> -			bad = chip->read_byte(mtd);
> +				res = hweight8(bad) < chip->badblockbits;
> +			if (res)
> +				return res;
>  		}
>  
> -		if (likely(chip->badblockbits == 8))
> -			res = bad != 0xFF;
> -		else
> -			res = hweight8(bad) < chip->badblockbits;
> -		ofs += mtd->writesize;
> -		page = (int)(ofs >> chip->page_shift) & chip->pagemask;
> +		if (!ret)
> +			ret = res;

Hm, I'm not sure I understand what you're doing here. If res is != 0,
then an error occurred when reading the OOB area and you should
probably return the error code directly instead of trying to read the
OOB from next page. On the other hand, if res is 0, then ret will
always be 0, so I don't think this extra ret variable is needed.

> +
> +		page++;
>  		i++;
> -	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
> +	} while (chip->bbt_options & NAND_BBT_SCAN2NDPAGE && i < 2);

A for loop would probably make more sense here, but that's just a
detail.

>  
> -	return res;
> +	return ret;
>  }
>  
>  /**

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L824
[2]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L747
[3]https://github.com/bbrezillon/linux-sunxi/blob/nand-core-rework-v2/include/linux/mtd/nand2.h
