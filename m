Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIzav-0001wa-VZ
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 15:43:36 +0000
Date: Thu, 8 Jun 2017 17:43:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut
 <marek.vasut@gmail.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-mtd@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Jassi Brar
 <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
Message-ID: <20170608174311.4f012cc5@bbrezillon>
In-Reply-To: <CAK7LNARbaAKyB2ss780o=L=sqqUdz=fix+PaxW_ODDAM63VXOw@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
 <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
 <20170608091239.0095511b@bbrezillon>
 <CAK7LNAQSCC-MB3Ck7KyE47HVeAOJ1t1Xop2s=tuJ-UH-OpvShQ@mail.gmail.com>
 <20170608132620.17fc7c96@bbrezillon>
 <CAK7LNARbaAKyB2ss780o=L=sqqUdz=fix+PaxW_ODDAM63VXOw@mail.gmail.com>
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

On Thu, 8 Jun 2017 21:58:00 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
>=20
> 2017-06-08 20:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
> > On Thu, 8 Jun 2017 19:41:39 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > =20
> >> Hi Boris,
> >>
> >>
> >> 2017-06-08 16:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-elect=
rons.com>: =20
> >> > Le Thu, 8 Jun 2017 15:10:18 +0900,
> >> > Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
> >> > =20
> >> >> Hi Boris,
> >> >>
> >> >>
> >> >> 2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-el=
ectrons.com>: =20
> >> >> > On Wed,  7 Jun 2017 20:52:19 +0900
> >> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >> >> >
> >> >> > =20
> >> >> >> -/*
> >> >> >> - * This is the interrupt service routine. It handles all interr=
upts
> >> >> >> - * sent to this device. Note that on CE4100, this is a shared i=
nterrupt.
> >> >> >> - */
> >> >> >> -static irqreturn_t denali_isr(int irq, void *dev_id)
> >> >> >> +static uint32_t denali_wait_for_irq(struct denali_nand_info *de=
nali,
> >> >> >> +                                 uint32_t irq_mask)
> >> >> >>  {
> >> >> >> -     struct denali_nand_info *denali =3D dev_id;
> >> >> >> +     unsigned long time_left, flags;
> >> >> >>       uint32_t irq_status;
> >> >> >> -     irqreturn_t result =3D IRQ_NONE;
> >> >> >>
> >> >> >> -     spin_lock(&denali->irq_lock);
> >> >> >> +     spin_lock_irqsave(&denali->irq_lock, flags);
> >> >> >>
> >> >> >> -     /* check to see if a valid NAND chip has been selected. */
> >> >> >> -     if (is_flash_bank_valid(denali->flash_bank)) {
> >> >> >> -             /*
> >> >> >> -              * check to see if controller generated the interr=
upt,
> >> >> >> -              * since this is a shared interrupt
> >> >> >> -              */
> >> >> >> -             irq_status =3D denali_irq_detected(denali);
> >> >> >> -             if (irq_status !=3D 0) {
> >> >> >> -                     /* handle interrupt */
> >> >> >> -                     /* first acknowledge it */
> >> >> >> -                     clear_interrupt(denali, irq_status);
> >> >> >> -                     /*
> >> >> >> -                      * store the status in the device context =
for someone
> >> >> >> -                      * to read
> >> >> >> -                      */
> >> >> >> -                     denali->irq_status |=3D irq_status;
> >> >> >> -                     /* notify anyone who cares that it happene=
d */
> >> >> >> -                     complete(&denali->complete);
> >> >> >> -                     /* tell the OS that we've handled this */
> >> >> >> -                     result =3D IRQ_HANDLED;
> >> >> >> -             }
> >> >> >> +     irq_status =3D denali->irq_status;
> >> >> >> +
> >> >> >> +     if (irq_mask & irq_status) {
> >> >> >> +             spin_unlock_irqrestore(&denali->irq_lock, flags);
> >> >> >> +             return irq_status;
> >> >> >>       }
> >> >> >> -     spin_unlock(&denali->irq_lock);
> >> >> >> -     return result;
> >> >> >> +
> >> >> >> +     denali->irq_mask =3D irq_mask;
> >> >> >> +     reinit_completion(&denali->complete); =20
> >> >> >
> >> >> > These 2 instructions should be done before calling
> >> >> > denali_wait_for_irq() (for example in denali_reset_irq()), otherw=
ise
> >> >> > you might loose events if they happen between your irq_status rea=
d and
> >> >> > the reinit_completion() call. =20
> >> >>
> >> >> No.
> >> >>
> >> >> denali->irq_lock avoids a race between denali_isr() and
> >> >> denali_wait_for_irq().
> >> >>
> >> >>
> >> >> The line
> >> >>      denali->irq_status |=3D irq_status;
> >> >> in denali_isr() accumulates all events that have happened
> >> >> since denali_reset_irq().
> >> >>
> >> >> If the interested IRQs have already happened
> >> >> before denali_wait_for_irq(), it just return immediately
> >> >> without using completion.
> >> >>
> >> >> I do not mind adding a comment like below
> >> >> if you think my intention is unclear, though.
> >> >>
> >> >>         /* Return immediately if interested IRQs have already happe=
nd. */
> >> >>         if (irq_mask & irq_status) {
> >> >>                 spin_unlock_irqrestore(&denali->irq_lock, flags);
> >> >>                 return irq_status;
> >> >>         }
> >> >>
> >> >> =20
> >> >
> >> > My bad, I didn't notice you were releasing the lock after calling
> >> > reinit_completion(). I still find this solution more complex than my
> >> > proposal, but I don't care that much. =20
> >>
> >>
> >> At first, I implemented exactly like you suggested;
> >>    denali->irq_mask =3D irq_mask;
> >>    reinit_completion(&denali->complete)
> >> in denali_reset_irq().
> >>
> >>
> >> IIRC, things were like this.
> >>
> >> Some time later, you memtioned to use ->cmd_ctrl
> >> instead of ->cmdfunc.
> >>
> >> Then I had a problem when I needed to implement
> >> denali_check_irq() in
> >> http://patchwork.ozlabs.org/patch/772395/
> >>
> >> denali_wait_for_irq() is blocked until interested IRQ happens.
> >> but ->dev_ready() hook should not be blocked.
> >> It should return if R/B# transition has happened or not. =20
> >
> > Nope, it should return whether the NAND is ready or not, not whether a
> > busy -> ready transition occurred or not. It's typically done by
> > reading the NAND STATUS register or by checking the R/B pin status. =20
>=20
> Checking the R/B pin is probably impossible unless
> the pin is changed into a GPIO port.
>=20
> I also considered NAND_CMD_STATUS, but
> I can not recall why I chose the current approach.
> Perhaps I thought returning detected IRQ
> is faster than accessing the chip for NAND_CMD_STATUS.
>=20
> I can try NAND_CMD_STATUS approach if you like.

Depends what you're trying to do. IIUC, you use denali_wait_for_irq()
inside your ->reset()/->read/write_{page,oob}[_raw]() methods, which is
perfectly fine (assuming CUSTOM_PAGE_ACCESS is set) since these hooks
are expected to wait for chip readiness before returning.

You could also implement ->waitfunc() using denali_wait_for_irq() if
you're able to detect R/B transitions, but I'm not sure it's worth it,
because you overload almost all the methods using this hook (the only
one remaining is ->onfi_set_features(), and using STATUS polling should
not be an issue in this case).

Implementing ->dev_ready() is not necessary. When not provided, the
core falls back to STATUS polling and you seem to support
NAND_CMD_STATUS in denali_cmdfunc(). Note that even if it's not fully
reliable in the current driver, you're switching to ->cmd_ctrl() at the
end of the series anyway, so we should be good after that.

>=20
>=20
>=20
>=20
>=20
> >> So, I accumulate IRQ events in denali->irq_status
> >> that have happened since denali_reset_irq(). =20
> >
> > Yep, I see that.
> > =20
> >>
> >>
> >> =20
> >> >>
> >> >>
> >> >> =20
> >> >> > You should also clear existing interrupts
> >> >> > before launching your operation, otherwise you might wakeup on pr=
evious
> >> >> > events. =20
> >> >>
> >> >>
> >> >> I do not see a point in your suggestion.
> >> >>
> >> >> denali_isr() reads out IRQ_STATUS(i) and immediately clears IRQ bit=
s.
> >> >>
> >> >> IRQ events triggered by previous events are accumulated in denali->=
irq_status.
> >> >>
> >> >> denali_reset_irq() clears it.
> >> >>
> >> >>         denali->irq_status =3D 0; =20
> >> >
> >> > Well, it was just a precaution, in case some interrupts weren't clea=
red
> >> > during the previous test (for example if they were masked before the
> >> > event actually happened, which can occur if you have a timeout, but
> >> > the event is detected afterward). =20
> >>
> >> Turning on/off IRQ mask is problematic.
> >> So I did not do that. =20
> >
> > I don't see why this is a problem. That's how it usually done.
> > =20
> >>
> >> I enable IRQ mask in driver probe.
> >> I think this approach is more robust when we consider race conditions
> >> like you mentioned. =20
> >
> > I'd like to hear more about the reasons you think it's more robust
> > than
> >
> > * at-probe-time: mask all IRQs and reset IRQ status
> >
> > * when doing a specific operation:
> > 1/ reset irq status
> > 2/ unmask relevant irqs (based on the operation you're doing)
> > 3/ launch the operation
> > 4/ wait for interrupts
> > 5/ mask irqs and check the wait_for_completion() return code + irq
> >    status
> >
> > This approach shouldn't be racy, because you're resetting+unmasking
> > irqs before starting the real operation (the one supposed to generate
> > such interrupts). By doing that you also get rid of the extra =20
> > ->irq_status field, and you don't have to check irq_status before =20
> > calling wait_for_completion(). =20
>=20
>=20
> IIRC, I was thinking like this:
>=20
> One IRQ line may be shared among multiple hardware including Denali.
> denali_pci may do this.
>=20
> The Denali IRQ handler need to check irq status
> because it should return IRQ_HANDLED if the event comes from Denali contr=
oller.
> Otherwise, the event comes from different hardware, so
> Denali IRQ handler should return IRQ_NONE.

Correct.

>=20
> wait_for_completion_timeout() may bail out with timeout error,
> then proceed to denali_reset_irq() for the next operation.

Before calling denali_reset_irq() you should re-mask the irqs you
unmasked in #1. Actually, calling denali_reset_irq() after
wait_for_completion_timeout() is not even needed here because you'll
clear pending irqs before launching the next NAND command.

> Afterwards, the event actually may happen, and invoke IRQ handler.

Not if you masked IRQs after wait_for_completion_timeout() returned.

>=20
> denali_reset_irq() and denali_isr() compete to grab the spin lock.
>=20
> If denali_reset_irq() wins, it clears INTR_STATUS register
> (if implemented like you suggested first) or changes IRQ mask for the
> next event.
> After that, denali_isr enters the critical section and checks IRQ bit
> but at this moment, the IRQ bit has gone.  So, it assumes this event
> is not for Denali, so returns IRQ_NONE.  Nobody returns IRQ_HANDLED.

Not if you have masked the interrupts.

>=20
> Then, kernel will complain "irq *: nobody cared"
>=20
>=20
> In my opinion, IRQ should be checked and cleared in one place
> (in IRQ handler).
>=20
> Enabling/disabling IRQ mask is not problem unless it masks out
> already-asserted IRQ status bits.

Here is a patch to show you what I had in mind [1] (it applies on top
of this patch). AFAICT, there's no races, no interrupt loss, and you
get rid of the ->irq_mask/status/lock fields.

[1]http://code.bulix.org/fufia6-145571
