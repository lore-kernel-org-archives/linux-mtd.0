Received: from [61.11.66.51] (helo=gateway.blr.dlink.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C5kza-0008IF-5K
	for linux-mtd@lists.infradead.org; Fri, 10 Sep 2004 08:59:08 -0400
Received: from ActhuthKamath (localhost [127.0.0.1])
	by gateway.blr.dlink.com (8.11.0/8.11.0) with ESMTP id i8ADFFj31857
	for <linux-mtd@lists.infradead.org>; Fri, 10 Sep 2004 18:45:15 +0530
From: "Achuth" <amk@dlink.co.in>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 10 Sep 2004 18:32:45 +0530
Message-ID: <000001c49736$77397960$ae64a8c0@ActhuthKamath>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: File system mounting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,
 I had a doubt regarding the file system mounting in ucLinux.
Can the kernel mount two file systems at bootup? I have arranged flash
in 5 partitions, and I have two different file systems in two different
partitions. I want the kernel to mount Partition X as root file system,
and then I have a mount point /mnt in already mounted root file system.
Now, I want the kernel to mount another partition at this mount point as
read/write. How do I do this? Both the file systems are presently in
Jffs2.

            Currently I tried mounting the partition (/dev/root) as
root, and then mounting another partition (/dev/config) at /mnt. The
kernel displays that it successfully mounted the file system. But when I
go to that mount point, I see that it is empty. What could be the
problem? 

Thanks and regards,

Achuth
