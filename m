Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYxVr-0001Kg-Hh
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 11:21:40 +0000
Message-ID: <1352978534.2221.33.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Date: Thu, 15 Nov 2012 13:22:14 +0200
In-Reply-To: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ghlmya5r6sFeCfmQZHLH"
Mime-Version: 1.0
Cc: afzal@ti.com, linux-doc@vger.kernel.org, tony@atomide.com,
 gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org,
 broonie@opensource.wolfsonmicro.com, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, gururaja.hebbar@ti.com,
 linux-mtd@lists.infradead.org, rmk+kernel@arm.linux.org.uk,
 ivan.djelic@parrot.com, dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ghlmya5r6sFeCfmQZHLH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-31 at 12:38 +0530, Philip, Avinash wrote:
> Support to use ELM as BCH 4 & 8 bit error correction module. Also perform=
ance
> enhancement by adding single shot read_page and write_page functions for =
the
> nand flashes with page size less than 4 KB.
>=20
> ELM module can be used to correct errors reported by BCH 4, 8 & 16 bit
> ECC scheme. For now only 4 & 8 bit support is added.
>=20
> BCH 4 & 8 bit error detection support is already available in mainline
> kernel and works with software error correction.
>=20
> This series is based on [1] and tested with RFC: OMAP GPMC bindings
> patch series
>=20
> 1. linux-next/20121030

Would you please re-send a version which cleanly applies to the
l2-mtd.git tree? This series has many conflicts. Thanks!

git://git.infradead.org/users/dedekind/l2-mtd.git

--=20
Best Regards,
Artem Bityutskiy

--=-ghlmya5r6sFeCfmQZHLH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpNBmAAoJECmIfjd9wqK09xYQAJcz98/ltdADT809ReLBCqsu
ZRxBPhKu6fXT3Q+CQi5NGnQZmyIjd38bmW4z2Q65XFfvnXyVcwWO97vHDvoYlbf9
4S4mXli4G0HBQ6xti1spOLsn7cv0Be9nfzBm34XKy+TAOkySv0WJb0q7fflxXJDF
PmKbibPXdRyFPyOttRiVA/HsJzHyIVWSD5D+5pIWjDWSRELRT19IQAraDhnZkbGC
AqIjeWxgrEXO5TqfEHQm0qM9kQjFLF4fVFVcRe75CGwCGMaiTAbioPr/ktr8eNE+
qiaKJ4FuSFM1V0Vq8Fmu+/nSXZpFQB0HGAhPl2ilf70wIh3+HET/h5hgcU11esbS
ckynh/rpTBOVb5n7RSiSar7ty5TormC9iXjp3uaA77yUoswkw5akcsl8Nd7oPi66
3chmga7RsUOEzDV5H3X54I+1PAiIlrrOAihMlRJg/4r9l3x6vrQBjNOap+qHofoQ
gabSqrRS3ar+TCPJNV6XcSMvJHiMa5jcnD4Wawb7r4F3DeNOsqSjnq6CBy3/oURB
HOWwu2K64LFx5hCpJVkzEA7C35+tMT7NqKiS1nvcn0n2c9Evkm+L0L3jmYra/2Oa
e2zO90XP3tBQyv3YunqKg8pWXyxfJFfNOpsY3xBKPOWO7gFsP3Kl6zkAquFJNApn
5PYSdfdcg0ObPzk3tEvN
=Qezj
-----END PGP SIGNATURE-----

--=-ghlmya5r6sFeCfmQZHLH--
