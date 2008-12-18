Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDCrO-0001dc-JQ
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 06:59:51 +0000
From: David Brownell <david-b@pacbell.net>
To: dedekind@infradead.org
Subject: Re: [PATCH] MTD: fix dataflash 64-bit divisions
Date: Wed, 17 Dec 2008 22:59:47 -0800
References: <1229532627.17960.37.camel@sauron>
	<200812170956.55539.david-b@pacbell.net>
	<1229581617.17960.63.camel@sauron>
In-Reply-To: <1229581617.17960.63.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812172259.48117.david-b@pacbell.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 17 December 2008, Artem Bityutskiy wrote:
> > Would this be part of a set of patches making 4 GByte
> > (and eventually, larger) NAND chips behave?
> 
> Well, this patch does only part of the job - it changes
> in-kernel API. Yes, makes >4GiB NANDs behave, and we tested
> it with NAND simulator (nandsim).

Good.  Larger parts seem to be easy to find nowadays,
and that particular limit seemed quite significant.


> However, all the user-space interfaces are still 32-bit.
> And the interfaces are not extendible, so someone should
> invent completely new MTD interfaces.
> 
> And to support 4KiB-page NANDs, which have 128bytes OOB,
> one needs to change user-space interfaces (ioctls), because
> they support 64-bit OOBs at max. On the other hand, I
> personally do not care about OOB support, because it is
> in general better to avoid any use of OOB.

This case was 2 GByte NAND chips with 4KiB pages.  The
important goal was being able to use them to hold much
filesystem data -- with 80 bytes hardware ECC data for
each 4KiB page -- and if the ioctls were also an issue,
I wouldn't have heard.

- Dave
