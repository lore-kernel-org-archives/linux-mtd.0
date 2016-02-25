Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ4o2-0001tz-VO
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 22:54:47 +0000
Received: by mail-oi0-x229.google.com with SMTP id x21so50530674oix.2
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 14:54:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1444139527-14087-1-git-send-email-harvey.hunt@imgtec.com>
References: <1444139527-14087-1-git-send-email-harvey.hunt@imgtec.com>
Date: Thu, 25 Feb 2016 23:54:25 +0100
Message-ID: <CAFLxGvxvWSGt3Z8p0yTPMh6v7LnjLKGtSeGdPkqauCYOXVnTzg@mail.gmail.com>
Subject: Re: [PATCH v7] mtd: nand: increase ready wait timeout and report
 timeouts
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: IMG-MIPSLinuxKerneldevelopers@imgtec.com,
 Alex Smith <alex.smith@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Niklas Cassel <niklas.cassel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 6, 2015 at 3:52 PM, Harvey Hunt <harvey.hunt@imgtec.com> wrote:
> From: Alex Smith <alex.smith@imgtec.com>
>
> If nand_wait_ready() times out, this is silently ignored, and its
> caller will then proceed to read from/write to the chip before it is
> ready. This can potentially result in corruption with no indication as
> to why.
>
> While a 20ms timeout seems like it should be plenty enough, certain
> behaviour can cause it to timeout much earlier than expected. The
> situation which prompted this change was that CPU 0, which is
> responsible for updating jiffies, was holding interrupts disabled
> for a fairly long time while writing to the console during a printk,
> causing several jiffies updates to be delayed. If CPU 1 happens to
> enter the timeout loop in nand_wait_ready() just before CPU 0 re-
> enables interrupts and updates jiffies, CPU 1 will immediately time
> out when the delayed jiffies updates are made. The result of this is
> that nand_wait_ready() actually waits less time than the NAND chip
> would normally take to be ready, and then read_page() proceeds to
> read out bad data from the chip.
>
> The situation described above may seem unlikely, but in fact it can be
> reproduced almost every boot on the MIPS Creator Ci20.
>
> Therefore, this patch increases the timeout to 400ms. This should be
> enough to cover cases where jiffies updates get delayed. In nand_wait()
> the timeout was previously chosen based on whether erasing or
> programming. This is changed to be 400ms unconditionally as well to
> avoid similar problems there. nand_wait() is also slightly refactored
> to be consistent with nand_wait{,_status}_ready(). These changes should
> have no effect during normal operation.
>
> Debugging this was made more difficult by the misleading comment above
> nand_wait_ready() stating "The timeout is caught later" - no timeout was
> ever reported, leading me away from the real source of the problem.
> Therefore, a pr_warn() is added when a timeout does occur so that it is
> easier to pinpoint similar problems in future.
>
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Reviewed-by: Niklas Cassel <niklas.cassel@axis.com>
> Cc: Alex Smith <alex@alex-smith.me.uk>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Niklas Cassel <niklas.cassel@axis.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> This patch was originally sent in a JZ4780 patch set, but sending
> it on its own was deemed more appropriate. Alex Smith sent the
> original patch - this is an unmodified version that he has asked me
> to send.
>
> v6 -> v7:
>  - Add Harvey's signed off by.
>  - Add Alex Smith to CC.
>  - Add Niklas' reviewed by.
>
> v5 -> v6:
>  - Incorporate suggestions from Niklas Cassel.
>
> v4 -> v5:
>  - Remove spurious change.
>  - Add Ezequiel's Reviewed-by.
>
> v3 -> v4:
>  - New patch to fix issue encountered in external Ci20 3.18 kernel
>    branch which also applies upstream.
>
>  drivers/mtd/nand/nand_base.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..8e58577 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -543,23 +543,32 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
>         }
>  }
>
> -/* Wait for the ready pin, after a command. The timeout is caught later. */
> +/**
> + * nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
> + * @mtd: MTD device structure
> + *
> + * Wait for the ready pin after a command, and warn if a timeout occurs.
> + */
>  void nand_wait_ready(struct mtd_info *mtd)
>  {
>         struct nand_chip *chip = mtd->priv;
> -       unsigned long timeo = jiffies + msecs_to_jiffies(20);
> +       unsigned long timeo = 400;
>
> -       /* 400ms timeout */
>         if (in_interrupt() || oops_in_progress)
> -               return panic_nand_wait_ready(mtd, 400);
> +               return panic_nand_wait_ready(mtd, timeo);
>
>         led_trigger_event(nand_led_trigger, LED_FULL);
>         /* Wait until command is processed or timeout occurs */
> +       timeo = jiffies + msecs_to_jiffies(timeo);
>         do {
>                 if (chip->dev_ready(mtd))
> -                       break;
> -               touch_softlockup_watchdog();
> +                       goto out;
> +               cond_resched();
>         } while (time_before(jiffies, timeo));
> +
> +       pr_warn_ratelimited(
> +               "timeout while waiting for chip to become ready\n");
> +out:

Sorry for exhuming an already merged patch but Boris and I ran into
spurious chip timeouts
and hunted the issue down to this change.
If the system is under heavy load the cond_resched() will swap in
other threads and the
time_before() calculation will trigger and a wrong chip timeout is reported.

It is also not clear to us why the cond_resched() is needed at all.
Can you please elaborate?

-- 
Thanks,
//richard
