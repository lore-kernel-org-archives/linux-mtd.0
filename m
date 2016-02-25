Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ57X-00034c-Px
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 23:14:56 +0000
Received: by mail-pa0-x235.google.com with SMTP id fy10so39773836pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 15:14:35 -0800 (PST)
Date: Thu, 25 Feb 2016 15:14:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>,
 IMG-MIPSLinuxKerneldevelopers@imgtec.com,
 Alex Smith <alex.smith@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Niklas Cassel <niklas.cassel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v7] mtd: nand: increase ready wait timeout and report
 timeouts
Message-ID: <20160225231432.GN21465@google.com>
References: <1444139527-14087-1-git-send-email-harvey.hunt@imgtec.com>
 <CAFLxGvxvWSGt3Z8p0yTPMh6v7LnjLKGtSeGdPkqauCYOXVnTzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvxvWSGt3Z8p0yTPMh6v7LnjLKGtSeGdPkqauCYOXVnTzg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 25, 2016 at 11:54:25PM +0100, Richard Weinberger wrote:
> On Tue, Oct 6, 2015 at 3:52 PM, Harvey Hunt <harvey.hunt@imgtec.com> wrote:
> > From: Alex Smith <alex.smith@imgtec.com>

[...]

> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -543,23 +543,32 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
> >         }
> >  }
> >
> > -/* Wait for the ready pin, after a command. The timeout is caught later. */
> > +/**
> > + * nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
> > + * @mtd: MTD device structure
> > + *
> > + * Wait for the ready pin after a command, and warn if a timeout occurs.
> > + */
> >  void nand_wait_ready(struct mtd_info *mtd)
> >  {
> >         struct nand_chip *chip = mtd->priv;
> > -       unsigned long timeo = jiffies + msecs_to_jiffies(20);
> > +       unsigned long timeo = 400;
> >
> > -       /* 400ms timeout */
> >         if (in_interrupt() || oops_in_progress)
> > -               return panic_nand_wait_ready(mtd, 400);
> > +               return panic_nand_wait_ready(mtd, timeo);
> >
> >         led_trigger_event(nand_led_trigger, LED_FULL);
> >         /* Wait until command is processed or timeout occurs */
> > +       timeo = jiffies + msecs_to_jiffies(timeo);
> >         do {
> >                 if (chip->dev_ready(mtd))
> > -                       break;
> > -               touch_softlockup_watchdog();
> > +                       goto out;
> > +               cond_resched();
> >         } while (time_before(jiffies, timeo));
> > +
> > +       pr_warn_ratelimited(
> > +               "timeout while waiting for chip to become ready\n");
> > +out:
> 
> Sorry for exhuming an already merged patch but Boris and I ran into
> spurious chip timeouts
> and hunted the issue down to this change.
> If the system is under heavy load the cond_resched() will swap in
> other threads and the
> time_before() calculation will trigger and a wrong chip timeout is reported.
> 
> It is also not clear to us why the cond_resched() is needed at all.
> Can you please elaborate?

I can't speak for the "why" precisely. It seemed reasonable to avoid a
(potentially) 400 ms busy loop though, in the presence of other
potential work.

Regardless, this timeout loop is wrong. Shouldn't it have something like
the following?

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f2c8ff398d6c..596a9b0503da 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -566,8 +566,8 @@ void nand_wait_ready(struct mtd_info *mtd)
 		cond_resched();
 	} while (time_before(jiffies, timeo));
 
-	pr_warn_ratelimited(
-		"timeout while waiting for chip to become ready\n");
+	if (!chip->dev_ready(mtd))
+		pr_warn_ratelimited("timeout while waiting for chip to become ready\n");
 out:
 	led_trigger_event(nand_led_trigger, LED_OFF);
 }
