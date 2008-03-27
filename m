Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JemBK-0002j9-GO
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 07:05:50 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1JemBG-0003n2-O6
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 02:05:47 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1JemBB-0002lJ-Ml
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 18:05:41 +1100
Date: Thu, 27 Mar 2008 18:05:41 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: corrupted ubi after reboot while busy
Message-ID: <20080327070541.GA10446@cloud.net.au>
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

I'm trying UBI for the first time; I have the kernel 2.6.24 with UBI
backported from 2.6.25-rc7.

I created a static volume (on NAND) and wrote a JFFS2 image to it with 
ubiupdatevol. mount succeeded, but the image was built wrongly so the
jffs2 garbage collector thread to fix it. I then rebooted the system
while this was running (using a proper reboot, which succeeded).

After rebooting, I can't attach the UBI volume at all:

Jan  1 00:16:34 elaraboot user.err kernel: [  994.310000] UBI error: validate_vid_hdr: inconsistent VID header at PEB 664                         
Jan  1 00:16:34 elaraboot user.err kernel: [  994.320000] UBI error: cannot attach mtd7                                                           
Jan  1 00:16:34 elaraboot user.err kernel: [  994.320000] UBI error: cannot initialize UBI, error -22 

I don't understand how a corrupt volume can cause the whole UBI to be
unusable?

As an aside, is a static volume not read-only?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
