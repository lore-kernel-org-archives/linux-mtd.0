Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvtTU-0000Yc-KP
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 20:55:37 +0000
Date: Mon, 9 Nov 2015 21:55:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Andrew E. Mileski" <andrewm@isoar.ca>, linux-mtd
 <linux-mtd@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>
Subject: Re: Hang on reboot in nand_get_device()
Message-ID: <20151109215508.7b14f5f3@bbrezillon>
In-Reply-To: <20151109194651.GI12143@google.com>
References: <55958F4C.1020002@isoar.ca> <20151106180052.GE12143@google.com>
 <20151106195903.0d55d819@bbrezillon>
 <20151109194651.GI12143@google.com>
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

On Mon, 9 Nov 2015 11:46:51 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Fri, Nov 06, 2015 at 07:59:03PM +0100, Boris Brezillon wrote:
> > On Fri, 6 Nov 2015 10:00:52 -0800
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > > On Thu, Jul 02, 2015 at 03:21:48PM -0400, Andrew E. Mileski wrote:
> > > > I'm experiencing a hang on reboot with a Freescale P1022 PowerPC system, with a
> > > > dual chip-select NAND part (specified in the device tree as two
> > > > separate devices), and kernel v4.0.6.
> > > 
> > > Which driver?
> > > 
> > > > It appears to be a hang in mtd/nand/nand_base.c:nand_get_device() waiting on
> > > > chip->controller->active.
> > > > 
> > > > Shouldn't nand_shutdown(), or perhaps a special case in nand_get_device() for
> > > > FL_SHUTDOWN, set chip->controller->active = NULL before returning?
> > > 
> > > I don't think that's exactly the right solution, but you're in the right
> > > ballpark I expect.
> > 
> > Hm, actually I find the idea of releasing the NAND controller when the
> > flash is set in FL_SHUTDOWN state not that bad. Is there any reason
> > we would want the NAND chip to stay active when we're shutting the
> > system down.
> 
> No, and that's the point of "getting" the device, without actually
> releasing it. (Andrew's suggestion is essentially a
> nand_release_device().) We don't want any other process picking up any
> I/O at this point. I suppose there really is no way to begin any new
> I/O, but it does seem possible for the last operation to still be in
> flight, at least according to Scott's reports.

Hm, if we really want all I/O going through the NAND controller to be
stopped, then that should definitely be handled at the controller level
(as you suggested in your previous email).
My understanding was that the shutdown and suspended states were only
attached to the device itself, not the controller behind this device
(even if at some point all the devices will be marked as suspended or
shut down and the controller will remain inactive).

> 
> > I understand that this is needed for the suspended case because we want
> > the system to restore the correct state when resuming (ie marking the
> > right device as active), but shutdown should be simpler.
> 
> Is the SUSPENDED code really that complex? It's just allowing all
> FL_PM_SUSPENDED requests after the first one. It doesn't even do much
> fancy for the release path (and in fact, it seems slightly buggy, now
> that I'm looking at it; because we violated mutual exclusion, there can
> now be many chips that are releasing the same chip. So nand_get_device()
> won't really work right again until all chips have called nand_resume().)

No it's not that complex, but I find it weird to keep the lock on the
controller even if the NAND chip attached to this controller has been
suspended. And the problem you pointed out just shows how tricky it
can be when you play this kind of game (keep the lock on the controller
assigned to one NAND chip but consider other nand_get_device() calls as
successful even if the controller is already taken by another chip in
some specific cases).

BTW, I guess you already have the fix, but in case you haven't done it
yet, this should do the trick:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f1ddacf..9f0ea48 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -136,9 +136,11 @@ static void nand_release_device(struct mtd_info *mtd)
 
        /* Release the controller and the chip */
        spin_lock(&chip->controller->lock);
-       chip->controller->active = NULL;
        chip->state = FL_READY;
-       wake_up(&chip->controller->wq);
+       if (chip->controller->active == chip) {
+               chip->controller->active = NULL;
+               wake_up(&chip->controller->wq);
+       }
        spin_unlock(&chip->controller->lock);
 }
 


