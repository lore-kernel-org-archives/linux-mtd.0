Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIx1K-0005lO-6w
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 12:58:40 +0000
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
 [209.85.213.177]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v58Cw1DK029446
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 21:58:02 +0900
Received: by mail-yb0-f177.google.com with SMTP id f192so9295387yba.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 05:58:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170608132620.17fc7c96@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
 <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
 <20170608091239.0095511b@bbrezillon>
 <CAK7LNAQSCC-MB3Ck7KyE47HVeAOJ1t1Xop2s=tuJ-UH-OpvShQ@mail.gmail.com>
 <20170608132620.17fc7c96@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 21:58:00 +0900
Message-ID: <CAK7LNARbaAKyB2ss780o=L=sqqUdz=fix+PaxW_ODDAM63VXOw@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

Hi Boris,

2017-06-08 20:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> On Thu, 8 Jun 2017 19:41:39 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>>
>> 2017-06-08 16:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-electro=
ns.com>:
>> > Le Thu, 8 Jun 2017 15:10:18 +0900,
>> > Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
>> >
>> >> Hi Boris,
>> >>
>> >>
>> >> 2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-elec=
trons.com>:
>> >> > On Wed,  7 Jun 2017 20:52:19 +0900
>> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >> >
>> >> >
>> >> >> -/*
>> >> >> - * This is the interrupt service routine. It handles all interrup=
ts
>> >> >> - * sent to this device. Note that on CE4100, this is a shared int=
errupt.
>> >> >> - */
>> >> >> -static irqreturn_t denali_isr(int irq, void *dev_id)
>> >> >> +static uint32_t denali_wait_for_irq(struct denali_nand_info *dena=
li,
>> >> >> +                                 uint32_t irq_mask)
>> >> >>  {
>> >> >> -     struct denali_nand_info *denali =3D dev_id;
>> >> >> +     unsigned long time_left, flags;
>> >> >>       uint32_t irq_status;
>> >> >> -     irqreturn_t result =3D IRQ_NONE;
>> >> >>
>> >> >> -     spin_lock(&denali->irq_lock);
>> >> >> +     spin_lock_irqsave(&denali->irq_lock, flags);
>> >> >>
>> >> >> -     /* check to see if a valid NAND chip has been selected. */
>> >> >> -     if (is_flash_bank_valid(denali->flash_bank)) {
>> >> >> -             /*
>> >> >> -              * check to see if controller generated the interrup=
t,
>> >> >> -              * since this is a shared interrupt
>> >> >> -              */
>> >> >> -             irq_status =3D denali_irq_detected(denali);
>> >> >> -             if (irq_status !=3D 0) {
>> >> >> -                     /* handle interrupt */
>> >> >> -                     /* first acknowledge it */
>> >> >> -                     clear_interrupt(denali, irq_status);
>> >> >> -                     /*
>> >> >> -                      * store the status in the device context fo=
r someone
>> >> >> -                      * to read
>> >> >> -                      */
>> >> >> -                     denali->irq_status |=3D irq_status;
>> >> >> -                     /* notify anyone who cares that it happened =
*/
>> >> >> -                     complete(&denali->complete);
>> >> >> -                     /* tell the OS that we've handled this */
>> >> >> -                     result =3D IRQ_HANDLED;
>> >> >> -             }
>> >> >> +     irq_status =3D denali->irq_status;
>> >> >> +
>> >> >> +     if (irq_mask & irq_status) {
>> >> >> +             spin_unlock_irqrestore(&denali->irq_lock, flags);
>> >> >> +             return irq_status;
>> >> >>       }
>> >> >> -     spin_unlock(&denali->irq_lock);
>> >> >> -     return result;
>> >> >> +
>> >> >> +     denali->irq_mask =3D irq_mask;
>> >> >> +     reinit_completion(&denali->complete);
>> >> >
>> >> > These 2 instructions should be done before calling
>> >> > denali_wait_for_irq() (for example in denali_reset_irq()), otherwis=
e
>> >> > you might loose events if they happen between your irq_status read =
and
>> >> > the reinit_completion() call.
>> >>
>> >> No.
>> >>
>> >> denali->irq_lock avoids a race between denali_isr() and
>> >> denali_wait_for_irq().
>> >>
>> >>
>> >> The line
>> >>      denali->irq_status |=3D irq_status;
>> >> in denali_isr() accumulates all events that have happened
>> >> since denali_reset_irq().
>> >>
>> >> If the interested IRQs have already happened
>> >> before denali_wait_for_irq(), it just return immediately
>> >> without using completion.
>> >>
>> >> I do not mind adding a comment like below
>> >> if you think my intention is unclear, though.
>> >>
>> >>         /* Return immediately if interested IRQs have already happend=
. */
>> >>         if (irq_mask & irq_status) {
>> >>                 spin_unlock_irqrestore(&denali->irq_lock, flags);
>> >>                 return irq_status;
>> >>         }
>> >>
>> >>
>> >
>> > My bad, I didn't notice you were releasing the lock after calling
>> > reinit_completion(). I still find this solution more complex than my
>> > proposal, but I don't care that much.
>>
>>
>> At first, I implemented exactly like you suggested;
>>    denali->irq_mask =3D irq_mask;
>>    reinit_completion(&denali->complete)
>> in denali_reset_irq().
>>
>>
>> IIRC, things were like this.
>>
>> Some time later, you memtioned to use ->cmd_ctrl
>> instead of ->cmdfunc.
>>
>> Then I had a problem when I needed to implement
>> denali_check_irq() in
>> http://patchwork.ozlabs.org/patch/772395/
>>
>> denali_wait_for_irq() is blocked until interested IRQ happens.
>> but ->dev_ready() hook should not be blocked.
>> It should return if R/B# transition has happened or not.
>
> Nope, it should return whether the NAND is ready or not, not whether a
> busy -> ready transition occurred or not. It's typically done by
> reading the NAND STATUS register or by checking the R/B pin status.

Checking the R/B pin is probably impossible unless
the pin is changed into a GPIO port.

I also considered NAND_CMD_STATUS, but
I can not recall why I chose the current approach.
Perhaps I thought returning detected IRQ
is faster than accessing the chip for NAND_CMD_STATUS.

I can try NAND_CMD_STATUS approach if you like.





>> So, I accumulate IRQ events in denali->irq_status
>> that have happened since denali_reset_irq().
>
> Yep, I see that.
>
>>
>>
>>
>> >>
>> >>
>> >>
>> >> > You should also clear existing interrupts
>> >> > before launching your operation, otherwise you might wakeup on prev=
ious
>> >> > events.
>> >>
>> >>
>> >> I do not see a point in your suggestion.
>> >>
>> >> denali_isr() reads out IRQ_STATUS(i) and immediately clears IRQ bits.
>> >>
>> >> IRQ events triggered by previous events are accumulated in denali->ir=
q_status.
>> >>
>> >> denali_reset_irq() clears it.
>> >>
>> >>         denali->irq_status =3D 0;
>> >
>> > Well, it was just a precaution, in case some interrupts weren't cleare=
d
>> > during the previous test (for example if they were masked before the
>> > event actually happened, which can occur if you have a timeout, but
>> > the event is detected afterward).
>>
>> Turning on/off IRQ mask is problematic.
>> So I did not do that.
>
> I don't see why this is a problem. That's how it usually done.
>
>>
>> I enable IRQ mask in driver probe.
>> I think this approach is more robust when we consider race conditions
>> like you mentioned.
>
> I'd like to hear more about the reasons you think it's more robust
> than
>
> * at-probe-time: mask all IRQs and reset IRQ status
>
> * when doing a specific operation:
> 1/ reset irq status
> 2/ unmask relevant irqs (based on the operation you're doing)
> 3/ launch the operation
> 4/ wait for interrupts
> 5/ mask irqs and check the wait_for_completion() return code + irq
>    status
>
> This approach shouldn't be racy, because you're resetting+unmasking
> irqs before starting the real operation (the one supposed to generate
> such interrupts). By doing that you also get rid of the extra
> ->irq_status field, and you don't have to check irq_status before
> calling wait_for_completion().


IIRC, I was thinking like this:

One IRQ line may be shared among multiple hardware including Denali.
denali_pci may do this.

The Denali IRQ handler need to check irq status
because it should return IRQ_HANDLED if the event comes from Denali control=
ler.
Otherwise, the event comes from different hardware, so
Denali IRQ handler should return IRQ_NONE.

wait_for_completion_timeout() may bail out with timeout error,
then proceed to denali_reset_irq() for the next operation.
Afterwards, the event actually may happen, and invoke IRQ handler.

denali_reset_irq() and denali_isr() compete to grab the spin lock.

If denali_reset_irq() wins, it clears INTR_STATUS register
(if implemented like you suggested first) or changes IRQ mask for the
next event.
After that, denali_isr enters the critical section and checks IRQ bit
but at this moment, the IRQ bit has gone.  So, it assumes this event
is not for Denali, so returns IRQ_NONE.  Nobody returns IRQ_HANDLED.

Then, kernel will complain "irq *: nobody cared"


In my opinion, IRQ should be checked and cleared in one place
(in IRQ handler).

Enabling/disabling IRQ mask is not problem unless it masks out
already-asserted IRQ status bits.


--=20
Best Regards
Masahiro Yamada
