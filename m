Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h5rf-0005o6-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 11:03:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1029796472.22781.136.camel@thomas.tec.linutronix.de> 
References: <1029796472.22781.136.camel@thomas.tec.linutronix.de>  <1029623727.2142.495.camel@thomas.tec.linutronix.de> <1029793649.22781.129.camel@thomas.tec.linutronix.de> 
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: No free space left for GC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Aug 2002 11:03:53 +0100
Message-ID: <30887.1029837833@redhat.com>
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

tglx@linutronix.de said:
>  The new decision function for gc and reserve_space takes only those
> blocks into account, which are on the dirty and very dirty list. The
> dirty space in the clean_list is ignored. This is neccecary to avoid
> endless GC loops. 

> Any suggestions ?

<IRC conversation repeated, for the benefit of the peanut gallery>

Nice work, thanks. If this fixes the problem, as I believe it does, please
don't calculate the dirty size in thread_should_wake() -- use c->dirty_size 
and just don't count the wasted space in the end of blocks on the 
clean_list in that; add something like 'wasted_size' to keep track of that
instead.

And read README.Locking again. It's rare that I actually write sensible 
documentation -- make the most of it :)

--
dwmw2
