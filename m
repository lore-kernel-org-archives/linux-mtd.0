From: David Woodhouse <dwmw2@infradead.org>
To: J B <mad_flasher@hotmail.com>
In-Reply-To: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
References: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
Content-Type: text/plain
Message-Id: <1067539988.3423.208.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 30 Oct 2003 18:53:08 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
Subject: Re: jffs2 fragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-10-18 at 09:20 -0500, J B wrote:
> Normally, a rm/cp pair takes about 2 minutes on my system.  After about 10 
> iterations, the copies begin to take longer, about 3-4 minutes.   After 
> about 10 iterations they take upwards of 1/2 an hour.

I suspect you've triggered the worst case of a performance bug which
I've known about for a while.

We should write new data out to one empty block, while writing out
garbage-collected data out to another. We don't do that at the moment;
we interleave old and new data and then you erase your new file, leaving
us with a very suboptimal mix of valid and obsolete nodes in each
eraseblock we've been writing to.

I'm still a bit surprised it takes half an hour though. 

-- 
dwmw2
