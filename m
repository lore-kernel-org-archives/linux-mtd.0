Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHpWk-0007IF-97
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 19:10:42 +0000
Date: Thu, 6 Nov 2003 11:09:21 -0800
From: Jun Sun <jsun@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031106110921.G19785@mvista.com>
References: <20031104164431.K16745@mvista.com>
	<1068023691.6065.7.camel@hades.cambridge.redhat.com>
	<20031105095658.B19785@mvista.com>
	<1068112207.6065.455.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1068112207.6065.455.camel@hades.cambridge.redhat.com>;
	from dwmw2@infradead.org on Thu, Nov 06, 2003 at 09:50:07AM +0000
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time configure and
	partitioning (take 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2003 at 09:50:07AM +0000, David Woodhouse wrote:
> On Wed, 2003-11-05 at 09:56 -0800, Jun Sun wrote:
> > Hmm, can you be more specific?  Here are all static variables that
> > matter in physmap.c.  Which ones are you thinking to eliminate?  And in 
> > what way?  (Assuming you do not mean I just drop "static" modifier...)
> 
> I mean mymtd, in particular. 
> 

Can you explain how to eliminate that?

All mapping drivers keep a static pointer to remember the mtd info
it discovers so that it can free it later.  Are you suggesting
we get rid of the exit function and we don't free it?


Jun
