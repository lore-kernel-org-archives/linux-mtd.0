Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4T0N-0002VS-9B
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 08:43:08 +0000
Message-ID: <1345711673.2848.214.camel@sauron.fi.intel.com>
Subject: Re: Current mainline (3.6-rc3) UBIFS errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
Date: Thu, 23 Aug 2012 11:47:53 +0300
In-Reply-To: <20120823103934.1028f491@archvile>
References: <20120823095048.6c6ee35a@archvile>
 <1345709408.2848.207.camel@sauron.fi.intel.com>
 <20120823103934.1028f491@archvile>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DPnean13lwyglBGQFVIy"
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


--=-DPnean13lwyglBGQFVIy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 10:39 +0200, David Jander wrote:
> On Thu, 23 Aug 2012 11:10:08 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
>=20
> > On Thu, 2012-08-23 at 09:50 +0200, David Jander wrote:
> > > [    4.069409] UBI warning: ubi_io_read: error -74 (ECC error) while
> > > reading 160 bytes from PEB 5616:87112, read only 160 bytes
> >=20
> > Hi, looks like a problem with your driver. For some reasons it returns
> > ECC errors when reading small amount of data (160 bytes). Did you run
> > mtd tests - to they pass?
>=20
> I thought so at first, but this error appeared on two different hardware
> platforms at the same time, when upgrading to latest mainline. I am comin=
g
> from kernel 3.1, which worked fine on the MPC5121e. The ARM platform also
> worked without problems on a previous version (I think it was 3.4-somethi=
ng,
> not so sure right now). The only common piece of hardware/driver is the a=
ctual
> NAND flash chip on both boards (Samsung K9K8G08... SLC 8Gbit NAND), so I
> thought this had to be a (temporary) issue in current mainline code.

A change in the mtd layer probably caused this.

> > So UBI just tells that it cannot read, the root-cause is in the driver.
>=20
> Two different drivers... same issue!?

Quite possible if there is a bug in mtd layer. First try to find out the
latest working kernel release.

> Can you tell if I am supposed to be able to mount a UBIFS device formatte=
d
> with 3.1 on latest mainline without trouble? Is there a chance OOB layout=
 may
> have changed, or something similar? I tried reformatting with 3.6-rc2 jus=
t in
> case, but the problem remained.

Absolutely yes, we maintain on-flash format compatibility and you do not
have to re-format your flash.

--=20
Best Regards,
Artem Bityutskiy

--=-DPnean13lwyglBGQFVIy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNe45AAoJECmIfjd9wqK0+0UP/RNJCCbASIHCydDieTg7W+qD
0tuQVQiOmcb4Qm7f6EHBoT0WI48x7jx6TU5f6ntMqgzztRom7EfIhGpFp5NrjWaS
Rsb5ZWt6CiAXy7dF6ViQCeyaXCnPJCLbrUxu93sX2ShM7ieL0wXhcKhrEK4CctFJ
UcKRWIT77+2Nl5tfImH2taleTp3fcGyypQZntdBi5lRdk/8kHunHZgJapcrCBAlu
P/p3JItHszvc4JpKc5SEl6lEdYB+vIWvptSpmxN5JpHM5gGoV9oDvtSUC+Jar0WJ
Kkh99qXl1f/UhctcO2ogur3WW2eoMs/7YFYzqVp7t5Ig33wB3rzdhNhRiJZBj6bT
sfOuhqVYTX+5mtQw0jlbO4pyVHpQd95MqRpMNl8JErwEDvs/ky6JrchOa5enZTBp
XWG3mKe0b5xPT3P4p+5xz0OrHz5g+1GySKvhWuTwVYZ8WFmLJaiP/MmJGknt6dU+
+7BBtUMj55y4S7p3Jp3gGISoXoFEhRwW73rcUCQIlrt5S+6QNnxG5cJPZPDiSe65
WZuJO0rgKLP3qe54IiEjYUZMtRALBOV0JRABG+3ZZJXLiU0yhr6xh6XSfH3oWelu
CR7Kj8NtJyviPN7wTtCCnZs0u9N6if0U0mgHaCK2kUwU2LKcVw+RNeCa6ZBJFNMA
gl/hyu0O05wYisgAR2bP
=eLdH
-----END PGP SIGNATURE-----

--=-DPnean13lwyglBGQFVIy--
