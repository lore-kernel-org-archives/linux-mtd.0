Message-ID: <1340789161.29342.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v11 1/4] MTD: at91: extract hw ecc initialization to one
 function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 27 Jun 2012 12:26:01 +0300
In-Reply-To: <1340618866-28776-2-git-send-email-josh.wu@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
 <1340618866-28776-2-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YtgBtO8mOO4xZzD2y3rz"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, jack.lan@freescale.com, nick.spence@freescale.com,
 tie-fei.zang@freescale.com, nicolas.ferre@atmel.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, bryan.wu@analog.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YtgBtO8mOO4xZzD2y3rz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-25 at 18:07 +0800, Josh Wu wrote:
> This patch moves hw ecc initialization code to one function.
>=20
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed this patch to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-YtgBtO8mOO4xZzD2y3rz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6tGpAAoJECmIfjd9wqK0gGoP/0Hx+U4heXQaMrJZsl3oq0D9
pebXCfpWHUWrbiBwiLCNZwzKiCK8hrSiePqmqVb8m5ZKcnKKDNNOkCYdKFmcOFrT
zSmNRNfmDGZf64873eGIyibyQtlHJGuju5w1FjpAkT7XcD7YNLj6rQB1/X4vYr/D
++mCe0EnmLCTzM/T+rW0RKU5aI18FkKdhBsOaTI2gqszNllFBSfwyX7cECO7N8fv
mL/4HhoFBi/eJrcPZTa2vMLMTHLXP4djZR3cWNMdm+jCIE4CPaw8pfpCk6m+dLE3
2vd4nnfXJ4AYioI15pYrtCYeix3QHOqKyF8oHtiKRm/0EbWVAkR8qjtVoc3Nwh5Q
HmVg+Stbuu190qc/av6XUDaXLizXXdX0EPzvsYz+NlA8cQW1Bls840LmwEXpk/gf
mX76+uGKiXb+wNLalVdtonXRgVrei8U2IXespkYW18Zlx8L+S5WIYGnR2B8ELpCr
WO4SUy83xuaTLEEXvw09e1Oq1AEAlm+Ts5QNcXrJ8XR54lX8vANzx4uA4xBdl0I7
nNQj8iXTpRobLHXypxMDIn12wZCoi4mHg/AURfmxnoQPyeHvucvjM02qPoXMPRi5
FunzeVhM4j+nn5F9gniTYkHh2cf1jNKfc7GDfvD/bpP7SAoezxpeqvLdQg34UrWa
9R6ba6vl4y1QU4vWtOxh
=1QAb
-----END PGP SIGNATURE-----

--=-YtgBtO8mOO4xZzD2y3rz--
