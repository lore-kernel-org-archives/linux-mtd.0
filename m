Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHPay-0004lD-CW
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 19:15:17 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1EJDRYA029641
	for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2007 14:13:27 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1EJDRXU541568
	for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2007 12:13:27 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1EJDRju019761
	for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2007 12:13:27 -0700
Subject: Re: P30 flash left in read status mode after a write
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <45D35A6F.3060203@ringle.org>
References: <45D35A6F.3060203@ringle.org>
Content-Type: text/plain
Date: Wed, 14 Feb 2007 13:14:30 -0600
Message-Id: <1171480470.4003.112.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-14 at 13:52 -0500, Jon Ringle wrote:
> Hi,
> 
> We have a hardware architecture with a IXP455 processor that allows read 
> access to a P30 flash attached to the IXP's expansion bus from a Pentium 
> M that does it's access via the PCI bus. The flash has 4 partitions: 
> Redboot, jffs2, fconfig, fis. I am running Linux 2.6.16.29 and I've 
> found that whenever a write is done to the jffs2 filesystem that flash 
> is left in read status mode and anything trying to do a read of flash 
> directly reads only 0x0080. Reading from an mtd device seems to fix the 

Yes.

> This did indeed seem to fix the problem, but I'm not sure if I might 
> inadvertently be causing some side effect. I believe that I might be 
> taking a slight performance hit to consecutive jffs2 write operations 
> because now each write operation will need to spend more cycles putting 
> the flash in to a write mode.

You're probably better off changing the driver to put the chip back in
read mode after directly from the write function.  You will, as you
correctly pointed out, incur a performance hit to consecutive JFFS2
writes.

Of course, I don't really see a problem here to being with though.
Doing the reads and writes through the MTD layer (which JFFS2 does)
should all work just fine.  Unless you're trying to access the flash via
something other than MTD.  If so, that is likely going to be racy.

josh
