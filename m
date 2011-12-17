Message-ID: <1324136016.4240.48.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: atmel_nand: Update Kconfig to support PMECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hong.xu@atmel.com
Date: Sat, 17 Dec 2011 17:33:36 +0200
In-Reply-To: <4EE6B160.3000201@atmel.com>
References: <1323327219-17895-1-git-send-email-hong.xu@atmel.com>
 <1323723514.2297.8.camel@koala> <4EE6A6DF.4@atmel.com>
 <4EE6B160.3000201@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-r5QifddF0M6PVwcGKopF"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-r5QifddF0M6PVwcGKopF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-13 at 09:58 +0800, Hong Xu wrote:
> PMECC is not compatible with the old HW ECC engine. It currently needs=
=20
> around 700 lines of C code to make it work. If we do not have a way to=
=20
> exclude the PMECC related code at compiling time, my quick testing shows=
=20
> that the driver code size will be doubled if some old SoCs do not=20
> support it. This sounds not good. What's your opinion?

Well, depends on its size. Say, if it is about 8KiB - then doubling it
is probably not a big deal.

--=20
Best Regards,
Artem Bityutskiy

--=-r5QifddF0M6PVwcGKopF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7LZQAAoJECmIfjd9wqK0srwP/Rlm/YQb2AkKPJt3QQOnE7wO
NpFottvN6KktUIG9FLUlni0011pkEHX21RMj9UMA0jL92S7iiKEiidb0rw94ls87
hw78EvDEjEOOdTnVKMLZ5LbHF50ySwDVExhIVBgFtkebVChOv53/Ev/IzOIvGbBE
5ccNlcW89Rhlm/e+xeavwnMmS6+B/6yBJC8mZJl0dZu7+4IocViGzPyXvnrTOK+h
NCnLd4XaOcm7bA7kHeZ1B5nSSsLtMGRfGHH6ocWAdDkZ0QViJkXaH73Ci/1fC2IP
hBo9WZgOE6nbF7bypo3nHp/iCcRwDvjnJXkcrthfUB2mDODv5LCy29CybgkP4DzO
wgabK0pp0OkXw4wqlQw/L1wu418kVoitj2NuOhds7wcbmagEF4J3Uq9WX23oGS4o
UmvoHHAk1f/72+iGtzhQraSSREoBR4a+QCQ0nDLPe9pKJZRJ3Gd8deWTvlFR1a/P
URNg6mlkpC/1K8nVXGPvqukT8YD2aso3jnHXTlesV67uDTomoNfk1SGXlN6HxklB
eH2V/V2ruvFP8f/kn9nF9JI4M4WojUBMLOmAOZF5WLfpzuGKYHqjXIy2g6rY4dAH
DmcM6vbVaGkWXdwTsTH0J8Bru6QhlLp1Dap9HIfnBD7RR7uPXvcAV76yvpzUqZF4
1vehRaseTDX9+IShaBTU
=i5IG
-----END PGP SIGNATURE-----

--=-r5QifddF0M6PVwcGKopF--
