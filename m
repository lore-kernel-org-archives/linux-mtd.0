Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGYVM-0001gT-D4
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 22:23:45 +0000
Received: by mail-pf0-x244.google.com with SMTP id w69so9299129pfk.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 15:23:23 -0700 (PDT)
Date: Thu, 1 Jun 2017 15:23:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170601222320.GE102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <20170601184340.GA102137@google.com>
 <bba73e6d5f4b41a88423287300d892e5@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bba73e6d5f4b41a88423287300d892e5@svr-chch-ex1.atlnz.lc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 01, 2017 at 09:30:07PM +0000, Chris Packham wrote:
> On 02/06/17 06:43, Brian Norris wrote:
> > On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote:
> >> Can we fix allocate_partition() to properly handle the
> >> master->erasesize == 0 case instead of doing that?
> >
> > Is everything actually ready for the eraseblock size to be 0?
> 
> That was my initial motivation for faking it.

Understood. I think it's probably better to avoid hacking drivers like
you were about to, but I was also curious if anyone had thought through
the implications of *not* forcing a non-zero size.

> > That would
> > seem surprising to many applications, I would think. Can you, for
> > instance, even use UBI on such a device?
> 
> I've tried ext2 and I believe Andrew has tried minix fs. We're talking 
> SRAM so UBI/UBIFS doesn't really provide much benefit for this use-case.

Right. But that's not necessarily true for all NO_ERASE devices, so we'd
probably want to think about that before allowing it.

Brian
