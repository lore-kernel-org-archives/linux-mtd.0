Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zKyr-0006cC-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 17:13:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m38zk07wtz.fsf@DLT.linuxnetworx.com> 
References: <m38zk07wtz.fsf@DLT.linuxnetworx.com>  <27217.989849725@redhat.com> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: linux-mtd@lists.infradead.org, ajlennon@arcom.co.uk
Subject: Re: CPU caching of flash regions. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 14 May 2001 17:17:45 +0100
Message-ID: <4987.989857065@redhat.com>
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

ebiederman@lnxi.com said:
>  What kind of scenario are we talking about?  Do the pages get read
> multiple times?  Of is it just that that copy_from needs to be more
> highly optimized like memcpy?  I suspect that before the whole
> interface changes you should experiment and see what really needs to
> be done.

This is during the initial mount of JFFS2. Nothing should be read twice - 
but we should at least be able to fill cache lines and do burst reads from 
the flash chips, shouldn't we?

> As for interface changes I would suggest an additional opertation
> memory_barrier that forces the flush if needed.  

The original plan involved no interface changes - I was suggesting that the 
map driver would DTRT with the caches internally.

> But I really think you should be able to get it working faster simply
> by optimizing the copy_from routine.

Most of the copy_from routines use memcpy_fromio(), which on i386 is just 
a memcpy(). It ought to be fairly close to optimal.

Actually, the board used for the offending profile is a board with paged 
access to the flash, so it's slightly slower than some others - but the 
overhead shouldn't be too high. And the cache benefit would be more limited.

--
dwmw2
