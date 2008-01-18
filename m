Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFr4n-0007mI-SV
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 13:16:12 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m0IDG3xA026308
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2008 08:16:03 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m0IDG3P2234290
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2008 08:16:03 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m0IDG2Hx025914
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2008 08:16:02 -0500
Date: Fri, 18 Jan 2008 07:14:05 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: question about node creation /dev/mtd*
Message-ID: <20080118071405.533c2b45@zod.rchland.ibm.com>
In-Reply-To: <1200661002.6934.23.camel@sauron>
References: <479097B7.9050401@gmail.com>
	<20080118064432.19233a37@zod.rchland.ibm.com>
	<1200661002.6934.23.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vicky <vicky.irobot@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 Jan 2008 14:56:42 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Fri, 2008-01-18 at 06:44 -0600, Josh Boyer wrote:
> > On Fri, 18 Jan 2008 17:42:39 +0530
> > vicky <vicky.irobot@gmail.com> wrote:
> > 
> > > Hi,
> > > 
> > > I have enabled mtd in my config. When I boot from the updated kernel I 
> > > find that /dev/mtdblock is not created?
> > > 
> > > How does the /dev/mtdblock get created? I didn't find this in the 
> > > init/rcs script. I am under an impression that once the mtd is enabled 
> > > in the linux
> > > config file the creation of the corresponding node is taken care in some 
> > > script.
> > 
> > You need to either have udev running, or create it manually yourself
> > with mknod (which can be done via a script you write). This is, of
> > course, assuming you have the mtdblock module loaded or compiled into
> > your kernel.
> 
> udev will not help because MTD is not Linux Device Model-enabled, so
> only ancient manual device node creation method may be used. There is a
> MAKEDEV script in mtd-utils.git which may help.

MTD itself isn't, no.  But I thought mtdblock got some of the sysfs
stuff for free because it hooked into the generic block layer?

It's been a while, I could be mistaken.

josh
