Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sle4-0004Ig-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 15:21:53 +0100
Date: Wed, 3 Apr 2002 16:21:47 +0200 (MEST)
From: Armin Schindler <acs@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd device for rootfs with kernel 2.4.18 
In-Reply-To: <2213.1017842011@redhat.com>
Message-ID: <Pine.LNX.4.21.0204031615150.16153-100000@dagobert.svc.sysgo.de>
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

Okay, the call to invalidate_device(), which causes the semaphore
problem, was removed from the release function in nftlcore.c.

Is it safe to do the same from the release function in mtdblock.c ?
If yes, why was it added ?

Armin 

On Wed, 3 Apr 2002, David Woodhouse wrote:
> 
> acs@sysgo.de said:
> >  Or did I overlook something here ? 
> 
> Yes. The mailing list archives.
> 
> --
> dwmw2
