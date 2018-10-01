Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6x20-0005Ow-EP
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 12:10:45 +0000
Received: by mail-lj1-x241.google.com with SMTP id f8-v6so11912091ljk.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2018 05:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-6-ricardo.ribalda@gmail.com>
 <20180927134216.1952f668@bbrezillon>
In-Reply-To: <20180927134216.1952f668@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 1 Oct 2018 14:10:03 +0200
Message-ID: <CAPybu_18jdEWEbAbYd4k-GPD+77sCA_5na0RJznixPEXkcs+kQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mtd: maps: gpio-addr-flash: Replace array with an
 integer
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

On Thu, Sep 27, 2018 at 1:42 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Wed,  5 Sep 2018 16:36:40 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > By replacing the array with an integer we can avoid completely
> > the bit comparison loop if the value has not changed (by far
> > the most common case).
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  drivers/mtd/maps/gpio-addr-flash.c | 31 +++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio=
-addr-flash.c
> > index 22e100f07112..8f5e3dce9be3 100644
> > --- a/drivers/mtd/maps/gpio-addr-flash.c
> > +++ b/drivers/mtd/maps/gpio-addr-flash.c
> > @@ -43,7 +43,7 @@ struct async_state {
> >       struct map_info map;
> >       size_t gpio_count;
> >       unsigned *gpio_addrs;
> > -     int *gpio_values;
> > +     unsigned int gpio_values;
> >       unsigned int win_order;
> >  };
> >  #define gf_map_info_to_state(mi) ((struct async_state *)(mi)->map_priv=
_1)
> > @@ -55,22 +55,25 @@ struct async_state {
> >   *
> >   * Rather than call the GPIO framework every time, cache the last-prog=
rammed
> >   * value.  This speeds up sequential accesses (which are by far the mo=
st common
> > - * type).  We rely on the GPIO framework to treat non-zero value as hi=
gh so
> > - * that we don't have to normalize the bits.
> > + * type).
> >   */
> >  static void gf_set_gpios(struct async_state *state, unsigned long ofs)
> >  {
> > -     size_t i =3D 0;
> > -     int value;
> > +     int i;
> >
> >       ofs >>=3D state->win_order;
> > -     do {
> > -             value =3D ofs & (1 << i);
> > -             if (state->gpio_values[i] !=3D value) {
> > -                     gpio_set_value(state->gpio_addrs[i], value);
> > -                     state->gpio_values[i] =3D value;
> > -             }
> > -     } while (++i < state->gpio_count);
> > +
> > +     if (ofs =3D=3D state->gpio_values)
> > +             return;
> > +
> > +     for (i =3D 0; i < state->gpio_count; i++) {
> > +             if ((ofs & BIT(i)) =3D=3D (state->gpio_values & BIT(i)))
>
> Parens around the xx & BIT(i) operations are unneeded.

If I remove it:


ricardo@neopili:~/curro/kernel-upstream$ make drivers/mtd/maps/gpio-addr-fl=
ash.o
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CC      drivers/mtd/maps/gpio-addr-flash.o
drivers/mtd/maps/gpio-addr-flash.c: In function =E2=80=98gf_set_gpios=E2=80=
=99:
drivers/mtd/maps/gpio-addr-flash.c:70:20: warning: suggest parentheses
around comparison in operand of =E2=80=98&=E2=80=99 [-Wparentheses]
   if (ofs & BIT(i) =3D=3D (state->gpio_values & BIT(i)))


>
> > +                     continue;
> > +
> > +             gpio_set_value(state->gpio_addrs[i], !!(ofs & BIT(i)));
> > +     }
> > +
> > +     state->gpio_values =3D ofs;
> >  }
> >
> >  /**
> > @@ -215,7 +218,7 @@ static int gpio_flash_probe(struct platform_device =
*pdev)
> >       if (!memory || !gpios || !gpios->end)
> >               return -EINVAL;
> >
> > -     arr_size =3D sizeof(int) * gpios->end;
> > +     arr_size =3D sizeof(state->gpio_addrs[0]) * gpios->end;
> >       state =3D devm_kzalloc(&pdev->dev, sizeof(*state) + arr_size, GFP=
_KERNEL);
> >       if (!state)
> >               return -ENOMEM;
> > @@ -226,9 +229,7 @@ static int gpio_flash_probe(struct platform_device =
*pdev)
> >        */
> >       state->gpio_count     =3D gpios->end;
> >       state->gpio_addrs     =3D (void *)(unsigned long)gpios->start;
> > -     state->gpio_values    =3D (void *)(state + 1);
> >       state->win_order      =3D get_bitmask_order(resource_size(memory)=
) - 1;
> > -     memset(state->gpio_values, 0xff, arr_size);
> >
> >       state->map.name       =3D DRIVER_NAME;
> >       state->map.read       =3D gf_read;
>


--=20
Ricardo Ribalda
