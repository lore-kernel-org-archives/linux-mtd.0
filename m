Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHRv8-0003Ho-II
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 17:58:18 +0000
Date: Wed, 5 Nov 2003 09:56:58 -0800
From: Jun Sun <jsun@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031105095658.B19785@mvista.com>
References: <20031104164431.K16745@mvista.com>
	<1068023691.6065.7.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1068023691.6065.7.camel@hades.cambridge.redhat.com>;
	from dwmw2@infradead.org on Wed, Nov 05, 2003 at 09:14:51AM +0000
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

On Wed, Nov 05, 2003 at 09:14:51AM +0000, David Woodhouse wrote:
> On Tue, 2003-11-04 at 16:44 -0800, Jun Sun wrote:
> > David,
> > 
> > Since you did not give any preference on how board should
> > pass partition info to physmap, I just picked a reasonable
> > one.
> 
> Sorry for the lack of response. Been beating up JFFS2 with LTP and it's
> been, erm, 'interesting'. S'fixed now though :)
> 
> > Is this patch now good enough to apply?  Thanks.
> 
> I'd still prefer to do it without any static variables in physmap.c. 
> 

Hmm, can you be more specific?  Here are all static variables that
matter in physmap.c.  Which ones are you thinking to eliminate?  And in 
what way?  (Assuming you do not mean I just drop "static" modifier...)

static struct mtd_info *mymtd;

static struct mtd_partition *mtd_parts;
static int                   mtd_parts_nb;

static int num_physmap_partitions;
static struct mtd_partition *physmap_partitions;

Jun
