Received: from [80.120.128.82] (helo=hofr.at)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Wea1-0004Zf-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 15:26:49 +0000
Received: (from root@localhost)
	by hofr.at (8.10.2/Hofrat's Mail Service V2.2.8bet6-test1) id h09FxWL31780
	for linux-mtd@lists.infradead.org; Thu, 9 Jan 2003 16:59:32 +0100
From: Der Herr Hofrat <der.herr@mail.hofr.at>
Message-Id: <200301091559.h09FxWL31780@hofr.at>
Subject: mtdram from todays CVS
To: linux-mtd@lists.infradead.org
Date: Thu, 9 Jan 2003 16:59:31 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

HI !

 just pulled todays CVS compiled it and loaded mtdcore.o and mtdram.o 
 then mtdblock.o and made a minix filesystem on /dev/mtdblock0 - all
 goes fine - mounted the filesystem, unmaounted it again - removed 
 mtdblock0 and when I tried to remove mtdram it tels me the device
 is busy

Module                  Size  Used by
mtdram                  2068   2 
mtdcore                 2052   1  [mtdram]
de4x5                  41104   1  (autoclean)

 The modules usage count is also incorect after this operation. Kernel is
 2.4.19 (rtlinux patch applied other than that vanilla kernel from kernel.org)

 have not tested to see if this happens on other boxes yet - has anybody had 
 any problems with mtdram in the current CVS ??

thx !
hofrat
