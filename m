Received: from cougar.intrinsyc.com ([209.139.192.225])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qc1s-0006ij-Am
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 01:02:52 +0100
Date: Thu, 12 Jun 2003 17:05:38 -0700 (PDT)
From: Chris <csperandeo@intrinsyc.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0306121704110.1757-100000@intrinsyc.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Reliability of NAND JFFS2 vs YAFFS for Embedded Systems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I was hoping that anyone who had some experience with JFFS2 and YAFFS NAND 
devices could give a good idea of the reliability of both filesystems.  I 
have attempted the JFFS2 filesystem on Toshiba NAND TC58256AFT with some 
success but have encountered CRC errors when rebooting or interrupting 
power 
during writing.

I am considering moving to the YAFFS filesystem due to reliablity 
concerns, 
but I am also wondering if YAFFS will have its own can of worms.  I would 
like to have reliability, performance and space but reliability is the 
most 
important concern. 

Does anyone have experience with testing reliability of both 
configurations?  
If so what were the resutls?

Should I change to YAFFS?  Why?

Or should I stay with JFFS2?  Why?

Thanks,

Chris Sperandeo
