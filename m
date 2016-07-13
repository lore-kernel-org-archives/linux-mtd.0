Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNNQs-00052S-Mr
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 16:54:47 +0000
Received: by mail-pf0-x22f.google.com with SMTP id h14so20294409pfe.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 09:54:26 -0700 (PDT)
Date: Wed, 13 Jul 2016 09:54:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Cached NAND reads and UBIFS
Message-ID: <20160713165422.GA130613@google.com>
References: <57863449.4070108@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57863449.4070108@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 13, 2016 at 02:30:01PM +0200, Richard Weinberger wrote:
> The TNC seems to assume that it can do a lot of short reads since the NAND
> read cache will help.

For my info: by "short reads" are you talking page-size/aligned?
Subpage-sized/aligned? Or none of the above?

> But as soon subpage reads are possible this assumption is no longer true.

This sounds similar to the problem we were just discussing, about a
bug/oversight/suboptimality in nand_do_read_ops()'s use of an extra
buffer + memcpy(). I guess the difference here is that a sub-page read
can't fill the cache as-is (we have no way to mark the cache as
partially valid), so we just skip it. To "fixup" the cache
for subpages, I guess we'd have to split it into subpages...

> Now we're not sure what do do, should we implement bulk reading in the TNC
> code or improve NAND read caching?

Seems like we should improve the caching, either in a layer above, or
just in the NAND layer.

But, we haven't really figured out how to advertise the minimum
(optimal) read size to the MTD user, right? We have at best

  writesize >> subpage_sft

but that's really the minimum write size, not read size, right? So even
if we're trying to shore up the read cacheability, we should better
define the constraints first, so that we know what we can guarantee an
MTD user, and what we can't. e.g., we will cache on size/alignment FOO,
and anything not aligned to that is not guaranteed.

On a potentially conflicting note, I think nand_do_read_ops() is too
complicated. I think Boris expressed a similar sentiment. So if we can
find a good way to factor the caching code to be less entangled with the
mechanics of reading, that'd be a win for me.

Brian
