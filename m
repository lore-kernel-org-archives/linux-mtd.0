Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgJY-0008Nz-0A
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 13:21:00 +0000
Received: by mail-wi0-f171.google.com with SMTP id em10so1356724wid.4
 for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2014 06:20:38 -0700 (PDT)
Message-ID: <1412256036.20895.10.camel@lp-lvrv.comap.cz>
Subject: Re: [PATCH v2 2/2] mtd: nand: omap: Synchronize access to the ECC
 engine
From: Rostislav Lisovy <lisovy@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Date: Thu, 02 Oct 2014 15:20:36 +0200
In-Reply-To: <542D4A51.9060907@ti.com>
References: <1412252173-20454-1-git-send-email-lisovy@merica.cz>
 <1412252173-20454-2-git-send-email-lisovy@merica.cz>
 <542D4A51.9060907@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rostislav Lisovy <lisovy@merica.cz>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 michal.vokac@comap.cz, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Roger;
Thanks for the review.

On Čt, 2014-10-02 at 15:51 +0300, Roger Quadros wrote:
> Don't you think this approach is racy?
> 
> IMHO the lock must be held across the entire page operation

I still think it is done in this way.

> i.e.
> hold ecc lock
> ecc.hwctl
> chip->read/write_buf
> ecc.calculate
> ecc.correct
> release ecc lock

According to my understanding of the code 'ecc.correct' does not access
the ECC engine directly, it gets the '*read_ecc' and '*calc_ecc' from
the 'ecc.calculate'.

Once again the work flow you described + my locking approach:
* ecc.hwctl       <-- mutex_lock() just before accessing the ECC engine
* chip->read/write_buf
* ecc.calculate   <-- mutex_unlock() just after reading from ECC engine
* ecc.correct

> 
> else we risk simultaneous NAND operations on multiple chips
> stomping on each other in between the entire sequence.
> 
> Then on further investigation isn't nand_get_device() already doing
> the same
> thing as you are attempting here?
> 
> The chip->controller->lock is meant for serializing NAND controller
> access.
> 
> so instead of adding a new lock in the omap2 nand driver we need to
> ensure that
> we are maintaining the same nand_hw_control (controller) structure
> across multiple NAND chips.
> 
> Let's move this controller structure out of omap_nand_info and keep it
> global to the driver
> and make sure every NAND instance uses it.

Ok; I will take a look at it. It looks like the appropriate lock to use.
I am just a bit unsure if the 'spinlock' is the correct synchronization
primitive here.

Best regards;
Rostislav
