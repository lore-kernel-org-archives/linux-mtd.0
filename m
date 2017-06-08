Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ1DW-000651-UG
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 17:27:33 +0000
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v58HQaXt004756
 for <linux-mtd@lists.infradead.org>; Fri, 9 Jun 2017 02:26:36 +0900
Received: by mail-yw0-f182.google.com with SMTP id 141so14730216ywe.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 10:26:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170608174311.4f012cc5@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
 <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
 <20170608091239.0095511b@bbrezillon>
 <CAK7LNAQSCC-MB3Ck7KyE47HVeAOJ1t1Xop2s=tuJ-UH-OpvShQ@mail.gmail.com>
 <20170608132620.17fc7c96@bbrezillon>
 <CAK7LNARbaAKyB2ss780o=L=sqqUdz=fix+PaxW_ODDAM63VXOw@mail.gmail.com>
 <20170608174311.4f012cc5@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 9 Jun 2017 02:26:34 +0900
Message-ID: <CAK7LNAQ3OwpC60oZ5pXTAzLN5uQHbm2jRMMQiwJuznHZYPWnTg@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
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

Hi Boris

2017-06-09 0:43 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.c=
om>:
> On Thu, 8 Jun 2017 21:58:00 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>> 2017-06-08 20:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electro=
ns.com>:
>> > On Thu, 8 Jun 2017 19:41:39 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> Hi Boris,
>> >>
>> >>
>> >> 2017-06-08 16:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-elec=
trons.com>:
>> >> > Le Thu, 8 Jun 2017 15:10:18 +0900,
>> >> > Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
>> >> >
>> >> >> Hi Boris,
>> >> >>
>> >> >>
>> >> >> 2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-e=
lectrons.com>:
>> >> >> > On Wed,  7 Jun 2017 20:52:19 +0900
>> >> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >> >> >
>> >> >> >
>> >> >> >> -/*
>> >> >> >> - * This is the interrupt service routine. It handles all inter=
rupts
>> >> >> >> - * sent to this device. Note that on CE4100, this is a shared =
interrupt.
>> >> >> >> - */
>> >> >> >> -static irqreturn_t denali_isr(int irq, void *dev_id)
>> >> >> >> +static uint32_t denali_wait_for_irq(struct denali_nand_info *d=
enali,
>> >> >> >> +                                 uint32_t irq_mask)
>> >> >> >>  {
>> >> >> >> -     struct denali_nand_info *denali =3D dev_id;
>> >> >> >> +     unsigned long time_left, flags;
>> >> >> >>       uint32_t irq_status;
>> >> >> >> -     irqreturn_t result =3D IRQ_NONE;
>> >> >> >>
>> >> >> >> -     spin_lock(&denali->irq_lock);
>> >> >> >> +     spin_lock_irqsave(&denali->irq_lock, flags);
>> >> >> >>
>> >> >> >> -     /* check to see if a valid NAND chip has been selected. *=
/
>> >> >> >> -     if (is_flash_bank_valid(denali->flash_bank)) {
>> >> >> >> -             /*
>> >> >> >> -              * check to see if controller generated the inter=
rupt,
>> >> >> >> -              * since this is a shared interrupt
>> >> >> >> -              */
>> >> >> >> -             irq_status =3D denali_irq_detected(denali);
>> >> >> >> -             if (irq_status !=3D 0) {
>> >> >> >> -                     /* handle interrupt */
>> >> >> >> -                     /* first acknowledge it */
>> >> >> >> -                     clear_interrupt(denali, irq_status);
>> >> >> >> -                     /*
>> >> >> >> -                      * store the status in the device context=
 for someone
>> >> >> >> -                      * to read
>> >> >> >> -                      */
>> >> >> >> -                     denali->irq_status |=3D irq_status;
>> >> >> >> -                     /* notify anyone who cares that it happen=
ed */
>> >> >> >> -                     complete(&denali->complete);
>> >> >> >> -                     /* tell the OS that we've handled this */
>> >> >> >> -                     result =3D IRQ_HANDLED;
>> >> >> >> -             }
>> >> >> >> +     irq_status =3D denali->irq_status;
>> >> >> >> +
>> >> >> >> +     if (irq_mask & irq_status) {
>> >> >> >> +             spin_unlock_irqrestore(&denali->irq_lock, flags);
>> >> >> >> +             return irq_status;
>> >> >> >>       }
>> >> >> >> -     spin_unlock(&denali->irq_lock);
>> >> >> >> -     return result;
>> >> >> >> +
>> >> >> >> +     denali->irq_mask =3D irq_mask;
>> >> >> >> +     reinit_completion(&denali->complete);
>> >> >> >
>> >> >> > These 2 instructions should be done before calling
>> >> >> > denali_wait_for_irq() (for example in denali_reset_irq()), other=
wise
>> >> >> > you might loose events if they happen between your irq_status re=
ad and
>> >> >> > the reinit_completion() call.
>> >> >>
>> >> >> No.
>> >> >>
>> >> >> denali->irq_lock avoids a race between denali_isr() and
>> >> >> denali_wait_for_irq().
>> >> >>
>> >> >>
>> >> >> The line
>> >> >>      denali->irq_status |=3D irq_status;
>> >> >> in denali_isr() accumulates all events that have happened
>> >> >> since denali_reset_irq().
>> >> >>
>> >> >> If the interested IRQs have already happened
>> >> >> before denali_wait_for_irq(), it just return immediately
>> >> >> without using completion.
>> >> >>
>> >> >> I do not mind adding a comment like below
>> >> >> if you think my intention is unclear, though.
>> >> >>
>> >> >>         /* Return immediately if interested IRQs have already happ=
end. */
>> >> >>         if (irq_mask & irq_status) {
>> >> >>                 spin_unlock_irqrestore(&denali->irq_lock, flags);
>> >> >>                 return irq_status;
>> >> >>         }
>> >> >>
>> >> >>
>> >> >
>> >> > My bad, I didn't notice you were releasing the lock after calling
>> >> > reinit_completion(). I still find this solution more complex than m=
y
>> >> > proposal, but I don't care that much.
>> >>
>> >>
>> >> At first, I implemented exactly like you suggested;
>> >>    denali->irq_mask =3D irq_mask;
>> >>    reinit_completion(&denali->complete)
>> >> in denali_reset_irq().
>> >>
>> >>
>> >> IIRC, things were like this.
>> >>
>> >> Some time later, you memtioned to use ->cmd_ctrl
>> >> instead of ->cmdfunc.
>> >>
>> >> Then I had a problem when I needed to implement
>> >> denali_check_irq() in
>> >> http://patchwork.ozlabs.org/patch/772395/
>> >>
>> >> denali_wait_for_irq() is blocked until interested IRQ happens.
>> >> but ->dev_ready() hook should not be blocked.
>> >> It should return if R/B# transition has happened or not.
>> >
>> > Nope, it should return whether the NAND is ready or not, not whether a
>> > busy -> ready transition occurred or not. It's typically done by
>> > reading the NAND STATUS register or by checking the R/B pin status.
>>
>> Checking the R/B pin is probably impossible unless
>> the pin is changed into a GPIO port.
>>
>> I also considered NAND_CMD_STATUS, but
>> I can not recall why I chose the current approach.
>> Perhaps I thought returning detected IRQ
>> is faster than accessing the chip for NAND_CMD_STATUS.
>>
>> I can try NAND_CMD_STATUS approach if you like.
>
> Depends what you're trying to do. IIUC, you use denali_wait_for_irq()
> inside your ->reset()/->read/write_{page,oob}[_raw]() methods, which is
> perfectly fine (assuming CUSTOM_PAGE_ACCESS is set) since these hooks
> are expected to wait for chip readiness before returning.
>
> You could also implement ->waitfunc() using denali_wait_for_irq() if
> you're able to detect R/B transitions,

R/B transition will set INTR__INT_ACT interrupt.

I think it is easy in my implementation of denali_wait_for_irq(),
like

   denali_wait_for_irq(denali, INTR__INT_ACT);



But, you are suggesting me to change it.
In your way, you give IRQ masks to denali_reset_irq(), like
denali_reset_irq(denali, INTR__ERASE_COMP | INTR__ERASE_FAIL);

Then, we have no room of IRQ bit in denali_wait_for_irq().

How will you implement it?







> but I'm not sure it's worth it,
> because you overload almost all the methods using this hook (the only
> one remaining is ->onfi_set_features(), and using STATUS polling should
> not be an issue in this case).
>
> Implementing ->dev_ready() is not necessary. When not provided, the
> core falls back to STATUS polling and you seem to support
> NAND_CMD_STATUS in denali_cmdfunc(). Note that even if it's not fully
> reliable in the current driver, you're switching to ->cmd_ctrl() at the
> end of the series anyway, so we should be good after that.

->dev_ready() is optional, but we may end up with waiting more than needed.

        case NAND_CMD_RESET:
                if (chip->dev_ready)
                         break;
                udelay(chip->chip_delay);


chip->chip_delay is probably set large enough, so this is not optimal.




If I add something more, the following two bugs were found by
denali_dev_ready().

commit 3158fa0e739615769cc047d2428f30f4c3b6640e
commit c5d664aa5a4c4b257a54eb35045031630d105f49


If NAND core is fine, denali_dev_ready() works fine too.

If not, it is a sign of bug of nand_command(_lp).
This is contributing to the core improvement.





>>
>> IIRC, I was thinking like this:
>>
>> One IRQ line may be shared among multiple hardware including Denali.
>> denali_pci may do this.
>>
>> The Denali IRQ handler need to check irq status
>> because it should return IRQ_HANDLED if the event comes from Denali cont=
roller.
>> Otherwise, the event comes from different hardware, so
>> Denali IRQ handler should return IRQ_NONE.
>
> Correct.
>
>>
>> wait_for_completion_timeout() may bail out with timeout error,
>> then proceed to denali_reset_irq() for the next operation.
>
> Before calling denali_reset_irq() you should re-mask the irqs you
> unmasked in #1. Actually, calling denali_reset_irq() after
> wait_for_completion_timeout() is not even needed here because you'll
> clear pending irqs before launching the next NAND command.
>
>> Afterwards, the event actually may happen, and invoke IRQ handler.
>
> Not if you masked IRQs after wait_for_completion_timeout() returned.


        wait_for_completion_timeout(&denali->complete, msecs_to_jiffies(100=
0));
                <<< WHAT IF IRQ EVENT HAPPENS HERE ? >>>
        iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));




