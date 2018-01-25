Date: Thu, 25 Jan 2018 11:05:54 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: sunxi: Fix ECC strength choice
Message-ID: <20180125110554.699b56e3@bbrezillon>
In-Reply-To: <20180124235936.4b49b094@xps13>
References: <20180124224931.14392-1-miquel.raynal@free-electrons.com>
 <20180124235936.4b49b094@xps13>
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

On Wed, 24 Jan 2018 23:59:36 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Hello,
>=20
> On Wed, 24 Jan 2018 23:49:31 +0100
> Miquel Raynal <miquel.raynal@free-electrons.com> wrote:
>=20
> > When the requested ECC strength does not exactly match the strengths
> > supported by the ECC engine, the driver is selecting the closest
> > strength meeting the 'selected_strength > requested_strength'
> > constraint. Fix the fact that, in this particular case, ecc->strength
> > value was not updated to match the 'selected_strength'.
> >=20
> > For instance, one can encounter this issue when no ECC requirement is
> > filled in the device tree while the NAND chip minimum requirement is not
> > a strength/step_size combo natively supported by the ECC engine.
> >  =20
>=20
> I forgot to add the Fixes/CC tags, but it seems that this problem
> has always been out there...
>=20
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller
> support")
> CC: stable@vger.kernel.org

No need to send a new version. I added the Fixes+stable tags when
applying.

Thanks,

Boris

>=20
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com> =20
>=20
> I will wait a review before sending a v2.
>=20
> Thanks,
> Miqu=C3=A8l
