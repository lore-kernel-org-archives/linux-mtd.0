Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 176yem-00067F-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 May 2002 20:05:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <13211.1020346858@redhat.com> 
References: <13211.1020346858@redhat.com>  <20020502155602.A8801@kosh.hut.fi> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 12 May 2002 20:04:43 +0100
Message-ID: <912.1021230283@redhat.com>
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

dwmw2@infradead.org said:
> 2. We have a 'dirty_list' containing blocks which have _any_ dirty space, 
>    and we pick blocks from the to garbage-collect from. If there's only a 
>    few bytes of dirty space, we GC the whole block just to gain a few 
>    bytes. We should keep a 'very_dirty_list' of blocks with _significant_ 
>    amounts of dirty space and favour that even more when picking blocks
>    to GC, especially when doing just-in-time GC rather than from the 
>    background thread. 

I've done this, and every block with more than 50% dirty space now goes on
the 'very_dirty_list'. With the file system snapshot I'd taken from my iPAQ
to investigate what turned out to the double-free bug, the garbage collect 
thread was GC'ing 6 blocks immediately after mounting before it stopped. 
With the very_dirty_list optimisation, that dropped to two.

I'm beginning to wonder whether we should actually abolish the separate
clean/dirty/very_dirty lists and keep a single used_list in decreasing 
order of dirty space, then in jffs2_find_gc_block just pick the block 
number $N in that list, where N is exponentially distributed -- high 
chance of being '1', small but non-negligible chance of being near the end 
of the list.

Keeping the used_list sorted should be fairly simple and cheap - each time 
you make a block slightly dirtier you just do a little bit of bubble-sort, 
and moving nextblock onto the used_list is fairly rare so it doesn't matter 
too much that it's a bit slower.

Does anyone have any ideas on how we'd generate the random number N for 
jffs2_find_gc_block() though?

--
dwmw2
