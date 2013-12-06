Received: from mail.aswsp.com ([193.34.35.150])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VotKO-00021x-DC
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 11:12:13 +0000
Date: Fri, 6 Dec 2013 12:11:30 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Coping with multibit ECC flashes in UBI
Message-ID: <20131206121130.05637732@parrot.com>
In-Reply-To: <alpine.DEB.2.00.1312061015380.1898@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1312061015380.1898@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Fri, 6 Dec 2013 10:24:17 +0100,
Ricard Wanderlof <ricard.wanderlof@axis.com> a =E9crit :

>=20
> There have been SLC NAND flashes around for a while which according
> to their data sheets require 4 or even 8 bit ECC (usually BCH).
> Traditionally this was only the case for MLC NAND, with SLC only
> requiring single-bit ECC (Hamming), and even then, bit flips were
> very rare.
>=20
> For flashes that require multibit ECC, it's common to have single
> bits which flip fairly quickly after having been written. Thus, the
> current scheme in UBI of rewriting a flash block when an 'ECC
> corrected' status has been returned during a read would quickly wear
> out certain blocks.
>=20
> I seem to recall there being a discussion like a year ago about=20
> introducing a threshold for the number of corrected bits in a page
> before the containing block was rewritten, but I don't know what
> became of that. Anyone who was more involved remember more?
>=20
In mtd there is now a bitflip_threshold.

Check commit d062d4ede877fcd2ecc4c6262abad09a6f32950a
