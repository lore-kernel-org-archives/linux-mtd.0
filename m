Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19uhGY-0000G9-VA
	for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2003 00:42:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Keith Outwater <Keith_Outwater@microvision.com>
In-Reply-To: <AFA2797FA126FD46B8CD281F2809844E181968@taurus.primary.local>
References: <AFA2797FA126FD46B8CD281F2809844E181968@taurus.primary.local>
Message-Id: <1062632507.31497.247.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 04 Sep 2003 00:41:47 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Latest CVS snapshot support for kernel 2.2.4?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-09-03 at 16:25 -0700, Keith Outwater wrote:
> Are there any plans to add support for earlier kernels?

No. Even something as old as 2.4.10 won't work easliy -- although 2.4.19
apparently does with a small amount of hacking.

It's mostly stuff in compatmac.h that you're missing, and much of it you
could probably reclaim from an older version in CVS. I'm no longer
interested in maintaining it though -- people just shouldn't be using
old and known-broken code, and if they really want to do that they can
use old MTD code too. 

Or fix it themselves without bothering me :)

Sorry.

-- 
dwmw2
