Received: from ns1.spewey.com ([64.170.22.140])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D4Ud-0006GU-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 14:27:31 +0100
Message-Id: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>
Date: Thu, 21 Jun 2001 08:43:45 -0500
To: Abraham vd Merwe <abraham@2d3d.co.za>,
 MTD for Linux <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: safe flash filesystem
In-Reply-To: <20010621125458.A23785@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

>
>We're developing a product that needs a small part of the flash memory to
>contain a very scaled down file system containing configuration files. This
>file system have to be extremely reliable. Speed is not an issue, but the
>validity of any data written to it is of utmost importance.
>
>So before I go reinvent the wheel, I'd like to know if there's something
>which already does this, i.e. does things like keep duplicate copies of
>everything around, have all sorts of checks and balances to check for
>damaged parts of the flash, no caching and some sort of wear levelling, etc?

Normally you could just use a "small" JFFS2 partition- or even a "full" JFFS2
partition with just your config database file on it.

HOWEVER, at this time JFFS2 is NOT power fail "roll back and recover" safe-
even for write()'s less than PAGE_SIZE.

Read gory details at:
JFFS: A practical guide at:
http://www.embeddedlinuxworks.com/articles/jffs_guide.html

There is another very serious problem with JFFS(2). IT may block read write
accesses for 10's of seconds while it GC's- specially on a new full fs.
(watch for a new article on read/write latencies on periodic tasks 
reading/writing
from/to a JFFS fs very soon).

In my opinion a "small" embedded power fail safe database utility is
needed that would solve the power fail issue as well as provide caching
support for read/write with a read/write log on another (separate) device 
to get around the latency problems.

I have started a project to define the features required for this. Please 
read details at:
http://www.embeddedlinuxworks.com/articles/db_project.html

I need the same thing for my project. I am sure there are others out there 
that need
this capability for their embedded systems. It would be nice if all could 
collaborate and come
up with an open source software that addresses this need.

Regards,

Vipin
