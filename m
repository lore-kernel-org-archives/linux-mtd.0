Received: from brick.kernel.dk ([93.163.65.50] helo=kernel.dk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LfZdM-0006CB-C0
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 12:58:39 +0000
Date: Fri, 6 Mar 2009 13:58:32 +0100
From: Jens Axboe <jens.axboe@oracle.com>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH/RFC] ps3/block: Add ps3vram-ng driver for accessing
	video     RAM as block device
Message-ID: <20090306125832.GX11787@kernel.dk>
References: <alpine.LRH.2.00.0903041444300.32279@vixen.sonytel.be>
	<20090305083701.GQ11787@kernel.dk>
	<alpine.LRH.2.00.0903051146440.2618@vixen.sonytel.be>
	<20090305110940.GY11787@kernel.dk>
	<alpine.LRH.2.00.0903051325450.2618@vixen.sonytel.be>
	<20090306074639.GN11787@kernel.dk>
	<alpine.LRH.2.00.0903061347360.16809@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.0903061347360.16809@vixen.sonytel.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoffrey.levand@am.sony.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, Linux/PPC Development <linuxppc-dev@ozlabs.org>,
	linux-mtd@lists.infradead.org,
	Vivien Chappelier <vivien.chappelier@free.fr>,
	David Woodhouse <dwmw2@infradead.org>,
	Cell Broadband Engine OSS Development <cbe-oss-dev@ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 06 2009, Geert Uytterhoeven wrote:
> On Fri, 6 Mar 2009, Jens Axboe wrote:
> > On Thu, Mar 05 2009, Geert Uytterhoeven wrote:
> > > But then I noticed ps3vram_make_request() may be called concurrently,
> > > so I had to add a mutex to avoid data corruption. This slows the
> > > driver down, and in the end, the version with a thread turns out to be
> > > ca. 1% faster. The version without a thread is about 50 lines less
> > > code, though.
> >
> > That is correct, ->make_request_fn may get reentered. I'm not surprised
> > that performance dropped if you just shoved everything under a mutex.
> > You could be a little more smart and queue concurrent bio's for
> > processing when the current one is complete though, there are several
> > approaches there that be a lot faster than going all the way through the
> > IO stack and scheduler just to avoid concurrency.
> 
> Yes, using a spinlock and queueing requests on a list if the driver is
> busy can be done after 2.6.29...

Certainly. Even just replacing your current mutex with a spinlock during
the memcpy() would surely be a lot faster. Or even just grabbing the
mutex before calling into the write for the duration of the bio. The way
you do it is certain context switch death :-)


-- 
Jens Axboe
