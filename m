Received: from h-66-166-124-218.lsanca54.covad.net ([66.166.124.218]
	helo=sb-exchange1.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALmhG-0005zP-I3
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 16:57:54 +0000
Date: Mon, 17 Nov 2003 08:53:12 -0800
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031117165312.GB13019@rinconnetworks.com>
References: <20031115002533.GA15967@rinconnetworks.com>
	<1068885063.29549.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1068885063.29549.5.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: problem writing to /dev/mtd0
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, I did. It seems to work fine on one of my other dev boards btw. So it
may be that the first board is having issues and it's not the software. I'll
dig some more.

Thanks.

Paul

On Sat, Nov 15, 2003 at 08:31:03AM +0000, David Woodhouse wrote:
> On Fri, 2003-11-14 at 16:25 -0800, Paul van Gool wrote:
> > Hi,
> > 
> > I'm trying to read and write from/to a flash partition using its char
> > device. Reading seems to work fine but I can't seem to get writing  to
> > work.
> 
> > I use this flash chip through its block device all the time and writing
> > through that device (/dev/mtdblock0) hasn't been an issue.
> 
> Did you erase the block in question first?
> 
> -- 
> dwmw2
> 

-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
