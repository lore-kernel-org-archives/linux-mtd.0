Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CuKFQ-0005LN-8U
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 19:44:29 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1106872400.6480.201.camel@localhost.localdomain>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 28 Jan 2005 01:44:25 +0100
Message-Id: <1106873065.21196.168.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-28 at 00:33 +0000, David Woodhouse wrote:
> On Fri, 2005-01-28 at 01:19 +0100, Thomas Gleixner wrote:
> > Sure. I'm aware of O_SYNC, fsync() and sync().
> > 
> > Please reread http://sources.redhat.com/jffs2/jffs2.pdf
> 
> That isn't a promise that I'll continue to guarantee anything that POSIX
> doesn't guarantee, especially in JFFS3.
> 
> I'm not going to object to a mount option which forces O_SYNC behaviour
> for all files. But there's no need for that to be the default.

Agreed. 

If it is JFFS3 it can have the default O_NOSYNC, but the option O_SYNC
still requires to solve the underlaying problem.

tglx
