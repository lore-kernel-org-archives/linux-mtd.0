Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtlJ5-0001aE-H2
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2004 06:53:40 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
In-Reply-To: <20040808061206.GA5417@mobilesoft.com.cn>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
Content-Type: text/plain
Message-Id: <1091962414.1438.977.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 08 Aug 2004 11:53:34 +0100
Content-Transfer-Encoding: 7bit
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

On Sun, 2004-08-08 at 14:12 +0800, Wu Jian Feng wrote:
> Can't figure out why but have a quick workaround for this:

Erases are permitted to be asynchronous -- if the erase was submitted
sucessfully, you may not free the object until the callback is called.
You _may_ free the object from the callback, and we do.

Can I infer from this that you've actually seen the same problem? Could
you reproduce it? What arch, compiler, etc?

-- 
dwmw2
