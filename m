Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD0Uq-0005ie-Q4
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 17:47:45 +0000
From: David Brownell <david-b@pacbell.net>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] MTD: fix dataflash 64-bit divisions
Date: Wed, 17 Dec 2008 09:47:38 -0800
References: <1229532627.17960.37.camel@sauron>
	<alpine.LFD.2.00.0812171205290.30035@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.0812171205290.30035@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812170947.38709.david-b@pacbell.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 17 December 2008, Nicolas Pitre wrote:
> On Wed, 17 Dec 2008, Artem Bityutskiy wrote:
> 
> > -	if ((instr->addr + instr->len) > mtd->size
> > -			|| (instr->len % priv->page_size) != 0
> > -			|| (instr->addr % priv->page_size) != 0)
> > +	if (instr->addr + instr->len > mtd->size)
> > +		return -EINVAL;
> > +	tmp = instr->len;
> > +	if (do_div(tmp, priv->page_size))
> > +		return -EINVAL;
> > +	tmp = instr->addr;
> > +	if (do_div(tmp, priv->page_size))
> >  		return -EINVAL;
> 
> Is it possible to have priv->page_size not a power of two?

Yes, and in fact it's probably more common to have some
extra bytes at the end of a page.  See the table right
before dataflash_probe(); the one before jedec_probe()
lists parts that can be made to use binary page sizes.

If these were NAND chips you'd think of it as OOB area ...
except it's addressible the normal way.  In particular,
the common "read all bytes starting at page N" operation
include those extra bytes.  And you *do* want to use
those primitives, to avoid a roundtrip over SPI for each
1056 or 528 (etc) page.
