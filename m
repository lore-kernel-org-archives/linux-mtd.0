Subject: Re: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
From: David Woodhouse <dwmw2@infradead.org>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <200706291024.49018.u.luckas@road.de>
References: <200706141509.50621.u.luckas@road.de>
	<1183056721.1170.188.camel@pmac.infradead.org>
	<200706291024.49018.u.luckas@road.de>
Content-Type: text/plain
Date: Fri, 29 Jun 2007 09:28:28 +0100
Message-Id: <1183105708.1170.223.camel@pmac.infradead.org>
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

On Fri, 2007-06-29 at 10:24 +0200, Uli Luckas wrote:
> But then again, my patch was more complex for a reason :-) How does your patch 
> handle the situation, where try_to_freeze returns true _and_ there is a 
> pending SIGHUP?

It'll go back to the beginning of the loop, then if it _does_ take the 
!thread_should_wake() path it'll be woken immediately by the pending
SIGHUP, and it'll do one GC pass as intended.

-- 
dwmw2
