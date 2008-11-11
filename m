Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kzxf4-0004rD-Jl
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 18:08:22 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	mABI8Kv7010105
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2008 10:08:20 -0800
To: linux-mtd@lists.infradead.org
Subject: MTD/flash perfomance statistics
MIME-Version: 1.0
Message-ID: <OF05EC4818.8CEEBBD5-ON882574FE.00634AE0-882574FE.0063997B@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 11 Nov 2008 10:08:17 -0800
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We're using UBIFS/UBI/MTD/NAND and we want to find out how much of our 
time is spent accessing the flash.  Are there any tools or is there any 
code in that chain that collects any sort of statistics on flash 
performace/utilization?  I could do something as crude as a counter in my 
NAND driver, but if there's anything more sophisticated that I can just 
"use out of the box" so to speak that would be better.  Thanks.

Bruce
