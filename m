Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SO6IP-0002Go-Oc
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 11:58:38 +0000
Received: by lboj14 with SMTP id j14so1288920lbo.36
 for <linux-mtd@lists.infradead.org>; Sat, 28 Apr 2012 04:58:35 -0700 (PDT)
Message-ID: <1335614313.1937.11.camel@koala>
Subject: Re: [PATCH] mtd: block2mtd: page_read() never returns NULL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ryosuke Saito <raitosyo@gmail.com>
Date: Sat, 28 Apr 2012 14:58:33 +0300
In-Reply-To: <1335178037.3060.7.camel@HDL00099>
References: <1335178037.3060.7.camel@HDL00099>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZR4h+uVcq+YhJ9S2s/AQ"
Mime-Version: 1.0
Cc: artem.bityutskiy@linux.intel.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZR4h+uVcq+YhJ9S2s/AQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 19:47 +0900, Ryosuke Saito wrote:
> page_read() never returns NULL, so we can remove the NULL check here.
>=20
> Signed-off-by: Ryosuke Saito <raitosyo@gmail.com>

Pushed to l2-mtd.git, thanks!
--=20
Best Regards,
Artem Bityutskiy

--=-ZR4h+uVcq+YhJ9S2s/AQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPm9tpAAoJECmIfjd9wqK0v2YP/ioq2oahVcooAX7+ejoNUbUy
Kmkyty85dz+EC4pzP6gX1bYcJGWscxwffAU7EfutO2kVfFuLne0UndiHCj4j1c0V
x4pDsM5qz/kYDLMrln5AQjQ/9L8tcvfHPqmRJeY6d9iDP/Uw7y9Ruy7lGy+tNUlZ
dIsGizZ3s6fM7Vm4DHwep1avxAKNK0t9ggapXDoquzSppwCHDY6F3pGZQgDoG1AH
RBuz7nPXSYcZZvkEFXaVRUUK+cOmzE3hHF3CpHWStSaJBXmIy807jRHSGNep4TaD
lU4NsHQ8uENQb6Od9ZnqdQQA0ImrT0depd3f0cuRqDleHPpjmpC9NrUehj2TwyEu
Qr3X8MzLr15SwQXTCfaCF3OTK/QKFb4+wzRG6AW6S+LCe/onzgexGEm26ZnEP9Ud
Uq3+Y+jUcBdTjmYeR8PqE9uIcmKVazI2OuxCiqcotbv1R7Ve7YqAcbkYWEincfzf
nDNvmvY+DIMKlx9PQlGdGIuMraaVVQz85+7evjUBGYaGbfctIoVobXjo8yA8jLfH
j4TPWzFnHjaTQZAfg3rJApr6UUEiDEbnslHyjJ5/jMhYaX3OG4yj2b+L6ANv+VPp
fvwnq3C8sXKClpXeVM3GSI4XHkCfcBOh4v0RDzNdLdHCW1WsZWp6P2kIWAzzvcZ3
1p3Btrr4x7F9d4m25duF
=9RXd
-----END PGP SIGNATURE-----

--=-ZR4h+uVcq+YhJ9S2s/AQ--
