Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1tG8-0003d1-6K
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 17:00:13 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Brian T <btuch@usa.net>
In-Reply-To: <073f01c48ecc$abd3e600$fd0ba8c0@briantpc>
References: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
	<1093894808.25339.57.camel@weaponx.rchland.ibm.com>
	<073f01c48ecc$abd3e600$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1093899187.16320.25.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Mon, 30 Aug 2004 22:53:07 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 file corruption
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-08-30 at 22:05, Brian T wrote:
> Did that.  My /var/ partition is a 512K RAMFS, and /var/log/messages rotates
> after 200K.  I will probably need to up that partition a bit and make the
> log rotate higher to get more debug stuff.
> 
Use a serial console and not syslogd. Else you will have messed debug
output which is not helpful at all

tglx
