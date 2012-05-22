Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWk1b-0003wX-4d
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 08:00:59 +0000
Message-ID: <1337673875.2483.116.camel@sauron.fi.intel.com>
Subject: Re: Problem with UBI / UBIFS (mainly ucorrectable error) on kernel
 higher than 2.6.30.10
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lukasz Nowak <lukasz.nowak@homersoft.com>
Date: Tue, 22 May 2012 11:04:35 +0300
In-Reply-To: <1337605024.2646.16.camel@debian.softace>
References: <1337255133.2457.66.camel@debian.softace>
 <1337348152.2483.59.camel@sauron.fi.intel.com>
 <1337605024.2646.16.camel@debian.softace>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cq0/uqdjMfUgxtr+ubKQ"
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


--=-cq0/uqdjMfUgxtr+ubKQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 14:57 +0200, Lukasz Nowak wrote:
> Hi Artem,
>=20
> Thanks for quick the response.
>=20
> 1. Please find attached log that you asked for. This time the mounting
> process started to run torture test for PEB 2062 in infinitive loop.
>=20
> 2. I have compared the MTD sources between 2.6.30.10 (last good kernel)
> and 2.6.31.1 (first with problems) and I found where is the problem.
>=20
> The new version of kernel (2.6.31.1) introduced some new buffer (in
> orion_nand.c file in drivers/mtd/nand directory you will find new method
> orion_nand_read_buf). What I did is that I have commented this line:
>=20
> //nc->read_buf =3D orion_nand_read_buf;
>=20
> in kernel 2.6.31.1 and recompiled it. This helps and no errors occurred
> this time during boot. I have tested 7 different devices and all of them
> are now OK. What is more I did the same with kernel 2.6.38.4 (our target
> kernel) and again no errors occurred during the boot and everything
> seems to work just fine.

OK.

> So my question is what is the buffer responsible for and is it safe for
> us to just remove it like I did?

I do not know, what is the commit id? Why not to put the author of that
change to CC?

--=20
Best Regards,
Artem Bityutskiy

--=-cq0/uqdjMfUgxtr+ubKQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu0iUAAoJECmIfjd9wqK0s9IP/AjXx2Ri9lozGSeIN7QMrdMC
u6NfRNv7ucfR2klf2XB7EbwUFAFG7fF4hTiWxc6EkWr+uOlgBFOmW3TVlA6FWNO6
labBCkzvHSfAkTZwLppNqOicC/n13zbMOSAsg5zykLI+arOfRyi7nYZ73aNElqIz
ie7nESe4WC45M4wIw+BCoW2eh4sBOQxK3NeQwqkK2+ezQmlSuttBpuMPQg2dWJTC
khF8+p4JP2D4gq+cm21+zcG8zHQZhoNjDaC569VlreH+6CCsn/wvqAZTPjv+bTWa
/s9Mdel/JAbUGiyTLqEcFBWFjuWPsAnqnVqNYv7e6DfhGgh1gzfNJ6qzOWYkmRtT
Z7pYO0FkdzxhEmEgVy8frh7oBSewCOS4NQ3OZVChdhpGHHhIp+gNLaIVolqWhavt
oq7URtJgkMNSqfQ+rz/9npfkyjNpAw+JL1bFTZp7F2fi1eMPPY/E9H5jtxxslRYG
eJQkoyjuXZmd32zvG3Je/vYqcTl/ie5kZxDrtZtjrYZIDkwGXO+nMDxImWfJReAc
LxMvUlzXMDetH+Ssp5/jfq9rxbikobeqYm6iI35/hxH6ZbAkX9ozBTIylVkTBrPF
8ybbmfUytp1Ibm/iWmxvV8szziXVfp4aPRkM1Ln8pRTNwAwmwJmQK49VB+UBrIVH
tSpPqACIVC0ROxOyaqRc
=+3iM
-----END PGP SIGNATURE-----

--=-cq0/uqdjMfUgxtr+ubKQ--
