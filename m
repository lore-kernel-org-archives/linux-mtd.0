Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSqR7-0005QU-7y
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 14:03:15 +0000
Message-ID: <1336745193.2625.81.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 12/14] MTD: MIPS: lantiq: implement OF support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 11 May 2012 17:06:33 +0300
In-Reply-To: <1336133919-26525-12-git-send-email-blogic@openwrt.org>
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org>
 <1336133919-26525-12-git-send-email-blogic@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Br6LUzRPYqcySERHclUK"
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Br6LUzRPYqcySERHclUK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-04 at 14:18 +0200, John Crispin wrote:
> Adds bindings for OF and make use of module_platform_driver for lantiq
> based socs.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mtd@lists.infradead.org
> ---
> This patch is part of a series moving the mips/lantiq target to OF and cl=
kdev
> support. The patch, once Acked, should go upstream via Ralf's MIPS tree.

Looks ok, but could you please send me the entire series anyway, may be
privately. I want to feed it to aiaiai and check before acking this
patch. Also, please, make sure you add dependency on OF in Kconfig.

--=20
Best Regards,
Artem Bityutskiy

--=-Br6LUzRPYqcySERHclUK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrRzpAAoJECmIfjd9wqK0unIP/jY4ohepbSULOEHDADQaGi7Q
2nypFAYH75c6qsugGGUo7sdWWdmwDuced3N4HvzdX6EjCRcfFaQZMhOR27NYLrxA
S+Tm3JHVgXBwuIuvsaLiKEiULQqTXBMyjSEdXJf2/fH/SRtv7xtkJzCkUYljk7Aq
mnvpClwQQG7tsk0rsHRbqNevfgPHj7puA3ppImGSg/IR0TBT/qm+t17h85K78HBY
/7Zj8HdljeuiBj2e/6YtHSYZu1ba7Bhx60P5IowWyuWBNwPAgXYDbjbZrn2kRw5I
kDVZTcBF4zLZtim//XE13pPIskVywlsw4ahijEu29bz+zQIF3ReNZzukv3gj4W0Q
N3+Tdyr8+S7HEe9KmgGmgF2GTPNjHB5BJkqlsA87orH1H9p+OMAVCEgIwxJxORU+
M3DbQMuEqbsIqi4ffkwZgaE4cCxfpPDMjQjeAVznOu38CXybs3BTiDaj0h+QNHRH
AKJ6ZwN+fqU+4JtKtrR2w2SEhPe/oUBd1DB0uUHloumPoSv2UCZrR8FgNlNxAuA6
y7D2nnt47wER3oL8uY5VSL4Kk/J5jD0JDWyGJeqURX6o3ZeyAzHRsmvebR4142wS
t905w+8y4unGprQCbQJa1dhMALbhVjB0555Ume95RPvHdLislCVrezKB69Fjd1Kq
XrCDFsD+V+9oEirRioym
=TFFa
-----END PGP SIGNATURE-----

--=-Br6LUzRPYqcySERHclUK--
