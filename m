Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq4HF-0008Gp-3z
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 19:47:09 +0000
Date: Tue, 12 Apr 2016 21:46:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux
 LED Subsystem <linux-leds@vger.kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Message-ID: <20160412214647.1249e587@bbrezillon>
In-Reply-To: <CAAEAJfA38ykPJb4yvs75ZqkQNkDJm4OrvW=f=wq2KZ7P9nh-PQ@mail.gmail.com>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160412202732.30d291c2@bbrezillon>
 <CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
 <CAAEAJfA38ykPJb4yvs75ZqkQNkDJm4OrvW=f=wq2KZ7P9nh-PQ@mail.gmail.com>
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

On Tue, 12 Apr 2016 16:35:43 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 12 April 2016 at 15:40, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> > On 12 April 2016 at 15:27, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote:
> >> Hi Ezequiel,
> >>
> >> On Tue, 12 Apr 2016 13:26:35 -0300
> >> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >>
> >>> This commit introduces a MTD trigger for flash (NAND/NOR) device
> >>> activity. The implementation is copied from IDE disk.
> >>>
> >>> This deprecates the "nand-disk" LED trigger, but for backwards
> >>> compatibility, we still keep the "nand-disk" trigger around.
> >>>
> >>> The motivation for deprecating the "nand-disk" LED trigger is that
> >>> it only works for NAND drivers, whereas the "mtd" LED trigger
> >>> is more generic (in fact, "nand-disk" currently only works for
> >>> certain NAND drivers).
> >>>
> >>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >>> ---
> >>>  drivers/leds/trigger/Kconfig       |  8 +++++++
> >>>  drivers/leds/trigger/Makefile      |  1 +
> >>>  drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
> >>>  drivers/mtd/mtdcore.c              |  7 ++++++
> >>>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
> >>>  include/linux/leds.h               |  6 +++++
> >>
> >> I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, and
> >> another one make use of ledtrig_mtd_activity() and removing
> >> nand-trigger code.
> >>
> >
> > Sure, that sounds good.
> >
> 
> One comment about the above: notice that if we split in two patches
> as  you suggest, we would create a dependency between patches.
> 
> I don't have any problem doing this, but it sounds like it might make
> maintainers
> life harder.

I guess both patches will go through the same tree even if they are
split (either leds or mtd), so that's not really a problem.

Note that you have the same dependency problem with the single patch
approach (if another leds or mtd patch is touching one of the file
modified here, we may have a merge conflict).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
