Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqhnX-0005CZ-5l
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 13:59:08 +0000
Received: by mail-wm0-x22d.google.com with SMTP id u206so127130290wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2016 06:58:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1460637534-5064-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460637534-5064-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Thu, 14 Apr 2016 10:58:44 -0300
Message-ID: <CAAEAJfBd=7=atzfwzeJk9+mjjvwZ4Gkwd2n+4c3m20Z4-MFQjA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Cleanup BBT initialization and release
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>
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

On 14 April 2016 at 09:38, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> The current NAND interface has a scan_bbt replaceable hook
> which allows drivers to specify ad-hoc BBT scanning.
>
> However, no user is currently using such feature, and all of
> them rely on the default BBT scan.
>
> Moreover, the current code leaks the allocated resources if
> the nand_default_bbt fails.
>
> Therefore this commit removes the nand_chip->scan_bbt hook,
> and instead introduces nand_init_bbt and nand_free_bbt to
> setup and release the BBT, respectively.
>
> Tha change makes sure that upon nand_init_bbt failure, all
> resources allocated get properly released.
>
> nand_init_bbt is invoked by nand_scan or nand_scan_tail.
> Drivers may override this, and invoke nand_init_bbt manually
> if NAND_SKIP_BBTSCAN flag is set.
>
> nand_free_bbt shouldn't be called by drivers, and is meant to
> be called by nand_release() only.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Talking on IRC, Boris pointed out that this patch is already addressed
in Peter's BBT reorganization patchset.

So, feel free to drop this or take it. I'm fine with either choice.

IMO, given Peter's series seems to be still under development,
it is safe to pick this patch now.

But on the other side, it really fixes a leak on the error path and
it's been like this since almost the dawn of time so I don't think
it's something to worry :-)

