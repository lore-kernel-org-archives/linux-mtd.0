Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjpPK-0007Pu-BI
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 10:23:34 +0000
Message-ID: <1340792855.29342.39.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC 1/2] mtd: cfi_cmdset_0002: Micron M29EW bugfix
 "Correcting Erase Suspend Hang Ups"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Date: Wed, 27 Jun 2012 13:27:35 +0300
In-Reply-To: <1340004279-26496-2-git-send-email-gerlando.falauto@keymile.com>
References: <1340004279-26496-1-git-send-email-gerlando.falauto@keymile.com>
 <1340004279-26496-2-git-send-email-gerlando.falauto@keymile.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7/DVhfe6GGeviW+p4x9a"
Mime-Version: 1.0
Cc: Holger Brunck <holger.brunck@keymile.com>, Leo <leo.costa77@gmail.com>,
 linux-mtd@lists.infradead.org, Stefan Bigler <stefan.bigler@keymile.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7/DVhfe6GGeviW+p4x9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 09:24 +0200, Gerlando Falauto wrote:
> +		/* before resume, insert a dummy 0xF0 cycle for Micron M29EW devices *=
/
> +		if ( (cfi->mfr =3D=3D 0x0089) &&
> +		   (((cfi->device_type =3D=3D CFI_DEVICETYPE_X8) && ((cfi->id & 0xff)=
=3D=3D 0x7e))
> +			  || ((cfi->device_type =3D=3D CFI_DEVICETYPE_X16) && (cfi->id =3D=3D=
 0x227e))) )
> +			map_write(map, CMD(0xF0), chip->in_progress_block_addr);

Please, separate the M29-specific quirks out to functions, do not inject
them to the main code.

Each quirk should be in a separate function, e.g.
'micron_m29_erase_quirk()'. The functions should have a descriptive
comment similar to what you added to the commit message. The function
just returns if the chip ID is not M29. This will be cleaner.

--=20
Best Regards,
Artem Bityutskiy

--=-7/DVhfe6GGeviW+p4x9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6uAXAAoJECmIfjd9wqK0G/8QAIiepJq1hWTCnJ9XN0Dlz/UC
8cl4Lv0v7v3NTmISjusx6BPfJ22mfsel+0oaYGd5Y3M5tq5VTs7pW545b2bernJ1
6OG4njsXndThpgStLV1jEcm/O3Kq7SW98VOfp6h0w+IZ9ks4YPI42Rk21P6xfSwU
gbusVa4PoZNPA3TG8FVoxnJsbz2dE7EXCoQMrApr0e794gWXln2Jsw1E+ps3VBza
/HLFrLGG2kEMZOhqI3/nyR2Y1W4d6FWP9EAYpIq5q6O9Bs9csF/117ssqAFeKx6y
6lsTZQ+9SCI17WCFmvkSD6euSE+fofGSJH4jb6a25iOHZDyQEwAMpncvinx3Zou/
0L36TQPOQc2RWwDvVOLw0n6iXB1RYOY9GOLFLQwndW9mmvNtbmuqM9xsBhB1RxLE
88tbE+IJk8rfTLdb8qSOhaDJ47nyB2V7L4xm/YCHYJk5JTuXBEzpCGkGnvziXuXv
9nPP9BNG3jhtz2lKRAnLi/+XCBWVJf4PI35Frvd1rn3wbB9bmWjN4OfTmsVT0JJ6
5oqeLo2GIy/cp8KXdOqzfLPQDOkNWazYW7BfNvCfCQebgA3jTRN7gGYbkzq2Nt5F
WHiN6fCC80SeRbc1FslOC5FrVsuLNLuf83Bjo/7zQvB2TO3kkoBH6XsooQsq0w/Q
cuzJoH8bhfkKS9qvpPc+
=o/E+
-----END PGP SIGNATURE-----

--=-7/DVhfe6GGeviW+p4x9a--
