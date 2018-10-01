Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6xNR-00026w-3f
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 12:32:59 +0000
Date: Mon, 1 Oct 2018 14:32:19 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] mtd: maps: gpio-addr-flash: Replace array with
 an integer
Message-ID: <20181001143219.59423ad3@bbrezillon>
In-Reply-To: <CAPybu_18jdEWEbAbYd4k-GPD+77sCA_5na0RJznixPEXkcs+kQ@mail.gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-6-ricardo.ribalda@gmail.com>
 <20180927134216.1952f668@bbrezillon>
 <CAPybu_18jdEWEbAbYd4k-GPD+77sCA_5na0RJznixPEXkcs+kQ@mail.gmail.com>
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

On Mon, 1 Oct 2018 14:10:03 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> > > +             return;
> > > +
> > > +     for (i =3D 0; i < state->gpio_count; i++) {
> > > +             if ((ofs & BIT(i)) =3D=3D (state->gpio_values & BIT(i))=
) =20
> >
> > Parens around the xx & BIT(i) operations are unneeded. =20
>=20
> If I remove it:
>=20
>=20
> ricardo@neopili:~/curro/kernel-upstream$ make drivers/mtd/maps/gpio-addr-=
flash.o
>   CALL    scripts/checksyscalls.sh
>   DESCEND  objtool
>   CC      drivers/mtd/maps/gpio-addr-flash.o
> drivers/mtd/maps/gpio-addr-flash.c: In function =E2=80=98gf_set_gpios=E2=
=80=99:
> drivers/mtd/maps/gpio-addr-flash.c:70:20: warning: suggest parentheses
> around comparison in operand of =E2=80=98&=E2=80=99 [-Wparentheses]
>    if (ofs & BIT(i) =3D=3D (state->gpio_values & BIT(i)))

Hm, okay. I remember having a similar discussion on one of my patch and
people suggesting to drop it because of the =3D=3D precedence on x & a.
Anyway, let's just keep it like that.
