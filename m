Received: from n1c.bullet.mail.ac4.yahoo.com ([76.13.13.78])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgbGJ-0003aC-W5
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 10:31:52 +0000
Message-ID: <350720.60481.qm@web180309.mail.gq1.yahoo.com>
Date: Wed, 4 Aug 2010 03:31:45 -0700 (PDT)
From: David Brownell <david-b@pacbell.net>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1280916725.19499.12.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	'Nicolas Pitre' <nico@fluxnic.net>,
	'Kevin Hilman' <khilman@deeprootsystems.com>, linux-kernel@vger.kernel.org,
	'David Howells' <dhowells@redhat.com>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



--- On Wed, 8/4/10, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2010-07-07 at 04:08 -0700,
> David Brownell wrote:
> > 
> > I think the short answer is that the callout is
> > what provides the board drivers enough information
> > to make the correct calls. 

EMPHASIS ON "CORRECT" ...

> I don't see how.
> 
> The only information it passes to the callout is the
> information it was
> already *given* in the partition structure.

There can be multiple such structures, each
of which describes different data to be extracted
from different persistent media contexts.

Examples:  one context holds one MAC address (and
another, a different one) ... another might embed
calibration data; another, serial numbers; etc.

Pass the wrong context around, you've trashed all
the data instead of getting it right.


> I'm more inclined to believe Sudhakar's claim that you'll
> get an
> 'initialization sequence problem', although I'm not sure I
> believe it
> can't be solved in a better way than this.

"Initialization sequence" is a grab-bag category
that covers most init issues.

Point is to ensure that enough of the right context
information is available to initialize correctly.
So the right data is extracted and passed on.


> 
> I'm also unhappy that it only works on partitioned devices
> -- that seems wrong.

Very different issue.  Seems easily fixable
if needed.  Agreed that e.g. EEPROMS won't
often be partitioned (unlike flash).
