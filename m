Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WI6a-0005a9-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 14:22:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02013113260208.00763@thomas> 
References: <02013113260208.00763@thomas>  <02013022481901.00763@thomas> <15998.1007200283@redhat.com> <17832.1012472563@redhat.com> 
To: gleixner@autronix.de
Cc: jffs-dev@axis.com
Subject: Re: JFFS2 on NAND flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 31 Jan 2002 14:30:14 +0000
Message-ID: <17713.1012487414@redhat.com>
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

( moved to jffs-dev list )

gleixner@autronix.de said:
> I know that and i was trying to put a workaround for the write cycle
> problem  into the nand driver. I think thats the correct location for
> this. Are there  other chips dealing with the same problem or is it
> related to NAND only ? 

Some new ST chips have similar problems, I think. You can only write once 
to any given 8-byte region before erasing it.

> My current solutiun would be: In nand.c the
> write functions checks the write attempts to a page. If there  were
> three writes already to this page, the function reads back the block
> data, erases the block and writes the block data back to the chip. 

You can't do it like that. What if you lose power while the block is erased,
but before you have written the data back again? You lose all the
information from the remainder of that erase block.

See http://mhonarc.axis.se/jffs-dev/msg01140.html

>  Is this also a problem for jffs1 ? I run jffs1 for a couple of weeks
> on my  board and had not one problem at all.  

I think you get away with it on JFFS1. You don't have nodes small enough 
that you'll fit ten of them in a page, and you can go for a couple of weeks 
without the lack of ECC biting you.

gleixner@autronix.de said:
> > Also note that the locking in jffs2_garbage_collect_deletion_dirent()
> > is broken. We need to lock the erase_completion_lock while we go through
> > the list, and drop the lock when we read the nodes. 

> I'm not deep enough inside this to see the neccecary change. Could you 
> please  explain more detailed ?

On completion of a block erase, we walk through all the node lists, and we 
remove and free all nodes in the block which has just been erased. Anything 
which walks the node lists (as this function does) must hold the
erase_completion_lock, so that the erase can't happen simultaneously.

So we must hold the erase_completion_lock while walking the lists, and 
because it's a spinlock we must unlock it before calling the flash read 
function. Then when we get it again the node we were looking at and the 
next node in the list may both have gone and been freed - we have to start 
again from the beginning.


--
dwmw2
