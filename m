Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkAJ-0000Gp-RL
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:35:05 -0500
Date: Tue, 21 Dec 2004 14:34:14 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221133414.GF22636@wohnheim.fh-wedel.de>
References: <41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
	<41C31307.70909@us.ibm.com>
	<1103304360.15914.210.camel@squizzey.bult.co.uk>
	<41C318C8.4030702@us.ibm.com>
	<20041218160255.GA1083@wohnheim.fh-wedel.de>
	<1103560493.25853.31.camel@weaponx.rchland.ibm.com>
	<1103562748.10800.62.camel@squizzey.bult.co.uk>
	<20041221130924.GB22636@wohnheim.fh-wedel.de>
	<1103635475.10794.143.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1103635475.10794.143.camel@squizzey.bult.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 December 2004 13:24:35 +0000, Gareth Bult (Encryptec) wrote:
> 
> Mmm .. anyone know a magazine editor who'd like to acquire a bunch of
> keys and runs some tests for us .. ;-)

Somewhere in my lkml-mailbox was a report of some device not doing
decent wear leveling.  It should be in the archives somewhere.  Ext3
killed the devices rather quickly, jffs2 didn't.

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
