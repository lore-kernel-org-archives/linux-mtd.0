Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16slnk-0004JS-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 15:31:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0204031615150.16153-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0204031615150.16153-100000@dagobert.svc.sysgo.de> 
To: Armin Schindler <acs@sysgo.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd device for rootfs with kernel 2.4.18 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 Apr 2002 15:31:50 +0100
Message-ID: <6547.1017844310@redhat.com>
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

acs@sysgo.de said:
> Okay, the call to invalidate_device(), which causes the semaphore
> problem, was removed from the release function in nftlcore.c.

> Is it safe to do the same from the release function in mtdblock.c ? If
> yes, why was it added ? 

It should never have been there in the first place. It was removed from 
mtdblock.c in CVS last year, and that fix is in 2.4.18-pre5.

--
dwmw2