> --
> Fun note: we had a comment refering to a "nand_free_bbt" function,
> that never existed. After a bit of kernel archeology, it seems
> the comment was introduced when the bad block table support was
> added, but the function was missing right from the start.
> ---
>  drivers/mtd/nand/diskonchip.c          |  4 ++--
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  2 +-
>  drivers/mtd/nand/nand_base.c           | 17 ++++----------
>  drivers/mtd/nand/nand_bbt.c            | 42 ++++++++++++++++++++++++++--=
------
>  drivers/mtd/nand/nandsim.c             |  2 +-
>  include/linux/mtd/nand.h               |  5 ++--
>  6 files changed, 44 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.=
c
> index a023ab9e9cbf..33f101370a9a 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c
> @@ -1294,7 +1294,7 @@ static int __init nftl_scan_bbt(struct mtd_info *mt=
d)
>                 this->bbt_md =3D NULL;
>         }
>
> -       ret =3D this->scan_bbt(mtd);
> +       ret =3D nand_init_bbt(mtd);
>         if (ret)
>                 return ret;
>
> @@ -1341,7 +1341,7 @@ static int __init inftl_scan_bbt(struct mtd_info *m=
td)
>                 this->bbt_md->pattern =3D "TBB_SYSM";
>         }
>
> -       ret =3D this->scan_bbt(mtd);
> +       ret =3D nand_init_bbt(mtd);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index c50523b085ef..23c3ddfb4570 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1980,7 +1980,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *th=
is)
>         ret =3D nand_boot_init(this);
>         if (ret)
>                 goto err_out;
> -       ret =3D chip->scan_bbt(mtd);
> +       ret =3D nand_init_bbt(mtd);
>         if (ret)
>                 goto err_out;
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 1c2f7879c47a..5f04fa237434 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3199,8 +3199,6 @@ static void nand_set_defaults(struct nand_chip *chi=
p, int busw)
>                 chip->write_byte =3D busw ? nand_write_byte16 : nand_writ=
e_byte;
>         if (!chip->read_buf || chip->read_buf =3D=3D nand_read_buf)
>                 chip->read_buf =3D busw ? nand_read_buf16 : nand_read_buf=
;
> -       if (!chip->scan_bbt)
> -               chip->scan_bbt =3D nand_default_bbt;
>
>         if (!chip->controller) {
>                 chip->controller =3D &chip->hwcontrol;
> @@ -4423,9 +4421,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>         mtd->writebufsize =3D mtd->writesize;
>
>         /*
> -        * Initialize bitflip_threshold to its default prior scan_bbt() c=
all.
> -        * scan_bbt() might invoke mtd_read(), thus bitflip_threshold mus=
t be
> -        * properly set.
> +        * Initialize bitflip_threshold prior to nand_init_bbt() call.
> +        * Setting up the BBT might invoke mtd_read(), thus bitflip_thres=
hold
> +        * must be properly set.
>          */
>         if (!mtd->bitflip_threshold)
>                 mtd->bitflip_threshold =3D DIV_ROUND_UP(mtd->ecc_strength=
 * 3, 4);
> @@ -4435,7 +4433,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>                 return 0;
>
>         /* Build bad block table */
> -       return chip->scan_bbt(mtd);
> +       return nand_init_bbt(mtd);
>  err_free:
>         if (!(chip->options & NAND_OWN_BUFFERS))
>                 kfree(chip->buffers);
> @@ -4492,18 +4490,13 @@ void nand_release(struct mtd_info *mtd)
>
>         if (chip->ecc.mode =3D=3D NAND_ECC_SOFT_BCH)
>                 nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
> -
> +       nand_free_bbt(mtd);
>         mtd_device_unregister(mtd);
>
>         /* Free bad block table memory */
> -       kfree(chip->bbt);
>         if (!(chip->options & NAND_OWN_BUFFERS))
>                 kfree(chip->buffers);
>
> -       /* Free bad block descriptor memory */
> -       if (chip->badblock_pattern && chip->badblock_pattern->options
> -                       & NAND_BBT_DYNAMICSTRUCT)
> -               kfree(chip->badblock_pattern);
>  }
>  EXPORT_SYMBOL_GPL(nand_release);
>
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 2fbb523df066..ce006ae77a27 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -1069,8 +1069,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, =
struct nand_bbt_descr *bd)
>   * not it scans the device for manufacturer marked good / bad blocks and=
 writes
