Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQBDq-0002zD-A7
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:33:28 +0000
Date: Wed, 28 Jun 2017 13:32:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)"
 <peterpandong@micron.com>, "richard@nod.at" <richard@nod.at>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Message-ID: <20170628133252.061c3d4c@bbrezillon>
In-Reply-To: <07de9ec3-4ac5-2bfa-eea1-e996a4db1bba@gmail.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
 <20170627221552.6e4efff9@bbrezillon>
 <07de9ec3-4ac5-2bfa-eea1-e996a4db1bba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Wed, 28 Jun 2017 11:41:03 +0200,
Arnaud Mouiche <arnaud.mouiche@gmail.com> a =C3=A9crit :

> Hello Boris,
>=20
> On 27/06/2017 22:15, Boris Brezillon wrote:
> >   =20
> > Hm, actually I wonder if this ->prepare_op() method is really what we
> > want. It seems to be here to set the proper plane number and the
> > number of dummy bytes after the address cycles.
> > I'd say deducing the plane from the page is something standard. Whether
> > we need it or not depends on the information provide in the memorg
> > object (->nplanes).
> >
> > Regarding the dummy byte, do you have examples of SPI NANDs requiring
> > less or more dummy bytes in this read/write from/to cache use case?
> > If not, I'd prefer to keep it hardcoded in the core for know, and add
> > a hook when the need appears. =20
> Here is the page read description for various devices I have:
>=20
> MT29FxG01AAADD
> - fetch to internal: CMD_READ (0x13) + (3 bytes page_id)
> - read from internal: CMD_READ_RDM (0x03) + (2 bytes address + pane=20
> selection @ bit 12) + 1 dummy byte
>=20
> GD5FxxQ4xC
> - fetch to internal: CMD_READ (0x13) + (3 bytes page_id)
> - read from internal: CMD_FAST_READ (0x0B) + 1 dummy byte + (2 bytes=20
> address) + 1 dummy byte

Ok, so this is the one causing trouble :-). That's a good reason for
making the read-from-internal (or read-from-cache) operation
customizable.

>=20
> MX35LFxGE4AB
> F50L1G41A
> W25N01GVZEIG
> - fetch to internal: CMD_READ (0x13) + (3 bytes page_id)
> - read from internal: CMD_READ_RDM (0x03) + (2 bytes address) + 1 dummy b=
yte

Hm, I guess those NANDs only have one plane, so it should be compatible
with the MT29Fx logic.

>=20
> But you are right. It's time to have an adopted implementation for=20
> Micron as proposed by Peter, and we will adapt it later for others.

Ok.
