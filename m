Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff6hk-0001e6-E7
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 16:50:34 +0000
Date: Mon, 16 Jul 2018 18:50:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 12/14] arm64: dts: marvell: add AP806 SEI subnode
Message-ID: <20180716185018.3846a619@xps13>
In-Reply-To: <20180716153158.GA8527@rob-hp-laptop>
References: <20180714135428.26955-1-miquel.raynal@bootlin.com>
 <20180716153158.GA8527@rob-hp-laptop>
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

Hi Rob,

Rob Herring <robh@kernel.org> wrote on Mon, 16 Jul 2018 09:31:58 -0600:

> On Thu, Jul 05, 2018 at 02:40:09PM +0200, Miquel Raynal wrote:
> > Add the System Error Interrupt node, representing an IRQ chip which is
> > part of the GIC. The SEI node has two subnodes, one for each interrupt
> > domain: wired (from the AP) and not-wired (MSIs from the CPs). =20
>=20
> Where are the 2 sub-nodes?

Indeed I did not update the commit log.

[...]

> > +			sei: interrupt-controller@3f0200 {
> > +				compatible =3D "marvell,armada-8k-sei";
> > +				reg =3D <0x3f0200 0x40>;
> > +				interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +				marvell,sei-ap-ranges =3D <0 21>;
> > +				marvell,sei-cp-ranges =3D <21 43>;

After more discussion, these ranges seems to be only related to the
IP internal organization itself and should not appear in the device
tree at all. Instead, I could probably have a more meaningful
compatible string, like "marvell,ap806-sei". Next time an AP has a
different internal distribution, we'll just add a different compatible
and handle the differences in the driver directly.

This does not have a big impact on the rest of the driver, I should
probably let Marc review this version first.

Thanks,
Miqu=C3=A8l
