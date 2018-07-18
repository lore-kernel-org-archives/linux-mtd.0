Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffhAk-00049M-8N
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 07:46:55 +0000
Date: Wed, 18 Jul 2018 09:46:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: add default values for dynamic timings
Message-ID: <20180718094632.1105861e@xps13>
In-Reply-To: <20180717142621.380adf1e@bbrezillon>
References: <20180714102354.12323-1-miquel.raynal@bootlin.com>
 <20180717142621.380adf1e@bbrezillon>
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

> On Sat, 14 Jul 2018 12:23:54 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Some timings like tBERS (block erase time), tCCs (change column setup
> > time), tPROG (page program time) and tR (page read time) are derived
> > from the ONFI parameter page. They are set in the SDR interface only
> > if the chip is ONFI compliant.
> >=20
> > It makes these timings unreliable and prevent the driver to use one of
> > these four values with a non-ONFI chip.
> >=20
> > Fix this situation by taking the highest possible value (or a default
> > one) value for each missing timing (stored as unsigned 16-bit entries in
> > the parameter page).
> >=20
> > This makes tBERS and tPROG being ~65ms while typical values are at most
> > a few milliseconds. As these are timeouts, it is not impacting at all
> > the performances in nominal use.
> >=20
> > tR maximum time and tCCS minimum time (delay to wait after a change
> > column) are set, according to the ONFI specification, to default 'slow'
> > values; respectively 200us and 500ns.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
>=20

Applied to nand/next.

Miqu=C3=A8l
