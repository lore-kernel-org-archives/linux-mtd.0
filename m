From: David Woodhouse <dwmw2@infradead.org>
To: Per Hedblom <per.hedblom@abem.se>
In-Reply-To: <20041111131932.D32EF3800F@smtp1-2-sn3.vrr.skanova.net>
References: <20041111131932.D32EF3800F@smtp1-2-sn3.vrr.skanova.net>
Content-Type: text/plain
Message-Id: <1100181523.8191.1410.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Nov 2004 13:58:43 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	'Mark Hamilton' <mhamilton@alliantnetworks.com>
Subject: RE: [JFFS2] GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-11 at 14:19 +0100, Per Hedblom wrote:
> On Thursday 11 November 2004 12:28 David Woodhouse Wrote
> >Yes, that is the expected behaviour and looks like the correct fix. I've
> >just committed the corresponding change to the eCos version of
> >jffs2_gc_fetch_page().
> 
> Will this code handle files larger than PAGE_SIZE?

Yes. The problem was that the core code expects you to return a _page_
from the file. That's a page in size, and aligned to a page in the file.
So if it passes you an offset of 0x1234, it doesn't actually want byte
0x1234 to be the first in the returned buffer -- it just wants the page
which contains by 0x1234. Which starts at 0x1000.

Your way does something similar -- adjusting the returned pointer so
that the part which the core code actually looks at is the same. But I
really don't like returning a pointer which is outside the real buffer.

> Some experience with jffs2 for eCos so far: 
> * it requires a lot of software maintenance to keep it updated and tested
> for the a specific usage in eCos.

Can you elaborate? I've seen very few patches submitted, and from that
I've inferred that we've been doing a good job of keeping the eCos port
working. 
 
> * it uses a lot of memory and memory management - a eCos system without
> memory management needs fixed memory pools to run stable for a long time. 
> We use a lot of small files and if someone is considering jffs2 for a new
> design I would recommend reserving a ram space for jffs2 that is in the
> range of the flash area in use.

Yeah. That's sort of inherent to the design, unfortunately. We're toying
with ways to improve it, but it's hard.

> * it doesn't do gc as a thread in eCos. This means that it almost always
> want to do gc at the time when you need to write data.

People have reported this a few times. Each time I replied that it was
easy for them to make it work if they care, and if they know how to do
this stuff in eCos. Nobody did, so I even threw in the skeleton
gcthread.c for eCos to give people a head-start.... and still nobody's
implemented it.

-- 
dwmw2
