Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jif9K-0006AA-Np
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 00:23:51 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jif9H-00074J-QT
	for linux-mtd@lists.infradead.org; Sun, 06 Apr 2008 19:23:48 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jif9D-0007z9-DX
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 10:23:43 +1000
Date: Mon, 7 Apr 2008 10:23:43 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
Message-ID: <20080407002343.GD31499@cloud.net.au>
References: <OF56D7FBB0.A3722ECD-ON88257423.008249AB-88257423.00833E0B@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF56D7FBB0.A3722ECD-ON88257423.008249AB-88257423.00833E0B@selinc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 06, 2008 at 04:53:37PM -0700, Bruce_Leonard@selinc.com wrote:
> Once I do all that I can read/write/copy/delete/etc files just fine on the 
> NAND flash.  So, like I said it appears to be working just fine.  But 
> everything I see on the mailing list seems to be saying I should be using 
> mkfs.ubifs.  But if everything works and I'm mounting the device as a 
> UBIFS filesystem, what (if anything) is mkfs.ubifs going to do for me that 
> I don't already have done?

mkfs.ubifs is for creating a ubifs image pre-populated with files eg
your root file system, similar to mkfs.jffs2, genext2fs, etc. You don't
need it to create a blank file system - in that case, just mount a blank
volume as you are doing now.


cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
