Received: from rcmenter.iserver.net ([192.41.35.12])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1583Ny-0007l6-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 18:15:54 +0100
Subject: Re: HELP
From: Russ Dill <Russ.Dill@asu.edu>
To: MTD for Linux <linux-mtd@lists.infradead.org>
In-Reply-To: <23825.991907052@redhat.com>
References: <20010607114319.A23641@crystal.2d3d.co.za>
	<20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com>
	<23825.991907052@redhat.com>
Content-Type: text/plain
Date: 07 Jun 2001 10:21:06 -0700
Message-Id: <991934470.27485.0.camel@timmy>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 07 Jun 2001 10:44:12 +0100, David Woodhouse wrote:
> 
> abraham@2d3d.co.za said:
> >  why is this necessary though? The kernel docs make it pretty clear
> > that enabling that causes severe performance penalties which I wanted
> > to avoid. 
> 
> Then fix the kernel docs. :)

I already tried feeding rmk such a patch. The unaligned handly only
impacts performance when there is an unaligned read. So for you, its
good you now know and are working around this. However, some drivers
*cough*jffs2*cough* will make unaligned reads from time to time, but
only rarely. In this case, the handler speeds things up by doing the
access, instead of producing an oops.
