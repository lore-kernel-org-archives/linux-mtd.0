Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3yzn-00058p-01
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 02:17:19 +0000
Date: Fri, 17 Jan 2014 09:40:50 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: add support for Samsung K9LCG08U0B
Message-ID: <20140117014048.GA27652@shlinux2.ap.freescale.net>
References: <1387963135-22142-1-git-send-email-b32955@freescale.com>
 <20140116213637.GH8919@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140116213637.GH8919@ld-irv-0074>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 16, 2014 at 01:36:37PM -0800, Brian Norris wrote:
> > +		case 7:
> > +			mtd->oobsize = SZ_1K;
> 
> #include <linux/sizes.h>
> 
> Did you compile this?
we do not need this header.
I had already tested this patch with the l2-mtd tree.

> 
> Anyway, I think just using the literal 1024 is better. I can fix it up
> and push myself in a bit.
Different person has different taste. :)

It is okay to me if you the literal 1024.

thanks
Huang Shijie
