Message-ID: <1350478066.5769.149.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 06/11] fsmc/nand: Modify the wait to uninterruptible
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Wed, 17 Oct 2012 15:47:46 +0300
In-Reply-To: <3dcb002d0ad03dde9a91e8128dbaa320b8a264a9.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <3dcb002d0ad03dde9a91e8128dbaa320b8a264a9.1349778821.git.vipin.kumar@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xz1u90G2mAuEbQ5+msKt"
Mime-Version: 1.0
Cc: plagnioj@jcrosoft.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xz1u90G2mAuEbQ5+msKt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-09 at 16:14 +0530, Vipin Kumar wrote:
> Interruptible wait caused trouble in fsmc hardware state machine if the
> application was killed abruptly. To make fsmc operation safe turn wait in=
 to
> un-interruptible.
>=20
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Pushed this one to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-xz1u90G2mAuEbQ5+msKt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfqjyAAoJECmIfjd9wqK0zuUP/jumn8llmvhcjdY0JALoLGMg
adGeAKQuRaxWKmTVRG8IyWXrrjAooc2d7eKvhktgayOkB+lCZbi4e5BNzY/BDaUX
IqJX0DQmpeVwoK+IG8qytp7+9fWKlvcT5ChMjnq692YtdaWjIwfkX+6zpyQXapn8
nDmSEUTzOAitTazwv8zD+ZaRd/HwA16b1dmmYbxw8qRxkREwGhEdUuHWqNj51enH
n5t3/8PHDTyBNvEOXj2qRwpT10fUBDFZ5ey9Ldsk0gHwI3yKGHjAoe2+teZs8zzJ
dV7PZz9AgIxYp8fUJp4qevb644RyEU8lvEh6rBDaKwBReKc9/p0NeLkD3XdXO/i6
0KaTJLRY3gXNaEX1BxI4VFQsJA/ZWai+rtKT1YaQzoHDHNYHj+Y89JiAFroC189f
9oqEnHitHDiv3wsC62WRY9RvIMP+4FdRy1jsoHCWuoGHl6hV98FLglqMn5fa/9Zr
ZtH++44fMchEpT1ZgSg9NECR6/TUDfP+X+559Uy5VbKgYCk72a9aGVeqPUWQEBWa
B21ZHyID3gtOFuRh8ilcqfxXDQnc2v/RtJUuO7tgXevWDDUph4aKyZrVflj13zBb
LPVmImL8IxolmP3FG4NHEY/P74p1ayXs15JZlUf1s2+5LtXJwScjaEoKM4rO8GEf
W0koUDzga3lRGr7k/26l
=VqW7
-----END PGP SIGNATURE-----

--=-xz1u90G2mAuEbQ5+msKt--
