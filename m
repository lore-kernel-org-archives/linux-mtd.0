Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GMa4-0004am-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 15:55:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0112181515390.32030-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0112181515390.32030-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Map driver usage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Dec 2001 16:05:45 +0000
Message-ID: <7139.1008691545@redhat.com>
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

rob@sysgo.de said:
>  I have a question regarding the usage od the access primitives (e.g.
> xx_read8(), xx_read16(), xx_copy_from() and so on). In writing a map
> driver, can one assume that the MTD layer never calls these functions
> to cross a flash device's block boundary ?

No. JFFS may do large reads which cross eraseblock boundaries, and the 
flash driver will translate that directly into a large ->copy_from call.

> The reason I'm asking is that I am writing a new map driver for a
> board that has a somwhat strange logical flash layout and I would like
> to hide that by "shuffling" some of the blocks so that they appear at
> different offsets. Transforming the offset parameter in the above
> mentioned functions would be an easy way to do this, but it requires
> that these functions are never asked to cross an erase block boundary.

I wouldn't do it in the map driver. Do it in the partitioning layer - 
that's already mucking around with the offsets anyway.

--
dwmw2
