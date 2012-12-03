Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfY0D-0007kU-PN
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 15:32:14 +0000
Message-ID: <1354548780.11583.21.camel@sauron.fi.intel.com>
Subject: Re: UBI wl_tree_add problems after PEB scrubbed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Mon, 03 Dec 2012 17:33:00 +0200
In-Reply-To: <20121203160258.4a719a67@spider.haslach.nod.at>
References: <50B8CB36.3010604@itwatchdogs.com>
 <1354545960.11583.17.camel@sauron.fi.intel.com>
 <20121203160258.4a719a67@spider.haslach.nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LnLfGic3jRgnGKPVQBQH"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Zach Sadecki <zsadecki@itwatchdogs.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LnLfGic3jRgnGKPVQBQH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 16:02 +0100, Richard Weinberger wrote:
> Am Mon, 03 Dec 2012 16:46:00 +0200
> schrieb Artem Bityutskiy <dedekind1@gmail.com>:
>=20
> > /me looks at Richard...
>=20
> /me looks at the code. ;)
>=20
> > OK, I confirm that this is fastmap to blame. Namely, this commit:
>=20
> CONFIG_MTD_UBI_FASTMAP is y and ubi.fm_autoconvert is 1, correct?
> What tests are you using? ubi-tests?

No, CONFIG_MTD_UBI_FASTMAP is "no", it is switched off.

I used integck. Here is the command I was using:

$ sudo modprobe nandsim && sudo modprobe ubi mtd=3D0 && sudo ubimkvol -N te=
st -m /dev/ubi0 && sudo modprobe ubifs && sudo mount -t ubifs /dev/ubi0_0 /=
mnt/ubifs/ && cd /home/dedekind/git/mtd-utils/tests/fs-tests/integrity && s=
udo sh -c 'echo 1 > /sys/kernel/debug/ubi/ubi0/tst_emulate_bitflips' && sud=
o ./integck -n2 /mnt/ubifs/

(sorry, you can easily split it).

--=20
Best Regards,
Artem Bityutskiy

--=-LnLfGic3jRgnGKPVQBQH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvMYsAAoJECmIfjd9wqK0K+cQANB5nnjrpqFkWNU0Jlttadzn
BdJDMdrjUUl1AcHqcErXY5x/EbrJxWq1ghCUJs9qdP/kaIIePJctSdzTEqNHsQV7
qvYVtNMUc+9CblZ4uT3zoiK4MK8fDs0lOR84GnfXN4hfBrL8HIGP1J2CPYZwKSjJ
4pbeiEwmmf+asIfAEhwURz65XysHlGGYr5RF6tIpLqvJHfhw19cTUDme7uSy4Of5
DJ2iBjR99cQx2g8XaU22SaXNiDYusPFthaBmtwh/kqKoqcHkjiFGOMvqM+TNS9oZ
3q5EamgzsFaMTzmCpEfBHyG+RJ+azGNC94u7UnK5YToa0qNaQTEpdfPVrY735+ht
aMJZYa0Jl8uJZdKy1DRSYEMkRfcSK2zgTIs7bdVKHNa5DjjQPARzGFBsbChMpYSn
xsJuXPsbck/PvhMoydSbb+QyjzS+kVvspMJylIbywEsGbEiAeGZU3yWKzV0lYWSu
gnKiDsU+AztlogDigkwkAHv0C6C6XI3+gzv7QqRRE8Z+NvD2rMy3cVP6+SpyfSiM
ucBj0+Q8j9lYwf+sj1WPVVodIyfPtsn2VqlR2fepPF6EVs+NPEzZHCNx+jy6sFm8
jovG70ZbhaDvu36vOQOGV75Q7nOE0Lo7JMLJJKonPlnUi8ouIpU0avwmRFxownrv
c8sGpKO3NsvdQhUVnw3b
=Q5xi
-----END PGP SIGNATURE-----

--=-LnLfGic3jRgnGKPVQBQH--
