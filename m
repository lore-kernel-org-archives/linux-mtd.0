Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cek2X-00069X-0L
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 20:02:47 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <41C0D3AC.3050801@us.ibm.com>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
Content-Type: text/plain
Date: Thu, 16 Dec 2004 01:02:54 +0000
Message-Id: <1103158974.15929.37.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

Sure, the file I've been changing is blkmtd.c.

The device I'm aiming for and testing on is 256Mb with a 128k erase
size.

Currently I'm using the code included in the 2.6.9 kernel source tree
with tools from cvs as of about a week ago.

Is this likely to contain the latest speedups or should I be looking
elsewhere?

tia
Gareth.

On Wed, 2004-12-15 at 18:15 -0600, Josh Boyer wrote:
> Gareth Bult (Encryptec) wrote:
> > Hi,
> > 
> > I've been working on the MTD block driver for JFFS2 and now seem to have
> > a relatively stable environment with a JFFS2 root filesystem on a USB
> > flash key device. 
> > (mtd block device speed now approximates actual device speed on both
> > read and write)
> 
> I assume you mean blkmtd here.  The mtdblock driver is used to present 
> an IDE type interface to flash, whereas blkmtd is used to present a 
> flash interface to an IDE type device.
> 
> > 
> > It seems to be much quicker (generally) than the previous ext2
> > incarnation.
> > 
> > However, I'm looking at 30secs to mount the root filesystem.
> 
> How big of a device?
> 
> > a. Is it possible (conceptually) to background the mount scan so the
> > system can boot while the scan happens ?
> 
> Which version of the code are you using?  Mount time has been 
> significantly improved in newer versions of the code.
> 
> > b. Is there an easy way to bypass the scan and does JFFS3 do this ? 
> 
> Not that I know of, because the code needs to read the node information 
> in order to get the versioning of inodes, etc. correct.
> 
> JFFS3 is essentially the exact same code base as JFFS2 right now.  It 
> was just forked about a week ago.
> 
> josh
> 
