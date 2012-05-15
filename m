Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUCaj-0001yc-1N
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 07:54:45 +0000
Message-ID: <1337068687.2528.144.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtdoops: refactor loop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 15 May 2012 10:58:07 +0300
In-Reply-To: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
References: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wB+rHJ1lEq3e1Y0mJZpn"
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


--=-wB+rHJ1lEq3e1Y0mJZpn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 13:30 -0700, Brian Norris wrote:
> We can clean up the loop logic a bit, here. This refactoring was enabled
> in part by:
>=20
>  Commit bb4a09866 [mtdoops: clean-up new MTD API usage]
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed all 3 to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-wB+rHJ1lEq3e1Y0mJZpn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsgyPAAoJECmIfjd9wqK0tKcP/RAWqLX63v639R93Py3x1dMD
e10/yp4SQtKagZxovIi7TwO3vPpY8vunCtMdS82vGSIwAUGIwaS8+/hs4OjOJZSi
Kp5fmZNzYrePRAvxW64pPml78S9BBKl38yAoetoqGx0ysi7hl2IREubgth9H1iEl
2ogQzGBLuahP+0/5z4hk13Dh9ieRqTgIxeMvUPnFM5SUz5Uv8faYl2aQtcuKaDxV
PVzMLoGeJKxSIyu+hNFD4oUG7NY5UA7gR0l8MP8ROw5jqNK8W4JLChkX/C05O8+G
LWm3J8oAYySag/dXQIZ8KawkFef0OJ/mRRgg5GDk7ubaA6xW8nYcLAYO0aaS0Nd2
DLrdSRi0tMq3V16Wz2uV0LHWapRtj6QSC3KuP5Nz1/KVoGlamyYw3sJk4RICHtwL
Des408HYJAXHF9d0GPbY7DZND2DE8YgjrTAkYalCtOLVyncR41Dc+C3YzWfwGgL3
vXaQeIboybB9/Rgyc9CRaOQ6U1Y6zX/tqS/64YuElCNDvQNYOdgmIdLY+iAtq3/5
W0IKOu1A1ttbA8Abll7Ei1kM/jJzw3JdIW/3Q15NU9XbV+tBCXpW0fbZ+lhl6ULY
YZp9PKum3TlQMpdhzKgJezCIWNUy26UrHvJkz9ARcfkWxsSrZuzVlJr4JBs71BMk
hyzeg0UoTBxEEZptLCXI
=jf3N
-----END PGP SIGNATURE-----

--=-wB+rHJ1lEq3e1Y0mJZpn--
