Received: from james.zidango.com ([213.242.178.190] helo=www.sveasoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ah4zg-0004es-0b
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2004 10:44:56 +0000
Received: from test (du-32-69.ppp.telenordia.se [62.127.32.69])
	by www.sveasoft.com (8.12.8/8.12.8) with SMTP id i0F9ceY3010471
	for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2004 10:38:40 +0100
Message-ID: <00df01c3dba0$2b481360$0901a8c0@test>
From: "James Ewing" <james.ewing@sveasoft.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 15 Jan 2004 11:45:45 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Booting directly to JFFS2 question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can anyone describe how to boot from flash directly to jffs2?

 I am working with a Broadcom MIPS based wireless router that originally
booted to cramfs. I added the ability to boot to Phillip Lougher's squashfs
and now use this filesystem.

With the squashfs addition, I modeled the code changes after cramfs and the
modifications were trivial. I would like to add boot ability directly to
jffs2, but am stumped as to how to do this.

When the system boots it creates four MTD partitions from flash. The second
contains a compressed root image and a cramfs (now squashfs) file system
image.
After creating the partitions the system looks for the file system image by
checking 64K boundaries of the 2nd flash partition looking for cramfs or
squashfs magic numbers. The routine then returns a pointer to the fs system
start byte and the init/do_mount.c code takes over.

This pointer was to the super_block for the filesystem. Apparently jffs2
doesn't have a super_block in the traditional sense so I am a bit stumped.


James Ewing
