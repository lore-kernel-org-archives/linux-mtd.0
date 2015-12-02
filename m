Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4CWb-0002A5-UP
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 18:53:11 +0000
Received: by pabfh17 with SMTP id fh17so49741238pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 10:52:49 -0800 (PST)
Date: Wed, 2 Dec 2015 10:52:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
Subject: Re: [PATCH] mtd: nand: do FIFO processing in nand_get_device()
Message-ID: <20151202185246.GI64635@google.com>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
 <20151123181811.GO17308@twins.programming.kicks-ass.net>
 <20151125173543.GA17151@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151125173543.GA17151@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 25, 2015 at 06:35:43PM +0100, Sebastian Andrzej Siewior wrote:
> I have here a live lock in UBI doing
>   ensure_wear_leveling() -> wear_leveling_worker() -> ubi_eba_copy_leb()
>   MOVE_RETRY -> schedule_erase() -> ensure_wear_leveling()
> 
> on the same PEB over and over again. The reason for MOVE_RETRY is that
> the LEB-Lock owner is stucked in nand_get_device() and does not get the
> device lock. The PEB-lock owner is only scheduled on the CPU while the UBI
> thread is idle during erase or read while (again) owning the device-lock
> so the LEB-lock owner makes no progress.
> 
> To fix this live lock I ensure that there FIFO processing in
> nand_get_device(). On release the first waiter is marked as the new
> owner. If someone asks for the device and is not the waiter to which
> nand device has been handed over then it will put itself on the
> waitqueue.
> The FIFO processing was suggested by Peter Zijlstra.
> 
> As a small optimization I use add_wait_queue_exclusive() instead
> add_wait_queue() to make sure that only _one_ waiter is woken up and not
> all of them.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> Would a stable be considered as reasonable?

Your threading is a bit confusing. Is this patch still needed, or did
you fix everything by fixing UBI with these?

http://lists.infradead.org/pipermail/linux-mtd/2015-November/063745.html
http://lists.infradead.org/pipermail/linux-mtd/2015-November/063744.html
http://lists.infradead.org/pipermail/linux-mtd/2015-November/063746.html

Brian
