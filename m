Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDWdC-00012K-Gi
	for linux-mtd@lists.infradead.org; Tue, 24 Jul 2007 22:30:02 -0400
Message-ID: <46A6B5F8.3090104@ak.jp.nec.com>
Date: Wed, 25 Jul 2007 11:31:20 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
References: <2f9409cb0707240459m9def03cy775b3f4dcf36b39b@mail.gmail.com>
In-Reply-To: <2f9409cb0707240459m9def03cy775b3f4dcf36b39b@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul,

I like to confirm your situation at first.

Did you pack any xattr in the filesystem image?
If you didn't specify a xattr related option in mkfs.jffs2, any xattr
on the host filesystem is not packed.

Paul Wakeman wrote:
> I'm seeing lots of jffs2 errors at boot when mounting filesystems. My
> kernel has XATTR enabled. If I build my kernel without
> CONFIG_JFFS2_FS_XATTR, the errors don't occur. What are the
> requirements for a working jffs2 with XATTR? Are there dependencies of
> userspace utilities - mount, mkfs.jffs2 etc?
> 
> Errors are of the form:-
> 
> Node totlen on flash (0xffffffff) != totlen from node ref (0x0000013c)
> at 0x00322d24
> Node totlen on flash (0xffffffff) != totlen from node ref (0x000007e0)
> at 0x00322544

jffs2_mark_node_obsolete() generates above messages, when the length of
node on the medium is differ from expected one.
It seems to me jffs2 tries to access a cleared region because left hand
is 0xffffff. In addition, 0x013c (316byte) and 0x07e0 (2016byte) are
too long, if these are xattr nodes.

Is it possible to retry it using the kernel with debug messages.
(See fs/jffs2/debug.h)

> The filesystem mounts but "ls" gives errors:
> 
> # ls /
> ls: Input/output error
> 
> My board has NOR and NAND flash. The errors occur in NOR partitions.
> 
> System info:-
> Freescale MX31 CPU (ARM11 core)
> 2.6.19 kernel
> mkfs.jffs2 version 1.50
> gcc 4.1.1 (glibc)
> busybox 1.1.3
> 
> I tried patching my kernel with the MTD code from the latest 2.6.22
> kernel but it results in the same problems. I also tried the latest
> mkfs.jffs2 from git (which reports the same version number though I
> don't think it is...).
> 
> Curiously, if I boot an NFS root and then mount the partition
> manually, the errors do not occur.

Is it really same kernel, and same partition?

> Any ideas?
> 
> Thanks
> 
> Paul
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
