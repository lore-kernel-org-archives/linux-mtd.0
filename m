Received: from cbshost-12-155-143-237.sbcox.net ([12.155.143.237]
	helo=sb-lnx3.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VGAe-0004pA-CJ
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 20:43:08 +0100
Date: Wed, 25 Jun 2003 12:43:21 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20030625194321.GA16321@rinconnetworks.com>
References: <20030625154815.GA15437@rinconnetworks.com>
	<20030625182020.GA15879@rinconnetworks.com>
	<20030625182431.GA15901@rinconnetworks.com>
	<200306252152.25576.tglx@linutronix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200306252152.25576.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: No space left on almost empty JFFS2 filesystem
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 25, 2003 at 09:52:25PM +0200, Thomas Gleixner wrote:
> You can only erase eraseblocks and not a quarter of them, as you can't buy a 
> 1/4 of a beerbottle. You can fill the bottle with 1/4 of the maximum content, 
> but the bottle still remains the same size. :)
I thought I would try and see what happened during the mount. I hoped it would
give me more data about whas was going on.

Thanks.

Paul
-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
