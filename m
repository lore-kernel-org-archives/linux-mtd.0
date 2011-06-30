Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcDQ2-0006cA-5j
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 09:20:20 +0000
Date: Thu, 30 Jun 2011 10:19:51 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: OneNAND: samsung: Write DMA support
Message-ID: <20110630091951.GQ21898@n2100.arm.linux.org.uk>
References: <20110608101804.GA5527@july> <1309420530.23597.153.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1309420530.23597.153.camel@sauron>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Kyungmin Park <kmpark@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 30, 2011 at 10:55:25AM +0300, Artem Bityutskiy wrote:
> > +	/* Handle vmalloc address */
> > +	if (buf >= high_memory) {
> > +		struct page *page;
> 
> OK, Russell will yell at this, but we do DMA vmalloc'ed addresses for

I most certainly will, because its broken.

> > +
> > +		if (((size_t) buf & PAGE_MASK) !=
> > +		    ((size_t) (buf + count - 1) & PAGE_MASK))
> 
> Something is fishy with these size_t casts, could you revisit this piece
> of code - and turn it to something simpler, if possible?
> 
> > +			goto normal;
> > +
> > +		page = vmalloc_to_page(buf);
> > +		if (unlikely(!page))
> > +			goto normal;
> > +
> > +		/* Page offset */
> > +		ofs = ((size_t) buf & ~PAGE_MASK);
> > +		page_dma = 1;
> > +
> > +		/* DMA routine */
> > +		dma_src = dma_map_page(dev, page, ofs, count, DMA_TO_DEVICE);

Which is that this code is trying to work around the restriction in the
DMA API that dma_map_single() can only take virtual addresses in the
kernel direct mapped region.

The key thing here is that with CPUs which lookup by virtual address,
like ARMs, you _must_ handle the cache aliases associated with the mapping
which you are accessing the memory via.

This means if you are accessing a DMA buffer at address X, and address X
is cacheable, address X needs cache maintainence performed on it.  Address
Y, which may correspond with the same memory as X through a different
mapping is no good.  It has to be X.

However, there is NO API for mapping DMA buffers from vmalloc space.
What we do now have are a pair of functions which must be used _correctly_
(iow, one before and one after) to ensure that virtual cached architectures
can access the data correctly - and its documented at the bottom of
cachetlb.txt.

As this is something which keeps coming up in connection with MTD, it
may be a good idea if MTD gave driver authors a helping hand with DMA
setup/teardown so that the chances of driver authors getting this right
is greater...
