Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TNkj1-0003az-Fk
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 13:28:56 +0000
Message-ID: <1350307723.5769.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] jffs2: Fix lock acquisition order bug in jffs2_write_begin
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 15 Oct 2012 16:28:43 +0300
In-Reply-To: <OFDA2AD2F6.2BD9C5E0-ONC1257A91.003021EB-C1257A91.003058E4@transmode.se>
References: <1349429064-10241-1-git-send-email-Joakim.Tjernlund@transmode.se>
 <OF69AFCA95.D74167D3-ONC1257A8E.003A3DD7-C1257A91.002E54A0@rohde-schwarz.com>
 <OFDA2AD2F6.2BD9C5E0-ONC1257A91.003021EB-C1257A91.003058E4@transmode.se>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LoQqPWH/eqasC1v3Ss6A"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Thomas.Betker@rohde-schwarz.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LoQqPWH/eqasC1v3Ss6A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-08 at 10:48 +0200, Joakim Tjernlund wrote:
> > And "be be" in the first comment should probably read "be done".
>=20
> Agreed on all above points, thanks.

So would someone send the final patch with the commit message,
Signed-off-by, etc? Should there be Cc: stable@vger.kernel.org?


--=20
Best Regards,
Artem Bityutskiy

--=-LoQqPWH/eqasC1v3Ss6A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfA+LAAoJECmIfjd9wqK0lY4P/AwPPcvmUrEiqYAQ+nBCPViN
LLbqAo931Oi/5IomP+VpXG6fqxNhwfs8NCYj6uAPux74lLCXcOgvafBLlF0st66e
rS3A+IXX8Y0JabA9SEaMdYfMm1iBN0Iqhwdj9/5cypQgTN4kD94znddExrYVX/rL
jovzWtw0trdZgGYt0D4ZqVc7cJVVf/VOXHubXBMDgdJZbdYLumWv8sT1KTp9PkBe
F9r2Qe63xXkcKTFca5Z1k+Cso63Wv3iDqOqcLljZPQ2ApXCgQp2F3n43F/lXj7Sr
docNJBWaulGQ+xgu9kpnIt3bjiDrZVZIHViWv19up31iRFhyCKQphUmkO1WTzCPk
5n87G0L9VYCKrty2ZiHIeFy0IyUMwT9RA/3mf8dWhLu1lwuC8RG0XWEeOAPIuHZg
L9ClwUt6PN0biX/1snyxHQ0PnQ/X+MtQnjroLqI2f0rCHdq27aGjc4foRptj+uhE
VREnGd3jbH7amU/zKkT/nkuIc3Uz1Po7DnCaAvPlSlUKx6eKJUbVKUAYRKiNZEvZ
LaIUUytR2hIbg2uicUXDe1/UlU95+pum8KbLKi3ieI4MI432luv4PKLtp7Ob3xyn
IoB4snhFuAClcQSBEh8vFxZFTonuglTZ0WsvxuKJUNgzCZq5+MIeNdBJXop//eyi
XDE2K1gb9dggXfEVKlLe
=cBR4
-----END PGP SIGNATURE-----

--=-LoQqPWH/eqasC1v3Ss6A--
