Message-ID: <1345451388.2848.16.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 5/8] UBI: check max_beb_per1024 value in ubi_attach_mtd_dev
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 11:29:48 +0300
In-Reply-To: <1345451128.2848.14.camel@sauron.fi.intel.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-6-git-send-email-richard.genoud@gmail.com>
 <20120819120804.15c33931@pixies.home.jungo.com>
 <CACQ1gAgLirwiwiUOoL7ig7R_RpB8xDr2-g2gVOEUZNvAHB60pQ@mail.gmail.com>
 <1345451128.2848.14.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bF/9Altc8xXbkfd50/gp"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bF/9Altc8xXbkfd50/gp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 11:25 +0300, Artem Bityutskiy wrote:
> On Mon, 2012-08-20 at 08:31 +0200, Richard Genoud wrote:
> > That's right, I'll correct that in next version.
> > Thanks !
>=20
> I've amended this patch, added Shmulik's reviewed-by and pushed to
> linux-ubi.git, thanks!

Sorry, actually I've dropped it - it does not compile :-) Please, send
bisectable patch-sets. Anyway, I expect you to re-send patches 5-8.

P.S. I am not sure we need to CC arm mailing list and lkml - I think we
spam them unnecessarily and the MTD list is enough.

--=20
Best Regards,
Artem Bityutskiy

--=-bF/9Altc8xXbkfd50/gp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMfV8AAoJECmIfjd9wqK0oCUQAJDNWdJ8Up/c3hOyabYUFH1j
nWBaSsBf+YFgG5Z3BbIMkqi6TS41E3geqmL16oJ98ge9SHsBfwCHvAG/T0Nvf0qT
XONQikFo8IwQLiptb0u9XM+hkQDYiPugDTjsy/Bcrc5oUvHpWF5rQstIhh3vj5tk
z4mwoVrs/MpilrircHYLKIVpjSBXKRIx1GtO8LkHMDWTDLzwRnqsUP1GPRkwaINZ
aBTviswyZbHE7cEeN6UqQD6KMr84yUB9QmtgXGZWQZtDH3uZP/rq9WGajw+tSM8Z
k7NDsvbCE1iT0BO4vu6oT2+4rQ2w3k5kx+LiDxRZ3BFdEEX4t3pNUxkE5DqyKy7r
wxrLq3BspfSlut1KholhCWNb2X3U0fyZGG0zjC7GWoKNq0lGV+AYz2ye/K90/VHL
ZnMr8qqRFYZFoLJBIC1RR7HxIouyw/IlvisUM7yY4qL8o5Oq4puw5fy51FDXzccT
X5YXPzkIBRBEwEaIuliKssCP5C0gZI8Ll0leNybTx0DR66sWUYxpGH7hFKBHEaUp
LnOaTFdaixHlZ51/GlKAfULBp83v+C6fAAjb8UlyHXK/kf6bi6mQmG+Afpaxgqxi
EBRQTKbhUHWEaphnZv8uNGKZzAdrB4QGEQ6BF5ctbsjQxoVstVpvIp3Hjp6ycJA8
XgfX301S0wAE3LJ4Mn28
=dPcK
-----END PGP SIGNATURE-----

--=-bF/9Altc8xXbkfd50/gp--
