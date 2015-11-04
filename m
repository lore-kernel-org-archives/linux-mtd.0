Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zttd6-0004or-Ka
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 08:41:17 +0000
Date: Wed, 4 Nov 2015 09:40:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "Bean Huo =?UTF-8?B?6ZyN5paM5paM?=
 \"(beanhuo)\"" <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: master node can not be recovered
Message-ID: <20151104094049.123e87b8@bbrezillon>
In-Reply-To: <1446625250.20949.26.camel@gmail.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
 <5637934D.5000503@nod.at> <1446541937.6126.125.camel@gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF4FE9E@NTXXIAMBX02.xacn.micron.com>
 <5639BBDE.5000604@nod.at> <1446625250.20949.26.camel@gmail.com>
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

Hi Artem,

On Wed, 04 Nov 2015 10:20:50 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Wed, 2015-11-04 at 09:03 +0100, Richard Weinberger wrote:
> > But if two or more pages are corrupted UBIFS will give up as this
> > most not happen
> > from UBIFS's point of view.
> 
> Right, and I hear that a lot of bug reports and frustration comes from
> this. This worked with SLCs we were using when implementing UBIFS
> (particularly, Samsung OneNAND was used, it was very high-quality
> NAND). Nowadays, this needs to be changed.
> 
> UBIFS logic is this. If there is a corruption, then it must be in the
> last used NAND page. Pages after this NAND page must contain empty
> space.
> 
> A small complication, which is not important now, is that UBIFS may
> operate with multiple NAND pages, this depends on what the driver tells
> is the min. IO size.
> 
> No the logic behind this was that we always write data from the
> beginning of the LEB, and continue to its end. In case of a power cut,
> we can only get corruption in the last NAND page (or more strictly,
> min. I/O unit) where we were writing to. The next NAND page and all the
> NAND pages after it should be empty. The previous NAND page and all the
> NAND pages before it should contain valid data (CRC OK).
> 
> Pretty simple. Worked well.
> 
> So what has to be changed in this logic? Obviously, the definition of
> empty space should be changed, it seems, because obviously not every
> driver wants/can ECC-protect the empty space.

There's a series trying to address this problem by fixing bitflips in
erased pages, and hopefully all NAND controller drivers will be fixed
at some point (either by using the generic helper or by implementing a
similar logic to detect bitflips in erased pages).

> 
> What else?

Well I don't know if this is the subject here, but for MLC NANDs,
because of paired pages, the corruption can occur between two pages
that have already been correctly written.
The question is, what should we do in this case? Should we drop all the
pages following the corrupted page in the LEB? Should we only drop the
faulty page and parse the nodes in the valid pages we can find after
this corruption (I don't know if it can be the case, but if some nodes
depend on other nodes, doing that may not work)? Any other option?

Best Regards,

Boris

[1]http://thread.gmane.org/gmane.linux.drivers.mtd/61358

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
