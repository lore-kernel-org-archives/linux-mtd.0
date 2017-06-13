Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKdeZ-0007Eb-0F
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 04:42:09 +0000
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v5D4fPQm014636
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 13:41:26 +0900
Received: by mail-yw0-f169.google.com with SMTP id v7so27467439ywc.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 21:41:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170609095803.2b755283@bbrezillon>
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
 <20170609095803.2b755283@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Jun 2017 13:41:24 +0900
Message-ID: <CAK7LNATEDLAC-8c0FWaGUfRk56Y=DOEeE-MhbAEGCv5bNx+QBg@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
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


2017-06-09 16:58 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Hi Masahiro,
>
> On Fri, 9 Jun 2017 02:26:34 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris
>>
>> 2017-06-09 0:43 GMT+09:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
>> > On Thu, 8 Jun 2017 21:58:00 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> Hi Boris,
>> >>
>> >> 2017-06-08 20:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-elec=
trons.com>:
>> >> > On Thu, 8 Jun 2017 19:41:39 +0900
>> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >> >
>> >> >> Hi Boris,
>> >> >>
>> >> >>
>> >> >> 2017-06-08 16:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-e=
lectrons.com>:
>> >> >> > Le Thu, 8 Jun 2017 15:10:18 +0900,
>> >> >> > Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
>> >> >> >
>> >> >> >> Hi Boris,
>> >> >> >>
>> >> >> >>
>> >> >> >> 2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@fre=
e-electrons.com>:
>> >> >> >> > On Wed,  7 Jun 2017 20:52:19 +0900
>> >> >> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >> >> >> >
>> >> >> >> >
>> >> >> >> >> -/*
>> >> >> >> >> - * This is the interrupt service routine. It handles all in=
terrupts
>> >> >> >> >> - * sent to this device. Note that on CE4100, this is a shar=
ed interrupt.
>> >> >> >> >> - */
>> >> >> >> >> -static irqreturn_t denali_isr(int irq, void *dev_id)
>> >> >> >> >> +static uint32_t denali_wait_for_irq(struct denali_nand_info=
 *denali,
>> >> >> >> >> +                                 uint32_t irq_mask)
>> >> >> >> >>  {
>> >> >> >> >> -     struct denali_nand_info *denali =3D dev_id;
>> >> >> >> >> +     unsigned long time_left, flags;
>> >> >> >> >>       uint32_t irq_status;
>> >> >> >> >> -     irqreturn_t result =3D IRQ_NONE;
>> >> >> >> >>
>> >> >> >> >> -     spin_lock(&denali->irq_lock);
>> >> >> >> >> +     spin_lock_irqsave(&denali->irq_lock, flags);
>> >> >> >> >>
>> >> >> >> >> -     /* check to see if a valid NAND chip has been selected=
. */
>> >> >> >> >> -     if (is_flash_bank_valid(denali->flash_bank)) {
>> >> >> >> >> -             /*
>> >> >> >> >> -              * check to see if controller generated the in=
terrupt,
>> >> >> >> >> -              * since this is a shared interrupt
>> >> >> >> >> -              */
>> >> >> >> >> -             irq_status =3D denali_irq_detected(denali);
>> >> >> >> >> -             if (irq_status !=3D 0) {
>> >> >> >> >> -                     /* handle interrupt */
>> >> >> >> >> -                     /* first acknowledge it */
>> >> >> >> >> -                     clear_interrupt(denali, irq_status);
>> >> >> >> >> -                     /*
>> >> >> >> >> -                      * store the status in the device cont=
ext for someone
>> >> >> >> >> -                      * to read
>> >> >> >> >> -                      */
>> >> >> >> >> -                     denali->irq_status |=3D irq_status;
>> >> >> >> >> -                     /* notify anyone who cares that it hap=
pened */
>> >> >> >> >> -                     complete(&denali->complete);
>> >> >> >> >> -                     /* tell the OS that we've handled this=
 */
>> >> >> >> >> -                     result =3D IRQ_HANDLED;
>> >> >> >> >> -             }
>> >> >> >> >> +     irq_status =3D denali->irq_status;
>> >> >> >> >> +
>> >> >> >> >> +     if (irq_mask & irq_status) {
>> >> >> >> >> +             spin_unlock_irqrestore(&denali->irq_lock, flag=
s);
>> >> >> >> >> +             return irq_status;
>> >> >> >> >>       }
>> >> >> >> >> -     spin_unlock(&denali->irq_lock);
>> >> >> >> >> -     return result;
>> >> >> >> >> +
>> >> >> >> >> +     denali->irq_mask =3D irq_mask;
>> >> >> >> >> +     reinit_completion(&denali->complete);
>> >> >> >> >
>> >> >> >> > These 2 instructions should be done before calling
>> >> >> >> > denali_wait_for_irq() (for example in denali_reset_irq()), ot=
herwise
>> >> >> >> > you might loose events if they happen between your irq_status=
 read and
>> >> >> >> > the reinit_completion() call.
>> >> >> >>
>> >> >> >> No.
>> >> >> >>
>> >> >> >> denali->irq_lock avoids a race between denali_isr() and
>> >> >> >> denali_wait_for_irq().
>> >> >> >>
>> >> >> >>
>> >> >> >> The line
>> >> >> >>      denali->irq_status |=3D irq_status;
>> >> >> >> in denali_isr() accumulates all events that have happened
>> >> >> >> since denali_reset_irq().
>> >> >> >>
>> >> >> >> If the interested IRQs have already happened
>> >> >> >> before denali_wait_for_irq(), it just return immediately
>> >> >> >> without using completion.
>> >> >> >>
>> >> >> >> I do not mind adding a comment like below
>> >> >> >> if you think my intention is unclear, though.
>> >> >> >>
>> >> >> >>         /* Return immediately if interested IRQs have already h=
append. */
>> >> >> >>         if (irq_mask & irq_status) {
>> >> >> >>                 spin_unlock_irqrestore(&denali->irq_lock, flags=
);
>> >> >> >>                 return irq_status;
>> >> >> >>         }
>> >> >> >>
>> >> >> >>
>> >> >> >
>> >> >> > My bad, I didn't notice you were releasing the lock after callin=
g
>> >> >> > reinit_completion(). I still find this solution more complex tha=
n my
>> >> >> > proposal, but I don't care that much.
>> >> >>
>> >> >>
>> >> >> At first, I implemented exactly like you suggested;
>> >> >>    denali->irq_mask =3D irq_mask;
>> >> >>    reinit_completion(&denali->complete)
>> >> >> in denali_reset_irq().
>> >> >>
>> >> >>
>> >> >> IIRC, things were like this.
>> >> >>
>> >> >> Some time later, you memtioned to use ->cmd_ctrl
>> >> >> instead of ->cmdfunc.
>> >> >>
>> >> >> Then I had a problem when I needed to implement
>> >> >> denali_check_irq() in
>> >> >> http://patchwork.ozlabs.org/patch/772395/
>> >> >>
>> >> >> denali_wait_for_irq() is blocked until interested IRQ happens.
>> >> >> but ->dev_ready() hook should not be blocked.
>> >> >> It should return if R/B# transition has happened or not.
>> >> >
>> >> > Nope, it should return whether the NAND is ready or not, not whethe=
r a
>> >> > busy -> ready transition occurred or not. It's typically done by
>> >> > reading the NAND STATUS register or by checking the R/B pin status.
>> >>
>> >> Checking the R/B pin is probably impossible unless
>> >> the pin is changed into a GPIO port.
>> >>
>> >> I also considered NAND_CMD_STATUS, but
>> >> I can not recall why I chose the current approach.
>> >> Perhaps I thought returning detected IRQ
>> >> is faster than accessing the chip for NAND_CMD_STATUS.
>> >>
>> >> I can try NAND_CMD_STATUS approach if you like.
>> >
>> > Depends what you're trying to do. IIUC, you use denali_wait_for_irq()
>> > inside your ->reset()/->read/write_{page,oob}[_raw]() methods, which i=
s
>> > perfectly fine (assuming CUSTOM_PAGE_ACCESS is set) since these hooks
>> > are expected to wait for chip readiness before returning.
>> >
>> > You could also implement ->waitfunc() using denali_wait_for_irq() if
>> > you're able to detect R/B transitions,
>>
>> R/B transition will set INTR__INT_ACT interrupt.
>>
>> I think it is easy in my implementation of denali_wait_for_irq(),
>> like
>>
>>    denali_wait_for_irq(denali, INTR__INT_ACT);
>>
>>
>>
>> But, you are suggesting me to change it.
>
> This is clearly not a hard requirement, I was just curious and wanted
> to understand why you had such a convoluted interrupt handling design. I
> think I now understand why (see below).
>
>> In your way, you give IRQ masks to denali_reset_irq(), like
>> denali_reset_irq(denali, INTR__ERASE_COMP | INTR__ERASE_FAIL);
>>
>> Then, we have no room of IRQ bit in denali_wait_for_irq().
>>
>> How will you implement it?
>
> It should be pretty easy: just make sure you reset the INTR__INT_ACT
> status flag before sending a command (->cmd_ctrl()), and then unmask the
> INTR__INT_ACT in denali_waitfunc() just before calling
> denali_wait_for_irqs(). This should guarantee that you don't loose any
> events, while keeping the logic rather simple.

Right.  This way will be possible.

One compromise I see is that
it sets INTR__INT_ACT (=3D wait for R/B# IRQ event) for all commands.
Some commands actually trigger R/B# transition, but some do not.

We can make it precise like nand_command_lp(),
but I do not want to write such a switch statement in my driver.
(this must be maintained for possible new command addition in the future)


Anyway, I will send v6 in my current approach.




>>
>>
>>
>> > Here is a patch to show you what I had in mind [1] (it applies on top
>> > of this patch). AFAICT, there's no races, no interrupt loss, and you
>> > get rid of the ->irq_mask/status/lock fields.
>> >
>> > [1]http://code.bulix.org/fufia6-145571
>> >
>>
>>
>> Problem Scenario A
>>  [1] wait_for_completion_timeout() exits with timeout.
>>  [2] IRQ happens and denali_isr() is invoked
>>  [3] iowrite32(0, denali->flash_reg + INTR_EN(denali->flash_bank));
>>  [4] status =3D ioread32(denali->flash_reg + INTR_STATUS(bank)) &
>>               ioread32(denali->flash_reg + INTR_EN(bank));
>>       (status is set to 0 because INTR_EN(bank) is now 0)
>>  [5] return IRQ_NONE;
>>  [6] kernel complains  "irq *: nobody cared"
>
> Okay, this is the part I initially misunderstood. Your goal is to never
> ever return IRQ_NONE, while I was accepting to rarely return IRQ_NONE
> in the unlikely interrupt-just-after-timeout case. Note that the kernel
> irq infrastructure accepts rare occurrences or IRQ_NONE [1].

I wanted to be strict here.

But, I did not know the kernel is tolerant with rare IRQ_NONE.
Thanks for the pointer!




--=20
Best Regards
Masahiro Yamada
