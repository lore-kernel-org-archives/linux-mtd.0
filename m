Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1953w5-0005Cu-TQ
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 14:23:51 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDC0099556UST@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 14 Apr 2003 15:23:19 +0200 (MEST)
Date: Mon, 14 Apr 2003 16:23:18 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: 
 <6D31D5429FA6884CBE9ECAB6C9B5E6A9444D@intel-srvr.patcameron.ne.mediaone.net>
To: Thomas Cameron <tom@ceisystems.com>, linux-mtd@lists.infradead.org
Message-id: <200304141623.18400.tglx@linutronix.de>
MIME-version: 1.0
References: 
 <6D31D5429FA6884CBE9ECAB6C9B5E6A9444D@intel-srvr.patcameron.ne.mediaone.net>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Which is simpler...
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 14 April 2003 15:05, Thomas Cameron wrote:
> Hello all,
> 	I have been working on a project recently, which uses a
> DiskOnChip for storage.  However, I have had a number of problems
> getting the DOC to work as I would like.  My question is this.  Would it
> be easier to simply use a CompactFlash?
Depends. :)

> 	My end goal is to use some sort of flash-based storage, and a
> jffs2 or yaffs root filesystem.  Is it possible to use these filesystems
> on a DiskOnChip at this point, or is support for this still forthcoming?
It's not implemented yet, as nobody wrote a chip driver for DOC, which fits to 
the generic NAND driver. nand.c provides all neccecary hooks to do so, but 
there was actually nobody interrested to do it self or to pay somebody to do 
it.

> Additionally, what would be the easiest way to implement one of these
> filesystems on a DiskOnChip.
Just write a chip - driver for nand.c and you're done. The neccecary functions 
are documented on http://www.linux-mtd.infradead.org/tech/nand.html. Driver 
samles are in drivers/mtd/nand. The DOC specific functions can be stolen from 
existing DOC drivers.

Is there a specific reason, that you want to use DOC?  It's more expensive 
than plain NAND. If you want a removable storage use a SmartMedia Card, which 
is just plain NAND molden in plastic with golden contacts. For those JFFS2 
and YAFFS work right out of the box.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
