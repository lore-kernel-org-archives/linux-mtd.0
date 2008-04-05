Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhz42-0007kK-Uv
	for linux-mtd@lists.infradead.org; Sat, 05 Apr 2008 03:27:35 +0000
Date: Fri, 4 Apr 2008 20:27:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] jffs2 summary allocation
Message-Id: <20080404202704.84e743d7.akpm@linux-foundation.org>
In-Reply-To: <200804041941.35075.david-b@pacbell.net>
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<9c9fda240804041829r5a768b39n340926485aa12687@mail.gmail.com>
	<20080404184615.deaf3122.akpm@linux-foundation.org>
	<200804041941.35075.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Kyungmin Park <kmpark@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Trimarchi <trimarchimichael@yahoo.it>,
	spi-devel-general@lists.sourceforge.net,
	Josh Boyer <jwboyer@gmail.com>, dwmw2@infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 4 Apr 2008 19:41:34 -0700 David Brownell <david-b@pacbell.net> wrote:

> On Friday 04 April 2008, Andrew Morton wrote:
> > This problem comes up pretty often. 
> 
> Which problem -- kmalloc(BIG)?  Or dma(dma-unsafe-mem)?
> Or something else?

Code needing a large amount of memory, trying to kmalloc it, then getting
into trouble, them using vmalloc, then getting into more trouble.

This is kernel - order-0 allocations will always be the most robust.
