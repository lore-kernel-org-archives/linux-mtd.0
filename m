Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2Hbt-0001NY-8I
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 08:41:06 +0000
Message-ID: <1359967368.13791.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 1/3] mtd: add new fields to nand_flash_dev{}
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 04 Feb 2013 10:42:48 +0200
In-Reply-To: <5105DD0E.1010500@freescale.com>
References: <1359007901-26464-1-git-send-email-b32955@freescale.com>
 <1359007901-26464-2-git-send-email-b32955@freescale.com>
 <5105DD0E.1010500@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4CWMzGYPcj9eIFzh/fDF"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, shmulik.ladkani@gmail.com, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4CWMzGYPcj9eIFzh/fDF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-01-28 at 10:06 +0800, Huang Shijie wrote:
> > +     unsigned int id_len;
> > +     unsigned long oobsize;
> > +     unsigned long ecc_len;
> I think it's better to submit another patch set to solve the ECC
> problem.

Would you please strip the cited text when bottom-posting - this would
be a lot mailing-list-friendly.
>=20
--=20
Best Regards,
Artem Bityutskiy

--=-4CWMzGYPcj9eIFzh/fDF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD3SIAAoJECmIfjd9wqK04V0QAIe0aP4NYMF7c0tQpkfxBLC9
pi5h4JCrH+zAO/wlWbwCk2r315l/1Pir7OvYvGRU5ygobGYxX1nomL/XHYYxSeoA
D9F2fVr3vYrlCrS43ujw7MEt9ya9mLNyOs2DZESDiL57ikfx2cWfi2qxSSwbQ4zd
7KvP6tGADueRas8LL9TegBSijLD1NgAw2alb0kAFGoRlpSzOp8zHJxOaSSD8K63u
UMMEeP1b7fiLRK5m9xEAoWoZwlSd1VxgT7UBkzZJD7B99kAhq1uuIvwChq7NjFOQ
h2PC2l3NKeyUaF+CdGjI2oJZA5VgzhzpThVQ40h7jtRz/2gxgAcXpndsb42EJPTb
iUHhRG4LdcEuRBZaahwzEmpp2Wo1bc2SqQ47IrvrwTWOnLsOaXwyVEw5vz3avwKb
bnP6gUwYo1P0R+dn1/QrqM4gBJ1lR8RuUOwjtW4WoR6QHAicTLnJem/q+0Eelv61
djpynJMPNsgMDICGr8Ti5KpUXYbkSTDT+VpyLse4IgWuCCcxdFYJSRiwy96f273I
qDoNXfx3H/DF8yGXESq+NW1OElRKaTu7UO1/5Sxm4r5mkLZ6hX4CvgSt+2zStbyk
yjf65BMvtM0NfOw88XXUcmu1nivVi51pn585PHax3JPb5Jhjopl7UQEA9J8MJK4A
Vg5VTGmsNSxJn+LzwiPC
=C/Es
-----END PGP SIGNATURE-----

--=-4CWMzGYPcj9eIFzh/fDF--
