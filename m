Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPi8U-00066p-JS
 for linux-mtd@lists.infradead.org; Wed, 20 Jul 2016 03:25:27 +0000
Received: by mail-pa0-x22b.google.com with SMTP id pp5so13358070pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 20:25:05 -0700 (PDT)
Date: Tue, 19 Jul 2016 20:25:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Stefan Roese <sr@denx.de>, kbuild test robot <fengguang.wu@intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH] mtd: spi-nor: don't build Cadence QuadSPI on non-ARM
Message-ID: <20160720032501.GA35298@google.com>
References: <201607190315.0nkQuD2W%fengguang.wu@intel.com>
 <20160718202026.GB137880@google.com> <578DC294.5090605@denx.de>
 <20160719200541.GA854@google.com>
 <3a769a42-f856-5b48-dd18-ef76a7bf4c91@denx.de>
 <20160720025027.GA131957@google.com>
 <eaf864ab-d154-994f-dc3d-9505b48705f3@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaf864ab-d154-994f-dc3d-9505b48705f3@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 20, 2016 at 04:58:08AM +0200, Marek Vasut wrote:
> On 07/20/2016 04:50 AM, Brian Norris wrote:
> > On Wed, Jul 20, 2016 at 03:50:27AM +0200, Marek Vasut wrote:
> >> On 07/19/2016 10:05 PM, Brian Norris wrote:
> >>> On Tue, Jul 19, 2016 at 08:03:00AM +0200, Stefan Roese wrote:
> >>>> On 18.07.2016 22:20, Brian Norris wrote:
> >>>>> Hmm, does x86 not define readsl()/writesl()? I can never tell what
> >>>>> accessors are supposed to be "standard" across architectures.
> >>>>>
> >>>>> Either we need to drop the COMPILE_TEST or maybe make it (!X86 &&
> >>>>> COMPILE_TEST).
> >>>>
> >>>> iowrite32_rep() etc should work for x86 as well.
> >>>
> >>> Looks like it might. I'm not sure the original submitter can retest
> >>> right now (travel), so I'd probably rather just take the easy fix for
> >>> now, and we can widen to COMPILE_TEST later if desired.
> >>
> >> Isn't there a generic readsl() and writesl() implementation in
> >> include/asm-generic/io.h ?
> > 
> > Yes, but somehow x86 has managed to avoid that. I guess it's optional
> > for arch/<foo>/include/asm/io.h to include <asm-generic/io.h>? At any
> > rate, I double-checked myself by adding '#error "blah"' to
> > include/asm-generic/io.h, and x86 still seemed to build fine (at least
> > for the modules I was checking, like cadence-quadspi.o).
> 
> Yep, I just checked the same and it's not included from
> arch/x86/include/asm/io.h for whatever reason. Maybe this needs to be
> fixed on x86 level?

Maybe. That's why I added the x86 maintainers. Maybe they'd respond
better^Wmore loudly if I just sent a patch to do that :)

But seriously, doing the above really breaks things, even if I stick the
include at the end of asm/io.h. There's plenty of stuff that the
asm-generic version includes based on #ifndef some_accessor, except x86
uses a static inline for their definition. So it seems it's not trivial
to get an architecture to fall back gracefully to asm-generic; you have
to put in some work. It also may not be all that desirable to have some
allegedly generic version generate something that may not be safe on a
given architecture (and I don't purport to understand the x86 memory
model).

Additionally, it looks like asm-generic/io.h is actually only included
in 14 of 33 arch'es, so it seems like that's really not a designated
goal. It does make it awfully difficult to figure out what I/O accessors
are *actually* portable though...

Brian
