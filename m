Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScNo0-0003J9-3V
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 21:30:17 +0000
Message-ID: <4FCFCBE5.1000107@nod.at>
Date: Wed, 06 Jun 2012 23:30:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 5/5] UBI: fastmap: more tiny TODOs
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
 <1338909119-5188-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338909119-5188-6-git-send-email-dedekind1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig39C9138422C66DAD1FEB7DA9"
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig39C9138422C66DAD1FEB7DA9
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 05.06.2012 17:11, schrieb Artem Bityutskiy:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>=20
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  TODO                      |    2 ++
>  drivers/mtd/ubi/fastmap.c |    7 +++++++
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/TODO b/TODO
> index 17e30b6..a944159 100644
> --- a/TODO
> +++ b/TODO
> @@ -9,3 +9,5 @@ to the ubi-utils.git repository, to a separate branch a=
t the beginning
>     test UBI + fastmap with it.
>  3. Test the autoresize feature
>  4. Test 'ubi_flush()'
> +5. Test that the same UBI image works fine on both LE and BE machines.=
 I guess
> +   we can do this using sime kind of emulators?

Okay, I'll test the same image on x86 and ppc.

> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index f938507..d446fc3 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -455,6 +455,9 @@ out:
>   * @fm_raw: the fastmap it self as byte array
>   * @fm_size: size of the fastmap in bytes
>   */
> +/* TODO: please, make all pointers like 'fm_raw' of type void. It is i=
ndeed a
> + * pointer to data blob, it is not a pointer to a string of characters=
=2E Note,
> + * that in pointer arithmetics void * is the same as char *. */

I know that char * and void * are equivalent.
That's why I've chosen char *.
IMHO a blob is a string of chars. (Of course it's not a C sting).
Anyway, if you prefer void * I'll change it. :-)

>  static int ubi_attach_fastmap(struct ubi_device *ubi,
>  			      struct ubi_attach_info *ai,
>  			      char *fm_raw, size_t fm_size)
> @@ -503,6 +506,10 @@ static int ubi_attach_fastmap(struct ubi_device *u=
bi,
>  	if (fm_pos >=3D fm_size)
>  		goto fail_bad;
> =20
> +	/* TODO: this is difficult to read. Can we please have instead an
> +	 * aggregate data structure? I did not think hard on it may be you ha=
ve
> +	 * a good reason for this difficult style, but on the first glance it=

> +	 * does not look like. And where are all the endiness stuff?  */

Yes, it's difficult to read but an aggregate data structure is not really=
 doable.
Please let me explain why:

The fastmap data blob has not a fixed length and it's internal field don'=
t have fixed positions.

1 struct ubi_fm_sb followed by
1 struct ubi_fm_hdr followed by
1 struct ubi_fm_scan_pool followed by
free_peb_count+used_peb_count struct ubi_fm_ec followed by
vol_count (
 struct ubi_fm_volhdr
 struct ubi_fm_eba
)

You see that only the first three structs have fixed positions.
So, the whole blob cannot be mapped into one aggregate data structure.
And I really don't want to play nasty games with variable-length arrays i=
n stucts...

Why do you mean by "where are all the endiness stuff"?
The position calculation takes care about endiness.

Thanks,
//richard


--------------enig39C9138422C66DAD1FEB7DA9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPz8vlAAoJEN9758yqZn9e3dUIALY0sN+gf5MO+a/hLTMykrHh
u1REtgzxJvleeQYsrG0SHf9gTcYfvQPHR1HDvCrcFvY/3hWlc12p1Dio1i0MsU2k
n/NgKAJCReN7AaVvRnnE9ngwq36honlnUs4RveidKcadFEDwGAqSsCzEKkbGZLhS
y7S2XBF2dEBi3GNe8qALr+kK2MpjY5ntswtn3Nb2vDAUpVgcSMtKqY8WCqy0M5sK
fFEzv8m8MGNJD9s4zzn9Y/0lGVdu2d0I63SZctn5B4qAqHakYQmBMgi9jeGi8G2F
7TV9HbkaTkScV1nGuHBeXYJiFAuc2QnNVJsPhpqdWppkeBXks0wrjhx2/sygPVQ=
=+tB5
-----END PGP SIGNATURE-----

--------------enig39C9138422C66DAD1FEB7DA9--
