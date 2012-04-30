Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SOkhX-0005Sv-W6
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 07:07:16 +0000
Message-ID: <1335769811.2584.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 00/10] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 30 Apr 2012 10:10:11 +0300
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CLp6DCjDhVjXOmG4UAdk"
Mime-Version: 1.0
Cc: Lei Wen <leiwen@marvell.com>, Mike Dunn <mikedunn@newsguy.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Li Yang <leoli@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Axel Lin <axel.lin@gmail.com>, Bastian Hecht <hechtb@googlemail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CLp6DCjDhVjXOmG4UAdk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-04-27 at 18:29 -0700, Brian Norris wrote:
> Hello again,
>=20
> This is the third (final?) version of my patches to change the nand_chip =
and
> nand_ecc_ctrl interfaces so that the nand_ecc_ctrl functions have informa=
tion
> about whether the higher layers actually need OOB data to be read/written
> from/to the NAND device.

Brian, now your patches do not apply to l2-mtd tree because of Mike's
changes I guess. Would you please make sure v4 is rebased against the
latest l2-mtd.git?

--=20
Best Regards,
Artem Bityutskiy

--=-CLp6DCjDhVjXOmG4UAdk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnjrTAAoJECmIfjd9wqK0kTEP/28oJh0qgno+IWVJJ6ajzwpr
7HGvfehtJAbLtZFH81GCpgjAP65vc7Cjnh69M4VMkaCNt4LC4LFJoIMU6GeW1449
L5diB1Da5Ty+G0SMvP0OvF7zPu8qgdEPMmuB9v4kxHfs+7du6AbpBuhJHESKPG3D
MLm/8pbyGwyi8Ol7pV6VVXP9mW9GiUrMlUNV2GFhJy435gA726/Pn0tcb4b7/mrN
ZEiCZaYyQZILghDJZWPInBWpbsRW2guGL21L7T84il2oUsWyAWg+cnO4slnXNlzF
lmspPrzY6tIWsjZ1LdP1Q4oIBrSQ6/fWaaa2ufpebLIxrt70KOmKphugOE5KXMTN
rcQ/2h/8PmbtyhXrZ/34kqMKam1e/SIslcZb5PWeALzk4J/+J0061RwYT59RSncN
NVMj1f+LPPRDC4nxs9D9fgv/YtjTYumf9ckCDAQSMfp+7eOD3hKgi7JIPWxyZwCm
a5nfgQ+PvlgM00ZhVau24NdNt92FjHnVw8M5IQuTwH/N/A3H/vu221SCSS25NiOI
87zHy1ePGiceE8TGIWGGYyMVQhVIxTzmeks9xE/hm7zAWSdZbqqre7Mg4z16uDHM
5hkRaS9vNpSDSQQ9vOThDx1NpNiQPBKyWi1DxkuXC1jFsvxS3BSI+80lqVAyoqOc
GyrJRkD+h0zirYCeauzj
=B4Wc
-----END PGP SIGNATURE-----

--=-CLp6DCjDhVjXOmG4UAdk--
