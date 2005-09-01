Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAqta-0006mA-OT
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 11:22:34 -0400
Date: Thu, 1 Sep 2005 17:21:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050901152147.GA4226@wohnheim.fh-wedel.de>
References: <FCB63FA5C6B0BA46A4F6A10096F1C3BB037C0294@exchange01.corp.2wire.com>
	<1125580332.27733.8.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125580332.27733.8.camel@windu.rchland.ibm.com>
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

On Thu, 1 September 2005 08:12:12 -0500, Josh Boyer wrote:
> On Tue, 2005-08-30 at 10:51 -0700, Brian Gunnison wrote:
> > Hi,
> > 
> > I searched the archive (I wish it was all in one list). 
> > 
> > I have a product that may have one or more flash manufacturers. 
> > 
> > I need the manufacturer and device types. i.e. the .name field from amd_flash_info
> 
> Currently there is no way to get this information from userspace.  Most
> likely due to the fact that userspace shouldn't care because that's
> MTD's job, but whatever.
> 
> If you want to get this info from userspace, you could create
> some /sysfs or /proc entries in your mapping driver.  Or patch mtdchar
> to add an ioctl to return that information.

Don't!  Yet another ioctl is exactly the thing that we don't need.

Brian, why should userspace know about the exact type of flash?

Jörn

-- 
/* Keep these two variables together */
int bar;
