From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1106871577.21196.155.camel@tglx.tec.linutronix.de>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Fri, 28 Jan 2005 00:33:19 +0000
Message-Id: <1106872400.6480.201.camel@localhost.localdomain>
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

On Fri, 2005-01-28 at 01:19 +0100, Thomas Gleixner wrote:
> Sure. I'm aware of O_SYNC, fsync() and sync().
> 
> Please reread http://sources.redhat.com/jffs2/jffs2.pdf

That isn't a promise that I'll continue to guarantee anything that POSIX
doesn't guarantee, especially in JFFS3.

I'm not going to object to a mount option which forces O_SYNC behaviour
for all files. But there's no need for that to be the default.

-- 
dwmw2
