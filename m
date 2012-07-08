Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SnqHM-0003I7-ES
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 12:08:05 +0000
Message-ID: <4FF9780D.4010709@nod.at>
Date: Sun, 08 Jul 2012 14:07:41 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: UBI fastmap updates
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <20120708144745.36109029@pixies.home.jungo.com>
In-Reply-To: <20120708144745.36109029@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigEDFE67F89D1E5D3F9ECC9E42"
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigEDFE67F89D1E5D3F9ECC9E42
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Shmulik!

Am 08.07.2012 13:47, schrieb Shmulik Ladkani:
> +
> +		/* TODO: if find_fastmap=3D=3D1, we do not enter this block at all.
> +		 * shouldn't we? shouldn't we care of compatability of unknown
> +		 * internal volumes OTHER than the fastmap ones, even if
> +		 * find_fastmap=3D=3D1?
> +		 */
> +

If find_fastmap=3D1 we scan only the first 64 PEBs (now by using scan_peb=
()).
When using fastmap can do not care about compatibility of unknown interna=
l volumes
at all.
Fastmap keeps only track of known (and compatible volumes).
Taking care of unknown internal volumes would imply a full scan.

		int lnum =3D be32_to_cpu(vidh->lnum);
> =20
>  		/* Unsupported internal volume */
> @@ -1221,6 +1228,7 @@ static void destroy_ai(struct ubi_attach_info *ai=
)
>   * scan_all - scan entire MTD device.
>   * @ubi: UBI device description object
>   * @ai: attach info object
> + * TODO: document @start

Tomorrow I'll send another kernel-doc update.
There more tags missing.

>   * This function does full scanning of an MTD device and returns compl=
ete
>   * information about it in form of a "struct ubi_attach_info" object. =
In case
> @@ -1350,6 +1358,11 @@ out_vidh:
>  out_ech:
>  	kfree(ech);
>  out_ai:
> +	/* TODO: doesn't seem clean to destroy 'ai' as it was allocated by th=
e
> +	 * caller, its his responsibility.
> +	 * also looks like it leads to double freee in case 'err' returned is=

> +	 * negative
> +	 */

I have to look closer into this.
It looks like the call to destroy_ai() in scan_fast() has to go.

>  	destroy_ai(ai);
>  	return err;
>  }
> @@ -1441,6 +1454,7 @@ int ubi_attach(struct ubi_device *ubi, int force_=
scan)
> =20
>  		err =3D scan_all(ubi, scan_ai, 0);
>  		if (err) {
> +			/* TODO: hmm... kfree or destroy_ai ? */

True. Must be desroy_ai().

>  			kfree(scan_ai);
>  			goto out_wl;
>  		}
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 50b7590..f769c22 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1053,6 +1053,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
>  	ubi_notify_all(ubi, UBI_VOLUME_REMOVED, NULL);
>  	dbg_msg("detaching mtd%d from ubi%d", ubi->mtd->index, ubi_num);
> =20
> +	/* TODO: any action on failure? */

What do you expect on failure?
At this point we have either no fastmap or a valid fastmap on flash.
If ubi_update_fastmap() fails it will ensure that no invalid fastmap rema=
ins on flash.
See invalidate_fastmap().

> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -272,6 +272,10 @@ static int produce_free_peb(struct ubi_device *ubi=
)
>  		dbg_wl("do one work synchronously");
>  		err =3D do_work(ubi);
>  		if (err)
> +			/* TODO: in the new locking scheme, produce_free_peb is
> +			 * called under wl_lock taken.
> +			 * so when returning, should reacquire the lock
> +			 */

Which new locking scheme?

>  			return err;
> =20
>  		spin_lock(&ubi->wl_lock);
> @@ -377,6 +381,7 @@ static struct ubi_wl_entry *find_wl_entry(struct ub=
i_device *ubi,
>  	 * as anchor PEB, hold it back and return the second best WL entry
>  	 * such that fastmap can use the anchor PEB later. */
>  	if (!ubi->fm_disabled && !ubi->fm && e->pnum < UBI_FM_MAX_START)
> +		/* TODO: do we have a risk returning NULL here? */

How?

>  		return prev_e;
> =20
>  	return e;
> @@ -405,6 +410,7 @@ static struct ubi_wl_entry *find_mean_wl_entry(stru=
ct ubi_device *ubi,
>  		/* If no fastmap has been written and this WL entry can be used
>  		 * as anchor PEB, hold it back and return the second best
>  		 * WL entry such that fastmap can use the anchor PEB later. */
> +		/* TODO: why this is specific just to < WL_FREE_MAX_DIFF case? */

Because find_wl_entry() already takes care of this.

Thanks,
//richard


--------------enigEDFE67F89D1E5D3F9ECC9E42
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP+XgNAAoJEN9758yqZn9ePqIH/i/RAnugdjNccspm6uE2OfQ5
o/VLzxLcaoRsnJHP+9zHt6T2OH/s4M+cZO+1A6WK4gOle089bB+9D0UacnoXGk0q
mE8yqnpTD48Vqr3SV6UJeKXEdlMGFyKljLCdDlzMDJV/fAOjmVa4Co1X44renkaY
0NX8QSnnIPFZkJkuj4JoiKJojJt5VioIFwn2qEivpX9n/88Ds8NxQSLVwLiNP7Ce
F28203uvtBIcDZ3n0jcQXamseGeHepWYHMEaBF8l49Wag/Kqmv3A5YKIFQonwdJY
g1RROjap+Ixg7FF2cdhXNBVlr0N0SKspvA+aDUzOKZhEn0ML9nXY8HjRiiKdlx0=
=6Ocp
-----END PGP SIGNATURE-----

--------------enigEDFE67F89D1E5D3F9ECC9E42--
