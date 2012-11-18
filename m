Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ta2NV-00039g-CF
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2012 10:45:30 +0000
Received: by mail-lb0-f177.google.com with SMTP id n10so1251210lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2012 02:45:26 -0800 (PST)
Message-ID: <1353235514.1592.0.camel@kyv>
Subject: Re: [PATCH Resend] mtd: s3c2410: Fix potential NULL pointer
 dereference error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Sun, 18 Nov 2012 12:45:14 +0200
In-Reply-To: <1353062302-10266-1-git-send-email-sachin.kamat@linaro.org>
References: <1353062302-10266-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GVN1WXWFBY5ljgfyIf3M"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GVN1WXWFBY5ljgfyIf3M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-16 at 16:08 +0530, Sachin Kamat wrote:
> 'set' is tested for NULL. But subsequently accessed without the check.
> Thus making it conditional to avoid NULL pointer dereferencing.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-GVN1WXWFBY5ljgfyIf3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQqLw6AAoJECmIfjd9wqK0uMcQAKWdv6a7aSJGwgaL/00DPcGK
E3ne6eYlzt0txiSMpvbaGjmJZOJGANsKn7fbjsj2tiBr/fmDqvT7gR/8i81XoMQl
o10Fjqb2lHH+zV9RU7t0AKvBfewYaKRo36BaQkYyNgOaKXMnxRQFoFllBM+oGm+3
qBFXAz5516Dug8YI8duNmj7WwbOD3IXQ8gVuWQCUMl25vWqwcEr81OhaDUxYY+lx
EgTkFY+1DuvUQjIJzl+5kQkrS3Fn0YqCu675LeOM0O5D+rsCCg4IhGJ9kHdvXBJy
9XONZ5iVFt58Pzu8jspDHlmR85eOk2dn7z2YCqWZ9NA2hnD/pTKN2yWHZI768frs
Uwsm/vwQ0drO2I0aqQP1ip54VWY0R3K1BA0dPNbsh52+oPLQx3jh/03etGk/WBY9
1H79Jmzx7kryj25oiqBJ+iIrtn3CZpWoxzbkfjbrFcFV2MXNNhkv5rYcgEcNlaia
tHQ1OGjDeQLmRfx3bpvw9kA/2HJFV4vtSy5Jdo9Bz+AtJhBwgVULS+RO2eU1GGEq
0GdZ1Tcyrk+fSSG0YhQVCw1ojn2Pcs/OXUxJ6J+dK4e9TNiqSb4+aCUa6YhaBx+G
6PG8lywlelyAxPGyvtXlM5GkhSn27VReI7JRUWmAKpYtsqz7TZ2NBXjiiO+WL0nL
ghW4PmdqLHIVbrgZmPG7
=4xD9
-----END PGP SIGNATURE-----

--=-GVN1WXWFBY5ljgfyIf3M--
