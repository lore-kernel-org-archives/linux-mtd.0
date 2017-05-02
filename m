Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Tj4-0003p5-4S
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 09:04:10 +0000
Date: Tue, 2 May 2017 11:03:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe LEROY <christophe.leroy@c-s.fr>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpio: make nCE GPIO optional
Message-ID: <20170502110334.33f1a3b8@bbrezillon>
In-Reply-To: <e35093cc-f5f0-f561-10cb-40d5a141e819@c-s.fr>
References: <20170210140110.87903682E7@localhost.localdomain>
 <20170501214627.GB140640@google.com>
 <e35093cc-f5f0-f561-10cb-40d5a141e819@c-s.fr>
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

On Tue, 2 May 2017 07:47:40 +0200
Christophe LEROY <christophe.leroy@c-s.fr> wrote:

> Le 01/05/2017 =C3=A0 23:46, Brian Norris a =C3=A9crit :
> > On Fri, Feb 10, 2017 at 03:01:10PM +0100, Christophe Leroy wrote: =20
> >> On some hardware, the nCE signal is wired to the ChipSelect associated
> >> to bus address of the NAND, so it is automatically driven during the
> >> memory access and it is not managed by a GPIO.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr> =20
> >
> > Not really a problem with this patch exactly, but FYI you're only making
> > this optional for the non-DT case. For device tree, this is kinda hard
> > to do, since the current binding suggests we retrieve the GPIOs based on
> > index position, not by name. So if you leave one off...I guess we well
> > just be off-by-1 on the indeces until we hit a non-optional one...which
> > I guess is "CLE".
> >
> > If we wanted this to work for DT, we'd need to extend this driver (and
> > binding doc) to support requesting GPIOs by name.
> > =20
>=20
> It works for me with devicetree.
>=20
> I have the following definition in my DT:
>=20
> 		nand@1,0 {
> 			compatible =3D "gpio-control-nand";
> 			reg =3D <1 0x0 0x01>;
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
> 			gpios =3D <&qe_pio_c 24 1 	// RDY
> 				 0			// nCE
> 				 &qe_pio_c 26 1		// ALE
> 				 &qe_pio_c 25 1		// CLE
> 				 0>;			// nwp =20
> 		};
>=20

Yep, it's perfectly fine to have 'empty' gpio entries (entries with
phandle set to 0/NULL), we're using this trick in the atmel_nand
driver as well.
