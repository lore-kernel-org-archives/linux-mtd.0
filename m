Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jxykt-0004Ym-VK
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 06:21:56 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jxykr-0005zH-Jl
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 01:21:53 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jxykn-0004Kf-4Q
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 16:21:49 +1000
Date: Mon, 19 May 2008 16:21:49 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: ext2 for read-only file system on UBI
Message-ID: <20080519062149.GA16462@cloud.net.au>
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

My embedded device has a read-only root file system which is only
replaced by writing a whole image (dd, flashcp, ubiupdatevol etc).

Using gluebi and mtdblock, I think I can put a traditional block file
system (eg ext2) on top of NAND flash. What are the disadvantages of
this? (For the read-only application only.)

Background: I've got older hardware which uses ext2 on top of compact
flash in IDE mode, and new hardware which has replaced the compact flash
with NAND. I'd like to share an ext2 image between the two if possible.

The read-write file systems use ubifs. I'm only considering this for the
read-only volumes. One obvious disadvantage is lack of compression. Are
there others? Do I still get the reliability of ubi? 

ie what does "UBI is not an FTL" mean in practice?

thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
