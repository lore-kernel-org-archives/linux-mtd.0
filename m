Received: from smtp5-g21.free.fr ([212.27.42.5])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciU0E-0001xH-W5
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 22:42:49 +0000
Date: Mon, 27 Feb 2017 23:41:52 +0100
From: Alban <albeu@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Aban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [RFC 0/3] drivers: Add an API to read device specific config data
Message-ID: <20170227234152.5c4a90dd@tock>
In-Reply-To: <20170227214230.53f05677@bbrezillon>
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
 <20170227214230.53f05677@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WEtezQsSsyIxtubrqnM=t6T"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/WEtezQsSsyIxtubrqnM=t6T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2017 21:42:30 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> +Moritz
>=20
> Hi Alban,
>=20
> On Mon, 27 Feb 2017 21:28:09 +0100
> Alban <albeu@free.fr> wrote:
>=20
> > Hi all,
> >=20
> > while looking at adding OF support for the ath9k driver I had the probl=
em of
> > reading the EEPROM data. On the SoC platforms this data is stored in an=
 SPI
> > flash along with a few other things. In OpenWRT/LEDE this data is read =
from
> > the board init code using the fact that the flash is (normaly) readable=
 from
> > a memory map. A bit too hackish for my taste.
> >=20
> > This is just one example, there is various other similar cases, mostly =
with
> > MAC addresses. I thought it would be nicer if we had a clean API for th=
is,
> > similar to the firmware API but per device instance instead of beeing p=
er
> > driver. The device driver wouldn't have to care where the data is store=
d,
> > they just request it and the backend take care of reading the EEPROM, M=
TD
> > or whatever is used on the board.
> >=20
> > This series implement such an API along with an implementation for MTD
> > devices and a use in the ath9k driver. As this is an RFC I didn't yet
> > write the OF binding documentation, that will come later if the feedback
> > is positive. =20
>=20
> What you're looking for already exists and it's called nvmem[1]. Some
> work has been done to expose MTD partitions as nvmem cells [2], but
> it's never been finished.
> Can you please finish Moritz implementation instead of creating a new
> API?

I didn't knew about the nvmem API :/ I'll look into finishing the MTD
support then.

Alban

--Sig_/WEtezQsSsyIxtubrqnM=t6T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYtKswAAoJEHSUmkuduC28bJ8QAJWTrszPrDGK2oX0AqspetH4
fnod2CNS+seETKUQaLc6iW2t9eJUIVhZt4HvA0vYhjrgJXJWr+uMtmN8p1B8SG3t
QE4y1mhO/81wOddrBBuCAtXmKhT53CyRNfQ5u5K6tWR6UnEmbJ2Peh2KTbu3/5pD
9pb+pQMLzGVUageZ+JQQB9HOMSsVHDDTY8iROnsKh7sWWl3PqzNx8+TobA1vBahQ
PrI2hWFp3iF6BYDO1l3wBzu9DdZVkrWsjpEXaCf+KYA0GX9Sza+aZXyoLHpZJV9Q
q6HeI0Cb73MCA2P4fikvvWWC2RETjarJoIgNH4Y7GX72CFrqA2bMyXbssDLzCXY/
Gq4C3I8+pFWGH5zNynCSCCViz5uThJZNkx8hFMapOrZ8vHRb2m7L9cbaTw9+Cw+W
jROUK0b3l5RHSQRY3kgo4mkuu3dk9oEI29f0BHjrjy9+mAp4b0R4jZq7HElKEUjC
ZZ298hKgmQ29KmO7bK1tPsC057jyKrw/3bcQISlAhZqrIQAZkualLO72U4/SB8SY
/lXTUjW6KR0oAk2KvjuVTB7hedqnhNT+qA1zHEs+XHsfEKwCJhQIKqp8o9ucu283
Vqr8XXi0kxW4EizjjHYReFly1s/kJQcOOKDdsTncxinA1hA/hhI4ULD697xZ6opy
TAN9rRGddHeTqdUSQrB3
=jI5O
-----END PGP SIGNATURE-----

--Sig_/WEtezQsSsyIxtubrqnM=t6T--
