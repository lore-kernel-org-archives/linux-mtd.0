Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4c89-0007cE-IM
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 13:05:11 +0000
Date: Tue, 18 Dec 2007 12:42:33 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC][patch] NAND partial page read functionality
Message-ID: <20071218114232.GA1741@lazybastard.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1197720795.25999.57.camel@sauron>
	<Pine.LNX.4.64.0712171454550.29723@pentafluge.infradead.org>
	<1197967731.18962.25.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1197967731.18962.25.camel@sauron>
Cc: joern@logfs.org, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 December 2007 10:48:51 +0200, Artem Bityutskiy wrote:
> 
> Well, this depends. If an MTD user wants to write 4KiB, and issues 4KiB
> write request, then it is of course faster to write 2x2048, then 8x512,
> and it is even faster to do some kind of multi-page write (some old
> flashes had this AFAIK).

Not necessarily.  The alauda chip has a "page program" and a "block
program" command.  With a naive implementation the block program is
faster.  But when doing asynchronous transfers on the usb bus, page
program becomes just as fast.  In this particular case, block program
can only reduce the number of synchronous bus latencies for a
non-optimized implementation.

> But surely if the driver is not dumb, it will do 2x2048?
> 
> I've glanced at jffs2_flash_writev(), and it seems it is also not dumb -
> if in needs to write a 4KiB buffer, it first finishes current
> write-buffer, flushes it, then it calles mtd->write() for multiple min.
> I/O units (note, it does not use wbuf now), and only the rest, which
> does not comprise whole min. I/O unit, goes to the wbuf.
> 
> Thus, I'd conclude, JFFS2 should benefit.

If writesize is 256 and pagesize is 2048, every wbuf flush will write
exactly 256.  Any remaining clean multiple of 256 is written directly,
but this will rarely be an aligned clean multiple of 2048.  Every wbuf
flush ensures that either the previous or the following writes is not.

As long as JFFS2 and MTD are synchronous, this could be a significant
performance hit.

Jörn

-- 
Mac is for working,
Linux is for Networking,
Windows is for Solitaire!
-- stolen from dc
