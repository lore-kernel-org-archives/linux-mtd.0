Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoKOw-00057Q-Np
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 10:22:58 -0400
Received: from c220-237-181-46.eburwd3.vic.optusnet.com.au ([220.237.181.46]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1HoKOu-0006CY-Q7
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 09:22:49 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.67)
	(envelope-from <hamish@cloud.net.au>) id 1HoKOk-0001nY-Gj
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 00:22:38 +1000
Date: Thu, 17 May 2007 00:22:38 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: choice of flash file system for large read-only volume
Message-ID: <20070516142238.GA5725@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I hope end-user questions are ok here. Don't want to distract from
choosing new file systems names etc ;)

On a system I'm developing I'll have a root file system on NAND
flash, which will be read-only in normal use. This file system might be
in the order of 128Mb or 256Mb. (We want to be able to write to it in 
the lab during development, but in production we'll erase/rewrite the 
whole volume).

What would be a good choice of file system for this application? Does it
come down to JFFS2 versus YAFFS, or are there other alternatives?

I understand that JFFS2 mount times are proportional to the size; mount
time isn't critical to me but I would like the system to boot as quickly
as possible. Is YAFFS better in this regard?


thanks,

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
