Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8pdB-0002Pp-SZ
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 09:41:14 +0000
Message-ID: <1346751966.12610.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 01/11] mtd: mtd_nandecctest: remove unnecessary
 srandom32() call
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 04 Sep 2012 12:46:06 +0300
In-Reply-To: <1346677206-13621-2-git-send-email-akinobu.mita@gmail.com>
References: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
 <1346677206-13621-2-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FfiDVCiSy55U/y74k1el"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FfiDVCiSy55U/y74k1el
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 21:59 +0900, Akinobu Mita wrote:
> It is unnecessary for this driver to call srandom32() in module_init.
>=20
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Just FYI, patches 1 and 2 are already in l2-mtd.git, no need to re-send
patches which are in the l2 tree again.

--=20
Best Regards,
Artem Bityutskiy

--=-FfiDVCiSy55U/y74k1el
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRc3eAAoJECmIfjd9wqK0l1EQAIu8k19s6FGZhU8LXRI2mYft
HWlvrlSZFiT8W9Y5IBASA+BDUOLIAbM45znidtcaP3szDYDSiY/cbyHgwlHofw7+
hFI0M8jpi7905XYlD1JjkgpViULy4oc1vb5S4eUKdKtC4v+WzfuOb835QxNqdzWF
zdN55uaO1yQ/VKsSHVbEeiOwenf6SeQDi+Suooy7kWCZK4/9z1kkA5rY+jl6Mvza
2HfJAjJIzAB6PN5muZFlIf3aC+D75mYzz8SgxdV+zSx0SMQ6TJpuT4Bpn7xXqqp7
AcqTjre9awrIvOM7cyX+t4qnnxPWYatVf97FqzOqKi0jqoYmFw41iNFLKzIGZJPH
UhFSa4YEHj4ewI6obnxhPNmkF2fw74TPL2M8/F6lL2MS/eXgYuvUoCQ+1U735bVW
uOQJbATjzfMpBUntDhvm45AJ6x1uuPX2z9KZTp+UJ4v27Tg2XGDSWCU0N/TUSpY6
IiSBaZl2Yk84XTTkF8/QHn4JTuurQwYXMPJ5cA5lqHok28xrcfHzpk6PiOxqnoXW
B0swPDILgqyEfz78yjrllcbGlAGUUYrtTZSKtsuSez//v+tZYnYJ3IRyE/rErf+1
Fgk0Zp8YPi9SQHalnHIG+hP67C+hVnoLdfAsLE/l4sndqh87zZjAjwmnxbUwnJcv
Tu99Jku20+RaZRZR1NYr
=9mGX
-----END PGP SIGNATURE-----

--=-FfiDVCiSy55U/y74k1el--
