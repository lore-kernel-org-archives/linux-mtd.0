Received: from modemcable096.213-200-24.mc.videotron.ca ([24.200.213.96]
	helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw1rB-0000Ag-C5
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 12:30:30 -0500
Date: Tue, 1 Feb 2005 12:30:19 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050201172059.GB26068@synertronixx3>
Message-ID: <Pine.LNX.4.61.0502011229310.31479@localhost.localdomain>
References: <20050201153945.GA26068@synertronixx3>
	<Pine.LNX.4.61.0502011137020.31479@localhost.localdomain>
	<20050201172059.GB26068@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: I need still help with XIP, kernel boots now :)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 Feb 2005, Konstantin Kletschke wrote:

> Am 2005-02-01 11:38 -0500 schrieb Nicolas Pitre:
> > On Tue, 1 Feb 2005, Konstantin Kletschke wrote:
> > 
> > > Hi people!
> > > 
> > > Now I need definately have XIP to get running :/
> > > 
> > > I use 2.6.11-rc2-mm2 and put the "xipu" patches into it, which make the
> > > "make xipuImage" available and the XIP Kernel boots now. heureka.
> > > 
> > > Due to the fakt I have no hardware partiotionable Flash devices I need
> > > to utlize the mtd software support to cexist with an XIP Kernel
> > > (CONFIG_MTD_XIP=y).
> > 
> > Try that option with a non XIP kernel at first, then test writing to 
> > flash etc.  See if that works first.
> 
> *ourks* This guves a nice Oops.
> 
> Internal error: Oops: 0 [#1] 
> CPU: 0            
> pc : [<c001fdd8>]    lr : [<e5933000>]    Not tainted
> Using defaults from ksymoops -t elf32-i386 -a i386
[...]

What kernel version is this?


Nicolas
