Received: from shyguy.smb.utfors.se ([195.58.112.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ciio-0004P3-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:32:42 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Dave Ellis" <DGE@sixnetio.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods 
Date: Thu, 8 Aug 2002 10:32:40 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEJGFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <28015.1028793771@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> 
> joakim.tjernlund@lumentis.se said:
> >  I noticed that erase_callback() in erase.c useses spin_lock(), not
> > spin_lock_bh(). Should it?
> 
> It expects to actually be called in bottom-half context, and if it isn't 
> then nothing else will be. So it's fine to use spin_lock() there.
OK.
> 
> >  I dont understand what using a timer would give us. I suppose that
> > one could have more the one erase simontainously(one per bank) but
> > that won't give a significant improvement and erase.c must be made
> > "bank aware" as well. 
> 
> > Unless there is some other advantage, I think you should change the
> > spec.
> 
> Using a timer to check for erase completion means that the process which 
> submitted the erase doesn't have to be blocked waiting for it. The callback 
> can happen some time later. In the case of JFFS2, it's kupdated that ends 
> up stuck in the erase routine for ages.

Maybe erasing should be moved away from kupdate then, to the gc thread or a new
erase thread that does not mind beeing blocked?
> 
> But using a timer to actually do the check doesn't mean we have to call the 
> completion callback in timer context -- we could use schedule_task() to run 
> it in process context.

OK, so if schedule_task() is used instead its possible to replace spin_lock_bh
with spin_lock everywhere?

I think we should change erase.c to do atmost 3 erase & mark in one go.
That will free up space more quickly when there is a lot of pending erases.

 Jocke
> 
> --
> dwmw2
> 
> 
> 
