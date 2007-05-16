Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoKVP-0005ch-M7
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 10:30:35 -0400
Received: from c220-237-181-46.eburwd3.vic.optusnet.com.au ([220.237.181.46]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1HoKVK-0006Dw-Vx
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 09:29:27 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.67)
	(envelope-from <hamish@cloud.net.au>) id 1HoKVC-0001pk-0E
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 00:29:18 +1000
Date: Thu, 17 May 2007 00:29:17 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: flash partitioning options
Message-ID: <20070516142917.GB5725@cloud.net.au>
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

I'm working on a device which has two flash devices. It'll boot from NOR
flash, which contains RedBoot and the kernel. Then the root file system
and other volumes are in NAND flash.

The boot flash is partitioned with the RedBoot FIS. However I'm
wondering what the best way to partition the other flash is?
As I see it the options are;

- RedBoot, but no tools to manipulate the layout from Linux?
- AFS, but I can't find the tools for that either.
- cmdlinepart, which means hard-coding the layout in the kernel image
  or the boot loader. Probably OK but can't deal with a change in part
  later very easily.
- UBI.

Is UBI overkill? My kernel is a bit old (~2.6.15) so I'm not even sure
if it's feasible. I'm not particularly concerned about wear-leveling
across the whole device (as per my last email it's mostly read-only) so
I don't think I need it otherwise. (Opinions welcome.)


thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
