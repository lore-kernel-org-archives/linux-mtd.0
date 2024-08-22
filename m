Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68201C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gd2eWAtH8GVOWFl/E1sVgXsCQGhABrEfbCA8OrJw3AE=; b=tyQru/7CujwKE4
	B21k9AHdo2CFLmopM2QIAUpTvQmfuJ0Lepbh0Ni11ckTYPObMISInWoSM+xWpi/0dEbn6jDx3BJd6
	wBnYO5GNWoLN5VX9h6sompFRnk9mZbASjM3fJt0mF35kodqWoR3b5M6YOeoOTeQ6Un0AuIQ3IwnLE
	AM2q1XTFCPL9FdQmAdHQi5OzYYBvwzjvTLfBlGt4zD1icqWIAstulwDfd0CIYcxJwG/F4EQYTo5DN
	08dVvDt/ClcWvid4u1vNBcbNIU4Jvms9I5LG70SJu549u9vjmWQr/dWVJgc0h6q3dyt0UGqNfJIYa
	PmFmpMfaRZ7YCUCbGY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7xs-0000000CyM5-3JV4;
	Thu, 22 Aug 2024 13:35:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7sh-0000000Cx1c-0Q7M
	for linux-mtd@lists.infradead.org;
	Thu, 22 Aug 2024 13:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16D3DA40299;
	Thu, 22 Aug 2024 13:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA63C4AF09;
	Thu, 22 Aug 2024 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333377;
	bh=lUGeJKqa7FN5d5xU6/U9g/Ib8k+Rf5qyVFTx8UgZZW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JmZjEYU2iu+6UC5CD7g5gPEhT/Z0upTF9xdUKkXhTn8ABWASDLGZuJnZkCFY+Ts6K
	 hW5J1T2LQFV3aNm9BQO8nXFgKZnjWIUlm1C1CvbbnMbgmqyr8uHUTEITka/DWn8L4y
	 pog/01Dj1xLNMDG0hiGhinAQ6P0lXtlrKYMZE1+x1GwvV+fvUDBpQGjhw2PSmer4L8
	 b6aRtWp8iFkC7D4ycirjrSPeTacpk0O/d23WB/vpS2vhjaps3PDON3owMbcgcCderL
	 sCDuLOtlk+5nlyInlDKbc53/TFGQyofRbsGA97l0uKEHj1J2ClR312glaV7Xn7e+Eb
	 9FBGiyXDPLv7g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Julien Su <juliensu@mxic.com.tw>,
  Alvin Zhou <alvinzhou@mxic.com.tw>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/9] mtd: spi-nand: Add continuous read support
In-Reply-To: <20240821162528.218292-5-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Wed, 21 Aug 2024 18:25:23 +0200")
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
	<20240821162528.218292-5-miquel.raynal@bootlin.com>
