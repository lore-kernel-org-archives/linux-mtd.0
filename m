Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0b0O-0003sJ-4q
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 13:13:36 +0000
Date: Wed, 21 Oct 2009 22:13:29 +0900 (JST)
Message-Id: <20091021.221329.159689505.anemo@mba.ocn.ne.jp>
To: hartleys@visionengravers.com
Subject: Re: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E248E7@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901E24827@mi8nycmail19.Mi8.com>
	<1256074658.4230.6.camel@macbook.infradead.org>
	<BD79186B4FD85F4B8E60E381CAEE190901E248E7@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Oct 2009 18:28:59 -0400, "H Hartley Sweeten" <hartleys@visionengravers.com> wrote:
> > In an attempt to improve my responsiveness as maintainer, I'd already
> > committed the first version. How does this look:
> 
> Very responsive indeed.  ;-)
> 
> Sorry about introducing the bug.  Your amended patch looks like it serves
> the same purpose as my updated one.  Thanks for fixing that.

Thank you.  Both looks good for me.

Reviewed-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
