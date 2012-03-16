Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8WYc-0007dv-Ia
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 12:46:59 +0000
Message-ID: <1331902176.3730.75.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Fri, 16 Mar 2012 14:49:36 +0200
In-Reply-To: <20120316111939.GA10362@parrot.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-K0KGjBMMYfxC10Catakn"
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mike Dunn <mikedunn@newsguy.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-K0KGjBMMYfxC10Catakn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Consider the following situation:
> - a NAND device with 2kB pages and 4 ecc steps per page (4 x 512 bytes)
> - the driver has chip->ecc.strength =3D 4, and therefore mtd->ecc_strengt=
h =3D 16

I would expect in this case we should have mtd->ecc_strength =3D 4 anyway.

> So my point is that the cleaning decision happens at the ecc step level,
> not at the page reading level.

I agree, good point.

> I think this could be fixed by dropping 'ecc_strength' and changing the s=
emantics
> of 'bitflip_threshold' in the following way (rephrasing your explanation)=
:
>=20
>   (3) The drivers' read methods, absent an error, return a non-negative i=
nteger
>       indicating the maximum number of bit errors that were corrected in =
any one
>       ecc step.  MTD returns -EUCLEAN if this is >=3D bitflip_threshold, =
0
>       otherwise.
>=20
>   So basically, the meaning of -EUCLEAN is changed from "one or more bit =
errors
>   were corrected", to "a dangerously high number of bit errors were corre=
cted on
>   one or more ecc step block".  By default, "dangerously high" is interpr=
eted
>   as chip->ecc.strength.  Drivers can specify a different value, and the =
user can
>   override it if more or less caution regarding data integrity is desired=
.
>=20
> But still, there is a problem: how do we implement (3), i.e. how do we kn=
ow
> "the maximum number of bit errors that were corrected in any one ecc step=
" ?
>=20
> Just looking at ecc_stats.corrected is not enough, as it accumulates over=
 each
> ecc step result, and does not allow us to distinguish cases 1 and 2 (from=
 my
> previous example). Maybe we could have per-step ecc stats ? or have the d=
river
> return directly the information ?

Yeah, sounds like we should have per-step stats.

--=20
Best Regards,
Artem Bityutskiy

--=-K0KGjBMMYfxC10Catakn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYzbgAAoJECmIfjd9wqK0F4MQAKj5Ynus2IYb94we8Gz3m/HR
2m6NaGjRcEHEzZcworTVLzK7Vcpn12GeSndDmadFXCrmlmhqYwvSnJY4Bu6GXn9B
+91j3Qvlz0ezfwEtTF+rrIuyw+p6qSaIAk1qCLNH4qfKXpeErJqeVjRqlKzebTR2
dTgtyXnT0845cbMXz3pWJrCI6ZTKF6nd4i1Mq0XOu0CrWH33D/5154OaEfuBbJJ9
LUD3wGXV/5Jw/9BZFgmJ7xuNMAdqD1KkqFBGLtmbm+lV7+1RSMGnw5NtnQaOL2Ry
4iwNLRc6OP2iMCv52bqhaJIsnMJGBmxdnzbw5PqGq6o6Ohrt0DCzlgcuZD+OzqU7
Pezb7EuIA6XVd/lcCq1lrDNpOWyIHwCcibE41fLyXQgZ+EQj0nHzasSZYpUG6i21
y+CAv8Q7qPCIbAs1HUsOp5j++0k22il/J34sDa7lndWECGM442Ow8KYN/kosz4r9
+SHJbxUfVSNALzfkwgsrzYmJ6EVfEuC6PRqBz1K604P4xdYbRE7jjVNMEy0ND96H
J13BMKSCkUDGmSt7x3/BYZfnDXdcSBl5vRIrsJuBIAgLpOUnFN23WfGTy2wszvoC
zOmHTBwgnMM4IfHIsDN0rGYoAOHTD29BiwxMktQB0ac1r7caW8bXVA7de7rJz8Tr
pqFffvNpLEEfI52T9178
=e+w0
-----END PGP SIGNATURE-----

--=-K0KGjBMMYfxC10Catakn--
