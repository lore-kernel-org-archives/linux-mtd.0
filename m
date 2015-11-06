Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZulK7-00032Y-Vj
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 18:01:16 +0000
Received: by padhx2 with SMTP id hx2so121305686pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2015 10:00:55 -0800 (PST)
Date: Fri, 6 Nov 2015 10:00:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Andrew E. Mileski" <andrewm@isoar.ca>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Scott Branden <sbranden@broadcom.com>
Subject: Re: Hang on reboot in nand_get_device()
Message-ID: <20151106180052.GE12143@google.com>
References: <55958F4C.1020002@isoar.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55958F4C.1020002@isoar.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ others

Hi Andrew,

Sorry for the delay here. I overlooked this.

On Thu, Jul 02, 2015 at 03:21:48PM -0400, Andrew E. Mileski wrote:
> I'm experiencing a hang on reboot with a Freescale P1022 PowerPC system, with a
> dual chip-select NAND part (specified in the device tree as two
> separate devices), and kernel v4.0.6.

Which driver?

> It appears to be a hang in mtd/nand/nand_base.c:nand_get_device() waiting on
> chip->controller->active.
> 
> Shouldn't nand_shutdown(), or perhaps a special case in nand_get_device() for
> FL_SHUTDOWN, set chip->controller->active = NULL before returning?

I don't think that's exactly the right solution, but you're in the right
ballpark I expect.

> This seems to fix the problem for me, but I don't know all the code well enough
> to know whether doing so is appropriate, or sufficient.

I'm going to guess you're seeing two reboot handlers trying to 'get' the
same controller structure. We could probably confirm that if we see your
driver.

But I see this could be a problem with a wide class of drivers.
Basically, any NAND driver that has multiple NAND chips attached will
see multiple reboot handlers that point at the same controller lock.
This will obviously deadlock, since only one of the chips will make it
through the nand_shutdown() function successfully.

And now that I begin describing the problem and grepping through the
source logs... I see that this problem was already resolved back in
2009, except for the FL_PM_SUSPENDED mode:

commit 6b0d9a84124937f048bcb8b21313152b23063978
Author: Li Yang <leoli@freescale.com>
Date:   Tue Nov 17 14:45:49 2009 -0800

    mtd: nand: fix multi-chip suspend problem

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=6b0d9a84124937f048bcb8b21313152b23063978
    
I actually don't see why we can't just use
nand_get_device(FL_PM_SUSPENDED) for the shutdown/reboot case, like
this:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index cc74142938b0..ece544efccc3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3110,7 +3110,7 @@ static void nand_resume(struct mtd_info *mtd)
  */
 static void nand_shutdown(struct mtd_info *mtd)
 {
-	nand_get_device(mtd, FL_SHUTDOWN);
+	nand_get_device(mtd, FL_PM_SUSPENDED);
 }
 
 /* Set default functions */


It's also possible that this could be better solved in a proper
refactor/rewrite of the NAND subsystem using a better controller/chip
split, so there's only one reboot handler per NAND controller. Boris has
been looking at that.

Anyway, if the above looks OK, I can send a proper patch and get your
'Tested-by's.

Brian
