Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwJok-0007Dd-Jx
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 07:41:18 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Rudi Engelbertink <rudi@unsec.nl>
In-Reply-To: <20050202112025.M50509@unsec.nl>
References: <20050201150810.M93647@unsec.nl>
	<Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
	<20050202085600.M52308@unsec.nl>
	<1107340012.21196.507.camel@tglx.tec.linutronix.de>
	<20050202112025.M50509@unsec.nl>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 13:41:05 +0100
Message-Id: <1107348065.21196.544.camel@tglx.tec.linutronix.de>
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

On Wed, 2005-02-02 at 13:26 +0100, Rudi Engelbertink wrote:
> > This converts the small nodes to bigger nodes when the data are appended
> > to log.big. I guess garbage collection should kick in quite fast and
> > clean up the small nodes. It might not totally go away, but it 
> > should be much better than now. This will also give you more 
> > capacity on your partition as the small nodes consist mostly of node 
> > overhead.
> 
> Digging through the logfile I noticed that several inodes had a lot of
> versions. Especialy the inode #737 which had 60000+ versions.
> This is a bit strange because this is a 16 byte pointer file which will
> be opened once and never closed. This should not result in 60000+ versions.

It's because JFFS2 does synchronous writes. That means, every write()
you do, is written to the FLASH immidiately. So every small log write
goes into FLASH and builds a node.

The version count is just incremented and the old nodes are declared
obsolete. I'm not sure, why the blocks are not garbage collected.

> A copy move action (cp -p file file.cp && mv file.cp file) indeed makes a big
> performance improvement. 
> Will a regular close open of this file make some improvement regarding the
> stored version information of this inode. During normal operations this file,
> and some other files, never gets closed. So there will be never a 'commit'.

close / open actually does not help. Without changes to JFFS2 code only
the copy to a different file will help you.

tglx
