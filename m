Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tlTo-0003Yp-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 08:51:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLCEJJEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLCEJJEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question/suggestion 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Oct 2001 09:00:14 +0100
Message-ID: <30104.1003305614@redhat.com>
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
>  Does JFFS2 erase the blocks that are already erased?

Yes, because they might not be _completely_ erased - unless they have a 
cleanmarker node at the beginning, then it's possible that they're only 
partly-erased. So it erases them again, just to make sure.

> I also noticed that an umount hangs until kupdate is finished, should it?

There's no real reason for it to do so - can you get a backtrace (SysRq-T) 
and find out what it's waiting for? That should be fixable.

> Is it safe to power cycle the board during this initial formating? 

Yes. The formatting is done specifically to make sure it's safe to power 
cycle at any time.

--
dwmw2
