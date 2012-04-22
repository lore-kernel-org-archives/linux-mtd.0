Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwge-0005Lw-DD
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:18:45 +0000
Received: by mail-lb0-f177.google.com with SMTP id l5so3603928lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 06:18:44 -0700 (PDT)
Message-ID: <1335100568.28267.12.camel@brekeke>
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive
 number in case of unrecoverable error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun, 22 Apr 2012 16:16:08 +0300
In-Reply-To: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DS7Gg81UgB4HY+PgYgPY"
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


--=-DS7Gg81UgB4HY+PgYgPY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 22:54 +0200, Jean-Christophe DUBOIS wrote:
> As per load_xattr_datum() comment:
> 	rc < 0 : recoverable error, try again
> 	rc =3D 0 : success
> 	rc > 0 : Unrecoverable error, this node should be deleted.
>=20
> For now we were only returning negative number (so recoverable error).
> But a CRC failure or some inconsitent data seems fatal enough to
> consider the attribute instance (version) as lost.
>=20
> So this patch returns a positive number (1) when it detects an
> unrecoverable error.
>=20
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>

Looks sensible. But since I did not take your previous patch, you might
want to check whether this patch is really independent. Also, please,
tell  whether this fixes a real-life bug or you are fixing a complaint
of a static analysis tools or something like this? And please, tell how
you tested it.

Thanks!

--=20
Best Regards,
Artem Bityutskiy


--=-DS7Gg81UgB4HY+PgYgPY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlASYAAoJECmIfjd9wqK0dDwQAL2HowH6brkGOIgkKrhGpG/E
iLV9qd6nOfs2qaovqTD9wv2NKj2h763Kkt3lkt2CcQ6/fU5J107UZ+vLqZf+9l/B
6kU3yEWOiohulVuZHIKpRKTeWNEYmaPV8bGLWx3iYTK1uqX2iwdOM0dcP+p2nZTh
szuEzVAkOEDChXiyFMTF8/MKMYMGZmvbF8aM5tIqFawwzwrBJhu5lD9sc7eD7fcV
Opt5Okp0Fl5BQVeBsAFCcmjVBEq6Gmb3X2q0koLAkhR+4SkTwM6oDEZ1EYzag2oH
7x7s1OVIvkRvT6BZIRXOP2YdfDtkU0rdRsxkhhwH52mHfxaux3y7chq1SqvUo+sv
G8JZZI6i5u3rN+nCNmBl4WtxeJaLzX60TipPLQUJipKHPBAxn1IVGqOgmmi9rWwb
BwqxmXWs4wft5guiO+O2VofCMtwNAmAmxSg5+tSvHNKIC5MSwDS03EAHmHycn2S9
zvZf8/8tT2gaCqoCY+IDVjcdqHGyuZJ1lrd/z86jrU1zqSWSOXxOJPF9m+Agn73A
fG9MrJ+nAmJOgi4BO+C+tOJBlwHNqEAWL3+M88f0IMMTz1dlZeJoiIqFYiJoEkWG
OnW4uxdiuEy83YK4HiYeVcymgAVomUbCN9dQZzH92VmY3uG6rg9573z4H/ffhrZe
YV+InJnQmWubOYAJE6Wx
=R1un
-----END PGP SIGNATURE-----

--=-DS7Gg81UgB4HY+PgYgPY--
