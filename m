Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15u9y1-0005ii-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 10:59:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEJPEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEJPEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question/suggestion 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Oct 2001 11:09:10 +0100
Message-ID: <2124.1003399750@redhat.com>
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
> > There's no real reason for it to do so - can you get a backtrace
> > (SysRq-T) and find out what it's waiting for? That should be fixable.

> OK, here it is:

> root@localhost:~# umount /jffs2/ 
> SysRq: Show State

Why are there no call traces in that?  

--
dwmw2
