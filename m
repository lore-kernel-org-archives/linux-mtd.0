Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bj4R-0003jV-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 15:42:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEHKFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEHKFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 15:42:53 +0100
Message-ID: <28973.1028558573@redhat.com>
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
> > SysRq-T should work on PPC. It's mostly generic code. What's wrong
> > with it? 

> Maybe I spoke too soon, but I can not make sense of it:

That's because you're using 2.4.2. A newer kernel would print the relevant 
call trace from the kernel stack too, and we'd be able to see what kernel 
function(s) it's sleeping in.

--
dwmw2
