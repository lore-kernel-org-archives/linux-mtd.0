Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dJEob-0005ej-Hn
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 07:58:45 +0000
Date: Fri, 9 Jun 2017 09:58:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-mtd@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar
 <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
Message-ID: <20170609095803.2b755283@bbrezillon>
In-Reply-To: <CAK7LNAQ3OwpC60oZ5pXTAzLN5uQHbm2jRMMQiwJuznHZYPWnTg@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
 <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
 <20170608091239.0095511b@bbrezillon>
 <CAK7LNAQSCC-MB3Ck7KyE47HVeAOJ1t1Xop2s=tuJ-UH-OpvShQ@mail.gmail.com>
 <20170608132620.17fc7c96@bbrezillon>
 <CAK7LNARbaAKyB2ss780o=L=sqqUdz=fix+PaxW_ODDAM63VXOw@mail.gmail.com>
 <20170608174311.4f012cc5@bbrezillon>
 <CAK7LNAQ3OwpC60oZ5pXTAzLN5uQHbm2jRMMQiwJuznHZYPWnTg@mail.gmail.com>
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

Hi Masahiro,

On Fri, 9 Jun 2017 02:26:34 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris
>=20
> 2017-06-09 0:43 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons=
.com>:
> > On Thu, 8 Jun 2017 21:58:00 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > =20
> >> Hi Boris,
> >>
> >> 2017-06-08 20:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-elect=
rons.com>: =20
> >> > On Thu, 8 Jun 2017 19:41:39 +0900
> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >> > =20
> >> >> Hi Boris,
> >> >>
> >> >>
> >> >> 2017-06-08 16:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-el=
ectrons.com>: =20
> >> >> > Le Thu, 8 Jun 2017 15:10:18 +0900,
> >> >> > Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
> >> >> > =20
> >> >> >> Hi Boris,
> >> >> >>
> >> >> >>
> >> >> >> 2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@free=
-electrons.com>: =20
> >> >> >> > On Wed,  7 Jun 2017 20:52:19 +0900
> >> >> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >> >> >> >
> >> >> >> > =20
> >> >> >> >> -/*
> >> >> >> >> - * This is the interrupt service routine. It handles all int=
errupts
> >> >> >> >> - * sent to this device. Note that on CE4100, this is a share=
d interrupt.
> >> >> >> >> - */
> >> >> >> >> -static irqreturn_t denali_isr(int irq, void *dev_id)
> >> >> >> >> +static uint32_t denali_wait_for_irq(struct denali_nand_info =
*denali,
> >> >> >> >> +                                 uint32_t irq_mask)
> >> >> >> >>  {
> >> >> >> >> -     struct denali_nand_info *denali =3D dev_id;
> >> >> >> >> +     unsigned long time_left, flags;
> >> >> >> >>       uint32_t irq_status;
> >> >> >> >> -     irqreturn_t result =3D IRQ_NONE;
> >> >> >> >>
> >> >> >> >> -     spin_lock(&denali->irq_lock);
> >> >> >> >> +     spin_lock_irqsave(&denali->irq_lock, flags);
> >> >> >> >>
> >> >> >> >> -     /* check to see if a valid NAND chip has been selected.=
 */
> >> >> >> >> -     if (is_flash_bank_valid(denali->flash_bank)) {
> >> >> >> >> -             /*
> >> >> >> >> -              * check to see if controller generated the int=
errupt,
> >> >> >> >> -              * since this is a shared interrupt
> >> >> >> >> -              */
> >> >> >> >> -             irq_status =3D denali_irq_detected(denali);
> >> >> >> >> -             if (irq_status !=3D 0) {
> >> >> >> >> -                     /* handle interrupt */
> >> >> >> >> -                     /* first acknowledge it */
> >> >> >> >> -                     clear_interrupt(denali, irq_status);
> >> >> >> >> -                     /*
> >> >> >> >> -                      * store the status in the device conte=
xt for someone
> >> >> >> >> -                      * to read
> >> >> >> >> -                      */
> >> >> >> >> -                     denali->irq_status |=3D irq_status;
> >> >> >> >> -                     /* notify anyone who cares that it happ=
ened */
> >> >> >> >> -                     complete(&denali->complete);
> >> >> >> >> -                     /* tell the OS that we've handled this =
*/
> >> >> >> >> -                     result =3D IRQ_HANDLED;
> >> >> >> >> -             }
> >> >> >> >> +     irq_status =3D denali->irq_status;
> >> >> >> >> +
> >> >> >> >> +     if (irq_mask & irq_status) {
> >> >> >> >> +             spin_unlock_irqrestore(&denali->irq_lock, flags=
);
> >> >> >> >> +             return irq_status;
> >> >> >> >>       }
> >> >> >> >> -     spin_unlock(&denali->irq_lock);
> >> >> >> >> -     return result;
> >> >> >> >> +
> >> >> >> >> +     denali->irq_mask =3D irq_mask;
> >> >> >> >> +     reinit_completion(&denali->complete); =20
> >> >> >> >
> >> >> >> > These 2 instructions should be done before calling
> >> >> >> > denali_wait_for_irq() (for example in denali_reset_irq()), oth=
erwise
> >> >> >> > you might loose events if they happen between your irq_status =
read and
> >> >> >> > the reinit_completion() call. =20
> >> >> >>
> >> >> >> No.
> >> >> >>
> >> >> >> denali->irq_lock avoids a race between denali_isr() and
> >> >> >> denali_wait_for_irq().
> >> >> >>
> >> >> >>
> >> >> >> The line
> >> >> >>      denali->irq_status |=3D irq_status;
> >> >> >> in denali_isr() accumulates all events that have happened
> >> >> >> since denali_reset_irq().
> >> >> >>
> >> >> >> If the interested IRQs have already happened
> >> >> >> before denali_wait_for_irq(), it just return immediately
> >> >> >> without using completion.
> >> >> >>
> >> >> >> I do not mind adding a comment like below
> >> >> >> if you think my intention is unclear, though.
> >> >> >>
> >> >> >>         /* Return immediately if interested IRQs have already ha=
ppend. */
> >> >> >>         if (irq_mask & irq_status) {
> >> >> >>                 spin_unlock_irqrestore(&denali->irq_lock, flags);
> >> >> >>                 return irq_status;
> >> >> >>         }
> >> >> >>
> >> >> >> =20
> >> >> >
> >> >> > My bad, I didn't notice you were releasing the lock after calling
> >> >> > reinit_completion(). I still find this solution more complex than=
 my
> >> >> > proposal, but I don't care that much. =20
> >> >>
> >> >>
> >> >> At first, I implemented exactly like you suggested;
> >> >>    denali->irq_mask =3D irq_mask;
> >> >>    reinit_completion(&denali->complete)
> >> >> in denali_reset_irq().
> >> >>
> >> >>
> >> >> IIRC, things were like this.
> >> >>
> >> >> Some time later, you memtioned to use ->cmd_ctrl
> >> >> instead of ->cmdfunc.
> >> >>
> >> >> Then I had a problem when I needed to implement
> >> >> denali_check_irq() in
> >> >> http://patchwork.ozlabs.org/patch/772395/
> >> >>
> >> >> denali_wait_for_irq() is blocked until interested IRQ happens.
> >> >> but ->dev_ready() hook should not be blocked.
> >> >> It should return if R/B# transition has happened or not. =20
> >> >
> >> > Nope, it should return whether the NAND is ready or not, not whether=
 a
> >> > busy -> ready transition occurred or not. It's typically done by
> >> > reading the NAND STATUS register or by checking the R/B pin status. =
=20
> >>
> >> Checking the R/B pin is probably impossible unless
> >> the pin is changed into a GPIO port.
> >>
> >> I also considered NAND_CMD_STATUS, but
> >> I can not recall why I chose the current approach.
> >> Perhaps I thought returning detected IRQ
> >> is faster than accessing the chip for NAND_CMD_STATUS.
> >>
> >> I can try NAND_CMD_STATUS approach if you like. =20
> >
> > Depends what you're trying to do. IIUC, you use denali_wait_for_irq()
> > inside your ->reset()/->read/write_{page,oob}[_raw]() methods, which is
> > perfectly fine (assuming CUSTOM_PAGE_ACCESS is set) since these hooks
> > are expected to wait for chip readiness before returning.
> >
> > You could also implement ->waitfunc() using denali_wait_for_irq() if
> > you're able to detect R/B transitions, =20
>=20
> R/B transition will set INTR__INT_ACT interrupt.
>=20
> I think it is easy in my implementation of denali_wait_for_irq(),
> like
>=20
>    denali_wait_for_irq(denali, INTR__INT_ACT);
>=20
>=20
>=20
> But, you are suggesting me to change it.

This is clearly not a hard requirement, I was just curious and wanted
to understand why you had such a convoluted interrupt handling design. I
think I now understand why (see below).

> In your way, you give IRQ masks to denali_reset_irq(), like
> denali_reset_irq(denali, INTR__ERASE_COMP | INTR__ERASE_FAIL);
>=20
> Then, we have no room of IRQ bit in denali_wait_for_irq().
>=20
> How will you implement it?

It should be pretty easy: just make sure you reset the INTR__INT_ACT
status flag before sending a command (->cmd_ctrl()), and then unmask the
INTR__INT_ACT in denali_waitfunc() just before calling
denali_wait_for_irqs(). This should guarantee that you don't loose any
events, while keeping the logic rather simple.

>=20
>=20
> > but I'm not sure it's worth it,
> > because you overload almost all the methods using this hook (the only
> > one remaining is ->onfi_set_features(), and using STATUS polling should
> > not be an issue in this case).
> >
> > Implementing ->dev_ready() is not necessary. When not provided, the
> > core falls back to STATUS polling and you seem to support
> > NAND_CMD_STATUS in denali_cmdfunc(). Note that even if it's not fully
> > reliable in the current driver, you're switching to ->cmd_ctrl() at the
> > end of the series anyway, so we should be good after that. =20
>=20
> ->dev_ready() is optional, but we may end up with waiting more than neede=
d. =20
>=20
>         case NAND_CMD_RESET:
>                 if (chip->dev_ready)
>                          break;
>                 udelay(chip->chip_delay);
>=20
>=20
> chip->chip_delay is probably set large enough, so this is not optimal.

That's true, this udelay should not be needed in your case.
=20
>=20
>=20
> If I add something more, the following two bugs were found by
> denali_dev_ready().
>=20
> commit 3158fa0e739615769cc047d2428f30f4c3b6640e
> commit c5d664aa5a4c4b257a54eb35045031630d105f49
>=20
>=20
> If NAND core is fine, denali_dev_ready() works fine too.
>=20
> If not, it is a sign of bug of nand_command(_lp).
> This is contributing to the core improvement.
>=20

Had a second look at denali_dev_ready() and it seems to do the right
thing, so let's keep it like that.
=20
>=20
> >>
> >> IIRC, I was thinking like this:
> >>
> >> One IRQ line may be shared among multiple hardware including Denali.
> >> denali_pci may do this.
> >>
> >> The Denali IRQ handler need to check irq status
> >> because it should return IRQ_HANDLED if the event comes from Denali co=
ntroller.
> >> Otherwise, the event comes from different hardware, so
> >> Denali IRQ handler should return IRQ_NONE. =20
> >
> > Correct.
> > =20
> >>
> >> wait_for_completion_timeout() may bail out with timeout error,
> >> then proceed to denali_reset_irq() for the next operation. =20
> >
> > Before calling denali_reset_irq() you should re-mask the irqs you
> > unmasked in #1. Actually, calling denali_reset_irq() after
> > wait_for_completion_timeout() is not even needed here because you'll
> > clear pending irqs before launching the next NAND command.
> > =20
> >> Afterwards, the event actually may happen, and invoke IRQ handler. =20
> >
> > Not if you masked IRQs after wait_for_completion_timeout() returned. =20
>=20
>=20
>         wait_for_completion_timeout(&denali->complete, msecs_to_jiffies(1=
000));
>                 <<< WHAT IF IRQ EVENT HAPPENS HERE ? >>>
>         iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));