> 
> > > I actually don't see why we can't just use
> > > nand_get_device(FL_PM_SUSPENDED) for the shutdown/reboot case, like
> > > this:
> > 
> > That should work, but shouldn't we keep the appropriate state (FL_SHUTDOWN)
> > and patch the nand_get_device() code instead?
> 
> The states mean only as much as we ascribe to them. If we really need to
> treat shutdown differently than suspend, then I suppose yes. But
> otherwise, I see no need.
> 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index ceb68ca..884caf0 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -839,9 +839,9 @@ retry:
> >                 spin_unlock(lock);
> >                 return 0;
> >         }
> > -       if (new_state == FL_PM_SUSPENDED) {
> > -               if (chip->controller->active->state == FL_PM_SUSPENDED) {
> > -                       chip->state = FL_PM_SUSPENDED;
> > +       if (new_state == FL_PM_SUSPENDED || new_state == FL_SHUTDOWN) {
> > +               if (chip->controller->active->state == new_state) {
> > +                       chip->state = new_state;
> >                         spin_unlock(lock);
> >                         return 0;
> >                 }
> 
> I suppose that works, but I don't see it buying us much.
> 
> (Although, I suppose it makes it a little more obvious if we somehow
> mixed the SUSPENDED state with the SHUTDOWN state.)

Well, it's more about using the proper state in case we have to propagate it to
NAND controller drivers someday.

> 
> > or
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index ceb68ca..812b8b1 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -830,6 +830,20 @@ nand_get_device(struct mtd_info *mtd, int new_state)
> >  retry:
> >         spin_lock(lock);
> >  
> > +       /* putting the NAND chip in shutdown state should always succeed. */
> > +       if (new_state == FL_SHUTDOWN) {
> > +               /*
> > +                * release the controller if the chip put in shutdown state
> > +                * is the current active device.
> > +                */
> > +               if (chip->controller->active == chip)
> > +                       chip->controller->active = NULL;
> > +
> > +               chip->state = new_state;
> > +               spin_unlock(lock);
> > +               return 0;
> > +       }
> > +
> >         /* Hardware controller shared among independent devices */
> >         if (!chip->controller->active)
> >                 chip->controller->active = chip;
> > 
> 
> This looks a lot more subtle and potentially wrong. What exactly is the
> rationale here? It appears you're kind of unlocking the controller (any
> other flash on the same controller can still go ahead) but at the same
> time forcing no further users of this particular flash. In the end, I
> guess it accomplishes mostly the same thing as the SUSPENDED case,
> except that it's written differently, and has slightly different
> behaviors in corner cases (e.g., what if another nand_chip gets a call
> to nand_get_device(FL_WRITING)? with this patch, they can still write to
> the flash; with your first patch or with mine, they are locked out).

Yes, that's pretty much was I said above: I was seeing FL_XXX states as attached
to the NAND chips not to the controller used to access those chips.
Not sure this is possible, but what if we had a way to use runtime PM at the
chip level, not the controller level. That would mean preventing every other
NAND chip under the same controller to work until this chip enter the
resumed/ready state.

> 
> IOW, I'd rather share the implementation if they're really that similar,
> unless you really have a good reason for this one.



> 
> > > It's also possible that this could be better solved in a proper
> > > refactor/rewrite of the NAND subsystem using a better controller/chip
> > > split, so there's only one reboot handler per NAND controller. Boris has
> > > been looking at that.
> > 
> > Yes, but I haven't considered reworking the locking or the reboot notifier
> > stuff :-).
> 
> Right, but once they're split, it might be easier to have more generic
> per-controller features (rather than per-flash). But maybe not. I'm
> definitely not suggesting we do that now; let's just fix the problem
> with the code as it stands now.

Yep.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
