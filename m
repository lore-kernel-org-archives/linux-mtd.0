Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHY0C-0004Os-P9
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 00:27:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Jim Duchek <jduchek@genaero.com>
In-Reply-To: <3FA9315E.2090508@genaero.com>
References: <3FA9315E.2090508@genaero.com>
Message-Id: <1068078256.11685.6.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 06 Nov 2003 00:24:16 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 + PPM-TX166 (PATCH)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-11-05 at 11:20 -0600, Jim Duchek wrote:
> I traced the problem down to the cond_resched() in WaitReady in 
> doc2000.c.  Removing cond_resched() made the problem go away (and the 
> system unresponsive while doing any DoC access).  Replacing the 
> udelay(1) and cond_resched() with a yield() fixes everything. 

Very strange. Calling yield() really isn't what we want there; we wanted
cond_resched(). What if you leave the cond_resched() and remove the
udelay()? What if you make the udelay() larger?

When the system is locked up as you described, can you hit SysRq-T to
see the backtrace of the stuck thread, and show me the (decoded) output.

Does the same happen even with the current CVS code?

-- 
dwmw2
