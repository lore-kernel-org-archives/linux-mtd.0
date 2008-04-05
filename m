Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhyLb-0005WU-88
	for linux-mtd@lists.infradead.org; Sat, 05 Apr 2008 02:41:39 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] jffs2 summary allocation
Date: Fri, 4 Apr 2008 19:41:34 -0700
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<9c9fda240804041829r5a768b39n340926485aa12687@mail.gmail.com>
	<20080404184615.deaf3122.akpm@linux-foundation.org>
In-Reply-To: <20080404184615.deaf3122.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804041941.35075.david-b@pacbell.net>
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

On Friday 04 April 2008, Andrew Morton wrote:
> This problem comes up pretty often. 

Which problem -- kmalloc(BIG)?  Or dma(dma-unsafe-mem)?
Or something else?

The specific issue here might best be described as JFFS2
making a bad assumption:  that MTD drivers never use DMA.
The I2C stack does that in some cases (for example, I/O
buffers in i2c_smbus_xfer_emulated are on-stack), but I'd
not call that an especially common assumption.


> Rather than open-coding it yet again 
> it'd be nice to have a little bit of library code which manages an array of
> pages and which has accessors for common operations like
> read/write-u8/u16/u32/u64, memset, memcpy, etc.

If array-of-pages is to be more widely adopted, that'd
make sense.  The MTD framework is a bit odd in that
respect ... it has block devices but doesn't use the
scatterlist primitives.

- Dave
