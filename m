Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDCGn-0007Aw-CO
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 10:07:53 +0000
Message-ID: <1333015836.31549.134.camel@sauron.fi.intel.com>
Subject: Re: UBIFS won't recognize ubinize image
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
Date: Thu, 29 Mar 2012 13:10:36 +0300
In-Reply-To: <5D308BD40154E4439D82454FE483A502064C7FD5@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A502064C7FD5@EVS4.nam.ci.root>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Ap9jJoxXtzQFamF1/XRA"
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


--=-Ap9jJoxXtzQFamF1/XRA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-27 at 19:15 -0400, Bishop, Mark wrote:
> 4) Transfer the ubi.new.img to my target, erase flash, write flash:
> 	bfin> tftp 0x1000000 ubi.new.img
> 	bfin> nand erase 0x880000 0x6400000
> 	bfin> nand write 0x1000000 0x880000 ${filesize}

Double-check that this actually writes the image and places it
correctly, ...


> 	UBI: data offset:                2048
> 	UBI: empty MTD device detected

because UBI believe this is an empty MTD device. It checks this by
reading the first NAND page of eraseblocks and checking that they
contain only 0xFF bytes (it actually checks only EC and VID headers).


--=20
Best Regards,
Artem Bityutskiy

--=-Ap9jJoxXtzQFamF1/XRA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPdDUcAAoJECmIfjd9wqK0X3IQAKg988K+ypAMu+l/6u3VZlm/
rfGrIj6ZMEnNqyEeit42go677c2+0ceLR6eEt3SydToHssIWR43ZWYOZoSnfip+2
Yqct3oInWGF8cCcJQzHiHJsfxaTEvQw55z6a3Ow78bdE+EZZQZ+TYiiQBzTCATZ0
L9sw25YIjFTEiBZ6/JZEZf3NRj5l1Vq3ULu4cM86thRXk8yvgRLVAehIgfXpcnkN
pIL6eJ+4Hrl4FzmZBiJGolbBQ3O7C2Yr+TsKQrmsTjkGwYp2Xd5nbdwDnLZtT6gv
UCQwf7+t+IZb4l+tZjvMixkhElMsJdB1NM0jUzpezpujWTp1TfzCRyxh5sOBvLKb
HYkmDszxYVPihXaiFqnQqFYl17JbgHIgVpOKhmm9Tg8WatFk3DaBk4hcXbvpZdjJ
GndG2c+QzSt4NQwVr+VajqVi33ylH6FNTbmJXxjaQ2r/owFheSTYkw3qrYYd0Rt4
saTBmy8NR49oswlHpvkNriWKi3cPt3cykNW7ryf1nNL9gYuTBhvOuR7VKrp5f0yR
1pKNRYA7UNkzY6PKG7TuGgeV2+3Lb3XsXktQqmx3LTSImbIJPgZ4JwEJYgJkVERx
YQwtzqcOs7JnKTzFcinSsk5JKhkqyHJETDC6Nz1ZD9t5325Ch0Vmd4cE0+JmgOsn
gKjY1xQTlOHanwGRTWQi
=lPLm
-----END PGP SIGNATURE-----

--=-Ap9jJoxXtzQFamF1/XRA--
