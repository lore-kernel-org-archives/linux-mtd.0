Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfnwk-0007uO-9G
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 08:33:43 +0000
Message-ID: <1354610079.11583.58.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] ubi: Remove PEB from free tree in get_peb_for_wl()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 04 Dec 2012 10:34:39 +0200
In-Reply-To: <1354564667-9549-2-git-send-email-richard@nod.at>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <1354564667-9549-2-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Ecqj4SqTReSQamhufbD3"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, zsadecki@itwatchdogs.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Ecqj4SqTReSQamhufbD3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 20:57 +0100, Richard Weinberger wrote:
> If UBI is built without fastmap, get_peb_for_wl() has to
> remove the PEB manially from the free tree.
> Otherwise the requested PEB lives in two trees.
>=20
> Reported-by: Zach Sadecki <zsadecki@itwatchdogs.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Thanks Richard, I'll send this to Linus ASAP.

> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index da7b449..1f9f5f7 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -679,7 +679,13 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ub=
i_device *ubi)
>  #else
>  static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
>  {
> -	return find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
> +	struct ubi_wl_entry *e;
> +
> +	e =3D find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
> +	self_check_in_wl_tree(ubi, e, &ubi->free);

Looking at all for these 'self_check_in_wl_tree()', I think can kill
most of them and just make 'find_wl_entry()' complain if it did not find
anything. But this is a subject of a separate patch.

--=20
Best Regards,
Artem Bityutskiy

--=-Ecqj4SqTReSQamhufbD3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvbWfAAoJECmIfjd9wqK0Dc4QALI3lepu6pMdin/RGK7jItBM
xzdtwqqM6gL+Eb1GO/xZlRfxvfENSGErt8Ch61Ju4yCPHaAykf+lRBUiYcLoVqkf
xe+lyWYDUVmZ6T2w8UHTZckaXj7G62jqKNTtguKeedhdzAHb4ocErc4Cxceh8zrf
ExEhVKVzjuuHg35Dkd9Re4vBZYHfCOtmH5e3dAVHhHOfREDwvV38qNOIGTGsbcxb
Uz+BaRiEZ/nLUIwrTafiAhcpIaQ0UapeHSp5M9HGmUsS7l7Sw2qbXEqhiCC1p3wD
gMXgqwVQfH5ekxvOwudKPUVw2Hk9I8zyDeTZhXnJsI7/faSo87CBp71Dto8r29OT
34PnBHsx8bKPYsWlkwfmQEMb9RbMj9yMgGHLdXe8DvUtn6vuEELYDdmEAghLdUBr
kmfRqrEd/j9aE8AYwAAHtpUF+JbVqndnbYojchU3CPY1+pDoEEFtGvmqt8n0bc5h
9XLu82+BMV5lc+WL2EzmasPiW4IbyEuAkbYZ4fovkKzX6tniB2dWhXizjBHdk0f5
7Op4RqDThshR49JIUic2O/mIiTTIpiTomvCtmUu4D/Gb61I8h9HvWVZ9MeiaRQZj
ZVfiCgaMulFD3+xkxH8YsiehlPh8Y5vt7QOgAbBHDjkOXl613I3k8BvZrU+a4OpY
TWqdAhQxDfD8UDom81Vp
=bIbY
-----END PGP SIGNATURE-----

--=-Ecqj4SqTReSQamhufbD3--
