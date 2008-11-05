Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KxZOQ-0002zv-JU
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 03:49:30 +0000
Date: Tue, 4 Nov 2008 19:49:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH] jffs2: force the jffs2 GC daemon to behave a bit better
Message-Id: <20081104194914.e39008ba.akpm@linux-foundation.org>
In-Reply-To: <20081102130449.0aa74adb@fred>
References: <20081102130449.0aa74adb@fred>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2 Nov 2008 13:04:49 -0500 Andres Salomon <dilinger@queued.net> wrote:

> 
> I've noticed some pretty poor behavior on OLPC machines after bootup, when
> gdm/X are starting.  The GCD monopolizes the scheduler (which in turns means
> it gets to do more nand i/o), which results in processes taking much much
> longer than they should to start.
> 
> As an example, on an OLPC machine going from OFW to a usable X (via auto-login
> gdm) takes 2m 30s.  The majority of this time is consumed by the switch into
> graphical mode.  With this patch, we cut a full 60s off of bootup time.  After
> bootup, things are much snappier as well.
> 
> Note that we have seen a CRC node error with this patch that causes the machine
> to fail to boot, but we've also seen that problem without this patch.  
> 

Well you've observed one of the problems with yield().  The other
problem is that this thread can be starved for fantastic amounts of
time when the system is busy.

yield() is so unpredictable that basically any use of it should be
viewed as a bug.

> ---
>  fs/jffs2/background.c |   18 +++++++++++-------
>  1 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index 8adebd3..f38d557 100644
> --- a/fs/jffs2/background.c
> +++ b/fs/jffs2/background.c
> @@ -95,13 +95,17 @@ static int jffs2_garbage_collect_thread(void *_c)
>  			schedule();
>  		}
>  
> -		/* This thread is purely an optimisation. But if it runs when
> -		   other things could be running, it actually makes things a
> -		   lot worse. Use yield() and put it at the back of the runqueue
> -		   every time. Especially during boot, pulling an inode in
> -		   with read_inode() is much preferable to having the GC thread
> -		   get there first. */
> -		yield();
> +		/* Problem - immediately after bootup, the GCD spends a lot
> +		 * of time in places like jffs2_kill_fragtree(); so much so
> +		 * that userspace processes (like gdm and X) are starved
> +		 * despite plenty of cond_resched()s and renicing.  Yield()
> +		 * doesn't help, either (presumably because userspace and GCD
> +		 * are generally competing for a higher latency resource -
> +		 * disk).
> +		 * This forces the GCD to slow the hell down.   Pulling an
> +		 * inode in with read_inode() is much preferable to having
> +		 * the GC thread get there first. */
> +		schedule_timeout_interruptible(msecs_to_jiffies(50));
>  
>  		/* Put_super will send a SIGKILL and then wait on the sem.
>  		 */

Yeah.  It doesn't matter much - almost any change you can make in there
will improve the current code.

David, I do think we should fix this in 2.6.28 (at least).

Perhaps this is an application for SCHED_IDLE?
