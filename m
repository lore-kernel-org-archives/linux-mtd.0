Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ciqQ-0004RX-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:40:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEJGFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEJGFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: "Dave Ellis" <DGE@sixnetio.com>, linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 09:40:29 +0100
Message-ID: <31741.1028796029@redhat.com>
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

joakim.tjernlund@lumentis.se said:
> Maybe erasing should be moved away from kupdate then, to the gc thread
> or a new erase thread that does not mind beeing blocked?

Maybe. I want to keep the GC thread optional though. I think it's 
sufficient just to fix the chip drivers to really do asynchronous erases, 
so the thread calling ->erase() doesn't actually have to block. Then we can 
leave it in kupdate.

>  OK, so if schedule_task() is used instead its possible to replace
> spin_lock_bh with spin_lock everywhere?

Yes.

> I think we should change erase.c to do atmost 3 erase & mark in one
> go. That will free up space more quickly when there is a lot of
> pending erases. 

Seems reasonable.

--
dwmw2
