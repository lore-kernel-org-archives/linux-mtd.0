Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf80e-0007qF-In
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 06:24:17 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jf80U-00020P-Sf
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 01:24:14 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jf80Q-0008Ja-69
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 17:24:02 +1100
Date: Fri, 28 Mar 2008 17:24:02 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: mkfs.ubifs: device table support
Message-ID: <20080328062402.GA31782@cloud.net.au>
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

Hi Artem and all,

Are there any plans to add support for a device table in mkfs.ubifs,
similar to mkfs.jffs2, genext2fs etc?

Otherwise the image must be made as root or using fakeroot I think.


Thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
