Subject: Re: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
From: David Woodhouse <dwmw2@infradead.org>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <200706141509.50621.u.luckas@road.de>
References: <200706141509.50621.u.luckas@road.de>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 19:52:01 +0100
Message-Id: <1183056721.1170.188.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-06-14 at 15:09 +0200, Uli Luckas wrote:
> The problem seems to happen, when suspend kicks in, after the call to 
> try_to_freeze and before the while loop in jffs2_garbage_collect_thread.
> 
> The pending freeze will cause signal_pending to return true until the 
> attempted suspend is over and thereby the while loop won't terminate until 
> the suspend times out.
> 
> This patch will call try_to_freeze from within the while loop and adds an 
> extra check for jffs2_thread_should_wake before we actually do the GC to 
> avoid calling jffs2_garbage_collect_pass at every wakeup.

Thanks. I've committed a slightly simpler fix:
http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=e716dd3644c2a79d6ffa4359bac06f57479dcb34

-- 
dwmw2
