Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIrd1-00032A-FP
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 07:13:15 +0000
Date: Thu, 8 Jun 2017 09:12:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen
 <dinguyen@kernel.org>, linux-mtd@lists.infradead.org, Masami Hiramatsu
 <mhiramat@kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
Message-ID: <20170608091239.0095511b@bbrezillon>
In-Reply-To: <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
 <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
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

Le Thu, 8 Jun 2017 15:10:18 +0900,
Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :

> Hi Boris,
>=20
>=20
> 2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
> > On Wed,  7 Jun 2017 20:52:19 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > =20
> >> -/*
> >> - * This is the interrupt service routine. It handles all interrupts
> >> - * sent to this device. Note that on CE4100, this is a shared interru=
pt.
> >> - */
> >> -static irqreturn_t denali_isr(int irq, void *dev_id)
> >> +static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
> >> +                                 uint32_t irq_mask)
> >>  {
> >> -     struct denali_nand_info *denali =3D dev_id;
> >> +     unsigned long time_left, flags;
> >>       uint32_t irq_status;
> >> -     irqreturn_t result =3D IRQ_NONE;
> >>
> >> -     spin_lock(&denali->irq_lock);
> >> +     spin_lock_irqsave(&denali->irq_lock, flags);
> >>
> >> -     /* check to see if a valid NAND chip has been selected. */
> >> -     if (is_flash_bank_valid(denali->flash_bank)) {
> >> -             /*
> >> -              * check to see if controller generated the interrupt,
> >> -              * since this is a shared interrupt
> >> -              */
> >> -             irq_status =3D denali_irq_detected(denali);
> >> -             if (irq_status !=3D 0) {
> >> -                     /* handle interrupt */
> >> -                     /* first acknowledge it */
> >> -                     clear_interrupt(denali, irq_status);
> >> -                     /*
> >> -                      * store the status in the device context for so=
meone
> >> -                      * to read
> >> -                      */
> >> -                     denali->irq_status |=3D irq_status;
> >> -                     /* notify anyone who cares that it happened */
> >> -                     complete(&denali->complete);
> >> -                     /* tell the OS that we've handled this */
> >> -                     result =3D IRQ_HANDLED;
> >> -             }
> >> +     irq_status =3D denali->irq_status;
> >> +
> >> +     if (irq_mask & irq_status) {
> >> +             spin_unlock_irqrestore(&denali->irq_lock, flags);
> >> +             return irq_status;
> >>       }
> >> -     spin_unlock(&denali->irq_lock);
> >> -     return result;
> >> +
> >> +     denali->irq_mask =3D irq_mask;
> >> +     reinit_completion(&denali->complete); =20
> >
> > These 2 instructions should be done before calling
> > denali_wait_for_irq() (for example in denali_reset_irq()), otherwise
> > you might loose events if they happen between your irq_status read and
> > the reinit_completion() call. =20
>=20
> No.
>=20
> denali->irq_lock avoids a race between denali_isr() and
> denali_wait_for_irq().
>=20
>=20
> The line
>      denali->irq_status |=3D irq_status;
> in denali_isr() accumulates all events that have happened
> since denali_reset_irq().
>=20
> If the interested IRQs have already happened
> before denali_wait_for_irq(), it just return immediately
> without using completion.
>=20
> I do not mind adding a comment like below
> if you think my intention is unclear, though.
>=20
>         /* Return immediately if interested IRQs have already happend. */
>         if (irq_mask & irq_status) {
>                 spin_unlock_irqrestore(&denali->irq_lock, flags);
>                 return irq_status;
>         }
>=20
>=20

My bad, I didn't notice you were releasing the lock after calling
reinit_completion(). I still find this solution more complex than my
proposal, but I don't care that much.

>=20
>=20
>=20
> > You should also clear existing interrupts
> > before launching your operation, otherwise you might wakeup on previous
> > events. =20
>=20
>=20
> I do not see a point in your suggestion.
>=20
> denali_isr() reads out IRQ_STATUS(i) and immediately clears IRQ bits.
>=20
> IRQ events triggered by previous events are accumulated in denali->irq_st=
atus.
>=20
> denali_reset_irq() clears it.
>=20
>         denali->irq_status =3D 0;

Well, it was just a precaution, in case some interrupts weren't cleared
during the previous test (for example if they were masked before the
event actually happened, which can occur if you have a timeout, but
the event is detected afterward).

>=20
>=20
> Again, denali->irq_lock avoids a race between denali_reset_irq() and
> denali_irq(),
> so this works correctly.
>=20
>=20

Anyway, you seem confident that you're doing the right thing, so I'll
let you decide what is appropriate and redirect any bug report to you if
that happens :-P.
