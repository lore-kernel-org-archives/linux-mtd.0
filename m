Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf30q-00019D-Sg
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 01:04:09 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jf30p-0000eu-UO
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 20:04:08 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jf30l-0006S7-9d
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 12:04:03 +1100
Date: Fri, 28 Mar 2008 12:04:03 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: choosing a file system to use on NAND/UBI
Message-ID: <20080328010403.GB23610@cloud.net.au>
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

I'm developing an embedded product which will have its root file system
on NAND. The root will be pre-prepared and installed using
flashcp/nandwrite/ubiupdatevol, and usually mounted read-only.
Occasionally we might want to mount it read/write for debug purposes.

I'm intending to use UBI for volume management and wear-levelling.

JFFS2 on UBI does not seem very fast, in particular mount time and
initial access (until cache is populated). I tried disabling compression
but that seemed to make it worse (mount time was doubled).

Will ubifs on UBI be better? Is it mature enough to use yet?

For static volumes you have UBI protecting you, so you should not need
file-system CRC checking as JFFS2 does, correct? Are there any file
systems which take advantage of this property? 

Would I be better choosing LogFS or YAFFS1/2, perhaps without UBI?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
