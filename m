Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sJZP-0005Ul-4B
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 10:59:59 +0100
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19sJZg-0007zT-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 12:00:16 +0200
To: linux-mtd@lists.infradead.org
From: "John Hall" <john-news1@cambridgetechgroup.com>
Date: Thu, 28 Aug 2003 10:50:38 +0100
Message-ID: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
Sender: news <news@sea.gmane.org>
Subject: Lost space on JFFS2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a 7MB NAND flash partition, on which I'm running JFFS2. This
partition contained about 3.5MB of files, yet df reported that the partition
was 96% full. I tried sending SIGHUP to the gc thread and unmounting and
remounting the device, but it had no effect. I then moved the files off the
partition and then copied them back, and the usage went down to just 31%,
which with compression is what one would expect.

I've got two ideas about what happened:

1. The files in question are log files and so there are lots of small writes
happening. How does JFFS2 compress files? Is it on a block basis or per
write? If it is the latter then I could imagine that compression is actually
having an adverse effect when a file is created from a large number of small
writes.

2. A bug in JFFS2 was causing some unused space not to be garbage collected.
The version of JFFS2 being used is 9 months old, so perhaps I should merge a
later version in anyway.

My knowledge of how JFFS2 works internally is limited, so I would be
grateful for any advice.

Regards,
John Hall
