Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4cvz-0004no-Gi
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 13:56:41 +0000
Date: Tue, 18 Dec 2007 14:51:03 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC][patch] NAND partial page read functionality
Message-ID: <20071218135103.GC1741@lazybastard.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1197720795.25999.57.camel@sauron>
	<Pine.LNX.4.64.0712171454550.29723@pentafluge.infradead.org>
	<1197967731.18962.25.camel@sauron>
	<20071218114232.GA1741@lazybastard.org>
	<1197982675.18962.34.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1197982675.18962.34.camel@sauron>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 December 2007 14:57:55 +0200, Artem Bityutskiy wrote:
> On Tue, 2007-12-18 at 12:42 +0100, Jörn Engel wrote:
> > On Tue, 18 December 2007 10:48:51 +0200, Artem Bityutskiy wrote:
> > > 
> > > Well, this depends. If an MTD user wants to write 4KiB, and issues 4KiB
> > > write request, then it is of course faster to write 2x2048, then 8x512,
> > > and it is even faster to do some kind of multi-page write (some old
> > > flashes had this AFAIK).
> > 
> > Not necessarily.  The alauda chip has a "page program" and a "block
> > program" command.  With a naive implementation the block program is
> > faster.  But when doing asynchronous transfers on the usb bus, page
> > program becomes just as fast.  In this particular case, block program
> > can only reduce the number of synchronous bus latencies for a
> > non-optimized implementation.
> 
> Well, in the context of discussion this example is not really relevant,
> since aluda have its own write_page, and we are talking about the
> nand_base.c's implementation.

Your claim above seemed to imply that larger transfers always improve
speed.  That simply isn't true.  If I misinterpreted your claim then
sorry about the noise.

Jörn

-- 
Chance favors only the prepared mind.
-- Louis Pasteur
