Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJn1k-0006ZV-6I
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 14:03:20 +0000
Received: by eye3 with SMTP id 3so4136647eye.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 07:03:18 -0700 (PDT)
Subject: RE: Subject: UBIFS and small dynamic files
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Date: Fri, 28 Oct 2011 17:03:16 +0300
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF2402CFE@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE0BF2402CFE@Cloud.RL.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+/JBXgxuKE9jUig59sao"
Message-ID: <1319810603.31184.184.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Daniel Wagener <daniel.wagener@kernelconcepts.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+/JBXgxuKE9jUig59sao
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-24 at 04:21 +0100, Jon Povey wrote:
> You need to rewrite files with safe POSIX semantics.
> It is not crash-safe to rewrite the target file directly (but many
> apps are naive and do this in an unsafe way)
>=20
> The right way to do it is write a new file on the same filesystem,
> fsync() it, then rename it over the target. The rename is atomic
> so after a crash you either get the old file or the new one.
>=20
> I had a quick google for the authoritative sequence but I couldn't
> find and can't remember it exactly. I think it might involve an fsync
> on the directory handle too if you want to be sure the new file has
> arrived on flash. This avoids syncing the entire filesystem
> or mounting it -o sync.

You can set per-file "sync" attribute as well.

Someone can also implement something similar as ext4 has in UBIFS: we
can sync when the last reference to the file descriptor is dropped. I
also described this in the MTD web site.

--=20
Best Regards,
Artem Bityutskiy

--=-+/JBXgxuKE9jUig59sao
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOqrYkAAoJECmIfjd9wqK0JnMP/1RLjYxxmmkNClnZRR4OpUnR
6oQ1DGAphDidJ2RUC/HZkmjN+/hvun6rzCsXJusfEsYJKXn/H3U7l9OIaGJfiPgf
v7ZThobz9YTIEUuaPQmT+8rk4/KMdQ1Tqb7T8tbwapa5T4MSUhkdmRADyeBe1LPG
Cr9JN065Lvip8VE+lJxBWpGOGVo022jIs6Zw/88GTs+djS85ufw8S6YXu6H4dC17
oUg1eVO8PC1F9Z2u32RQFy9unm822PlR7xkOq6RBFvc/ZvWHrw6Td81Ku8Ux9sLe
exNO9pXIcnUd7KIXGSdYIaaNdSWAUwZxh7l3APfHq/Q16zTZsUbf4nK9QpnnboNA
0way7h7xcZGepkklj9NLxe9dhm41J6GhVEzLSimAVjyhhu2CWqpfAaODIcRxpBSO
9SY1jLSGvZp0db+aDjab71/7KEU4vFRIgetUG29kLs1Erb8zZqE86dJ6ebLXTRdb
ISZQ2k5t2l40Aom46CXICRcJ+vopkzr+1nhvA43fuxxDxQUnbFksBNC+k4Wri390
RV7FtM78Pc9IF86Qd/U9U88CFUNjPuHhOHqngYtC2zOYG2BMqTWM7T8ENn4Z4E1V
3d7oKB6Bd9vS1/TpBo7AdGZ3xYmmyEnD0pkUMt5oDsCINUqKiiPUCtYLvYTvU/Ky
+6m9l/zwSgnoMvx87v7/
=x+Ov
-----END PGP SIGNATURE-----

--=-+/JBXgxuKE9jUig59sao--