Date: Thu, 22 Aug 2024 15:29:34 +0200
Message-ID: <mafs04j7cznwh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_062939_304722_93743F3F 
X-CRM114-Status: GOOD (  45.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Aug 21 2024, Miquel Raynal wrote:

> A regular page read consist in:
> - Asking one page of content from the NAND array to be loaded in the
>   chip's SRAM,
> - Waiting for the operation to be done,
> - Retrieving the data (I/O phase) from the chip's SRAM.
>
> When reading several sequential pages, the above operation is repeated
> over and over. There is however a way to optimize these accesses, by
> enabling continuous reads. The feature requires the NAND chip to have a
> second internal SRAM area plus a bit of additional internal logic to
> trigger another internal transfer between the NAND array and the second
> SRAM area while the I/O phase is ongoing. Once the first I/O phase is
> done, the host can continue reading more data, continuously, as the chip
> will automatically switch to the second SRAM content (which has already
> been loaded) and in turns trigger the next load into the first SRAM area
> again.
>
> From an instruction perspective, the command op-codes are different, but
> the same cycles are required. The only difference is that after a
> continuous read (which is stopped by a CS deassert), the host must
> observe a delay of tRST. However, because there is no guarantee in Linux
> regarding the actual state of the CS pin after a transfer (in order to
> speed-up the next transfer if targeting the same device), it was
> necessary to manually end the continuous read with a configuration
> register write operation.
>
> Continuous reads have two main drawbacks:
> * They only work on full pages (column address ignored)
> * Only the main data area is pulled, out-of-band bytes are not
>   accessible. Said otherwise, the feature can only be useful with on-die
>   ECC engines.
>
> Performance wise, measures have been performed on a Zynq platform using
> Macronix SPI-NAND controller with a Macronix chip (based on the
> flash_speed tool modified for testing sequential reads):
> - 1-1-1 mode: performances improved from +3% (2-pages) up to +10% after
>               a dozen pages.
> - 1-1-4 mode: performances improved from +15% (2-pages) up to +40% after
>               a dozen pages.
>
> This series is based on a previous work from Macronix engineer Jaime
> Liao.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 9042a092687c..964c9035fdc8 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
[...]
> +
> +static DEFINE_STATIC_KEY_FALSE(cont_read_supported);
> +
> +static void spinand_cont_read_init(struct spinand_device *spinand)
> +{
> +	struct nand_device *nand = spinand_to_nand(spinand);
> +	enum nand_ecc_engine_type engine_type = nand->ecc.ctx.conf.engine_type;
> +
> +	/* OOBs cannot be retrieved so external/on-host ECC engine won't work */
> +	if (spinand->set_cont_read &&
> +	    (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
> +	     engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
> +		static_branch_enable(&cont_read_supported);
> +	}
> +}
> +
> +static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
> +				  struct mtd_oob_ops *ops)
> +{
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	struct nand_pos start_pos, end_pos;
> +
> +	/* OOBs won't be retrieved */
> +	if (ops->ooblen || ops->oobbuf)
> +		return false;
> +
> +	nanddev_offs_to_pos(nand, from, &start_pos);
> +	nanddev_offs_to_pos(nand, from + ops->len - 1, &end_pos);
> +
> +	/*
> +	 * Continuous reads never cross LUN boundaries. Some devices don't
> +	 * support crossing planes boundaries. Some devices don't even support
> +	 * crossing blocks boundaries. The common case being to read through UBI,
> +	 * we will very rarely read two consequent blocks or more, so it is safer
> +	 * and easier (can be improved) to only enable continuous reads when
> +	 * reading within the same erase block.
> +	 */
> +	if (start_pos.target != end_pos.target ||
> +	    start_pos.plane != end_pos.plane ||
> +	    start_pos.eraseblock != end_pos.eraseblock)
> +		return false;
> +
> +	return start_pos.page < end_pos.page;
> +}
> +
>  static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>  			    struct mtd_oob_ops *ops)
>  {
> @@ -684,7 +830,11 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>  
>  	old_stats = mtd->ecc_stats;
>  
> -	ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
> +	if (static_branch_unlikely(&cont_read_supported) &&
> +	    spinand_use_cont_read(mtd, from, ops))

This looks a bit odd. If your system has two NAND devices, one with
continuous read support and one without, you will enable this static
branch and then attempt to use continuous read for both, right? I think
spinand_use_cont_read() should have a check for spinand->set_cont_read,
otherwise you end up calling a NULL function pointer for the flash
without continuous read.

This would reduce the cost of checking set_cont_read in the hot path if
there are no flashes with continuous read. When you do have at least
one, you would have to pay it every time. I suppose you can do some sort
of double branch where you take the respective static branch if _all_ or
_none_ of the flashes have continuous read, and then the heterogeneous
setups do the check at runtime. But is spinand_mtd_read() even hot
enough to warrant such optimizations?

> +		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
> +	else
> +		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
>  
>  	if (ops->stats) {
>  		ops->stats->uncorrectable_errors +=
> @@ -874,6 +1024,9 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
>  	};
>  	struct spi_mem_dirmap_desc *desc;
>  
> +	if (static_branch_unlikely(&cont_read_supported))
> +		info.length = nanddev_eraseblock_size(nand);

Same here. With a heterogeneous setup, you will set length to eraseblock
size even for the non-continuous-read flash. Though from a quick look
info.length doesn't seem to be used anywhere meaningful.

In general, a static branch looks misused here. This isn't even a hot
path where you'd care about performance.

> + /* The plane number is passed in MSB just above the column address
> */ info.offset = plane << fls(nand->memorg.pagesize);
>  
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
