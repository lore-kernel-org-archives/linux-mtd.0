Received: from sccimhc02.asp.att.net ([63.240.76.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDnwo-00034i-FF
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 18:13:15 +0100
From: jmrobert5@mchsi.com
To: linux-mtd@lists.infradead.org
Date: Wed, 14 Apr 2004 17:12:57 +0000
Message-Id: <041420041712.17158.34@mchsi.com>
Subject: Losing inodes in DOC2000 w/ext2 fs?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have been having an issue with a ext2 fs on a DOC2000.  If I overwrite a file
being marked as used by a process (such as a lib), the file is cached and then
later flushed at a reboot.  But then there are many unused inodes hanging
around.  The result is my flash upgrades leave many inodes marked as being used,
using more space.

Is this another effect that is talked about in the FAQ?  Or the real question,
is this a file system issue, or an MTD doc driver issue?  The FAQ leads me to
believe its a ext2 issue.

Will using JFFS2 solve this problem?

Many thanks,
--
Joe Robertson
jmrobert5@mchsi.com
