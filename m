Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O5PuS-00066v-U3
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 20:55:37 +0000
Date: Fri, 23 Apr 2010 22:55:19 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [Patch] Catch filesystems lacking s_bdi
Message-ID: <20100423205518.GB7008@logfs.org>
References: <20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
	<20100422055448.GA27309@logfs.org>
	<20100422062631.GC27309@logfs.org>
	<alpine.LFD.2.00.1004220724170.9086@i5.linux-foundation.org>
	<alpine.LFD.2.00.1004220730280.9086@i5.linux-foundation.org>
	<20100422162709.GJ27497@kernel.dk>
	<20100422203358.GB30749@logfs.org>
	<20100423100532.GN27497@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100423100532.GN27497@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 April 2010 12:05:32 +0200, Jens Axboe wrote:
> 
> So it's probably safe and good enough as-is, I'll add it. Thanks!

I cannot see this patch in your tree yet.  Could be the weekend or a
deliberate decision not to send this for 2.6.34-rc anymore.

In case it was a deliberate decision, can we please make it explicit?  I
don't like the idea of adding a BUG_ON() that potentially triggers for
thousands of people this late in the stabilization process - but it is
better than having people lose data.  Even if we already ran two stable
kernels that way.

Damned if you do, damned if you don't. :(

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
