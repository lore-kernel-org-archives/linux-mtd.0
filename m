From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1106857409.21196.58.camel@tglx.tec.linutronix.de>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Thu, 27 Jan 2005 22:35:26 +0000
Message-Id: <1106865326.783.146.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-27 at 21:23 +0100, Thomas Gleixner wrote:
> Keep it write-through !
> 
> Write caching is contrary to powerfail robustness.

No. O_SYNC, fsync() and sync() are there for a reason, and even on NAND
today you have to use them correctly according to POSIX if you want sane
results. We're not pandering to stupidity.

-- 
dwmw2
