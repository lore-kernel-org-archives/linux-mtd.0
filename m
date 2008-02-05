Received: from outbound.mobilygen.com ([72.166.0.2]
	helo=mailhost.mobilygen.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMVWS-0001ha-C5
	for linux-mtd@lists.infradead.org; Tue, 05 Feb 2008 21:40:14 +0000
Received: from qu062.quarc.com (qu062 [192.168.40.235])
	by mailhost.mobilygen.com (8.13.8/8.13.8) with ESMTP id m15Ldx8l020784
	for <linux-mtd@lists.infradead.org>; Tue, 5 Feb 2008 13:39:59 -0800
Subject: marking a block bad
From: Jeff Hane <jhane@mobilygen.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 05 Feb 2008 13:39:59 -0800
Message-Id: <1202247599.11825.24.camel@qu062.quarc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

 I am using yaffs for my root filesystem and I am getting some ECC
errors for reads and writes.  What I'm trying to understand is what
determines if a block has gone bad when the block is marked bad. I see
the way to mark a block bad in the mtd code but not clear on when this
will be used.
 Of course this leads to another problem, if a block is marked bad and
the system is rebooted the data that was in that block would become
unaccessible(assume the system can reboot).  In this case, is there
something that can be done, by the filesystem or other methods, to try
to re-locate the data before reboot or rebuilding the bbt?

thanks,
jeff
