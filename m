Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16c2Wm-0006rc-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2002 10:57:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202161157380.17237-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202161157380.17237-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org,
    J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 16 Feb 2002 11:08:26 +0000
Message-ID: <24624.1013857706@redhat.com>
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
>  OK, but is the function allowed to erase blocks up to the point where
> it hits the partial block request ? That would make it simpler,
> especially in the presence of variable block sizes.

It doesn't matter. The caller _knows_ the blocksize setup, and must not
_ever_ ask for an erase that doesn't both start and end on block boundaries.

I hereby declare that the behaviour of the driver if this happens is
undefined. You can do what ever you like, including erasing the whole of 
the flash, all hard drives, and blowing up the machine.

I probably won't actually accept a patch which implements that. I'd take one
which has a BUG() though ;)

--
dwmw2
