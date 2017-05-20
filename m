Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dC8ac-0001in-F7
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 17:54:56 +0000
Date: Sat, 20 May 2017 19:54:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 3/3] mtd: nand: add option to ignore bad blocks when
 erasing, opt-in through debugfs
Message-ID: <20170520195433.2f1970a9@bbrezillon>
In-Reply-To: <20170520152428.9184-4-mrugiero@gmail.com>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
 <20170520152428.9184-3-mrugiero@gmail.com>
 <20170520152428.9184-4-mrugiero@gmail.com>
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

Le Sat, 20 May 2017 12:24:28 -0300,
"Mario J. Rugiero" <mrugiero@gmail.com> a =C3=A9crit :

And again, pleases add a commit message.

> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 26 ++++++++++++++++++++++----
>  include/linux/mtd/nand.h     | 12 ++++++++++++
>  2 files changed, 34 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 52a257e12026..8cffea38a642 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -47,6 +47,7 @@
>  #include <linux/io.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/of.h>
> +#include <linux/debugfs.h>
> =20
>  static int nand_get_device(struct mtd_info *mtd, int new_state);
> =20
> @@ -3209,10 +3210,15 @@ int nand_erase_nand(struct mtd_info *mtd, struct =
erase_info *instr,
>  		/* Check if we have a bad block, we do not erase bad blocks! */
>  		if (nand_block_checkbad(mtd, ((loff_t) page) <<
>  					chip->page_shift, allowbbt)) {
> -			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
> -				    __func__, page);
> -			instr->state =3D MTD_ERASE_FAILED;
> -			goto erase_exit;
> +			if (!chip->dbg.scrub_enabled) {
> +				pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
> +				    	__func__, page);
> +				instr->state =3D MTD_ERASE_FAILED;
> +				goto erase_exit;
> +			} else {
> +				pr_warn("%s: erasing a bad block at page 0x%08x\n",
> +					__func__, page);
> +			}
>  		}
> =20
>  		/*
> @@ -4931,6 +4937,18 @@ int nand_device_register(struct mtd_info *mtd,
>  			 int defnr_parts)
>  {
>  	int ret =3D nand_device_register(mtd, defparts, defnr_parts);
> +	struct nand_debug_info *dbg;
> +
> +	if (!ret) {
> +		dbg =3D &mtd_to_nand(mtd)->dbg;
> +		dbg->scrub_enabled =3D false;
> +		dbg->dfs_scrub_enabled =3D debugfs_create_bool("scrub_enabled",

Or just "scrub", the enable/disable status is reflected by the value
exposed by the file.
BTW, not sure scrub is clear enough, how about "allow-bad-block-erase"?

> +							     0600,
> +							     mtd->dbg.dfs_dir,
> +							     &dbg->scrub_enabled);
> +		if (IS_ERR(dbg->dfs_scrub_enabled))
> +			dbg->dfs_scrub_enabled =3D NULL;
> +	}

I prefer:

	struct nand_debug_info *dbg;
	int ret;

	ret =3D mtd_device_register(mtd, defparts, defnr_parts);
	if (ret)
		return ret;

	dbg =3D &chip->dbg;
	dbg->scrub_enabled =3D false;
	dbg->dfs_scrub_enabled =3D debugfs_create_bool("scrub", 0600, mtd->dbg.dfs=
_dir,
						     &dbg->scrub_enabled);
	if (IS_ERR(dbg->dfs_scrub_enabled))
		dbg->dfs_scrub_enabled =3D NULL;
 =20
  	return 0;


This way the error path is easily identified and you don't have to add
an indentation level for the normal path.

}
