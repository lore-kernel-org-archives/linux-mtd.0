Received: from bar.sig21.net ([80.81.252.164])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5GA7-0003J6-0y
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 09:58:55 +0000
Date: Tue, 3 Nov 2009 11:00:18 +0100
From: Johannes Stezenbach <js@sig21.net>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: make command buffer DMA-safe
Message-ID: <20091103100018.GA20519@sig21.net>
References: <20091028132137.GA17813@sig21.net>
	<1257230165.21596.33.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1257230165.21596.33.camel@localhost>
Cc: linux-mtd@lists.infradead.org,
	David Brownell <dbrownell@users.sourceforge.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 03, 2009 at 08:36:05AM +0200, Artem Bityutskiy wrote:
> On Wed, 2009-10-28 at 14:21 +0100, Johannes Stezenbach wrote:
> > spi_write() requires the buffer to be DMA-safe, kmalloc()
> > it seperately to ensure this.
> 
> Even though it is just 4 or 5 bytes it can do DMA? Does not sound too
> sane to use DMA in that case. Does this patch fix a real error?
> 
> I do not know much about SPI, but for me it sounds like there should be
> a method to ask SPI to avoid using DMA, and you should use that method.

It fixes a real error -- with an out-of-tree driver and ancient kernel.
For the flash read/write case it is used with list-DMA (e.g. write 4 bytes,
read 64KB).  There are extensive comments in include/linux/spi/spi.h
which document the DMA-safe requirement of the buffers.

Thanks
Johannes
