Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGnwF-0004Rv-2g
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:29:51 +0000
Message-ID: <1348651795.24309.49.camel@sauron.fi.intel.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jaya Kumar <jayakumar.lkml@gmail.com>
Date: Wed, 26 Sep 2012 12:29:55 +0300
In-Reply-To: <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2B3yDvbwFM3zptXrMpFR"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2B3yDvbwFM3zptXrMpFR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 13:42 +0800, Jaya Kumar wrote:
> I think what this means is that after doing the rootfs upgrade using
> ubiupdatevol, I must reboot into a 3rd partition running a minimal OS
> to perform the ubirename of roofs_reserve and then reboot again. This
> step seems expensive to have to boot into a 3rd partition to do the
> rename operation.
>=20
> I see someone else also has encountered this,
> http://comments.gmane.org/gmane.linux.drivers.mtd/39415 and solved by
> having a initramfs. I guess I could do that. But still seems messy.

Yes, the way it is currently implemented is:

1. ubirename /dev/ubi0 rootfs rootfs_reserve
2. UBI figures out that old 'rootfs' should be removed.
3. UBI changes the volume table and wipes old rootfs from there,
   and changes name 'rootfs_reserve' to 'rootfs'.

   Now if you have a power cut, you will no longer see the old rootfs
   vloume, only the new one.
4. Then UBI actually deletes the old volume from all the in-memory
   data structures. Obviously, you cannot use this volume at the same
   time.

But this can be improved, I did not think a lot about this, but I guess
if you just skip step 4, it should work. The rename will succeed, but
you will still see the old layout. And only when you reboot, you'll have
the old rootfs deleted and the new one being in place.

Or not even reboot - detach and attach back should be enough. I guess
you can hack this.

Also, I guess the rename path should not open the volume in the
exclusive mode.

--=20
Best Regards,
Artem Bityutskiy

--=-2B3yDvbwFM3zptXrMpFR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYssTAAoJECmIfjd9wqK0QJgP/1ce20pCxLmnFSNwrdb9zXjT
xWNmDlRGFY+Rvf0Tv//mnE9YuobHRFKJaaSHEoZSbQGgEUe1o99luLNpU0KuQI24
FtTbpATfEuKYVVbSyLkrm/7jEIUqnOCQoYzHUDx5AKmNX9J0+87Cfm+r00tohXVx
yFFAu/8lprXoBgP0TKbGjXe1XR57Zc5hh2ZvvhP4ikQE/oSD+6s0CqRkHGQPpKPZ
v6hVl0im/6bPSHkqOO2ElIrEBkRWu7c/wsUkkxIL8w2WLw7v+yyKibsDfZrwz8QC
UJ1ty4nxDwGZocz3JGYynFGH/kjBULiCGDJLF/SX8hgHiaqoCX480hp8D9ryswnL
+es/560ZCeGvWHcjg18MLullT0COxwUMJJb8AUEQtAE5ovrheqc0JlD6kggdUeAe
KMoYavtELsCIEKFZ3wlHG3QkWGKBrqGNIzYBFMmiIlU9W6/DG4UjuH9YlZ1XvroH
btmQkjnxMt11VlLxLhuEjwRNB9fQ0x3ZxzLjonkKrkJ6p7oO5e0O9PHupnu9SzDt
1WGuJ56JI+xIYgUB+dMEzECoy2Bd4Ut2EGd5Ga7iMrSbecQh8vP8pfkxgxin97nS
Z13c+wrmNIOnbi6dnx1Gzqwaj4IRU1dIG6mmrc9cArXJi6IffydH4+EnbqN5QlKc
KoC2zCsfB1KTrqBmKVLy
=zjot
-----END PGP SIGNATURE-----

--=-2B3yDvbwFM3zptXrMpFR--
