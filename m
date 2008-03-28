Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf8h1-0001aC-Oz
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 07:08:04 +0000
Date: Fri, 28 Mar 2008 18:07:56 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: mkfs.ubifs: device table support
Message-ID: <20080328070756.GA319@cloud.net.au>
References: <20080328062402.GA31782@cloud.net.au>
	<1206686574.3856.66.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1206686574.3856.66.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Mar 28, 2008 at 08:42:54AM +0200, Artem Bityutskiy wrote:
> On Fri, 2008-03-28 at 17:24 +1100, Hamish Moffatt wrote:
> > Are there any plans to add support for a device table in mkfs.ubifs,
> > similar to mkfs.jffs2, genext2fs etc?
> 
> Not sure what is this for actually :-) Could you please elaborate?

You provide a list of device nodes that you want to be included in the
created image, but you don't need to actually create them on your host
file system so you don't need to be root. They are just added to the
image automatically by mkfs.jffs2 etc.

Here's an example table from buildroot:

# Normal system devices
#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
/dev/mem	c	640	0	0	1	1	0	0	-
/dev/kmem	c	640	0	0	1	2	0	0	-
/dev/null	c	666	0	0	1	3	0	0	-
/dev/zero	c	666	0	0	1	5	0	0	-
/dev/random	c	666	0	0	1	8	0	0	-
/dev/urandom	c	666	0	0	1	9	0	0	-
/dev/ram	b	640	0	0	1	1	0	0	-
/dev/ram	b	640	0	0	1	0	0	1	4
/dev/loop	b	640	0	0	7	0	0	1	2
[snip]

The last entry for example creates /dev/loop0 through /dev/loop7.

> I glanced at mkfs.jffs2.c it does not look difficult, so we may
> implement it if you need - no problem.

That would be very useful for me and for buildroot, which uses that option 
on genext2fs and mkfs.jffs2.

thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
