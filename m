Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sga8I-0007Gv-UP
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 11:28:35 +0000
Message-ID: <1340019147.2420.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 18 Jun 2012 14:32:27 +0300
In-Reply-To: <20120610135812.01dce4e7@pixies.home.jungo.com>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vwWGd/j0un7DgG17fwZh"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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


--=-vwWGd/j0un7DgG17fwZh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-06-10 at 13:58 +0300, Shmulik Ladkani wrote:
> The code responsible for reading the version of the mirror bbt was
> incorrectly using the descriptor of the main bbt.
>=20
> Pass the mirror bbt descriptor to 'scan_read_raw' when reading the
> version of the mirror bbt.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Added

Cc: stable@vger.kernel.org [v2.6.37+]

and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-vwWGd/j0un7DgG17fwZh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP3xHLAAoJECmIfjd9wqK0cQUP/22Ss+eLASaPNQnvsOS1jA2o
mMwX23wtW5iGl6zm0aA1Nzv/8vEuBQLH/77Jc++CGm/8qEizd1w/kdIo/1Gfy2jg
eVAIlxYsF0BxtVWz8JYhmn+NwrNzbNtlEE0BIyGX7X9bjxIH3QVTFAvHLM8VGMW1
dECQlUValUTu37ynM+TnoqY4Row+b7F4exSWp6yOuUQwxNwtpnw1OL3IjUgPzjBn
thhF9WuM1AZRJ6ciZMDdn/8i+RL+iHdhHrR0bHABka+bSohPUBQqEQlpAqsxCM3a
CPNf3RgrFKsQOxS0C/UY941rrSexShBnZBGBoCnRFxTH4rYEyMIwao1GgQksMcH2
ebC5dhtxzZP8fGfwgTVB4KQeCkS5bT1462G3pih4x8o8bLSjCb8aNnBrMCO6ndth
6yM39Cyb2Fkt5CDFjih988vW9mVWcviVOR6+uH4wohtRkwWCFIxkFZcYAMw2dkFL
a8ucA5o99/vhIppPtoyV+gfjG8p0f77PHvK4iu5N3NkGnX+FV6FQLM0iYXhWMTnM
owTrieErEq16pIPiepgK62r+aTEuSRSZ++jyoCLP3hJ4iMFHfH/pRiS3y6k2qA+w
jYy0Rx62xGsSuost4sK0Xz7Qi7OKALotwsX22zhnCSZ238Ri0sRQu1ZkupRWZNTZ
XvGTz4eyEdCdEwTjhLAI
=nYog
-----END PGP SIGNATURE-----

--=-vwWGd/j0un7DgG17fwZh--
