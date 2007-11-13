Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IrnoV-00012G-6j
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 23:55:58 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRF008QAHP2ZDE0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 23:55:50 -0500 (EST)
Date: Mon, 12 Nov 2007 23:55:50 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
Message-id: <alpine.LFD.0.9999.0711122352570.21255@xanadu.home>
References: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Nov 2007, Justin Treon wrote:

> > What about a new partition flag then?  When set the unlock method would 
> > be called on the corresponding partition if the partition is not already 
> > marked read-only.
> > 
> 
> I think that a partition flag is a good idea, but the mtd partition should be
> unlocked by defualt if it is not read only and adding the flag will keep it locked.

And in fact this is already implemented, and the partition flag (which 
is actually a negative flag) is already called MTD_STUPID_LOCK.

So let's go back to finding your flash model requiring a 
fixup_use_powerup_lock() call.


Nicolas
