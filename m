Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4o9j-00050i-26
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 07:18:11 +0000
Message-ID: <1345792970.2848.256.camel@sauron.fi.intel.com>
Subject: Re: UBIFS is not remounted read-only from within do_emergency_remount
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Date: Fri, 24 Aug 2012 10:22:50 +0300
In-Reply-To: <16202485.ui8ZXcNIqe@ws-stein>
References: <16202485.ui8ZXcNIqe@ws-stein>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uXXugSNE14SefcFPOdmc"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uXXugSNE14SefcFPOdmc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-31 at 13:24 +0200, Alexander Stein wrote:
> upon testing do_emergency_remount from a power fail interrupt (using the=
=20
> workqueue of course), we noticed UBIFS is not remounted read-only afterwa=
rds.
> The current code in do_emergency_remount checks if the kernel actually ne=
eds=20
> to remount a filesystem using the following code:
> > if (sb->s_root && sb->s_bdev && (sb->s_flags & MS_BORN) &&
> >     !(sb->s_flags & MS_RDONLY)) {
> >         /*
> >          * What lock protects sb->s_flags??
> >          */
> >         do_remount_sb(sb, MS_RDONLY, NULL, 1);
> > }
>=20
> I'm not in the details of this part of the kernel, but I suspect that sb-
> >s_bdev is NULL for UBIFS as it has no block device, but the character de=
vice=20
> /dev/ubiX_Y instead. I have the information from a collegue that removing=
 the=20
> check for testing purposes for sb->s_bdev mounts UBIFS read-only.
> Any comments/ideas how to remount UBIFS as read-only from=20
> do_emergency_remount?

I think this check is there to prevent file-systems like sysfs, tmpfs,
procfs, cgroup and debugfs from re-mounting R/O. If we just remove the
'sb->s_bdev' check - they all become R/O as well. For me it sounds OK,
but I've never used this functionality, so not sure.


--=20
Best Regards,
Artem Bityutskiy

--=-uXXugSNE14SefcFPOdmc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNyvKAAoJECmIfjd9wqK05pwQALnh3wmYHgADUFCtdvND0C5L
IRdTaFThZfB8BGwnXlglMoW+BFwwZGxPg490GfPPyph9SFnvX+MNW2VMWFtwg7M5
5SWvN/Z7jHzn3yp9z16uC/UJVdS9N0AAZrI/CKRUfdme32QiHHJ/4bmj1Dpx9BSi
Q0RTp3zQEDtASv8wGPuPjOmFrca2Ahbse96brUzyTxJWvuw7NLiourWMoDTFShM2
CpDR95+iprykEKx1G2RWR3zKl164PWV6wEmba56vUelemGYex/n/XVchZvLc/kTf
BcYTCLgT/GPbZvSaXjlvtAv7Jix8qlh7phSbJ5nl3U5JBeohQCG79eGT6gYbPk/n
HKYO/Cbp6ntG4Qo/g1ROUnzh0JmSGekvb9l33qM3XFgsdYIzEqKvFiQuQ/2wfUIt
Pdp8UB7ct0pDpTXLwoGzeyaOR8ZPlogq3+YQaj88tsxfaVe+j0R4jjILarFe7dBQ
GRv+q944plvl2sjPHgj3Ifzqzo/2038avEgxy3R/j4TH+9LMVPPUmCyX0wB2d+YC
/NaJqh/4uCYhCmk3zXW/4xA8GgwcpLUNqXA+ytHFCk46BsBPc0FHMJp7M9dSEKpK
BS3EEBY8JkG3IF7nW/u70IrvMgFLjoL/6L32rIrRi0WBPcenOirhtPUy7rpAzn34
M59xyFgXwxWWADH4xRG2
=LJsD
-----END PGP SIGNATURE-----

--=-uXXugSNE14SefcFPOdmc--
