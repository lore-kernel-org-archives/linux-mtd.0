Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP25r-0006Pi-19
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:13:21 +0000
Date: Tue, 20 Nov 2018 10:13:03 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: keep original flags for every struct mtd_info
Message-ID: <20181120101303.762ab73e@bbrezillon>
In-Reply-To: <20181120085546.8336-1-zajec5@gmail.com>
References: <20181120085546.8336-1-zajec5@gmail.com>
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

On Tue, 20 Nov 2018 09:55:45 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> When allocating a new partition mtd subsystem runs internal tests in the
> allocate_partition(). They may result in modifying specified flags (e.g.
> dropping some /features/ like write access).
>=20
> Those constraints don't have to be necessary true for subpartitions. It
> may happen parent partition isn't block aligned (effectively disabling
> write access) while subpartition may fit blocks nicely. In such case all
> checks should be run again (starting with original flags value).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/mtdcore.c   | 2 ++
>  drivers/mtd/mtdpart.c   | 3 ++-
>  include/linux/mtd/mtd.h | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 97ac219c082e..2d24701255e5 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -665,6 +665,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  	} else {
>  		pr_debug("mtd device won't show a device symlink in sysfs\n");
>  	}
> +
> +	mtd->orig_flags =3D mtd->flags;
>  }
> =20
>  /**
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 99c460facd5e..2b6e53af47da 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -346,7 +346,8 @@ static struct mtd_part *allocate_partition(struct mtd=
_info *parent,
> =20
>  	/* set up the MTD object for this partition */
>  	slave->mtd.type =3D parent->type;
> -	slave->mtd.flags =3D parent->flags & ~part->mask_flags;
> +	slave->mtd.flags =3D parent->orig_flags & ~part->mask_flags;
> +	slave->mtd.orig_flags =3D slave->mtd.flags;
>  	slave->mtd.size =3D part->size;
>  	slave->mtd.writesize =3D parent->writesize;
>  	slave->mtd.writebufsize =3D parent->writebufsize;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index cd0be91bdefa..b491a08e87e5 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -207,6 +207,7 @@ struct mtd_debug_info {
>  struct mtd_info {
>  	u_char type;
>  	uint32_t flags;
> +	uint32_t orig_flags; /* Flags as before running mtd checks */

Hm, I'm not a big fan of this orig_flags field. I'd prefer to have
Miquel's patch series [1] ported to Linus, so that master can be
retrieved with a simple loop:

struct mtd_info *mtd_get_master(struct mtd_info *mtd)
{
	struct mtd_info *master =3D mtd;

	while (master->parent)
		master =3D master->parent;
}

[1]https://www.mail-archive.com/u-boot@lists.denx.de/msg297465.html