You're right, the write to INTR_EN() should be protected by a
spin_lock_irqsave to prevent concurrency between the irq handler and
the thread executing this function (and we should also take the lock
from the irq handler when doing status & mask). I didn't consider the
SMP case when coding this approach (one CPU can handle the interrupt
while the other one continues executing this function after the
timeout).

>=20
>=20
>=20
>=20
> Also, you ignore the return value of wait_for_completion_timeout(),
> then drop my precious error message()
>=20
>   dev_err(denali->dev, "timeout while waiting for irq 0x%x\n",
>           denali->irq_mask)

Timeout can be detected by testing the status: if none of the flags we
were waiting for are set this is a timeout. Maybe I forgot to add this
message back though.

>=20
>=20
>=20
> > Here is a patch to show you what I had in mind [1] (it applies on top
> > of this patch). AFAICT, there's no races, no interrupt loss, and you
> > get rid of the ->irq_mask/status/lock fields.
> >
> > [1]http://code.bulix.org/fufia6-145571
> > =20
>=20
>=20
> Problem Scenario A
>  [1] wait_for_completion_timeout() exits with timeout.
>  [2] IRQ happens and denali_isr() is invoked
>  [3] iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));
>  [4] status =3D ioread32(denali->flash_reg + INTR_STATUS(bank)) &
>               ioread32(denali->flash_reg + INTR_EN(bank));
>       (status is set to 0 because INTR_EN(bank) is now 0)
>  [5] return IRQ_NONE;
>  [6] kernel complains  "irq *: nobody cared"

Okay, this is the part I initially misunderstood. Your goal is to never
ever return IRQ_NONE, while I was accepting to rarely return IRQ_NONE
in the unlikely interrupt-just-after-timeout case. Note that the kernel
irq infrastructure accepts rare occurrences or IRQ_NONE [1].

>=20
>=20
>=20
> Problem Scenario B  (unlikely to happen, though)
>  [1] wait_for_completion_timeout() exits with timeout.
>  [2] IRQ happens and denali_isr() is invoked
>  [3] iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));
>  [4] chip->select_chip(mtd, -1)
>  [5] denali->flash_bank =3D -1
>  [6] status =3D ioread32(denali->flash_reg + INTR_STATUS(bank)) &
>               ioread32(denali->flash_reg + INTR_EN(bank));
>        ( access to non-existing INTR_STATUS(-1) )

Wrapping the write INTR_EN() into a
spin_lock_irqsave/unlock_irqrestore() section and doing the same in the
interrupt handler (without irqsave/restore) should solve the problem.

This being said, I'm not asking you to change the code, I just wanted
to understand why you were doing it like that.

Thanks,

Boris

[1]http://elixir.free-electrons.com/linux/latest/source/kernel/irq/spurious=
.c#L407