Also, you ignore the return value of wait_for_completion_timeout(),
then drop my precious error message()

  dev_err(denali->dev, "timeout while waiting for irq 0x%x\n",
          denali->irq_mask)



> Here is a patch to show you what I had in mind [1] (it applies on top
> of this patch). AFAICT, there's no races, no interrupt loss, and you
> get rid of the ->irq_mask/status/lock fields.
>
> [1]http://code.bulix.org/fufia6-145571
>


Problem Scenario A
 [1] wait_for_completion_timeout() exits with timeout.
 [2] IRQ happens and denali_isr() is invoked
 [3] iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));
 [4] status =3D ioread32(denali->flash_reg + INTR_STATUS(bank)) &
              ioread32(denali->flash_reg + INTR_EN(bank));
      (status is set to 0 because INTR_EN(bank) is now 0)
 [5] return IRQ_NONE;
 [6] kernel complains  "irq *: nobody cared"



Problem Scenario B  (unlikely to happen, though)
 [1] wait_for_completion_timeout() exits with timeout.
 [2] IRQ happens and denali_isr() is invoked
 [3] iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));
 [4] chip->select_chip(mtd, -1)
 [5] denali->flash_bank =3D -1
 [6] status =3D ioread32(denali->flash_reg + INTR_STATUS(bank)) &
              ioread32(denali->flash_reg + INTR_EN(bank));
       ( access to non-existing INTR_STATUS(-1) )





--=20
Best Regards
Masahiro Yamada
