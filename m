Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtD6H-0000p8-VI
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 06:58:26 +0000
Received: by pbdx9 with SMTP id x9so3192677pbd.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 22:58:23 -0800 (PST)
Message-ID: <1328252423.6750.47.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/4] jffs2: Remove unnecessary OOM messages
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
Date: Fri, 03 Feb 2012 09:00:23 +0200
In-Reply-To: <98592226b940c1fa59ced4a28418343508714161.1328049542.git.joe@perches.com>
References: <cover.1328049542.git.joe@perches.com>
 <98592226b940c1fa59ced4a28418343508714161.1328049542.git.joe@perches.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IGf1R394+TPJhxFq/2C3"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IGf1R394+TPJhxFq/2C3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 14:42 -0800, Joe Perches wrote:
> Per call site OOM messages are unnecessary.
> k.alloc and v.alloc failures use dump_stack().
>=20
> Signed-off-by: Joe Perches <joe@perches.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-IGf1R394+TPJhxFq/2C3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK4YHAAoJECmIfjd9wqK04o4P/jseB136azEkGBN+9OdQCjh1
m6Gdxu8z1VPvH+/E0okJmoYrzl3W6Vwf56tz3lsDflOorFHtlnsTTEA0SR0Ci5/V
o8CPoAMpvXR9ZuM4ZKezKqT8rrz6R9Kxcy6jaOfq3RPkjz0s5inqJvJa8jMHkpD5
BfqUKxo/vQsTU3UObgenm6QfVd+D+GTDL6dw0QiPuGV1NqwwxiJZqUUrcoKU16l0
UsW7Q/pYfVSYaJrr+SOcqEewi1GpBNDk9oG9gCygb6lwHt9t/uO8LFJRHoXpiDpd
ZEITACcEkshZqEfP4nk5TNAOZUwMxqQ2QqazraKWvTnjr7GbzmpbPx1MGxtYEKqR
wae/M1EXJDzRqk2Qd2hElX7mD4Gr73y5eUKEdmO37im5z7UddvVlZNCFZcwY71EL
2JkE43LftqEHwas9rNSM2/2wKCuBMn7Stw4yUUtD33g7MRx31p/abE29hWyF8Juo
DUeMQ56E+aGsLXLmLLrs4ZC3XQLueARuBtwugy42PjAUMDYdRoUOt9kZWFl7a0g6
d8uTrjqHSZ/wDlzm6JC59rxcjPvGUeY7q1FLaYfb8cyrVVKVoCOAOjMu8yWVgFBU
h7WawO7/hLH24hCuUjgKVpYWX5vgV80YHXom9IW0s7Tj0f7F6AaaJhH/AE6PWQwA
akY6iQKc14NTQAmD2bl4
=BP6n
-----END PGP SIGNATURE-----

--=-IGf1R394+TPJhxFq/2C3--
