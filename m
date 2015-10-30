Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs4wR-0007TH-Da
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 08:21:43 +0000
Date: Fri, 30 Oct 2015 09:21:20 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger  <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= \"(beanhuo)\""
 <beanhuo@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20151030092120.2d7df596@bbrezillon>
In-Reply-To: <20151030091521.439f436b@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
 <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon>
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

On Fri, 30 Oct 2015 09:15:21 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> 
> 2/ skipping pages on demand is not as easy as only writing on lower
> pages of each pair. As you might know, when skipping pages to secure
> your data, you'll also have to skip some lower pages so that you end up
> with an offset to a memory region that can be contiguously written to,
> and when you skip those lower pages, you have to write on it, because
> NAND chips require that the lower page of each pair be programmed
> before the higher one (ignoring this will just render some pages
> unreliable).
> 
> 3/ UBIFS is really picky when it comes to corrupted nodes detection,
> and there are a few cases where it refuses to mount the FS when a
> corrupted node is detected. One of this case is when the corrupted
> page (filled with one or several nodes) is filled with non-ff data,

I meant, "Once of this case is when the corrupted page is followed by
a page filled with non-ff data" 

> which is likely to happen with MLC NANDs (paired pages are not
> contiguous). We discussed about relaxing this policy a few weeks ago,
> but what should we do when such a corruption is detected? Drop all
> nodes with a sequence higher or equal to the last valid node on the
> LEB?
> Note that with the consolidation-GC approach we don't have this
> problem because the consolidate LEB is added to journal after it has
> been completely filled with data, and marked as full (->free = 0) so
> that nobody can reclaim it to write data on it.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
