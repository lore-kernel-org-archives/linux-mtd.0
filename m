Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IzYS-0001zK-00
	for mtd-list@infradead.org; Wed, 17 Jan 2001 20:51:40 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14IzYR-0001zE-00
	for mtd@infradead.org; Wed, 17 Jan 2001 20:51:39 +0000
Date: Wed, 17 Jan 2001 20:51:30 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: <mark.langsdorf@amd.com>
cc: <mtd@infradead.org>,  <jffs-dev@axis.com>
Subject: Re: 101% in use?
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F285@txexmta8.amd.com>
Message-ID: <Pine.LNX.4.30.0101172034350.2011-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


(This be more appropriate on the JFFS list, so I've CC'd the response
there)

On Tue, 16 Jan 2001 mark.langsdorf@amd.com wrote:

> I've finally gotten my flash system 95% working, and now I'm
> performing some stress tests to make sure that everything is
> good.

At last :) Good. Have you solved the random oops on write cycles to the 
ioremapped flash addresses, then?

> The partition size is 14.5 megs, give or take a bit, and
> I have a very large directly (around 2.7 megs) that I'm
> repeatedly copying onto the disk and deleting.  At one
> point, I got my italicization (according to df) up to 
> 101%, with a negative number of free blocks.  Is this bad?

I wouldn't worry too much about the the results of df. We basically make
stuff up in jffs_statfs(). It's only if the internal filesystem code
_really_ thinks there are negative amounts of free space that I'd start to
wet myself. And I don't think that's the case.

> After I deleted the most recent copy of the directory, 
> utilization dropped to 100%, with 44 blocks free.  
> Shouldn't the GC be kicking in and getting rid of the
> rest of the dirty space?  It's stayed at 44 blocks for
> quite some time.

Nope, that's OK. No point in GC'ing it till we actually need to - we GC
enough to keep some space free but don't compact it right down till we
want the space. It's a tradeoff between gratuitous flash erases and later
write performance. It's tweakable - see the code in thread_should_wake().

If you want the background thread to always keep as much space free as 
possible, change the 'return 0' at the end of the routine to 'return 1'.

Or at runtime, if you want the GC thread to wake up, send it a SIGHUP.  
It'll GC a little and go back to sleep. Repeat until you're happy or 
the dirty size is less than a sector (i.e. it can't usefully GC any more).

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
