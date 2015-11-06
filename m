Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZumEc-0005kn-H9
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 18:59:46 +0000
Date: Fri, 6 Nov 2015 19:59:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Andrew E. Mileski" <andrewm@isoar.ca>, linux-mtd
 <linux-mtd@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>
Subject: Re: Hang on reboot in nand_get_device()
Message-ID: <20151106195903.0d55d819@bbrezillon>
In-Reply-To: <20151106180052.GE12143@google.com>
References: <55958F4C.1020002@isoar.ca>
	<20151106180052.GE12143@google.com>
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

Hi Brian,

On Fri, 6 Nov 2015 10:00:52 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> + others
> 
> Hi Andrew,
> 
> Sorry for the delay here. I overlooked this.
> 
> On Thu, Jul 02, 2015 at 03:21:48PM -0400, Andrew E. Mileski wrote:
> > I'm experiencing a hang on reboot with a Freescale P1022 PowerPC system, with a
> > dual chip-select NAND part (specified in the device tree as two
> > separate devices), and kernel v4.0.6.
> 
> Which driver?
> 
> > It appears to be a hang in mtd/nand/nand_base.c:nand_get_device() waiting on
> > chip->controller->active.
> > 
> > Shouldn't nand_shutdown(), or perhaps a special case in nand_get_device() for
> > FL_SHUTDOWN, set chip->controller->active = NULL before returning?
> 
> I don't think that's exactly the right solution, but you're in the right
> ballpark I expect.

Hm, actually I find the idea of releasing the NAND controller when the
flash is set in FL_SHUTDOWN state not that bad. Is there any reason
we would want the NAND chip to stay active when we're shutting the
system down.
I understand that this is needed for the suspended case because we want
the system to restore the correct state when resuming (ie marking the
right device as active), but shutdown should be simpler.

> 
> > This seems to fix the problem for me, but I don't know all the code well enough
> > to know whether doing so is appropriate, or sufficient.
> 
> I'm going to guess you're seeing two reboot handlers trying to 'get' the
> same controller structure. We could probably confirm that if we see your
> driver.

Yes, that's probably what's happening here.

> 
> But I see this could be a problem with a wide class of drivers.
> Basically, any NAND driver that has multiple NAND chips attached will
> see multiple reboot handlers that point at the same controller lock.
> This will obviously deadlock, since only one of the chips will make it
> through the nand_shutdown() function successfully.

Indeed.

> 
> And now that I begin describing the problem and grepping through the
> source logs... I see that this problem was already resolved back in
> 2009, except for the FL_PM_SUSPENDED mode:
> 
> commit 6b0d9a84124937f048bcb8b21313152b23063978
> Author: Li Yang <leoli@freescale.com>
> Date:   Tue Nov 17 14:45:49 2009 -0800
> 
>     mtd: nand: fix multi-chip suspend problem
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=6b0d9a84124937f048bcb8b21313152b23063978
>     
> I actually don't see why we can't just use
> nand_get_device(FL_PM_SUSPENDED) for the shutdown/reboot case, like
> this:

That should work, but shouldn't we keep the appropriate state (FL_SHUTDOWN)
and patch the nand_get_device() code instead?

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..884caf0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -839,9 +839,9 @@ retry:
                spin_unlock(lock);
                return 0;
        }
-       if (new_state == FL_PM_SUSPENDED) {
-               if (chip->controller->active->state == FL_PM_SUSPENDED) {
-                       chip->state = FL_PM_SUSPENDED;
+       if (new_state == FL_PM_SUSPENDED || new_state == FL_SHUTDOWN) {
+               if (chip->controller->active->state == new_state) {
+                       chip->state = new_state;
                        spin_unlock(lock);
                        return 0;
                }

or

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..812b8b1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -830,6 +830,20 @@ nand_get_device(struct mtd_info *mtd, int new_state)
 retry:
        spin_lock(lock);
 
+       /* putting the NAND chip in shutdown state should always succeed. */
+       if (new_state == FL_SHUTDOWN) {
+               /*
+                * release the controller if the chip put in shutdown state
+                * is the current active device.
+                */
+               if (chip->controller->active == chip)
+                       chip->controller->active = NULL;
+
+               chip->state = new_state;
+               spin_unlock(lock);
+               return 0;
+       }
+
        /* Hardware controller shared among independent devices */
        if (!chip->controller->active)
                chip->controller->active = chip;

> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index cc74142938b0..ece544efccc3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3110,7 +3110,7 @@ static void nand_resume(struct mtd_info *mtd)
>   */
>  static void nand_shutdown(struct mtd_info *mtd)
>  {
> -	nand_get_device(mtd, FL_SHUTDOWN);
> +	nand_get_device(mtd, FL_PM_SUSPENDED);
>  }
>  
>  /* Set default functions */
> 
> 
> It's also possible that this could be better solved in a proper
> refactor/rewrite of the NAND subsystem using a better controller/chip
> split, so there's only one reboot handler per NAND controller. Boris has
> been looking at that.

Yes, but I haven't considered reworking the locking or the reboot notifier
stuff :-). BTW, if you want to have a look at this work, it is in my
nand/layering-rework branch (starting at commit
9da4cc22857c103010141bca4d403915ee103dbb).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
