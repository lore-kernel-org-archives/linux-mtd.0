Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNe5H-0007RR-N5
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 05:51:12 +0000
Received: by lagy4 with SMTP id y4so293970lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2012 22:51:08 -0700 (PDT)
Message-ID: <1335505821.1767.2.camel@koala>
Subject: Re: [PATCH] mtd: nand: omap: fix race condition in omap_wait()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Fri, 27 Apr 2012 08:50:21 +0300
In-Reply-To: <1334661113-24709-1-git-send-email-ivan.djelic@parrot.com>
References: <1334661113-24709-1-git-send-email-ivan.djelic@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SC1dgisPue+0vFD9vou+"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SC1dgisPue+0vFD9vou+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-17 at 13:11 +0200, Ivan Djelic wrote:
> If a context switch occurs in function omap_wait() just before the
> while loop is entered, then upon return from context switch the
> timeout may already have elapsed: in that case, status is never
> read from NAND device, and omap_wait() returns an error.
> This failure has been experimentally observed during stress tests.
>=20
> This patch ensures a NAND status read is always performed before
> returning, as in the generic nand_wait() function.
>=20
> Signed-off-by: Ivan Djelic <ivan.djelic@parrot.com>

Pushed this one to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-SC1dgisPue+0vFD9vou+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPmjOdAAoJECmIfjd9wqK0Cq4P/3BEofcau9aw1HY+q1VBRF5g
WgJ2LlyAjcyi3Px9/X4x61fWhlaIaHIn8Fijm1inxF4+2ZBIWzA0C8De0JGZF0U5
Qm87EocFX+oRDkSN//wUCeADBrzfI9I1yM0l89mtdRypds9lmg2hzwg0jgE0O47N
V98gVBdmzMH5gmrzBXHxYfSOCJ4OOWwrOXUUkXuWx1Dr5eW6LHwkCcH/yFvpMVTg
ULbPmJ7CmRc6hiidul0syURc3ClZ5KMEz2iqzVJFOxCqvkEazSGKQeGBU9JUBrm6
R/e4ldHBgMz+ZUvHmoGF/u2Ogi44fbU7kxrW93YHnW0Y+H2ys8ze+sohbVWO7/jx
sxxkIdD4kxLvlkSMEk4ypk67rnOzMj47x9qqmVOpPAqhAuantti3k/QRLgIpRHIw
2evokw0SgjjLMJyAoCeNPPNM/IhLkW8Oln/lkZJJP4vAezzVuDYVh9lrai73kAPE
IPPH6me/aGeGm3nLG8/ClTam/luDw5/JjZtovy49OhwF7Rb6P/7X95XQT5uyml7y
Ky5Yym+0AJ3WCL8DpubQAcEQpWDzj4w2wkWQlwVvXruxWX0FJCToxnUSyvRfyY7b
7VHTNC0yWkCCpNxZD96zfNX/A2I9IdXUS6iDnWaS7u0ahssvX0/cImkearenrgUx
2ANyMSgEAlwTVnpkGKmc
=yAeU
-----END PGP SIGNATURE-----

--=-SC1dgisPue+0vFD9vou+--
