Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQCod-0003OP-Ed
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 07:20:36 +0000
Message-ID: <1336116237.30168.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 00/10] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 04 May 2012 10:23:57 +0300
In-Reply-To: <4FA2BC40.70504@newsguy.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1336039230.13013.14.camel@sauron.fi.intel.com>
 <4FA2BC40.70504@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vs8Rhp5CAGVEI/tayo2V"
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


--=-vs8Rhp5CAGVEI/tayo2V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-03 at 10:11 -0700, Mike Dunn wrote:
> On 05/03/2012 03:00 AM, Artem Bityutskiy wrote:
> > On Wed, 2012-05-02 at 10:14 -0700, Brian Norris wrote:
> >> Hello,
> >>
> >> This is the fourth version of my patches to change the nand_chip and
> >> nand_ecc_ctrl interfaces so that the nand_ecc_ctrl functions have info=
rmation
> >> about whether the higher layers actually need OOB data to be read/writ=
ten
> >> from/to the NAND device.
> >=20
> > Pushed patches 1,2,6,7,8,9 to l2-mtd.git, thanks!
> >=20
>=20
>=20
> I compile-tested these patches on all arches.  No warnings or errors on t=
he
> files that were touched.

I think the worry is that we do not know the specifics of the drivers
and we may break them, while there is no harm if we do not touch them.
So we wanted to only push those patches which were acked.

--=20
Best Regards,
Artem Bityutskiy

--=-vs8Rhp5CAGVEI/tayo2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAABAgAGBQJPo4QNAAoJECmIfjd9wqK0I5wP+LhBzPfu/OXCiQtAhZ1Z8lWf
tQBBGnzkKuF4CdrQW8Yyc79+WwzQgquc7r5T5j7ZsG9y1x9UTDDyzE1r2ZEVXB+l
qXX4eCdzohzaeZhmupWSN1S3Y7GBbh3XlYE1KIs1C3Jek8cK5m6MZJz0TklCjBUN
ugBR2Cnmb4N8M9UGG6BuOaBEmam5fstZCTmmIWEc5dj6qJnQ/owmkAerYkQ1Sq8n
jV0M2s6Sv3oTeW2FUx5Pu0d/CqMwBHU/Fw2gCf+100rgd7hDsNIyfQa53e4DVDof
yCLlxycIEUK01l5z06UdCKHSo2f9AzOfOMuT283Rt0u54l/ZXruHEfZwS+lQaR6N
6woRNS4ukmMp01e5tcKfbk2vNhBHhuyPR/W+ZUo/kaJTq2q0XrMmM1VZcJmu1wQl
kVa3j5f/2ouOAKVeoQWGfjSFmYmvJk8r/RicUvCzedObc0+8OAVyhyc5MtK7Yk9g
nKQsVmSPaSP4TXU5C5r4gT1wAkRpOXB6y3imSfdOeLqUiZNFez4UCN7N8R7jPaZL
vYDgqixNNOemR+YI6w1ZdXY+ngp5qLw8lhCzAmrA//nxmbSCuqiLSlWU5nMV5+IT
W/vtoQn94mHmmQb/SjcpvhnM6YsxV9vJ0ugoOyx0ZuKNBFQHoSAuKxkkmXSz0kSg
JgHljSvDgXRTmsSi4nI=
=pFsM
-----END PGP SIGNATURE-----

--=-vs8Rhp5CAGVEI/tayo2V--
