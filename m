Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOQSK-0002uR-Bt
	for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2003 23:49:24 +0000
Date: Mon, 24 Nov 2003 21:35:52 +0100
From: lanas@t-online.de (lanas)
To: linux-mtd@lists.infradead.org
Message-Id: <20031124213552.5357c92a.lanas@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: DoC newbie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

  I have a few questions about a Disk-On-Chip 2000 and its possibilities
ans integration.

  Is it possible to boot from such a device ?

  What I did up to now is to get the device recognized as /dev/ntfla. 
So I did a fdisk on this, created a bootable partition, and formatted it
ext2.  Ans then I mount it and I can copy files to it.  I tried to run a
basic and recent lilo with device being /dev/ntfla bit lilo got lost
somewhere.  Anyhow I understand that using jffs2 would be a much better
choice to leverage the wear on the chip.  Where can i find complete and
recent instructions for using the jffs2 with kernel 2.4.20, as well as
the utilities needed such as mkjffs2 (or some such) ?

  Ah, did I damaged anything in the DoC by formatting it using ext2 ? 
Do I simply have to reformat it using the jffs2 formatting utility (much
in the same way as mke2fs) ?

  Any hint and comments appreciated,

Cheers,

Al
