Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9xRh-0000qZ-Cu
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 11:41:46 +0000
Message-ID: <1332243871.11468.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: add documentation about locking context of MTD API
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 20 Mar 2012 13:44:31 +0200
In-Reply-To: <87r4wo8arp.fsf@free.fr>
References: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
 <4F67B3B8.7090909@nod.at> <87r4wo8arp.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-y2c09dxHL/woWrHg1nu5"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-y2c09dxHL/woWrHg1nu5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-19 at 23:51 +0100, Robert Jarzmik wrote:
> Richard Weinberger <richard@nod.at> writes:
>=20
> > Am 19.03.2012 23:26, schrieb Robert Jarzmik:
> >> Add a comment to mtd header for MTD drivers writters, so that they
> >> know that each function in the MTD API, ie. in the mtd_info
> >> structure, is called in a sleeping context.
> >>=20
> >
> > Why do we need this comment?
> Because I was asked to, in [1].

Well, Richard has a point :-) But I guess you can simply write "may
sleep" instead of "sleeping context". Or may be even use "may_sleep()"
in the wrappers?

--=20
Best Regards,
Artem Bityutskiy

--=-y2c09dxHL/woWrHg1nu5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaG2fAAoJECmIfjd9wqK0yloQAJdp6YqsFP0d3YRqRKSM99qo
eBLg6/4GCWhLt0wdKbD1T2pFxm7JKZ3PYe/VTln10KXlxVxanUkucSpRM3k84gso
sCi6Am+WGa35PP+efWB0S62uFQcZSdmqBeh5r2thNjzTZIzBj5KjEFQ0e0e/B7to
+3dSy0Fcg16L1Z6ARlTdkUABJwEEsafflbzIcIhET1DC2k+FEOFI70KD/LnokO/k
LuJAwhBhtBdsxn4bbSa/ebw0v2Nyl5J8TM7AH4ya6q3dd37z8Ov2f7JhFsn4D+nz
7ozRucvWt3OzZ8huKY1i6mefRjcop06Bkww2xpssP6ilBctxlDWdLki/REkC45nA
Avlg8ZXq/fVs32o2z1DliHlWFv+nF97R8LalBlIFxi0G69ssekvkC3JgrsZm5RC7
oQJ3pG2Sv+VV3oDSOBoyCdGDALApxm96GWWYR+mqQXXeU1lZRmBGfi6eXmAazY4O
1lXGhnGmgDvb2HXg7EikecvqphtKydgfQHkvBJiMm/9/GEUxYp8SBSIaOQ1Z9/B1
oZRokk55XDkj48sFrDsYj50t6z2yJFCObfAI2YsG32TZg1YklyX/G9B25m80TQTd
2zhRiSitSCn2YLMEae/lS3JfeT2eqDMdY1JPAxDMm28IhKxQ9bFdw3dUZQ9YJleH
Uc/SuvwcoItpbN+aNTM3
=pURJ
-----END PGP SIGNATURE-----

--=-y2c09dxHL/woWrHg1nu5--
