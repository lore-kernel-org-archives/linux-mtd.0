Received: from ring.vpop.net ([207.178.248.5])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DHPwV-0002fL-19
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2005 12:28:23 -0500
From: Matthew Reimer <mreimer@vpop.net>
To: tglx@linutronix.de
Date: Fri, 1 Apr 2005 09:27:47 -0800
References: <424B4FFA.7050906@joshuawise.com>
	<200503311029.46475.mreimer@vpop.net>
	<1112343814.4228.79.camel@tglx.tec.linutronix.de>
In-Reply-To: <1112343814.4228.79.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200504010927.47300.mreimer@vpop.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: oobavail issues
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 01 April 2005 12:23 am, Thomas Gleixner wrote:
> On Thu, 2005-03-31 at 10:29 -0800, Matthew Reimer wrote:
> > > I will fix this. But I still wonder why you hit this problem with
> > > JFFS2. JFFS2 does not provide a filesystem buffer for oob data, so the
> > > memcpy in nand_prepare_oobbuf is never invoked.
> >
> > IIRC it wasn't jffs2 but the MTD_WRITEECC() we were doing to write a
> > kernel to a partition, which we had to do in preparation for mounting
> > jffs2. Sorry for the confusion.
>
> Ok. Fixed in CVS. Thanks for pointing this out.

Thanks, looks good!

Matt
