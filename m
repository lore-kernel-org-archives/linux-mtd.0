Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dABGs-0000tv-DI
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 08:22:28 +0000
Date: Mon, 15 May 2017 10:21:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170515102158.798f83f2@bbrezillon>
In-Reply-To: <20170512073946.812-1-mrugiero@gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <20170512073946.812-1-mrugiero@gmail.com>
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

+MTD maintainers

Hi Mario,

Can you please Cc NAND/MTD maintainers next time.

On Fri, 12 May 2017 04:39:46 -0300
"Mario J. Rugiero" <mrugiero@gmail.com> wrote:

> Some chips used under a custom vendor driver can get their blocks
> incorrectly detected as bad blocks, out of incompatibilities
> between such drivers and MTD drivers.
> When there are too many misdetected bad blocks, the device becomes
> unusable because a bad block table can't be allocated, aside from
> all the legitimately good blocks which become unusable under these
> conditions.
> This adds a build option to workaround the issue by enabling the
> user to free up space regardless of what the driver thinks about
> the blocks. It still warns about it, since that's potentially
> dangerous.
> 
> Example usage: recovering NAND chips on sunxi devices, as explained
> here: http://linux-sunxi.org/Mainline_NAND_Howto#Known_issues
> 
> v3: Warn when erasing a bad block, as suggested by Andrea Scian.
> 
> v2: Fix a typo in the config description.

For your future submissions, please put the changelog after the --- so
that it's dropped when applying the patch.

> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---

Here:

v3: ...

v2: ...

>  drivers/mtd/nand/Kconfig     | 9 +++++++++
>  drivers/mtd/nand/nand_base.c | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index c3029528063b..e0a32a34b6bf 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -36,6 +36,15 @@ config MTD_NAND_ECC_BCH
>  	  ECC codes. They are used with NAND devices requiring more than 1 bit
>  	  of error correction.
>  
> +config MTD_NAND_ERASE_BADBLOCKS
> +	bool "Enable erasing of bad blocks (DANGEROUS)"
> +	default n
> +	help
> +	  This enables support for attempting to erase bad blocks.
> +	  It is needed to workaround too many badblocks issue on chips used
> +	  under custom, incompatible vendor drivers.
> +	  Say N if unsure.
> +
>  config MTD_SM_COMMON
>  	tristate
>  	default n
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d474378ed810..282410813a9c 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3211,8 +3211,10 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  					chip->page_shift, allowbbt)) {
>  			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
>  				    __func__, page);
> +			#ifndef CONFIG_MTD_NAND_ERASE_BADBLOCKS

#ifndef statements should be at the beginning of the line. But anyway,
I think we all agree that always forcing bad block erasure is a bad
idea. If we accept to support this feature, this should be done through
a per-NAND-chip debugfs entry, with fine grained selection of the block
that we're allowing to be forcibly erased.

Here is a suggestion:

echo all > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
echo none > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
echo X,Y-Z,... > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks

where X is an eraseblock number, and X-Y is a range of eraseblocks.

BTW, maybe we should create and expose a top-level mtd debugfs directory
to avoid exposing MTD related things at the root of the debugfs FS.

Something like:

/sys/kernel/debug/mtd/<dev-type>/...

so for the NAND related bits it would be

/sys/kernel/debug/mtd/nand/...

MTD maintainers, any opinion on this?
