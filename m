Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqg85-0001hA-NZ
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 14:53:35 +0000
Date: Fri, 17 Aug 2018 16:53:22 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Spieth <mspieth@digivation.com.au>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [RFC PATCH] UBI fixable bit-flip issue
Message-ID: <20180817165322.61958720@bbrezillon>
In-Reply-To: <227ad167-4e57-638d-a4cb-1e82613de2bc@digivation.com.au>
References: <1bcbe82a-85e5-52f8-dc54-9d22e5b390fa@digivation.com.au>
 <20180817102559.7ab14fd9@bbrezillon>
 <227ad167-4e57-638d-a4cb-1e82613de2bc@digivation.com.au>
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

On Sat, 18 Aug 2018 00:33:25 +1000
Mark Spieth <mspieth@digivation.com.au> wrote:

> >> I hope this description is clear enough.  
> > Well, I think selecting the bitflip threshold properly is really
> > important, simply because some NANDs (including SLC NANDs) are showing
> > bitflips even on blocks that have a low EC. Check the NAND ECC
> > requirements, and if it's something like 8bit/512bytes, I guess that's
> > more or less expected (it all depends on how many bitflips you have in
> > the faulty block). It's less likely on NANDs requiring 1bit/512bytes
> > ECC, and if that happens on such NANDs, you may have a problem in the
> > controller driver.  
> 4 bits ECC per 512 bytes, from memory 28 bytes in OOB, using software 
> ECC in the MTD driver.
> As I said, I believe the better threshold is hiding the root cause. It 
> is only a band-aid.

What you describe will anyway happen sooner or later: if you're using
almost all LEBs, and the remaining free ones are all impacted by the
correctable bit-flip issue you'll have to use them anyway. So, yes,
this is a band-aid, just like your solution is just improving things
but not really solving the issue. This being said, if the blocks
really show too many bitflips, they should be marked bad at some point,
because during the scrubbing process we do write a pattern and check
that we can read it back. I'll have to double check, but I think we're
also checking for EUCLEAN and mark the block bad when that happens.

Another option would be to order free blocks, not only by
descending erase counters, but also by number of times the upper layer
reported EUCLEAN on them. That would imply adding a new field to the EC
header, but I think both Richard and I are open to discussing that.

Regards,

Boris
