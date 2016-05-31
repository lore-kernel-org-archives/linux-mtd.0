Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7o8g-0005I0-0W
 for linux-mtd@lists.infradead.org; Tue, 31 May 2016 18:11:39 +0000
Received: by mail-pa0-x22b.google.com with SMTP id um11so21398360pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 31 May 2016 11:11:17 -0700 (PDT)
Date: Tue, 31 May 2016 11:11:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Matthias Auchmann <m.auchmann@artech.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: mtd locking
Message-ID: <20160531181113.GA27381@google.com>
References: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB470@SRV01.ARTech.local>
 <CAFLxGvz+9JqcLZwuUqOd1UsCNbbjD52ecd5Faj8PC12YhTuYiA@mail.gmail.com>
 <566B344A0B1AB14EB2486D887B6FF9E0331F3DB473@SRV01.ARTech.local>
 <574B15FE.8030206@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <574B15FE.8030206@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, May 29, 2016 at 06:17:02PM +0200, Richard Weinberger wrote:
> Am 29.05.2016 um 17:53 schrieb Matthias Auchmann:
> > By intended you mean it's wrong and we know, but it's still wrong, right?
> 
> I'd say lazy. Sometimes counters don't need to be exact.
> Having exact counting is expensive. See network stack.
> 
> I'm not sure what the exact reasons in the ECC error counting
> case are.
> Maybe Brian or Boris can tell more.

Boris correctly explained things. And several people have noticed, but
few solutions have been attempted.

The only thing I'd add: I suspect the MTD char device APIs haven't
gotten as much love because they aren't as useful. Most users have found
better utility by working through JFFS2, UBI/UBIFS, etc., since there's
just so much that a raw MTD doesn't really solve for you, especially
when you start talking about the type of device where you care about
bitflips (i.e., NAND).

You're more likely to get away fine with raw MTD on NOR flash, but then
you don't care about ECCGETSTATS there anyway.

I think Boris has found use cases where he just wants to talk raw
NAND/MTD, so maybe some of this dynamic is changing.

(And BTW, I realized this is a potential impediment to moving the MTD
tests entirely to user space. They can still work fine in
single-threaded mode, but once you start running multiple instances,
you'll start getting inaccurate stats reports, which will make some
tests think they've failed.)

Brian
