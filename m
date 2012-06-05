Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sc0Pp-0003Cv-Vo
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 20:31:46 +0000
Message-ID: <4FCE6CA3.1050905@nod.at>
Date: Tue, 05 Jun 2012 22:31:31 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: ubi: fastmap: v7: ubi_update_fastmap failure
References: <20120605164142.02d9e235@pixies.home.jungo.com>
 <4FCE0E81.9000705@nod.at> <20120605232049.1e4f5184@halley>
In-Reply-To: <20120605232049.1e4f5184@halley>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig62C920DDA7C4D753D2B0810D"
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig62C920DDA7C4D753D2B0810D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 05.06.2012 22:20, schrieb Shmulik Ladkani:
> Thanks, will retest.
>=20
> BTW, a UBIFS question.
> Any idea why UBIFS failed to mount eventually?

Maybe you need commit "UBI: Fastmap: Handle protection queue correctly".
Again, please use v7+. :)

Thanks,
//richard


--------------enig62C920DDA7C4D753D2B0810D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPzmyjAAoJEN9758yqZn9eJwIH/1bHDXA7XF9pYpfIjpFwnZMO
KHq/MivYZpiEobmrF0x8/13yDCzWeNbF2iBBSvFOjaByABOTUFrXvcFUr+65nStX
Yt2cbJ7i38bMdbpQnOgzMFOfAbU4AaKhWfN8Nz9Gfzv9t93IPDmihDC0iTPd4C9O
5saHCP1kfRs+SY2D/6zqw63K8tRtWjqW+MDyltS8ALGiX+DiFwfJHTwm05YfCW+g
61FoMTv6JG7AiGRHeJ63R55bFGwzIcdjkYTKmy7j2xszURrubplM5LLX/QI9LUJd
pDeIrKnxLqtEyuUXPQJbWmMSmF2a1FIytBMisojpPGEWE5t9GrTNEcOLTSdOk3g=
=J+7X
-----END PGP SIGNATURE-----

--------------enig62C920DDA7C4D753D2B0810D--
