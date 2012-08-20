Message-ID: <1345451128.2848.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 5/8] UBI: check max_beb_per1024 value in ubi_attach_mtd_dev
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 11:25:28 +0300
In-Reply-To: <CACQ1gAgLirwiwiUOoL7ig7R_RpB8xDr2-g2gVOEUZNvAHB60pQ@mail.gmail.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-6-git-send-email-richard.genoud@gmail.com>
 <20120819120804.15c33931@pixies.home.jungo.com>
 <CACQ1gAgLirwiwiUOoL7ig7R_RpB8xDr2-g2gVOEUZNvAHB60pQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-S+THycFNlnRdkA1nVaUr"
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


--=-S+THycFNlnRdkA1nVaUr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 08:31 +0200, Richard Genoud wrote:
> That's right, I'll correct that in next version.
> Thanks !

I've amended this patch, added Shmulik's reviewed-by and pushed to
linux-ubi.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-S+THycFNlnRdkA1nVaUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMfR4AAoJECmIfjd9wqK0Ax4QAMkh31Tjvg/t8bnxBcCfag1r
oEZxItVyO7+tS2Ve7QG38rVVE8dwr/gcz2kkELCJSnLFNXDwJSwROJ0QH1JOVfYU
Rtl19BmWm2g083WsTjw+b4R+qCuPa/gReB1H8V4au12Bh/Ew6JWvTUQOzoAW45+i
AgS6i6r8zoTnyslx8yUg0nQoSD+iwCLYG2Jsql5T5zFHpjKWK8pwrg3cQoLAtGEh
LzkbT8wY2+6ZWOSIhCw8a1jYYJdRgdBkm1chjeFkV4TNKRe4D95868/Z0RHYUG6q
c+ySVNhdfplMWu+pVAKGRjAR7vVm+a4Oxx1pRVxb1lk1ZCsk2d3Gyx0MwczDGPP1
3kFmDpc8aSmsBKsHOMjg/qFULRK1lpnVzMCusNfaTj26pQSSzIzciQ5Er87u9A4j
QS39f7t32TmX7IQbuShHVDK02/KknqcONGAq+7Oc8q7Hm00+yZU6HnG5DSPmqm3U
nYUW5PTJIHbQNYrUycQjTW8b+xNgH64I+djpBo1u1QNAO3M5MyK2cKp1jjB0HSZ6
B3gYOBVU9GGx8289qAQ/8vUw9rZWkkwK0IvGpwaa+DzV25WpXubJWSsxvHkd6qJE
qmytxNtM7wlKv7QIikW4BumwMB2CynorvEvB7HrbpjAzDn2WEoGJVr8NIt/tD7fU
TdQsDEygK9KWoN5bQcLZ
=o5Ws
-----END PGP SIGNATURE-----

--=-S+THycFNlnRdkA1nVaUr--
