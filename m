Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sluj-0004KP-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 15:39:05 +0100
Date: Wed, 3 Apr 2002 16:39:02 +0200 (MEST)
From: Armin Schindler <acs@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd device for rootfs with kernel 2.4.18 
In-Reply-To: <6547.1017844310@redhat.com>
Message-ID: <Pine.LNX.4.21.0204031637190.16912-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 3 Apr 2002, David Woodhouse wrote:
> acs@sysgo.de said:
> > Okay, the call to invalidate_device(), which causes the semaphore
> > problem, was removed from the release function in nftlcore.c.
> 
> > Is it safe to do the same from the release function in mtdblock.c ? If
> > yes, why was it added ? 
> 
> It should never have been there in the first place. It was removed from 
> mtdblock.c in CVS last year, and that fix is in 2.4.18-pre5.

Okay, thanx.
Just wondering, in CVS HEAD it is still there ? Or is this only
meant for 2.5 ?

Armin
