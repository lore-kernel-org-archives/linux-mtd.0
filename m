Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIboe-0002TA-OL
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 07:52:57 +0000
Received: by wwf27 with SMTP id 27so195111wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 00:52:55 -0700 (PDT)
Subject: Re: Subject: UBIFS and small dynamic files
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Wagener <daniel.wagener@kernelconcepts.de>
Date: Tue, 25 Oct 2011 10:52:43 +0300
In-Reply-To: <4EA1823D.3040708@kernelconcepts.de>
References: <4EA1823D.3040708@kernelconcepts.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-c25dxPiahprT5q9rC/Ux"
Message-ID: <1319529170.14178.10.camel@golum>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-c25dxPiahprT5q9rC/Ux
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-10-21 at 16:31 +0200, Daniel Wagener wrote:
> Ahoi,
>=20
> we are having trouble with the side effects of the UBIFS write buffer=20
> described in http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuf=
fer
> We have certain config files that are quite small and get rewritten very=
=20
> frequently by their applications.
> Matchbox-panels' ~/.matchbox/mbdock.session is a fine example as it gets=
=20
> emptied on a power cut or hard reset resulting in an empty and therefore=
=20
> useless panel on the next start.

Well, all the docs about the synchronization are at the web site. There
is also a description with links of what other FSes do:
http://linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions

>=20
> The document above mentions the '-o sync' option which disables the=20
> write buffer on a partition, but this is not an option for us because we=
=20
> do not want to reduce the write performance. And there is also the issue=
=20
> of a synchronously mounted UBIFS that can make things even worse in case=
=20
> of power cuts.

You can do fsync(), or you can set the "S" flag to the file and make it
always be synchronous (see man chattr).

--=20
Best Regards,
Artem Bityutskiy

--=-c25dxPiahprT5q9rC/Ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOpmrLAAoJEJtuLFy+q7fe+RAIAMDLSJvqPLS6T1TINY0xniUg
dJhettelRJW5lTDupeFxgDJKuGdRyr0NVYHF1+YBPuqrTQpbXhjrU9OJpFyO0A3Z
WxlgcOdaOoW/loNEgr3C0XVq34DWcL8NFwb0jD+UoPa59WTUsuNZe8L7l+HbAUgK
FQris91THyH3yGlofFUQVNMuQozDuXEPUDBoigxGQMntxt74iN8wZy3z/8K3lAUZ
LXYZNcBCJ2QUSs2Qm2q2OHZ4rxyU81qcHVtfYaIpuXHehdtS+AcU66QYsYcP9/Zl
VCrK/5GT1GxLfzLBzBGnjlLtiBHwt8CMZq4B1p93SGrzLnZlZifC//ipfmwTegA=
=EUtx
-----END PGP SIGNATURE-----

--=-c25dxPiahprT5q9rC/Ux--
