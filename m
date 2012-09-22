Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFRBO-0006EP-N5
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 14:59:55 +0000
Received: by mail-bk0-f49.google.com with SMTP id ji2so2132415bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2012 07:59:50 -0700 (PDT)
Message-ID: <1348325985.1894.2.camel@kyv>
Subject: Re: [PATCH] mtd: mxc_nand: Adapt the clock name to the new clock
 framework
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Sep 2012 17:59:45 +0300
In-Reply-To: <1346856747-32694-1-git-send-email-festevam@gmail.com>
References: <1346856747-32694-1-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+8tbs1p/TbM1L0Y2uK22"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+8tbs1p/TbM1L0Y2uK22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-05 at 11:52 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> With the new i.mx clock framework the mxc_nand clock is registered as:
>    =20
> clk_register_clkdev(clk[nfc_gate], NULL, "mxc_nand");0")
>    =20
> So we do not need to pass "nfc" string and can use NULL instead.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-+8tbs1p/TbM1L0Y2uK22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXdJhAAoJECmIfjd9wqK0C+MP/ipbWqhKYMjNteMJXS7Qy+9/
0NYeM85kzap1xFW8Aw+AwcNLrP/+0KR738xaqL48m8auZd7/D4HjUHYeUclpKd2e
a8oUfpQd2lopfPlHbjMJpSkCfRBYSQY+obHIsiRrAnuIhtOA6XB9qAf3+2BBbgO0
oN2oXT92ArXuBa8+F9FfGN3eUojCsxWEfITL2Laz3xptXhS0NYpUhMPHgak/DdT8
G67RSNbdnffMS4iR4XHV+i+TjdgG9q3HPe1vWTJ/j6OHW2WMtqebnoC0mRL90zVc
HXyU1usZY8DJP9sVy1bUaKjFuYOYn7bvtVpHhmJrsdohN3Frj4y1YX2jdAw/KioV
C05Frkhde30YexTsdDpQql4OQ03ACFMWsL3T51R3ZIelWCCWO2tWCw9XOsaZle41
9a35TxKb7IKTQSGzWcnIEVbKTrd7ZffSc9zZyQBGzy/eHripJkkTIeOSUi3v67y/
BciYEvOkkL67mKvYdLynM5UocSll/3F4WsfIMVX+CAEg9r8z6+K+VD/Y6ehZlJhc
PefNQ0uPyaC2GItFNLSxk6cTUceF3PZbKUOPcCiOc+HKUmpDhdNAwweNaLkT6Xd1
ij8QbHpcTO0tuOqk0nvSvt68ZqfONw0E//JBAYbJhgThTmkyI0S3f4bDef6uluBS
vQbOnzUm1cvO/kyhJllI
=1e+F
-----END PGP SIGNATURE-----

--=-+8tbs1p/TbM1L0Y2uK22--
