Received: from ring.vpop.net ([207.178.248.5])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERj68-00081y-3j
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 00:29:19 -0400
Received: from bilbo.vpop.net (bilbo.vpop.net [70.56.77.194])
	by ring.vpop.net (Postfix) with ESMTP id 9BFCAAFAAD8
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2005 21:28:46 -0700 (PDT)
From: Matthew Reimer <mreimer@vpop.net>
To: linux-mtd@lists.infradead.org
Date: Mon, 17 Oct 2005 21:27:39 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510172127.39342.mreimer@vpop.net>
Subject: mtd_blkdevs.c missing flush_dcache_page()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I came across this post in which RMK says mtd_blkdevs.c is missing a call to 
flush_dcache_page(), patch included:

http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2005-May/029023.html

I suppose not calling flush_dcache_page() could result in file corruption.

Should this patch be applied?

Matt
