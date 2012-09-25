Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGVmK-0000XU-To
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 14:06:25 +0000
Message-ID: <1348581959.24309.5.camel@sauron.fi.intel.com>
Subject: Re: [MTD-UTILS] io_update test: correct lseek parameters order
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 25 Sep 2012 17:05:59 +0300
In-Reply-To: <1347460674-3536-1-git-send-email-richard.genoud@gmail.com>
References: <1347460674-3536-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Jngyl5cs9+R0ncpW5SYT"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Jngyl5cs9+R0ncpW5SYT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 16:37 +0200, Richard Genoud wrote:
> There's a typo in lseek parameters order.
>=20
> But, due to the value of SEEK_SET, this commit doesn't introduce a
> change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Jngyl5cs9+R0ncpW5SYT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYbpHAAoJECmIfjd9wqK00y4QANJaADN/hr+cWU3AxxDuMxDx
xu7OEXH1kD5w7M6FXPqtxAd45sgeNBW1FpDJSSifKNQKnby8PYCTFZVqZmMKObrC
SeBrxVLG7L1rLBAzdLo97J+YmQ+SW7qVyHmvJqSRW2G8XpRma8QGSFy5lyjrLlY/
Jk5696GxGV+7Yq77aW1naLJAwfNKgjW+d6Dw6Fmkfz4fYQDb4lg0EykYVeMX+MzU
kX+zYMiCjW6dG0FQVnXgM/a+CtfwZF3d9V4fNfLsyzGuzwwRZeD5xQjWtN3n/1/w
gwaLP3GjoWwHjADMz0sI0SHYxd4xgFyV/2eInXE//A+X8dlU7dhpjQHf1koAQEQY
3NT8BSBABGsg02yW5pnpbtjy/ePZUk8xtbF9PoG0KGqooOyf+1wmEj0Jfx2pAy/M
266sp6B3IUc8P31yyIWdIP+eVdTwPdSIhxeYHfFU2aKbp9J0PeHOeme9vCjZkPCU
CY6/WOSOynMrRZpKG/ZBHKIFcEZwERuRVW4g7rQY9mae571eUGKoxpL0yJQAf1hi
70zFOwzUQz94RWd3mr3XT16UYBxqPdIVOvXDw6q0HLbqyEi16jo2FCE+dvWDT4JZ
mtE26hPucqAQGRsUHTR4fyLM0vkycDjyjtzf1z3FtSrO0ej3xsE9w6zMIY31BYmQ
/Gf4ZyP1Gp3P8z3igI71
=M8+R
-----END PGP SIGNATURE-----

--=-Jngyl5cs9+R0ncpW5SYT--
