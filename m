Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KJhX-0004hu-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 15:11:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLAEKPFEAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLAEKPFEAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: point()/unpoint() questions + small cfi_cmdset_0001.c patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jun 2002 15:11:18 +0100
Message-ID: <5984.1024409478@redhat.com>
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
> Is this on your board with burst reads working? Are you using a cached
> mapping for point()? 

> Yes x 2 

As discussed on IRC -- perhaps we want to investigate using prefetch() then.

>  After a quick read I think it's NOT possible to read data without
> suspending an Erase first.

Yeah - it looks that way to me too. XIP on a writable file system really 
does seem like a silly plan, given current flash technology.

--
dwmw2
