Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IpAx-0007fK-9v
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 13:28:03 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=localhost)
	by imladris.demon.co.uk with esmtp (Exim 4.14)
	id 19IpBI-0007BL-Jz
	for linux-mtd@lists.infradead.org; Thu, 22 May 2003 13:28:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Message-Id: <1053606504.21582.153.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 22 May 2003 13:28:24 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Call for testing.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've just had a bit of a spring clean...

 - rewritten the locking around MTD device registration/deregistration,

 - revamped the map drivers so that simple linear mappings no longer
   need out-of-line functions to access the chip and so that XIP is a
   little more feasible,

 - taken out all the horrid Linux blkdev crap from FTL,NFTL and
   mtdblock, replacing it with a library which creates the kernel thread
   for them and does all the relevant partitioning and block request
   queue crap for 2.4 and 2.5

 - Fixed all the makefiles for out-of-tree build in 2.5

 - Cleaned up include files

 - Removed support for ancient (older than about 2.4.10 I think) kernels
   from compatmac.h. You should still be able to make it work by using
   and older compatmac.h -- I just don't want to know about it :)

It all seems to be working for me in 2.4 and 2.5, and I'm intending to
send it Linuswards soon, and probably to Marcelo for 2.4.22-pre1 too if
that goes well. So let me know if you can break it :)

I still need to fix the DiskOnChip and NFTL drivers to stop abusing the
mtd->read_ecc API, and double-check JFFS2 is still building and working
in 2.5.current, but that's about it, I think.

-- 
dwmw2
