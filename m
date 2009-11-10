Subject: Re: [PATCH] mtd: m25p80: make command buffer DMA-safe
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johannes Stezenbach <js@sig21.net>
In-Reply-To: <20091103100018.GA20519@sig21.net>
References: <20091028132137.GA17813@sig21.net>
	<1257230165.21596.33.camel@localhost>
	<20091103100018.GA20519@sig21.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Nov 2009 16:54:07 +0200
Message-Id: <1257864847.21596.769.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	David Brownell <dbrownell@users.sourceforge.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 11:00 +0100, Johannes Stezenbach wrote:
> On Tue, Nov 03, 2009 at 08:36:05AM +0200, Artem Bityutskiy wrote:
> > On Wed, 2009-10-28 at 14:21 +0100, Johannes Stezenbach wrote:
> > > spi_write() requires the buffer to be DMA-safe, kmalloc()
> > > it seperately to ensure this.
> > 
> > Even though it is just 4 or 5 bytes it can do DMA? Does not sound too
> > sane to use DMA in that case. Does this patch fix a real error?
> > 
> > I do not know much about SPI, but for me it sounds like there should be
> > a method to ask SPI to avoid using DMA, and you should use that method.
> 
> It fixes a real error -- with an out-of-tree driver and ancient kernel.
> For the flash read/write case it is used with list-DMA (e.g. write 4 bytes,
> read 64KB).  There are extensive comments in include/linux/spi/spi.h
> which document the DMA-safe requirement of the buffers.

Pushed to my l2-mtd-2.6 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
