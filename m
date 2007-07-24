Received: from wr-out-0506.google.com ([64.233.184.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDJ3I-0003E3-6d
	for linux-mtd@lists.infradead.org; Tue, 24 Jul 2007 07:59:46 -0400
Received: by wr-out-0506.google.com with SMTP id i22so1268820wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Jul 2007 04:59:38 -0700 (PDT)
Message-ID: <2f9409cb0707240459m9def03cy775b3f4dcf36b39b@mail.gmail.com>
Date: Tue, 24 Jul 2007 12:59:37 +0100
From: "Paul Wakeman" <prwakeman@yahoo.com>
Sender: katalix@googlemail.com
To: linux-mtd@lists.infradead.org
Subject: jffs2: mount problems when XATTR is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm seeing lots of jffs2 errors at boot when mounting filesystems. My
kernel has XATTR enabled. If I build my kernel without
CONFIG_JFFS2_FS_XATTR, the errors don't occur. What are the
requirements for a working jffs2 with XATTR? Are there dependencies of
userspace utilities - mount, mkfs.jffs2 etc?

Errors are of the form:-

Node totlen on flash (0xffffffff) != totlen from node ref (0x0000013c)
at 0x00322d24
Node totlen on flash (0xffffffff) != totlen from node ref (0x000007e0)
at 0x00322544

The filesystem mounts but "ls" gives errors:

# ls /
ls: Input/output error

My board has NOR and NAND flash. The errors occur in NOR partitions.

System info:-
Freescale MX31 CPU (ARM11 core)
2.6.19 kernel
mkfs.jffs2 version 1.50
gcc 4.1.1 (glibc)
busybox 1.1.3

I tried patching my kernel with the MTD code from the latest 2.6.22
kernel but it results in the same problems. I also tried the latest
mkfs.jffs2 from git (which reports the same version number though I
don't think it is...).

Curiously, if I boot an NFS root and then mount the partition
manually, the errors do not occur.

Any ideas?

Thanks

Paul
