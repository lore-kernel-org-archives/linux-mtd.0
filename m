Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIqez-0002tJ-Ec
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 06:11:11 +0000
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
 [209.85.161.174]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id v586AJAh002036
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 15:10:20 +0900
Received: by mail-yw0-f174.google.com with SMTP id l75so9935804ywc.3
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2017 23:10:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170607155701.4bc89ad8@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 15:10:18 +0900
Message-ID: <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-06-07 22:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed,  7 Jun 2017 20:52:19 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>
>> -/*
>> - * This is the interrupt service routine. It handles all interrupts
>> - * sent to this device. Note that on CE4100, this is a shared interrupt.
>> - */
>> -static irqreturn_t denali_isr(int irq, void *dev_id)
>> +static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
>> +                                 uint32_t irq_mask)
>>  {
>> -     struct denali_nand_info *denali = dev_id;
>> +     unsigned long time_left, flags;
>>       uint32_t irq_status;
>> -     irqreturn_t result = IRQ_NONE;
>>
>> -     spin_lock(&denali->irq_lock);
>> +     spin_lock_irqsave(&denali->irq_lock, flags);
>>
>> -     /* check to see if a valid NAND chip has been selected. */
>> -     if (is_flash_bank_valid(denali->flash_bank)) {
>> -             /*
>> -              * check to see if controller generated the interrupt,
>> -              * since this is a shared interrupt
>> -              */
>> -             irq_status = denali_irq_detected(denali);
>> -             if (irq_status != 0) {
>> -                     /* handle interrupt */
>> -                     /* first acknowledge it */
>> -                     clear_interrupt(denali, irq_status);
>> -                     /*
>> -                      * store the status in the device context for someone
>> -                      * to read
>> -                      */
>> -                     denali->irq_status |= irq_status;
>> -                     /* notify anyone who cares that it happened */
>> -                     complete(&denali->complete);
>> -                     /* tell the OS that we've handled this */
>> -                     result = IRQ_HANDLED;
>> -             }
>> +     irq_status = denali->irq_status;
>> +
>> +     if (irq_mask & irq_status) {
>> +             spin_unlock_irqrestore(&denali->irq_lock, flags);
>> +             return irq_status;
>>       }
>> -     spin_unlock(&denali->irq_lock);
>> -     return result;
>> +
>> +     denali->irq_mask = irq_mask;
>> +     reinit_completion(&denali->complete);
>
> These 2 instructions should be done before calling
> denali_wait_for_irq() (for example in denali_reset_irq()), otherwise
> you might loose events if they happen between your irq_status read and
> the reinit_completion() call.

No.

denali->irq_lock avoids a race between denali_isr() and
denali_wait_for_irq().


The line
     denali->irq_status |= irq_status;
in denali_isr() accumulates all events that have happened
since denali_reset_irq().

If the interested IRQs have already happened
before denali_wait_for_irq(), it just return immediately
without using completion.

I do not mind adding a comment like below
if you think my intention is unclear, though.

        /* Return immediately if interested IRQs have already happend. */
        if (irq_mask & irq_status) {
                spin_unlock_irqrestore(&denali->irq_lock, flags);
                return irq_status;
        }





> You should also clear existing interrupts
> before launching your operation, otherwise you might wakeup on previous
> events.


I do not see a point in your suggestion.

denali_isr() reads out IRQ_STATUS(i) and immediately clears IRQ bits.

IRQ events triggered by previous events are accumulated in denali->irq_status.

denali_reset_irq() clears it.

        denali->irq_status = 0;


Again, denali->irq_lock avoids a race between denali_reset_irq() and
denali_irq(),
so this works correctly.


-- 
Best Regards
Masahiro Yamada
