Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17plN1-00085x-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 09:00:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002d01c25ad8$5a39d310$80d1a8c0@synso.com.tw> 
References: <002d01c25ad8$5a39d310$80d1a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: jffs-dev@axis.com
Subject: Re: About GC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Sep 2002 08:59:31 +0100
Message-ID: <11233.1031903971@redhat.com>
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

(redirected to jffs list)

startec@ms11.hinet.net said:
> The recent CVS code has a great improvement at mounting time. It's
> great. I test it with the 32Mbytes NAND flash and the mounting time
> reduce to 10 seconds(the original time is 50 seconds). 

We can probably do better than that. I think we're still not page-aligning 
our reads during scan.

> After mounting, I found that the GC thread will take the most CPU 
> time(99.9)  in my system for a while. How can I make 
> jffs2_garbage_collection_pass to reduce CPU time?

(not really answering the question but I've written it now...)

Well, telling me it takes 99% CPU time isn't wonderfully useful. What's 
more useful is telling me _what_ it's doing. But as it happens, I was 
looking at that yesterday. http://www.infradead.org/~dwmw2/holey-profile
is a profile run from about a couple of minutes of GC-intensive writes on a 
fs which is about 80% full. 

We already have code to mark nodes as 'pristine' when they can be copied 
intact without having to iget the inode to which they belong and then read 
and rewrite the data. That will help a lot with memory usage (far less 
thrashing of icache) and allow us to remove the zlib traces from the 
profile. (You don't see the read_inode time in the trace because the icache 
was already fully populated with _every_ inode in the fs before I started).

However, the amount of time spent in zlib decompressing and then 
recompressing each node we GC isn't actually as much as I thought it was. 
We could possibly get 10% improvement when we finish that code and make the 
GC use it, but not a lot more, AFAICT.

The vast majority of the time is spent in __delay, which will have been 
used from the erase routine. The logic there is "if(need_resched()) do_so() 
else udelay()" so on an unloaded system it will hog your CPU and check more 
frequently for completion than once per jiffie, but if there's other stuff 
to run it'll be kinder.

I don't think there's anything I can do there locally -- we're waiting for
hardware. What we need to do is ensure that we erase less. At the moment, 
we have a single block to which we are currently writing. GC'd nodes get 
written there mixed up with new nodes with writes from the user. The former 
has a high probability of being static long-lived data, while the latter is 
more likely to be volatile. The result is that we tend to end up with a lot
of erase blocks which are about half-full of long-lived data and half 
dirty. for each pair of those, what we _want_ is a completely full clean
one and a completely dirty one. 

We can probably get much closer to that ideal by splitting up the writes. 
If we have two blocks 'on the go' at a time, one of which is taking new 
writes from the user, the other of which is taking GC'd nodes from elsewhere
with older data, we will tend to group clean and dirty stuff more usefully, 
and hence have to do less erasing and copying to make progress when we come 
to GC.

We already have separate allocation routines for GC writes anyway, for other
reasons, so implementing this shouldn't be too painful. It's just a case of
convincing myself it's actually going to be worth it and getting round to it
-- as ever, in the absence of customers causing my boss to schedule my time
for it, it has to wait till I'm sufficiently disgusted by what I'm
_supposed_ to be working on that I steal enough cycles to play with it.

--
dwmw2
