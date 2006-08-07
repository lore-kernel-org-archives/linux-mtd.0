Received: from fitch1.uni2.net ([130.227.52.101])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GA0Kn-0003lD-Aq
	for linux-mtd@lists.infradead.org; Mon, 07 Aug 2006 04:19:41 -0400
Received: from [130.228.251.10] (unknown [130.228.251.10])
	by fitch1.uni2.net (Postfix) with SMTP id 7EC521291526
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Aug 2006 09:56:25 +0200 (CEST)
From: KimM <kmnet1@gmail.com>
Subject: JFFS2 Garbage collector on 2.6.16
Date: Mon, 07 Aug 2006 09:56:25 +0200
Message-Id: <pan.2006.08.07.07.56.24.475480@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I have a question regarding the JFFS2 garbage collector.

On my AT91RM9200 system I have a 22 MB JFFS2 RW partition. The mount time
is OK, but the problem is that the garbage collector starts to run and
locks down the system for additional 60-120 seconds!

What happens is:

The System boots
busybox init rcS runs
/ is remounted RW
I get a login prompt
The garbage collector starts/continues to runs I type in login and
password
The system stalls until the garbage collector finishes.
 
Now, I traced the problem and found that the long runtime of the garbage
collector is causes by a few large files on my system (~6MB). While the GC
process the inodes of any single file, the FS is locked, which is why my
user apps stalls. More specifically, JFFS2 spends it's time in:

jffs2_do_read_inode_internal()

which is called from:
jjffs2_garbage_collect_pass() ->
ffs2_do_crccheck_inode() ->
jffs2_do_read_inode_internal()

Reading the README.Locking explains the GC locking, but I was wondering if
this is really desired behaviour, and if there is anything I can do to
speed up things. I am not brave enough to just change the locking
mechanism...;-)

I should mention that I get the same behaviour on 2.6.17.6...

BTW: what is the correct mail list for strictly JFFS2 related topics? I
tried jffs-dev@axis.com & linux.file-systems.jffs@gmane.org without
success...

BR
Kim
