Received: from [216.219.239.237] (helo=www.sensoria.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w6XD-0001wr-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 19:44:19 +0100
Received: from baoha ([209.245.83.145])
	by www.sensoria.com (8.10.2/8.10.2) with SMTP id f9NIlgW31123
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 14:47:42 -0400
From: "Bao C. Ha" <baoha@sensoria.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 destroys CRAMFS!
Date: Tue, 23 Oct 2001 11:52:14 -0700
Message-ID: <014d01c15bf3$d4ff82a0$456c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

We are using RedBoot and have several MTD partitions.
One of the partitions has our minimal CRAMFS.  The
other contains JFFS2.  I made a mistake of compiling
a kernel with jffs2 built-in, but not cramfs.  The
bootup process tells the kernel to mount the cramfs
partition as the root device.  It just goes through 
and erased everything there, then it panics!

This behavior is not consistent with all other Linux
filesystems.  I would like to propose changes to the
designs of jffs2 as follows:

- Only make.jffs2 can create a jffs2 filesystem
- Unless jffs2 detects its MAGIC, it can't make
changes to the MTD partition.

It will save a lot of griefs later.  I know that
there are many work-arounds.  But, I had a mental
block that had refused to believe that a read-only
cramfs can be destroyed that easily.

Thanks.
Bao
