Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19K2If-0002Ou-SN
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 21:41:01 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19K2HR-0006kd-00
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 22:39:45 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Sun, 25 May 2003 13:41:45 -0700
Message-ID: <m3brxqzrli.fsf@bfnet.com>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: v1.38  "mkfs.jffs2 --pad"  goes overboard
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Why is mkfs.jffs2 generating a larger file than I want?

  # /sbin/mkfs.jffs2 --version
  mkfs.jffs2: revision 1.38

  # /sbin/mkfs.jffs2 --pad=10485760 --little-endian --squash -e 16384 -d root -o jffs2.dat
  # ls -al jffs2.dat
  -rw-r--r--    1 root     root     10551296 May 25 13:36 jffs2.dat
  # 

My partition is only 10MB.  That's (1024*1024*10) = 10485760 bytes.
It is divisible by the 16k erase block.  So why does mkfs.jffs2 insist
on writing 65536 more bytes than I want?  Am I doing something wrong
or is this a bug?

Dave
