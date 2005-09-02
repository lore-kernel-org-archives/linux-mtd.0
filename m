Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EBBEB-0004Iy-6O
	for linux-mtd@lists.infradead.org; Fri, 02 Sep 2005 09:05:16 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j82D53Vo012907
	for <linux-mtd@lists.infradead.org>; Fri, 2 Sep 2005 09:05:03 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j82D53dm045778
	for <linux-mtd@lists.infradead.org>; Fri, 2 Sep 2005 09:05:03 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j82D4v3K024865
	for <linux-mtd@lists.infradead.org>; Fri, 2 Sep 2005 09:04:57 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050901152147.GA4226@wohnheim.fh-wedel.de>
References: <FCB63FA5C6B0BA46A4F6A10096F1C3BB037C0294@exchange01.corp.2wire.com>
	<1125580332.27733.8.camel@windu.rchland.ibm.com>
	<20050901152147.GA4226@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Fri, 02 Sep 2005 08:04:40 -0500
Message-Id: <1125666280.3552.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Brian Gunnison <bgunnison@2wire.com>
Subject: Re: Getting manufacturer id and device ID from user space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-01 at 17:21 +0200, Jörn Engel wrote:
> On Thu, 1 September 2005 08:12:12 -0500, Josh Boyer wrote:
> > On Tue, 2005-08-30 at 10:51 -0700, Brian Gunnison wrote:
> > > Hi,
> > > 
> > > I searched the archive (I wish it was all in one list). 
> > > 
> > > I have a product that may have one or more flash manufacturers. 
> > > 
> > > I need the manufacturer and device types. i.e. the .name field from amd_flash_info
> > 
> > Currently there is no way to get this information from userspace.  Most
> > likely due to the fact that userspace shouldn't care because that's
> > MTD's job, but whatever.
> > 
> > If you want to get this info from userspace, you could create
> > some /sysfs or /proc entries in your mapping driver.  Or patch mtdchar
> > to add an ioctl to return that information.
> 
> Don't!  Yet another ioctl is exactly the thing that we don't need.

I listed the options in the order I prefer ;).  And note that I didn't
say "submit a patch".  I just said "patch".

josh
