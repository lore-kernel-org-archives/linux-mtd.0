Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zKa3-0006aH-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 16:48:20 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, ajlennon@arcom.co.uk
Subject: Re: CPU caching of flash regions.
References: <27217.989849725@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 14 May 2001 09:51:36 -0600
In-Reply-To: David Woodhouse's message of "Mon, 14 May 2001 15:15:25 +0100"
Message-ID: <m38zk07wtz.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> I've just seen profiling of a system mounting JFFS2 filesystem which shows 
> that the majority of the time is spend in the map driver's copy_from 
> function.
> 
> The copy_from() functions are currently using a completely uncached mapping 
> of the flash chip, but in fact for reading the chip that's not strictly 
> necessary. This is especially true during the initial scan. 
> 
> I think we ought to allow map drivers to do intelligent caching of bus 
> accesses. Suggested semantics:
> 
>  1. Only the copy_from() and copy_to() functions can use a cacheable mapping.
> 
>  2. Any access to the chip through one of the other ({read,write}{8,16,32}) 
> 	functions causes the cache to be flushed for the entire mapping.
> 
> If a cache flush is expensive, a mapping driver may optimise the flushes and
> perform a cache flush only if the cache is expected to be non-empty.
> 
> This approach is fairly simple, and allows mapping drivers to do something 
> closely approximating the "right thing" without adding complexity to the 
> chip driver code. An alternative, which I'm dubious about, is to add 
> explicit cache management functionality to the methods exported by the 
> mapping drivers, and to have the chip driver explicitly turn the cache 
> on/off and flush parts of it when writing/erasing.
> 
> Comments?

What kind of scenario are we talking about?  Do the pages get read
multiple times?  Of is it just that that copy_from needs to be more
highly optimized like memcpy?  I suspect that before the whole interface
changes you should experiment and see what really needs to be done.

As for interface changes I would suggest an additional opertation
memory_barrier that forces the flush if needed.  

But I really think you should be able to get it working faster simply
by optimizing the copy_from routine.

Eric
