Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIiFu-0002PA-1s
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 15:17:46 +0000
Message-ID: <1334330445.2544.83.camel@sauron.fi.intel.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matteo Mattei <matteo.mattei@gmail.com>
Date: Fri, 13 Apr 2012 18:20:45 +0300
In-Reply-To: <loom.20120329T173823-262@post.gmane.org>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <1332239983.11468.14.camel@sauron.fi.intel.com>
 <loom.20120329T173823-262@post.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jW4KJwhEe05QjrYNZm2S"
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jW4KJwhEe05QjrYNZm2S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-29 at 15:48 +0000, Matteo Mattei wrote:
> Artem Bityutskiy <dedekind1 <at> gmail.com> writes:
>=20
> >=20
> > On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
> > > Hi guys,
> > >=20
> > > I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
> > >=20
> > > I already posted some requests to TI forum but I have no answers up t=
o now:
> > > http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875
> >=20
> > Well, this error was reported several times. AFAIR, there are 2 possibl=
e
> > causes for this.
> >=20
> > 1. Your driver does not protect the empty space. Normally the driver
> > corrects bit-flips using ECC, but some systems do not do this for empty
> > space, i.e., for the flash regions which have been erased but have neve=
r
> > been written. UBIFS expects to see all 0xFFs there, and if it doesn't,
> > it reports about corrupt empty space.
> >=20
> > You can fix this by fixing the driver, at least this is what people see=
m
> > to do. If this is impossible to fix, you can teach UBIFS to tolerate
> > bit-flips in the empty space.
> >=20
> > 2. More difficult issue which no one still dares to start fixing is the
> > unstable bits issue. I do not have time to work on this, so I offer
> > everyone assistance, but no on so far started working on this, AFAIK.
> > Here is the description of the issue:
> >=20
> > http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits
> >=20
> > HTH.
> >=20
>=20
> Hi Aartem,
> I have some updates (also a BCH fix) as reported here:
> http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx
>=20
> Anyway the read-only mounting persists.
> I have errors also at run time (without power cuts) simply performing ver=
y=20
> frequent and stressful reading/writing operations (using dd and md5sum wi=
th 8=20
> parallel processes).

Does BCH in your tree protects the free space? CCing Ivan, just in case.
Preserving more than usual of the context for him.

>=20
> At this point I am wondering:
> 1- Is possibile that the "unstable bits" issue happens also during run-ti=
me=20
> simply reading and writing?

Not as far as I know.

> 2- How can I do to tolerate bit-flips in the empty space?

Make your ECC protect it. Or modify UBIFS and make it tolerate bit-flips
in empty space. I think in the newest kernels we export the ecc strength
in 'struct mtd_info', and it could be used when scanning the empty
space. But I am not so sure this is a good idea.

> This is the output of dmesg during heavy reading/writing operations (as=
=20
> described above):
>=20
> UBIFS error (pid 2289): ubifs_scanned_corruption: corruption at LEB 6182:=
126342
> 00000000: fffffffd ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=20
> ffffffff  ................................
> 00000260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff=20
> ff ff ff                    ..........................
> UBIFS error (pid 2289): ubifs_scan: LEB 6182 scanning failed
> UBIFS warning (pid 2289): ubifs_ro_mode: switched to read-only mode, erro=
r -117
> UBIFS error (pid 2289): make_reservation: cannot reserve 4144 bytes in jh=
ead 2,=20
> error -117
> UBIFS error (pid 2289): do_writepage: cannot write page 1392 of inode 178=
69,=20
> error -117
>=20
>=20
> As you can see we read fffffffd instead of ffffffff.
>=20
> Thanks for your time.


--=20
Best Regards,
Artem Bityutskiy

--=-jW4KJwhEe05QjrYNZm2S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiERNAAoJECmIfjd9wqK00QIP/jjxKk2Blt9vCrgaAvoAYKKC
Xms2Ct+ceRVSlqhgPODHKTM5KYL4FgVsvtZxOidKFFPq4COhifo5hGUU9tmfZSZs
aqBXVQiN949ns3N5y58Iv0SOyBcrNZ0AeOe/UDmE+kooo1lbUAZPcGFKRi09ui+k
HTD/+1GSqenmgxE9VxieY7OcKlkTZ1pn1sX/frsoZM6U5o4DbZsn/bWF75yIcoLk
cFnIqQIUQK2gSIyPmcBlKFr3Il/+xpx6SkCq+FoqgYdhP6JKFVx3CmV+RFZZqx6d
Gp4ywe9XMuVxdq6tOGMngXB/0UXun4W47/7KIo29qH8oxKJ0Em/rJke8oB9iDAoi
JOkEoquCybXRdANDmcA9KLiLu655+b4CNerO0HptfUl8FhkwjfMyE/aDZJy60dxd
VE+8uZ4JDfgR90TUWrrYYr6ulSBxja5NnnU5HHGXXwpBPTee5WHp3r5jdvvf3kw/
QASFdqJiv9+DtBCMr+QzDI0iQPrQT+oflOUGik874bTYTpv18AD41+t3HEQutBxh
kpFTEVKSMDM6ORqKFveX/nvb51fdKPLx9UUUbWKXm/xY2BkRDb/T5o4AveNVUL6a
fQ3r9GVclFQIgNEq3kkQA96Hi5HlkNDTvFgBeCNE+wQIFkx3srnmAwJSfBXGrAC4
efrbbnZDjKOw8uf3aX3H
=WiOx
-----END PGP SIGNATURE-----

--=-jW4KJwhEe05QjrYNZm2S--
