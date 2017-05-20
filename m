Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dC78C-0004WT-Ra
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 16:21:30 +0000
Date: Sat, 20 May 2017 18:21:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 1/3] mtd: create per-device and module-scope debugfs
 entries
Message-ID: <20170520182102.504f1372@bbrezillon>
In-Reply-To: <20170520152428.9184-2-mrugiero@gmail.com>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
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

Le Sat, 20 May 2017 12:24:26 -0300,
"Mario J. Rugiero" <mrugiero@gmail.com> a =C3=A9crit :

I'd like to have a bit more details explaining why you want to do that.
Something like:

"
Several MTD drivers are currently creating their own debugfs directory
at the root of the debugfs filesystem. Create an mtd directory and one
subdirectory per MTD device so that specific MTD drivers or sub-layers
(NAND, SPI-NOR, ...) can add their own debugfs files under a well known
directory instead of spreading them over the debugfs tree.
"

> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>

You forgot to add my Ack here.

> ---

There should be a changelog here, or in the cover letter describing the
evolution of this patch.

>  drivers/mtd/mtdcore.c   | 17 +++++++++++++++++
>  drivers/mtd/mtdcore.h   |  2 ++
>  include/linux/mtd/mtd.h | 10 ++++++++++
>  3 files changed, 29 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 1517da3ddd7d..461e8139ac2d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -40,6 +40,7 @@
>  #include <linux/slab.h>
>  #include <linux/reboot.h>
>  #include <linux/leds.h>
> +#include <linux/debugfs.h>
> =20
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> @@ -662,6 +663,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  	}
>  }
> =20
> +static struct dentry *dfs_dir_mtd;
> +
>  /**
>   * mtd_device_parse_register - parse partitions and register an MTD devi=
ce.
>   *
> @@ -701,6 +704,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, =
const char * const *types,
> =20
>  	mtd_set_dev_defaults(mtd);
> =20
> +	mtd->dbg.dfs_dir =3D debugfs_create_dir(mtd->name, dfs_dir_mtd);
> +	if (IS_ERR(mtd->dbg.dfs_dir))
> +		mtd->dbg.dfs_dir =3D NULL;
> +
>  	memset(&parsed, 0, sizeof(parsed));
> =20
>  	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
> @@ -740,6 +747,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  out:
>  	/* Cleanup any parsed partitions */
>  	mtd_part_parser_cleanup(&parsed);
> +	if (ret)
> +		debugfs_remove_recursive(mtd->dbg.dfs_dir);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
> @@ -754,6 +763,8 @@ int mtd_device_unregister(struct mtd_info *master)
>  {
>  	int err;
> =20
> +	debugfs_remove_recursive(master->dbg.dfs_dir);
> +
>  	if (master->_reboot)
>  		unregister_reboot_notifier(&master->reboot_notifier);
> =20
> @@ -1807,6 +1818,10 @@ static int __init init_mtd(void)
> =20
>  	proc_mtd =3D proc_create("mtd", 0, NULL, &mtd_proc_ops);
> =20
> +	dfs_dir_mtd =3D debugfs_create_dir("mtd", NULL);
> +	if (IS_ERR(dfs_dir_mtd))
> +		dfs_dir_mtd =3D NULL;
> +
>  	ret =3D init_mtdchar();
>  	if (ret)
>  		goto out_procfs;
> @@ -1816,6 +1831,7 @@ static int __init init_mtd(void)
>  out_procfs:
>  	if (proc_mtd)
>  		remove_proc_entry("mtd", NULL);
> +	debugfs_remove(dfs_dir_mtd);
>  	bdi_put(mtd_bdi);
>  err_bdi:
>  	class_unregister(&mtd_class);
> @@ -1826,6 +1842,7 @@ static int __init init_mtd(void)
> =20
>  static void __exit cleanup_mtd(void)
>  {
> +	debugfs_remove_recursive(dfs_dir_mtd);
>  	cleanup_mtdchar();
>  	if (proc_mtd)
>  		remove_proc_entry("mtd", NULL);
> diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
> index 55fdb8e1fd2a..b5d095d24087 100644
> --- a/drivers/mtd/mtdcore.h
> +++ b/drivers/mtd/mtdcore.h
> @@ -19,6 +19,8 @@ int parse_mtd_partitions(struct mtd_info *master, const=
 char * const *types,
> =20
>  void mtd_part_parser_cleanup(struct mtd_partitions *parts);
> =20
> +extern struct dentry *debug_mtd;
> +
>  int __init init_mtdchar(void);
>  void __exit cleanup_mtdchar(void);
> =20
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f8a2ef239c60..6cd0f6b7658b 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -206,6 +206,15 @@ struct mtd_pairing_scheme {
> =20
>  struct module;	/* only needed for owner field in mtd_info */
> =20
> +/**
> + * struct mtd_debug_info - debugging information for an MTD device.
> + *
> + * @dfs_dir: direntry object of the MTD device debugfs directory
> + */
> +struct mtd_debug_info {
> +	struct dentry *dfs_dir;
> +};
> +
>  struct mtd_info {
>  	u_char type;
>  	uint32_t flags;
> @@ -346,6 +355,7 @@ struct mtd_info {
>  	struct module *owner;
>  	struct device dev;
>  	int usecount;
> +	struct mtd_debug_info dbg;
>  };
> =20
>  int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
