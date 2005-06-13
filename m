Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dhnis-0006Ld-Ha
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 08:07:24 -0400
Date: Mon, 13 Jun 2005 14:07:21 +0200
From: Sean Young <sean@mess.org>
To: Joern Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20050613120721.GA26279@atlantis.8hz.com>
References: <20050613104818.GB24387@atlantis.8hz.com>
	<20050613120204.GA30868@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050613120204.GA30868@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: inftl major number
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 13, 2005 at 02:02:04PM +0200, Joern Engel wrote:
> On Mon, 13 June 2005 12:48:18 +0200, Sean Young wrote:
> > diff -u -r1.6 inftl.h
> > --- include/linux/mtd/inftl.h   30 Jun 2004 14:49:00 -0000      1.6
> > +++ include/linux/mtd/inftl.h   13 Jun 2005 10:47:19 -0000
> > @@ -20,7 +20,7 @@
> >  #include <mtd/inftl-user.h>
> > 
> >  #ifndef INFTL_MAJOR
> > -#define INFTL_MAJOR 94
> > +#define INFTL_MAJOR 96
> >  #endif
> >  #define INFTL_PARTN_BITS 4
> 
> Looks sane.  Do you have cvs commit rights?

I do. I'll go ahead and commit unless someone tells me not to.


Sean
