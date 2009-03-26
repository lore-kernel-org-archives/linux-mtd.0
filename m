Received: from risingsoftware.com ([207.192.70.63]
	helo=li32-63.members.linode.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lmhwc-0004Bs-OA
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 05:16:05 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au) by li32-63.members.linode.com with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Lmhw0-00032d-Ja
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 01:15:20 -0400
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Lmhvo-0001K5-Of
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 16:15:08 +1100
Date: Thu, 26 Mar 2009 16:15:08 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: ubifs version 1 compatibility
Message-ID: <20090326051508.GA4760@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem and all,

I'm upgrading my embedded system which uses UBIFS from 2.6.24 (with a
slightly updated ubifs) to 2.6.29.

I notice that the new kernel won't read my existing file systems as it
says they are too old - version 1. The code checks for version 3 or 4 I
see.

My application firmware is generated with mkfs.ubifs and programmed via
ubiupdatevol, but the boot loader on my devices is based on the older
kernel and won't be able to read it. And I have read-write file systems
that will be formatted with the old version too.


Is there any solution?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
