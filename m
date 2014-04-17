Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Waonk-0007DV-6f
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 16:04:36 +0000
Received: by mail-pa0-f48.google.com with SMTP id hz1so521989pad.35
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 09:04:13 -0700 (PDT)
Date: Thu, 17 Apr 2014 23:57:59 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Message-ID: <20140417155758.GA14819@localhost.localdomain>
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
 <20140416200849.GO3528@book.gsilab.sittig.org>
 <20140417134127.GA3980@localhost.localdomain>
 <20140417155507.GT3528@book.gsilab.sittig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140417155507.GT3528@book.gsilab.sittig.org>
Cc: marex@denx.de, Huang Shijie <b32955@freescale.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 17, 2014 at 05:55:07PM +0200, Gerhard Sittig wrote:
> On Thu, 2014-04-17 at 21:41 +0800, Huang Shijie wrote:
> > 
> > The disassemble code for "int dummy = 8; dummy /= 8;" is:
> > --------------------------------------------------
> >     83a6:	2308      	movs	r3, #8
> >     83a8:	607b      	str	r3, [r7, #4]
> >     83aa:	687b      	ldr	r3, [r7, #4]
> >     83ac:	1dda      	adds	r2, r3, #7
> >     83ae:	2b00      	cmp	r3, #0
> >     83b0:	bfb4      	ite	lt
> >     83b2:	4613      	movlt	r3, r2
> >     83b4:	461b      	movge	r3, r3
> >     83b6:	10db      	asrs	r3, r3, #3
> >     83b8:	607b      	str	r3, [r7, #4]
> > --------------------------------------------------
> > 
> > The disassemble code for "int dummy = 8; dummy >>= 3;" is:
> > --------------------------------------------------
> >     83a6:	2308      	movs	r3, #8
> >     83a8:	607b      	str	r3, [r7, #4]
> >     83aa:	687b      	ldr	r3, [r7, #4]
> >     83ac:	10db      	asrs	r3, r3, #3
> >     83ae:	607b      	str	r3, [r7, #4]
> > --------------------------------------------------
> > 
> > Obviously, the "dummy >>= 3" is faster then "dummy /= 8".
> 
> That is because of signedness.  Both forms of "/= 8" and ">>= 3"
> should be identical to the compiler, and generate the same
> output.  Compilers know that division by powers of two can be
> done with a shift.
> 
> Signedness apparently makes a difference.  If you know that the
> number of clocks always is non-negative, use appropriate data
> types.  Or let the compiler carry out the correct instructions
> for the very data type that was declared.  Pick one, don't
> violate abstractions.
> 
> Counter example, matching the expectation:
> 
> 	unsigned int u_div(unsigned int v) {
> 		return v / 8;
> 	}
> 
> 	unsigned int u_shift(unsigned int v) {
> 		return v >> 3;
> 	}
> 
> 	0000001c <u_div>:
> 	  1c:   e1a001a0        lsr     r0, r0, #3
> 	  20:   e12fff1e        bx      lr
> 
> 	00000024 <u_shift>:
> 	  24:   e1a001a0        lsr     r0, r0, #3
> 	  28:   e12fff1e        bx      lr
> 
> 
> Anyway, source code should be written for humans, as it gets read
> more often than written, and maintenance is hard enough already.
> Try to come up with a text search pattern to catch both the 3 and
> 8 values at the same time.  Or try to easily see how they are the
> same when there is no comment.  Is the code path so hot that
> single instructions count so badly, that the downsides should be
> considered acceptable?
okay.

I will change to "dummy /= 8" in the next version. 

thanks
Huang Shijie
