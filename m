Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGnu0-0002CU-8J
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 13:13:26 +0000
Date: Wed, 6 Jan 2016 14:12:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, fransklaver@gmail.com,
 Peter Pan <peterpandong@micron.com>, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 karlzhang@micron.com
Subject: Re: [PATCH v2 02/12] mtd: nand_bbt: introduce struct nand_bbt
Message-ID: <20160106141258.5c1e5fc6@bbrezillon>
In-Reply-To: <1450159178-29895-3-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <1450159178-29895-3-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, Peter,

On Tue, 15 Dec 2015 05:59:28 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> From: Brian Norris <computersforpeace@gmail.com>
>=20
> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
>=20
> Separate struct nand_chip from BBT code can make current BBT shareable.
> We create struct nand_bbt to take place of nand_chip in nand_bbt.c
>=20
> Below is mtd folder structure we want:
> 	mtd
> 	=E2=94=9C=E2=94=80=E2=94=80 Kconfig
> 	=E2=94=9C=E2=94=80=E2=94=80 Makefile
> 	=E2=94=9C=E2=94=80=E2=94=80 ...
> 	=E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c
> 	=E2=94=9C=E2=94=80=E2=94=80 nand
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Makefile
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 nand_base.c
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 nand_ids.c
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ...
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xway_nand.c
> 	=E2=94=9C=E2=94=80=E2=94=80 spi-nand
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Makefile
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 spi-nand-base.c
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ...
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 spi-nand-device.c
> 	=E2=94=94=E2=94=80=E2=94=80 ...
>=20
> We put every information nand_bbt.c needed from outside into struct
> nand_bbt, include:
> 	@mtd:	pointer to MTD device structure
> 	@is_bad_bbm:	check if a block is factory bad block
> 	@mark_bad_bbm:	imitate a block as factory bad block
> 	@erase:	erase block bypassing resvered checks
> 	@bbt_options:	bad block specific options. All options used
> 			here must come from nand_bbt.h.
> 	@numchips:	number of physical chips, required for NAND_BBT_PERCHIP
> 	@bbt_td:	bad block table descriptor for flash lookup.
> 	@bbt_md:	bad block table mirror descriptor
> 	@chipsize:	the size of one chip for multichip arrays
> 	@chip_shift:	number of address bits in one chip
> 	@bbt_erase_shift:	number of address bits in a bbt entry
> 	@page_shift:	number of address bits in a page
> 	@bbt:	bad block table pointer
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> [Peter: correct comment style]
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  include/linux/mtd/nand_bbt.h | 59 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
>=20
> diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
> index 5a65230..e468571 100644
> --- a/include/linux/mtd/nand_bbt.h
> +++ b/include/linux/mtd/nand_bbt.h
> @@ -18,6 +18,8 @@
>  #ifndef __LINUX_MTD_NAND_BBT_H
>  #define __LINUX_MTD_NAND_BBT_H
> =20
> +struct mtd_info;
> +
>  /* The maximum number of NAND chips in an array */
>  #define NAND_MAX_CHIPS		8
> =20
> @@ -115,4 +117,61 @@ struct nand_bbt_descr {
>  /* The maximum number of blocks to scan for a bbt */
>  #define NAND_BBT_SCAN_MAXBLOCKS	4
> =20
> +/**
> + * struct nand_bbt - bad block table structure
> + * @mtd:	pointer to MTD device structure
> + * @is_bad_bbm:	check if a block is factory bad block
> + * @mark_bad_bbm:	imitate a block as factory bad block
> + * @erase:	erase block bypassing resvered checks
> + * @bbt_options:	bad block specific options. All options used
> + *			here must come from nand_bbt.h.
> + * @numchips:	number of physical chips, required for NAND_BBT_PERCHIP
> + * @bbt_td:	bad block table descriptor for flash lookup.
> + * @bbt_md:	bad block table mirror descriptor
> + * @chipsize:	the size of one chip for multichip arrays
> + * @chip_shift:	number of address bits in one chip
> + * @bbt_erase_shift:	number of address bits in a bbt entry
> + * @page_shift:	number of address bits in a page
> + * @bbt:	bad block table pointer
> + *
> + */
> +struct nand_bbt {
> +	struct mtd_info *mtd;
> +
> +	/*
> +	 * This is important to abstract out of nand_bbt.c and provide
> +	 * separately in nand_base.c and spi-nand-base.c -- it's sort of
> +	 * duplicated in nand_block_bad() (nand_base) and
> +	 * scan_block_fast() (nand_bbt) right now
> +	 *
> +	 * Note that this also means nand_chip.badblock_pattern should
> +	 * be removed from nand_bbt.c
> +	 */
> +	int (*is_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
> +
> +	/*
> +	 * Only required if the driver wants to attempt to program new
> +	 * bad block markers that imitate the factory-marked BBMs
> +	 */
> +	int (*mark_bad_bbm)(struct mtd_info *mtd, loff_t ofs);

Not sure what this function is really meant for, and it's not used in
the current patch series. Do you have an example where it would be
useful and how it would be implemented?
In any case, shouldn't we delay the creation of this method until we
have a real user?

> +
> +	/* Erase a block, bypassing reserved checks */
> +	int (*erase)(struct mtd_info *mtd, loff_t ofs);

Just a question about the above methods (->is_bad_bbm(),
->mark_bad_bbm() and ->erase()). Are those really meant to be defined
on a per-chip basis, or is this something set by the NAND controller, or
NAND interface common code (raw, SPI, onenand)?
In the latter case, I'd suggest defining a nand_bbt_ops struct where
you would put those methods, and then adding a
const struct nand_bbt_ops * field in nand_bbt.

I also think we should pass struct nand_bbt and not struct mtd as the
first argument of all this functions. mtd can thus be retrieved using
bbt->mtd (or even better, you could hide it behind an helper function).

> +
> +	unsigned int bbt_options;
> +	int numchips;
> +
> +	/*
> +	 * Discourage new custom usages here; suggest usage of the
> +	 * relevant NAND_BBT_* options instead
> +	 */
> +	struct nand_bbt_descr *bbt_td;
> +	struct nand_bbt_descr *bbt_md;
> +	u64 chipsize;
> +	int chip_shift;
> +	int bbt_erase_shift;
> +	int page_shift;
> +	u8 *bbt;
> +};

It seems that this nand_bbt struct is redefining some fields already
specified in nand_chip (->numchips, ->chipsize, ->chip_shift, ...), and
I guess those fields are also defined in onenand_chip and will be
defined in spi_nand_chip, so maybe it's time to create a nand_chip_info
or nand_chip_layout_info struct containing all those fields and pass a
const pointer to this struct when creating the bbt object.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
