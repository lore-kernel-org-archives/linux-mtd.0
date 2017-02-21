Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cg7ri-0007c2-4t
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 10:40:16 +0000
Date: Tue, 21 Feb 2017 11:39:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, "linshunquan (A)"
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH 04/11] nand: spi: Add read function support
Message-ID: <20170221113936.749b5b15@bbrezillon>
In-Reply-To: <CAAyFORKDNpkycQ-n5yg=H+fmu6v4teUhwzcXEa-SROV_8kVOBA@mail.gmail.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-5-git-send-email-peterpandong@micron.com>
 <20170221105153.75772e25@bbrezillon>
 <CAAyFORKDNpkycQ-n5yg=H+fmu6v4teUhwzcXEa-SROV_8kVOBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Feb 2017 18:06:03 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

[...]

> >> +static int spi_nand_get_device(struct mtd_info *mtd, int new_state)
> >> +{
> >> +     struct spi_nand_chip *this = mtd_to_spi_nand(mtd);
> >> +     DECLARE_WAITQUEUE(wait, current);
> >> +
> >> +     /*
> >> +      * Grab the lock and see if the device is available
> >> +      */
> >> +     while (1) {
> >> +             spin_lock(&this->chip_lock);
> >> +             if (this->state == FL_READY) {
> >> +                     this->state = new_state;
> >> +                     spin_unlock(&this->chip_lock);
> >> +                     break;
> >> +             }
> >> +             if (new_state == FL_PM_SUSPENDED) {
> >> +                     spin_unlock(&this->chip_lock);
> >> +                     return (this->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
> >> +             }
> >> +             set_current_state(TASK_UNINTERRUPTIBLE);
> >> +             add_wait_queue(&this->wq, &wait);
> >> +             spin_unlock(&this->chip_lock);
> >> +             schedule();
> >> +             remove_wait_queue(&this->wq, &wait);
> >> +     }  
> >
> > Do we really need this fl_state dance? It could be replaced with a
> > simple mutex that is taken for the whole flash operation. This leaves
> > the suspended case which could be handled with:
> >
> > static void spinand_suspend(struct mtd_info *mtd)
> > {
> >         struct spi_nand_chip *this = mtd_to_spinand(mtd);
> >
> >         if (!mutex_trylock(&this->lock))
> >                 return -EAGAIN;
> >
> >         return 0;
> > }
> >
> > For other operations (read, write, lock, unlock, ...), you just have to
> > take the lock before accessing the NAND and release it when you're done.
> >
> > Again, I'm saying that because I don't want to end up with something
> > that is overly complex for no real reason, but maybe I'm missing
> > something.  
> 
> This code refers old NAND framework two years ago. I just check the latest
> nand_base.c you already remove it. Let's make it simple. Fix this in v2.

Nope, it's still here [1], but I'm pretty sure this complexity is
actually not needed, and anyway, I plan to delegate this serialization
to the NAND controller in the future (some operations can be done
in //, for example, on multi-die NANDs, you can read something on a die,
while you're programming something on the other die).

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L851
