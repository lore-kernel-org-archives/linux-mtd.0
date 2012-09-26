Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGoJf-0006IH-8K
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:54:03 +0000
Message-ID: <1348653248.24309.55.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cmdlineparts.c: Codingstyle cleanup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Wed, 26 Sep 2012 12:54:08 +0300
In-Reply-To: <1348043427-5165-1-git-send-email-sr@denx.de>
References: <1348043427-5165-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2hi5JXl+T74KO30b7vz2"
Mime-Version: 1.0
Cc: dedekind@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2hi5JXl+T74KO30b7vz2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-19 at 10:30 +0200, Stefan Roese wrote:
> The codingstyle of cmdlineparts.c was really ugly. I've run this
> file through Lindent and made some manual tweaks.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>

But it is cleaned-up in the l2-mtd.git tree. Remember to base your
patches on this tree :-)

--=20
Best Regards,
Artem Bityutskiy

--=-2hi5JXl+T74KO30b7vz2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYtDAAAoJECmIfjd9wqK0XbgP/07jdiCSZ+JeT9NotBx0jMsr
uUv32oIr9xT+hnRYdksEF+8qDk+w0GWfSRTdexW8iphq17hd+ay1F/Lny3edn3Bb
UujiOGVzdg1SgVNiSgKHfIOGfOsDs68By+niJU6Rv7naloCQBCZeJY0c8FF4nZNT
FNzR62hCg7zvz90bSly1OJAGuNTJQqm6ROG03cSiKfckoLxsC29Ww6GGmLUKGtoH
EfjeFRY4PcPMuKdfTwaBZG8Nw4jaFkaF/YMtfr3NiFG0jwVLMZKn6jyMUrSJZfOF
zt6laSI09GwQGVzqkuY8JoYxV6PxqOQc0qDZAJ2WORxyTKgSb8rQldKl5S2FwsH/
AKPw3e0wq0ZnWD31uEjxeH72veu50XDRJ6+p0io2GAvlwCPZBBmMIlqG6dkTnJPG
svK+iNrOj633a+ormZDb6Xijc0BmDKJbskMJYafC/RwgVwHjswF1IKCyWKCETcv9
HDzH9VBu82iwWii3Rc/EKHmpVkU4Rb1vi8SDQYxG2UiwRVOInUowrzXRJ/HoMcQW
rhxSvypjG1WSypBLQtM7l5yDX67RZbhNQDvVUTVqC3YLIcGoKMTPPm8ys6JGA6lw
NrfYw4iuSxeiKnvglqGObcZ0ILs8mL193koPB2ZZC9lqVAszEZP9/HrUWz6DapVv
HFD9UECaeZNxlZiws5h2
=qhYO
-----END PGP SIGNATURE-----

--=-2hi5JXl+T74KO30b7vz2--
