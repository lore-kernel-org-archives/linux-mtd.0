Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNyWy-0001AO-Do
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 08:31:33 +0000
Date: Fri, 15 Jul 2016 10:30:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: Cached NAND reads and UBIFS
Message-ID: <20160715103057.691c320f@bbrezillon>
In-Reply-To: <57878E68.30901@nod.at>
References: <57863449.4070108@nod.at> <20160713165422.GA130613@google.com>
 <20160714103301.4b01b0ce@bbrezillon> <57878E68.30901@nod.at>
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

Hi Richard,

On Thu, 14 Jul 2016 15:06:48 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 14.07.2016 um 10:33 schrieb Boris Brezillon:
> >>> Now we're not sure what do do, should we implement bulk reading in the TNC
> >>> code or improve NAND read caching?    
> >>
> >> Seems like we should improve the caching, either in a layer above, or
> >> just in the NAND layer.  
> > 
> > I think we all agree on that one :).  
> 
> Today I found some time to implement a PoC of a single page cache directly
> in UBI.

Oh, that was fast. I'm looking forward to seeing this implementation.

> IMHO UBI is the right layer for that. NAND is too low and UBIFS too high
> level.
> With a few lines of case I was able to speedup UBIFS TNC lookups a lot,
> in fact it gave me the same speed up as caching in the NAND layer does.

As explained in a previous answer, assuming the user will always need
the content of a full page is not necessarily the good option, even if,
as seen with the UBIFS example, it's usually what we want.
In our use case, only UBIFS can know/guess how much data will be needed
in each page.

The good thing is that caching at the UBI level allows you to use
sub-page reads for EC/VID headers.

> 
> As next step I'll tidy the code, add a debugfs interface to expose cache hit/miss
> counters such that we can experiment with different workloads and users ontop
> of UBIFS. /me thinks of squashfs+ubiblock which is also rather common these days.

Yep, it might help, especially if the squashfs 'block size' is less
than the NAND page size.

> 
> Maybe caching more than one page helps too.

That would also help, though IMO it requires using the 'page cache'
mechanism so that the system can reclaim cached pages when it is under
memory pressure.

Anyway, thanks for investigating this option, let's see what Artem and
Brian think about this approach.

Regards,

Boris
