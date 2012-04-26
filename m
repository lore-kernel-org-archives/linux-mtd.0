Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNI4k-0004ya-2q
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2012 06:21:10 +0000
Received: by lboj14 with SMTP id j14so822207lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 23:21:07 -0700 (PDT)
Subject: Re: [PATCH 1/2 V2] mtd: spear_smi: Add clk_{un}prepare() support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viresh Kumar <viresh.kumar@st.com>
Date: Thu, 26 Apr 2012 09:20:37 +0300
In-Reply-To: <43a59a35ce076693de33846844ac5be4dae5a49b.1334662614.git.viresh.kumar@st.com>
References: <43a59a35ce076693de33846844ac5be4dae5a49b.1334662614.git.viresh.kumar@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-AIiFTDY2Tkm7wAgDA9ol"
Message-ID: <1335421265.4703.0.camel@koala>
Mime-Version: 1.0
Cc: artem.bityutskiy@linux.intel.com, linus.walleij@linaro.org,
 spear-devel@list.st.com, viresh.linux@gmail.com, linux-mtd@lists.infradead.org,
 sr@denx.de, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-AIiFTDY2Tkm7wAgDA9ol
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-17 at 17:07 +0530, Viresh Kumar wrote:
> clk_{un}prepare is mandatory for platforms using common clock framework. =
Since
> this driver is used by SPEAr platform, which supports common clock framew=
ork,
> add clk_{un}prepare() support for it.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-AIiFTDY2Tkm7wAgDA9ol
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmOk1AAoJEJtuLFy+q7fehsMH/iN5BPxS0uuOyI8POMy4djh/
rwZhTIaj3e2jnn88IajSJODm4x7TjP2wmu0oV4H0QFlZhuabPTW9gme7Xy2Qp1m+
pTdshx52IQIf4U6fB4h0LE9IMw8EaZPlf+HNWAZorRztFhtm7jewW9N+mpUtxr18
sVqum1IYBilRiKqQOAV1+zQq233vqDbKvK/9TuOMGOOW2rekpalUjwXa6CbrTVNW
rlZpP+oreYvLxxb2GvQm8VxTFgUB9NjefIFmipjTS+Fu/fz6VBkp3YBq7qJE2eHg
8M3AIPmcMyd4ePXr7YY0JDZrNw8ZfQz0l+vbL8pZ5pBWQKT32mp1XVDKrBXvlww=
=tu5k
-----END PGP SIGNATURE-----

--=-AIiFTDY2Tkm7wAgDA9ol--
