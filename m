Received: from saturn.cs.uml.edu ([129.63.8.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157YgJ-0005tB-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 09:28:47 +0100
From: "Albert D. Cahalan" <acahalan@cs.uml.edu>
Message-Id: <200106060832.f568WR3253749@saturn.cs.uml.edu>
Subject: Re: Missing cache flush.
To: davem@redhat.com (David S. Miller)
Date: Wed, 6 Jun 2001 04:32:27 -0400 (EDT)
Cc: dwmw2@infradead.org (David Woodhouse), cw@f00f.org (Chris Wedgwood),
       jgarzik@mandrakesoft.com (Jeff Garzik), bjornw@axis.com,
       linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <15132.54565.311995.865807@pizda.ninka.net> from "David S. Miller" at Jun 05, 2001 05:48:37 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David S. Miller writes:
> David Woodhouse writes:

>>> Call it flush_ecache_full() or something.
>>
>> Strange name. Why? How about __flush_cache_range()?
>
> How about flush_cache_range_force() instead?
>
> I want something in the name that tells the reader "this flushes
> the caches, even though under every other ordinary circumstance
> you would not need to".

"flush" means what to you?

write-back
write-back-and-invalidate
discard-and-invalidate

All 3 behaviors are useful to me, and a few more. I've been
using chunks of PowerPC assembly. Using PowerPC mnemonics...

dcba -- allocate a cache block with undefined content
dcbf -- write to RAM, then invalidate ("data cache block flush")
dcbi -- invalidate, discarding any data
dcbst -- initiate write if dirty
dcbt -- prefetch, hinting about future load instructions
dcbtst -- prefetch, hinting about future store instructions
dcbz -- allocate and zero a cache block (cacheable mem only!)

So dcbf_range() and dcbi_range() sound good to me. :-)
