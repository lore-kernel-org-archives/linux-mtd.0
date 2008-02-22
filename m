Subject: Re: [MTD/NAND] Blackfin NFC driver DMA bug ?
From: David Woodhouse <dwmw2@infradead.org>
To: Bryan Wu <cooloney@kernel.org>
In-Reply-To: <386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
References: <loom.20080221T171743-57@post.gmane.org>
	<386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Feb 2008 16:05:08 +0900
Message-Id: <1203663909.5771.26.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-02-22 at 10:52 +0800, Bryan Wu wrote:
> Oh, I am not fully understand your concern.  The code is invalidating
> or flushing buf before DMA operation.
> And invalidate and flush operation is OK for buf which is not
> cache-aligned on Blackfin arch. it also should be
> OK for other arch.

The problem occurs when your buffer is not aligned at the beginning of a
cache line. If there is other data on the _same_ cache line as your
buffer, and you invalidate the cache, then you may cause data loss
outside the buffer.

Also, in some systems you must make sure that allocations to be used for
DMA are from a certain memory pool.

As for the original question... I'm not sure. At the moment I don't
believe it's true that all such buffers are suitable for DMA. Perhaps it
would be sensible for us to redefine the MTD API so that it is required
(and fix the users).

For a long time, flash I/O was always done by the CPU instead of DMA, so
it wasn't an interesting question. I did start wondering when I
implemented support for the CAFÉ controller on OLPC, but then that
turned out to need bounce buffers anyway so it escaped my attention
again.

-- 
dwmw2
