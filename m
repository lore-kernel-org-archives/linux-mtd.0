Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMDcd-0005g5-Cj
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 07:56:00 +0000
Message-ID: <1349942173.20594.57.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Thu, 11 Oct 2012 10:56:13 +0300
In-Reply-To: <1349882785.2552.1987.camel@lnxprebble2.se.axis.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
 <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
 <1349861452.20594.12.camel@sauron.fi.intel.com>
 <1349865249.2552.1965.camel@lnxprebble2.se.axis.com>
 <1349868630.20594.16.camel@sauron.fi.intel.com>
 <1349882785.2552.1987.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YJpW5uNTNarAa85X2l86"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YJpW5uNTNarAa85X2l86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 17:26 +0200, Marcus Prebble wrote:
> which was a tad confusing. Please find attached a new diff (based off
> yours) with a few minor suggested changes.

Actually, I've just pushed my patch out to mtd-utils.git. Would you
please, send your diff as a normal patch on top of that?

--=20
Best Regards,
Artem Bityutskiy

--=-YJpW5uNTNarAa85X2l86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdnudAAoJECmIfjd9wqK0i44QAIlRFczPsSi2OIDMTXxUjHX8
iOU8Xjn0lG52QhAcnAymSxzpp2mGWKSc6B25KRcK7NTaL6sIj1usGPLHN722+53s
RN+fqvB9te+7bGWB2R+fL2n6q5l/RU60VggNBRX/NBT1WFa1ODGu6sY33YnRONmL
+WbDVF8YPaSio0GttZfiOhZ9gMe6AVpiKyhpl3OSzi+tk+iBo+THOH86n24TxLkh
cJ+ZJvZEmmZrCplY2I2DtbbTWUmUuGVjOJAxVV7bTPJzfwOyqxs1cSWmH+zuk90m
4bO88ophJpfPlHtllhNJxKtAjpMBPwVkdXKB84erlqpwPfHlqBrvOKXJCReqpJrY
34DCOUfernPl8T9XTmMQYS1Qp6Gb7ztc+GXzai1wi0h//AVHVpq/384KOjJAicnN
pFr4ZO8d6XBi7npAeRN8E4DWZuMXyBH8Cy8cAa1cSoc7lEATXGxDcHbVOEycdfpw
AvTeOlWom/JoUY+dfS4ztElz3a8NSCE2xVA4hV6h9RMlmTey94cyUvidCFlMHqUL
YH4wRouk7luE1ry+CpLWHxT3J3Mcj2p0vBmlWGtERzLTyYC8oKt6fAHmAfi2Dgf5
js5hVmCDjA8HNVrIbBET6eETN59B2FoAYB98nCh3qHJwE/hC6xBQqJ15iSZx38w2
CDGTmUOheUH888APC6H7
=VAZ5
-----END PGP SIGNATURE-----

--=-YJpW5uNTNarAa85X2l86--
