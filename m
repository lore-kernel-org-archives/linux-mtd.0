Received: from [61.155.114.21] (helo=mail.mobilesoft.com.cn)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtzNy-0003Cn-1A
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2004 21:55:39 -0400
Date: Mon, 9 Aug 2004 09:59:51 +0800
From: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040809015950.GA20408@mobilesoft.com.cn>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
	<1091962414.1438.977.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1091962414.1438.977.camel@imladris.demon.co.uk>
Sender: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] 2.6.8-rc3 slab corruption (jffs2?)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 08, 2004 at 11:53:34AM +0100, David Woodhouse wrote:
> On Sun, 2004-08-08 at 14:12 +0800, Wu Jian Feng wrote:
> > Can't figure out why but have a quick workaround for this:
> 
> Erases are permitted to be asynchronous -- if the erase was submitted
> sucessfully, you may not free the object until the callback is called.
> You _may_ free the object from the callback, and we do.
> 
> Can I infer from this that you've actually seen the same problem? Could
> you reproduce it? What arch, compiler, etc?
> 
> -- 
> dwmw2
> 
> 

I see the same thing as rmk, used both gcc-3.3.2 and 3.4.0,
on a OMAP730 (arm926ejs).
