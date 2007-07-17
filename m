Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IAkrF-0004uC-MO
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 12:04:47 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6HB5alZ023547
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2007 07:05:36 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l6HB4M3K554598
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2007 07:04:22 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6HB4MWh019672
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2007 07:04:22 -0400
Date: Tue, 17 Jul 2007 06:16:14 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: MTD ABI
Message-ID: <20070717111613.GN3925@crusty.rchland.ibm.com>
References: <469B6E7F.6000704@hyd.hellosoft.com>
	<1184592970.9726.7.camel@weaponx.rchland.ibm.com>
	<loom.20070717T110348-642@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <loom.20070717T110348-642@post.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 17, 2007 at 09:05:35AM +0000, MikeW wrote:
> Josh Boyer <jwboyer <at> linux.vnet.ibm.com> writes:
> 
> > 
> > On Mon, 2007-07-16 at 18:41 +0530, Ranga Raju B wrote:
> > > Hi,
> > >     This question is for curiosity sake. What is MTD ABI? What is the 
> > > expansion of ABI and what is it's significance in MTD. Could anyone give 
> > > me a pointer to this?
> > 
> > ABI stands for 'application binary interface'.  MTD doesn't really have
> > an ABI...  It does have an API, or application programming interface,
> > which can be found on the MTD website.
> > 
> > josh
> 
> and can also be found summarised in <mtd/mtd-user.h> !!

Well, for user<->kernel interaction, yes.  I was referring to the in-kernel
used for new drivers, etc.

josh
