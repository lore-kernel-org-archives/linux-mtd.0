Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwHj9-0005i5-0u
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 05:27:16 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Rudi Engelbertink <rudi@unsec.nl>
In-Reply-To: <20050202085600.M52308@unsec.nl>
References: <20050201150810.M93647@unsec.nl>
	<Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
	<20050202085600.M52308@unsec.nl>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 11:26:51 +0100
Message-Id: <1107340012.21196.507.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes() very very slow
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-02 at 10:05 +0100, Rudi Engelbertink wrote:
> The powerfail tests are done by:
> A. a clock. Just turn off and on the power every 15 minutes and start the
> an application which logs 2 40-60 byte events every second.
> ...
> Yes, the root is accessable but the directory where the logging is stored,
> is unavailable for several minutes.

You hit the worst case for JFFS2.

Your event logging creates tons of small nodes for your logfiles.
Actually are about 96000 very small nodes on the chip, so the mount time
is not surprising. This also will use a quite big amount of memory.

We have no real cure for this at the moment. We have this scenario in
our design list for JFFS3. I remember that somebody else came up with
this issue sometime ago. IIRC changing the log method did help a bit.

while true
do
	log_event
	let cnt=cnt+1
	if [ $cnt -ge $LIMIT ]
	then
		closelog
		cat log.small >>log.big
		rm log.small
	fi
done

This converts the small nodes to bigger nodes when the data are appended
to log.big. I guess garbage collection should kick in quite fast and
clean up the small nodes. It might not totally go away, but it should be
much better than now. This will also give you more capacity on your
partition as the small nodes consist mostly of node overhead. 

You may also try YAFFS for the logging partition. It should deal with
this situation a bit better.

tglx
