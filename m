Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Comqp-0005Lk-H0
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:04:12 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112165911.GE25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<1105488400.17853.179.camel@tglx.tec.linutronix.de>
	<20050112165911.GE25638@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 12 Jan 2005 18:37:00 +0100
Message-Id: <1105551420.17853.256.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 17:59 +0100, Jörn Engel wrote:
> Ok, you completely ignore the central issue.  Looks like I was unclear
> about it.
> 
> What happens, if crucial data in flash gets corrupted and is unusable?
> Say, /sbin/init.

I totaly agree that it must be sure that stuff does not get corrupted. 

We use MTD for embedded systems since long and I'm well aware that data
might be corrupted. So most of the systems have a ro partition for
crucial stuff which only is mounted rw for updates under safe
conditions. The application data is living on a different partition.

For critical systems we have a backup emergency root, which we can
activate when a update smashes the normal rootfs. There are other
userspace possibilities to take care of backups and fallback.

So I don't see the point of an enforced mirror in MTD which will bring
more complexity than it is worth, but I might have missed some points.

tglx
