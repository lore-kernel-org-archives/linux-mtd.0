Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhdIU-0001ny-Mm
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 04:13:02 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1JhdIP-0004rN-EK
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 23:12:57 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1JhdIK-0000vW-67
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 15:12:52 +1100
Date: Fri, 4 Apr 2008 15:12:52 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: can't mount ubifs on volume smaller than 265 LEBs/32MiB
Message-ID: <20080404041251.GA2752@cloud.net.au>
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

I need a ubifs on a small volume (around 16MiB or less) but I've found
that I can't get the volume to mount if it's that small.

With a LEB size of 126kb, any file system < 265 LEBs won't mount,
failing in validate_sb.

# ubimkvol /dev/ubi0 -N config -S 264
Volume ID 2, size 264 LEBs (34062336 bytes, 32.5 MiB), LEB size 129024 bytes (126.0 KiB), dynamic, name "config", alignment 1
# mount /rw
mount: mounting ubi0:config on /rw failed: Invalid argument

# dmesg
[...]
[ 1191.360000] UBIFS error (pid 2804): validate_sb: bad superblock

# ubirmvol /dev/ubi0 -n 2
# ubimkvol /dev/ubi0 -N config -S 265
Volume ID 2, size 265 LEBs (34191360 bytes, 32.6 MiB), LEB size 129024 bytes (126.0 KiB), dynamic, name "config", alignment 1
# mount /rw

My ubifs is about 1 week old from git.

Thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
