Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWAw5-0006L7-Sw
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 18:32:58 +0000
Received: by lbbgg6 with SMTP id gg6so3865054lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 May 2012 11:32:53 -0700 (PDT)
Message-ID: <1337538771.1745.9.camel@koala>
Subject: Re: [patch] UBI: add in hex the value for UBI_INTERNAL_VOL_START to
 comment
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Sun, 20 May 2012 21:32:51 +0300
In-Reply-To: <alpine.DEB.2.00.1205201340410.26953@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205201340410.26953@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wjxSlWx4JflND0o3OvaW"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wjxSlWx4JflND0o3OvaW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-20 at 13:42 +0200, Joel Reardon wrote:
> Explicitly provide the first internal volume ID value in the comment for
> UBI_INTERNAL_VOL_START. This allows developers who, when adding features
> related to volume ids and observe unexpected very large volume ids, to gr=
ep
> for the observed value in the source code and find out immediately that i=
t is
> expected behaviour.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Pushed to linux-ubi.git, it is also in your branch, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-wjxSlWx4JflND0o3OvaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuTjTAAoJECmIfjd9wqK0liYP/3nr5K+VY3hudez6tUqg860+
8SnAusNGCQqSSWs/VQ/R3rJaoZIl+RQX7HTEYEsSy/Emc5J2WyO79RT7DLnlNsSk
Fuk4lrj104D70YjKLa2V5FekDmcrXP6LjfuDCYpc5lyPWXZCVnGeb0OCNIX/fc2I
5P/T7mmV1wr8TBHnQQ9Wm4VH3OrOEcnL9QP0fr8FnEzDDN5SpYNx4uJPeVwHRCqI
uzB3YfHwN9hSgMU9o7cWnsscAtCPFutdE41TEktd2V9eV2UG6nvwHDDSbmqHO3yS
otmWtP5Z3lZ3TRlUVMZHQiQAAIsUFVHYuX7HKV1juUpq5OZSMtgqt9FBzXWuVb5S
it3l1csj6gYajUK6ZRui4GKy7KR1udkEeqJtPOTbHEWqYSzgUvUS84zMJJCGBjhv
7Bqo60sIZ2wrfXEJkIb8FxZxf7Mia+10wmp4Djbn837AC7rH87ML0F3OFWT78mCm
wxMcrzjNBggnTZGB4y3FwLyx2IIHdx2MceAx/mdhj0owK98x9MnSsxwMWm8Luwl5
o3Y3iGyCXRESe3JQda9dsKbr5osewCDJFJLJ0aRYcunZ0z9DelgVy8YG42IBlfpk
m3/GYCw16YnfGfC44bT/TlF19h2pu71nmGJRmb/9+4B268LMgyY7DR1nwyfvnkG3
wVWbiIozkIl9naum+nAF
=556Z
-----END PGP SIGNATURE-----

--=-wjxSlWx4JflND0o3OvaW--
