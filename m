Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19K2QK-0002UZ-Kn
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 21:48:56 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19K2Ok-0007YN-00
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 22:47:18 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Sun, 25 May 2003 13:48:42 -0700
Message-ID: <m37k8ezr9x.fsf@bfnet.com>
References: <m3brxqzrli.fsf@bfnet.com>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: v1.38  "mkfs.jffs2 --pad"  goes overboard
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Never mind.  My root dir had more than 10MB in it because I forgot to
strip some files.  Sorry.

Me> Why is mkfs.jffs2 generating a larger file than I want?
Me>   # /sbin/mkfs.jffs2 --version
Me>   mkfs.jffs2: revision 1.38

Me>   # /sbin/mkfs.jffs2 --pad=10485760 --little-endian --squash -e 16384 -d root -o jffs2.dat
Me>   # ls -al jffs2.dat
Me>   -rw-r--r--    1 root     root     10551296 May 25 13:36 jffs2.dat
Me>   # 

Me> My partition is only 10MB.  That's (1024*1024*10) = 10485760 bytes.
Me> It is divisible by the 16k erase block.  So why does mkfs.jffs2 insist
Me> on writing 65536 more bytes than I want?  Am I doing something wrong
Me> or is this a bug?
