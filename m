Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEieY-0002Ko-9A
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 14:54:42 +0000
Message-ID: <1333378674.22146.18.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: Add cryptographic functionality when a key is
 passed to the compress / decompress functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 02 Apr 2012 17:57:54 +0300
In-Reply-To: <alpine.DEB.2.00.1204021645070.29393@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203252302310.5527@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203252325100.5527@eristoteles.iwoars.net>
 <1332837188.31549.14.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203291639200.912@eristoteles.iwoars.net>
 <1333377383.22146.14.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1204021645070.29393@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-acqWhqSzj0UQWawQILGr"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-acqWhqSzj0UQWawQILGr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-02 at 16:48 +0200, Joel Reardon wrote:
> >
> > You support only one length - please, kill ivlen parameter.
> >
> > Also, should ubifs_aes_crypt be static? I do not see any users outside
> > of compress.c. In this case remove the "ubifs_" prefix. But a
> > non-written convention, in UBIFS we _tend_ to prefix only non-static
> > functions with "ubifs_" and avoid having it for static functions.
> >
>=20
> Should length for key remain, and the IV is just the same? Or should the
> global #define just be used inside the aes function.

I guess I was a little confused WRT iv vs cryptokey. Anyway, I thought
you just use UBIFS_CRYPTO_KEYSIZE for all of this, why not to just use
the constant in this function? Why passing the length as an argument?

--=20
Best Regards,
Artem Bityutskiy

--=-acqWhqSzj0UQWawQILGr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPeb5yAAoJECmIfjd9wqK0Rt4QAKUUNE01BMt4AMnSLskOc9TL
dkCmmG3AjoyuWks+NJ3V1fNq3ajNq+Rn+C4GgUmv0UhPoI4/ih54sO4JXuD2NMBs
lqSZD/KTKUukEOiwxopw7W9yYn2gFiW0inoK0QdNMHqn70XMsFRrOGSFs/qNgnAH
4jdC4wLQD5H28VAV5qPHtx4xXF5lu4z4KoIBMqBVxI8zjD5bs9OqmbOMZKhisA/z
W5nwJA4QUdafa4s3CqKphaMUbUj4+dPrISCWg/cjGTwbmKlzKAh3Pu8o1v8IoXBx
reghqG1fnatxPDqdL7L17Ye3z7YQIwnWozZkmEsd/lerEQ6jFN80ThY6fZaWnewn
bxoEndvEerQA8eOMs6USzqQsI2wted5xCTcKO6dA3ID7S8XDL+akRYKijjDRq1Bt
QkHZaZBRHax1i5ygcPSNZ0fqTyeOFuVdzPWgr01qGXJPo4Pxx//l9pKIZJX6hRCD
/jBve+ZN2COhD5NxDGekkzqeRIA/QRrfvbr86x49M4x/MYc4zliM2GMBzVfdt1u1
za0P42CWMBMqxzjoX5IgujsMH06YCngMv99PKMI04Etlzm2z8ZxD55UBms1/lb4y
C/HrNgxrp3Ttnh17Ya8AqXu8r0wfLnUUJqzoFiMTemv7ef63McjJnrqwaR6oRiAP
HLeKR6TejCAelXmdcf1X
=/my3
-----END PGP SIGNATURE-----

--=-acqWhqSzj0UQWawQILGr--
