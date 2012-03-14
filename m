Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7nz0-0001kU-Bs
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 13:11:16 +0000
Message-ID: <1331730825.3730.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 00/13] mtd/nand/fsmc related modifications
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Wed, 14 Mar 2012 15:13:45 +0200
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dMr1e0+V6UIU+4lOntJb"
Mime-Version: 1.0
Cc: sr@denx.de, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dMr1e0+V6UIU+4lOntJb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-14 at 11:47 +0530, Vipin Kumar wrote:
> Hello Artem,
>=20
> These are the patches 8-20 of the original patchset of which 1-7 have alr=
eady
> been applied by you. I have rebased these patches over
> git://git.infradead.org/users/dedekind/l2-mtd.git to help you apply these=
 easily
>=20
> Modifications in v2
> - Add support for partition information to be passed from platform data
> - Default partition information removed from driver
> - Remove sparse errors and warnings

Pushed all to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-dMr1e0+V6UIU+4lOntJb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYJmJAAoJECmIfjd9wqK0kagP+wUEpU7E+1Zo1Ph54sPpNnJa
YKBdtSoy/Q5++c0IwdhQlaKrNWjtk7WW+ICEFzGK8nY2f3/qWYCd/sUQ9meTbY1A
YibHBwPJTXWzp2m2D4ONSbJAI/hqoyPUHW7MPkulO0XHGQSSTyhgsPHGHsEGrKVo
PvhlVENOxcoJo47qz97UV9FZanORiYf9xIoeP7ZyDHJT6yAf7N/ywI3T2Kuq6noA
ztHLdSvR/f1mYdO2tW/lrS2LyYwPz4g6jeKNg618uvQRg9Z9FAuxtmSN2J1bVzdL
MiNk2rr77MTFGvln6V7bAiP6zJYkfGc/Kfw0f1VlMQmNY64RNhz7gQLKPjFiDkPZ
rOFGg2RSFpWqSsGNmzByR9SdZgJRWJPUXOHVZEAa80Uv4it/YMt1jvlmCm51kAH2
0eTDwgJkrqJ+aku7DMXexx3SvAQXOUpKnmqjZCLRKbSwEjkAAV+0Q63zZ7lpvcbL
DiZNg/lxgur7ShOAC7q6QkKtP+/aC7XabzWzOpROEO/ThdGiLbzavzoWyMvxG7HL
3Nyt2mAU6S2P65AMYX5nsqjFM7+XpLsRbiRWIggpEkTdi3e1DQOTq/mFlno5w64M
89XwbqITVQiZZhzIxLjUVx1tzIxsbI0m+CrsHVvXay9iIg4UM3t6AXC9jSIL3mZe
kK263xqeB8XF/GQICdR0
=febm
-----END PGP SIGNATURE-----

--=-dMr1e0+V6UIU+4lOntJb--
