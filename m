Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvAW1-0005Ij-Ht
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 05:05:28 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DvAVl-0004TT-2O
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 11:05:05 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 11:05:04 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 11:05:04 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 20 Jul 2005 11:03:59 +0200
Message-ID: <dbl42b$hcn$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I guess I'll be touching an old subject with this thread:

I have a "small" NAND device (32MByte) with JFFS2 on top used as the 
root-fs on my system. It's been working like a charm - until just now. 
After (over)writing a relative large file (11 megs uncomp. - 
~3-5compr.), the garbage collector (jffs2_gcd_mtd0) uses 8:45 minutes of 
CPU time (~99%) after booting - blocking any write operations.
Ok, I accept that some GC'ing should be performed when going "beyond the 
edge" - but shouldn't this be a one-time process, so the next time I 
boot this is done with?
I see it everytime I reboot - without touching any files on the system...

I use the mtd source from 2005-03-04...

BR,
  Martin Egholm
