Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ciFz-0004Le-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:02:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLIEJFFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLIEJFFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: "Dave Ellis" <DGE@sixnetio.com>, linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 09:02:51 +0100
Message-ID: <28015.1028793771@redhat.com>
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
>  I noticed that erase_callback() in erase.c useses spin_lock(), not
> spin_lock_bh(). Should it?

It expects to actually be called in bottom-half context, and if it isn't 
then nothing else will be. So it's fine to use spin_lock() there.

>  I dont understand what using a timer would give us. I suppose that
> one could have more the one erase simontainously(one per bank) but
> that won't give a significant improvement and erase.c must be made
> "bank aware" as well. 

> Unless there is some other advantage, I think you should change the
> spec.

Using a timer to check for erase completion means that the process which 
submitted the erase doesn't have to be blocked waiting for it. The callback 
can happen some time later. In the case of JFFS2, it's kupdated that ends 
up stuck in the erase routine for ages.

But using a timer to actually do the check doesn't mean we have to call the 
completion callback in timer context -- we could use schedule_task() to run 
it in process context.

--
dwmw2
