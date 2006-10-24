Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GcJR4-00086q-Pn
	for linux-mtd@lists.infradead.org; Tue, 24 Oct 2006 06:23:14 -0400
Date: Tue, 24 Oct 2006 11:02:45 +0100
From: Ben Dooks <ben@fluff.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] MTD: fix printk format warning
Message-ID: <20061024100245.GA21695@home.fluff.org>
References: <20061023214826.d54fc7c6.randy.dunlap@oracle.com>
	<1161681850.3260.167.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1161681850.3260.167.camel@sauron>
Sender: Ben Dooks <ben@fluff.org.uk>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, akpm <akpm@osdl.org>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 24, 2006 at 12:24:10PM +0300, Artem Bityutskiy wrote:
> On Mon, 2006-10-23 at 21:48 -0700, Randy Dunlap wrote:
> > (may be a gcc phenomenon)
> > Fix printk format warning:
> > drivers/mtd/maps/physmap.c:93: warning: long long unsigned int format, long unsigned int arg (arg 2)
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> ... snip ...
> 
> >       	printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
> > -	    (unsigned long long)dev->resource->end - dev->resource->start + 1,
> > +	    (unsigned long long)(dev->resource->end - dev->resource->start + 1),
> >  	    (unsigned long long)dev->resource->start);
> 
> Hmm, AFAIK
> 
> "(unsigned long) dev->resource->end - dev->resource->start + 1" should 

I thought that 'z' was the modifier to %x for resources?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
