Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy3OV-0001ty-9U
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 19:23:07 +0000
Received: by pdea3 with SMTP id a3so48284291pde.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 12:22:46 -0700 (PDT)
Date: Thu, 28 May 2015 12:22:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd: dc21285: use raw spinlock functions for nw_gpio_lock
Message-ID: <20150528192238.GQ27753@ld-irv-0074>
References: <1432801330-26406-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1432801330-26406-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, Ingo Molnar <mingo@elte.hu>,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 28, 2015 at 10:22:10AM +0200, Uwe Kleine-König wrote:
> Since commit bd31b85960a7 (which is in 3.2-rc1) nw_gpio_lock is a raw spinlock
> that needs usage of the corresponding raw functions.
> 
> This fixes:
> 
>   drivers/mtd/maps/dc21285.c: In function 'nw_en_write':
>   drivers/mtd/maps/dc21285.c:41:340: warning: passing argument 1 of 'spinlock_check' from incompatible pointer type
>     spin_lock_irqsave(&nw_gpio_lock, flags);
> 
>   In file included from include/linux/seqlock.h:35:0,
>                    from include/linux/time.h:5,
>                    from include/linux/stat.h:18,
>                    from include/linux/module.h:10,
>                    from drivers/mtd/maps/dc21285.c:8:
>   include/linux/spinlock.h:299:102: note: expected 'struct spinlock_t *' but argument is of type 'struct raw_spinlock_t *'
>    static inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
>                                                                                                         ^
>   drivers/mtd/maps/dc21285.c:43:25: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type
>     spin_unlock_irqrestore(&nw_gpio_lock, flags);
>                            ^
>   In file included from include/linux/seqlock.h:35:0,
>                    from include/linux/time.h:5,
>                    from include/linux/stat.h:18,
>                    from include/linux/module.h:10,
>                    from drivers/mtd/maps/dc21285.c:8:
>   include/linux/spinlock.h:370:91: note: expected 'struct spinlock_t *' but argument is of type 'struct raw_spinlock_t *'
>    static inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
> 
> Fixes: bd31b85960a7 ("locking, ARM: Annotate low level hw locks as raw")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to l2-mtd.git. Apparently nobody builds this driver.

Brian