>   * the bad block table(s) to the selected place.
>   *
> - * The bad block table memory is allocated here. It must be freed by cal=
ling
> - * the nand_free_bbt function.
> + * The bad block table memory is allocated here.
>   */
>  static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd=
)
>  {
> @@ -1096,7 +1095,7 @@ static int nand_scan_bbt(struct mtd_info *mtd, stru=
ct nand_bbt_descr *bd)
>         if (!td) {
>                 if ((res =3D nand_memory_bbt(mtd, bd))) {
>                         pr_err("nand_bbt: can't scan flash and build the =
RAM-based BBT\n");
> -                       goto err;
> +                       goto err_free_bbt;
>                 }
>                 return 0;
>         }
> @@ -1109,7 +1108,7 @@ static int nand_scan_bbt(struct mtd_info *mtd, stru=
ct nand_bbt_descr *bd)
>         buf =3D vmalloc(len);
>         if (!buf) {
>                 res =3D -ENOMEM;
> -               goto err;
> +               goto err_free_bbt;
>         }
>
>         /* Is the bbt at a given page? */
> @@ -1122,7 +1121,7 @@ static int nand_scan_bbt(struct mtd_info *mtd, stru=
ct nand_bbt_descr *bd)
>
>         res =3D check_create(mtd, buf, bd);
>         if (res)
> -               goto err;
> +               goto err_free_vbuf;
>
>         /* Prevent the bbt regions from erasing / writing */
>         mark_bbt_region(mtd, td);
> @@ -1132,7 +1131,9 @@ static int nand_scan_bbt(struct mtd_info *mtd, stru=
ct nand_bbt_descr *bd)
>         vfree(buf);
>         return 0;
>
> -err:
> +err_free_vbuf:
> +       vfree(buf);
> +err_free_bbt:
>         kfree(this->bbt);
>         this->bbt =3D NULL;
>         return res;
> @@ -1273,13 +1274,28 @@ static int nand_create_badblock_pattern(struct na=
nd_chip *this)
>  }
>
>  /**
> - * nand_default_bbt - [NAND Interface] Select a default bad block table =
for the device
> + * nand_free_bbt - Free resources allocated by nand_init_bbt.
> + * @mtd: MTD device structure
> + */
> +void nand_free_bbt(struct mtd_info *mtd)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +       kfree(chip->bbt);
> +       if (chip->badblock_pattern &&
> +           chip->badblock_pattern->options & NAND_BBT_DYNAMICSTRUCT)
> +               kfree(chip->badblock_pattern);
> +}
> +EXPORT_SYMBOL_GPL(nand_free_bbt);
> +
> +/**
> + * nand_init_bbt - [NAND Interface] Initialize a bad block table for the=
 device
>   * @mtd: MTD device structure
>   *
>   * This function selects the default bad block table support for the dev=
ice and
>   * calls the nand_scan_bbt function.
>   */
> -int nand_default_bbt(struct mtd_info *mtd)
> +int nand_init_bbt(struct mtd_info *mtd)
>  {
>         struct nand_chip *this =3D mtd_to_nand(mtd);
>         int ret;
> @@ -1307,8 +1323,16 @@ int nand_default_bbt(struct mtd_info *mtd)
>                         return ret;
>         }
>
> -       return nand_scan_bbt(mtd, this->badblock_pattern);
> +       ret =3D nand_scan_bbt(mtd, this->badblock_pattern);
> +       if (ret) {
> +               if (this->badblock_pattern &&
> +                   this->badblock_pattern->options & NAND_BBT_DYNAMICSTR=
UCT)
> +                       kfree(this->badblock_pattern);
> +               return ret;
> +       }
> +       return 0;
>  }
> +EXPORT_SYMBOL_GPL(nand_init_bbt);
>
>  /**
>   * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 6ff1d8d31ac2..886fbd5f6feb 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -2378,7 +2378,7 @@ static int __init ns_init_module(void)
>         if ((retval =3D init_nandsim(nsmtd)) !=3D 0)
>                 goto err_exit;
>
> -       if ((retval =3D chip->scan_bbt(nsmtd)) !=3D 0)
> +       if ((retval =3D nand_init_bbt(nsmtd)) !=3D 0)
>                 goto err_exit;
>
>         if ((retval =3D parse_badblocks(nand, nsmtd)) !=3D 0)
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index e851839daf09..12161fcc80cb 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -598,7 +598,6 @@ struct nand_buffers {
>   * @buffers:           buffer structure for read/write
>   * @hwcontrol:         platform-specific hardware control structure
>   * @erase:             [REPLACEABLE] erase function
> - * @scan_bbt:          [REPLACEABLE] function to scan bad block table
>   * @chip_delay:                [BOARDSPECIFIC] chip dependent delay for =
transferring
>   *                     data from array to read regs (tR).
>   * @state:             [INTERN] the current state of the NAND device
> @@ -686,7 +685,6 @@ struct nand_chip {
>                         int page_addr);
>         int(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
>         int (*erase)(struct mtd_info *mtd, int page);
> -       int (*scan_bbt)(struct mtd_info *mtd);
>         int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int =
state,
>                         int status, int page);
>         int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> @@ -893,7 +891,8 @@ struct nand_manufacturers {
>  extern struct nand_flash_dev nand_flash_ids[];
>  extern struct nand_manufacturers nand_manuf_ids[];
>
> -extern int nand_default_bbt(struct mtd_info *mtd);
> +extern int nand_init_bbt(struct mtd_info *mtd);
> +extern void nand_free_bbt(struct mtd_info *mtd);
>  extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
>  extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
>  extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbb=
t);
> --
> 2.7.0
>



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
