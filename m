Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtZwb-00012a-J4
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2004 18:45:42 -0400
Date: Sat, 7 Aug 2004 23:45:36 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040807234536.C1322@flint.arm.linux.org.uk>
References: <20040807141829.D2805@flint.arm.linux.org.uk>
	<1091915887.1438.99.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1091915887.1438.99.camel@imladris.demon.co.uk>;
	from dwmw2@infradead.org on Sat, Aug 07, 2004 at 10:58:07PM +0100
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] 2.6.8-rc3 jffs2 unable to read filesystems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 07, 2004 at 10:58:07PM +0100, David Woodhouse wrote:
> On Sat, 2004-08-07 at 14:18 +0100, Russell King wrote:
> > This can be seen by tracing through the code from jffs2_alloc_raw_inode()
> > and noticing that previous implementations do not initialise this field -
> > AFAICS kmem_cache_alloc() does not guarantee that memory returned by
> > this function will be initialised.
> 
> Doh.
> 
> > Therefore, recent 2.6.8-rc kernels must _NOT_ use this field if they
> > wish to remain compatible with existing jffs2 filesystems.
> 
> The format is compatible in theory -- we just need to work around the
> bug in the older code. Can you try this?

Ok, this boots fine here, thanks.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
