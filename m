Received: from [2001:838:3de:1000::2] (helo=fserver.unsec.nl)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwJa9-0006xW-8G
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 07:26:06 -0500
From: "Rudi Engelbertink" <rudi@unsec.nl>
To: tglx@linutronix.de
Date: Wed, 2 Feb 2005 13:26:00 +0100
Message-Id: <20050202112025.M50509@unsec.nl>
In-Reply-To: <1107340012.21196.507.camel@tglx.tec.linutronix.de>
References: <20050201150810.M93647@unsec.nl>
	<Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
	<20050202085600.M52308@unsec.nl>
	<1107340012.21196.507.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=iso-8859-1
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes() very very slow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 02 Feb 2005 11:26:51 +0100, Thomas Gleixner wrote
> On Wed, 2005-02-02 at 10:05 +0100, Rudi Engelbertink wrote:
> > The powerfail tests are done by:
> > A. a clock. Just turn off and on the power every 15 minutes and start the
> > an application which logs 2 40-60 byte events every second.
> > ...
> > Yes, the root is accessable but the directory where the logging is stored,
> > is unavailable for several minutes.
> 
> You hit the worst case for JFFS2.
> 
> Your event logging creates tons of small nodes for your logfiles.
> Actually are about 96000 very small nodes on the chip, so the mount time
> is not surprising. This also will use a quite big amount of memory.
> 
> We have no real cure for this at the moment. We have this scenario in
> our design list for JFFS3. I remember that somebody else came up with
> this issue sometime ago. IIRC changing the log method did help a bit.
> 
> while true
> do
> 	log_event
> 	let cnt=cnt+1
> 	if [ $cnt -ge $LIMIT ]
> 	then
> 		closelog
> 		cat log.small >>log.big
> 		rm log.small
> 	fi
> done
> 
> This converts the small nodes to bigger nodes when the data are appended
> to log.big. I guess garbage collection should kick in quite fast and
> clean up the small nodes. It might not totally go away, but it 
> should be much better than now. This will also give you more 
> capacity on your partition as the small nodes consist mostly of node 
> overhead.

Digging through the logfile I noticed that several inodes had a lot of
versions. Especialy the inode #737 which had 60000+ versions.
This is a bit strange because this is a 16 byte pointer file which will
be opened once and never closed. This should not result in 60000+ versions.
A copy move action (cp -p file file.cp && mv file.cp file) indeed makes a big
performance improvement. 
Will a regular close open of this file make some improvement regarding the
stored version information of this inode. During normal operations this file,
and some other files, never gets closed. So there will be never a 'commit'.
So after a powerfail, all the inode version information must be checked.

> 
> You may also try YAFFS for the logging partition. It should deal with
> this situation a bit better.
> 
> tglx

RGDS Rudi.
-- 
They that can give up essential liberty to obtain a little temporary
safety deserve neither liberty nor safety.
   Benjamin Franklin (1706-1790), Letter to Josiah Quincy, Sept. 11, 1773.
GnuPG Key fingerprint = 706C E2AC 7AE2 BCEE 04EB  A962 0A75 7F9B 07A1 83E8
