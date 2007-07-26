Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDtH4-0005aS-N7
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 22:40:53 -0400
Message-ID: <46A80A01.6010108@ak.jp.nec.com>
Date: Thu, 26 Jul 2007 11:42:09 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
References: <369376.85924.qm@web57912.mail.re3.yahoo.com>
In-Reply-To: <369376.85924.qm@web57912.mail.re3.yahoo.com>
Content-Type: text/plain; charset=ISO-2022-JP
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

Paul Wakeman wrote:
>> I wonder why jffs2/xattr code gave an effect your flash device
>> without any xattr node, because any xattr related implementation
>> is invoked only when jffs2 found xattr nodes on the medium, or
>> xattr related operations are done (like setfacl).
> 
> Maybe it causes timing differences just by it being compiled in?

Is it means there are differences of kernels between flash case and
NFS one? We can confirm it using binary hash such as md5sum.

> My boot logs show calls to jffs_build_xattr_subsystem().

But it reports the partition contains no JFFS2_NODETYPE_XATTR and JFFS2_NODETYPE_XREF
nodes. jffs_build_xattr_subsystem() did just an empty loop.

| JFFS2 notice: (1) jffs2_build_xattr_subsystem: complete building xattr subsystem
| , 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.

>>>> Is it possible to retry it using the kernel with debug messages.
>>>> (See fs/jffs2/debug.h)
>>> Ok. I'll send the log later.
>> I think Kconfig related to JFFS2 also helps us to understand the
>> situation.
> 
> Attached are two compressed logs captured on the serial port.
> 
> jffs2-dbg-flashboot.log.gz
> jffs2-dbg-nfsboot.log.gz
> 
> The logs show kernel boot messages and shell command output which will
> hopefully show the symptoms. The same kernel was used in each case.

In the tail of jffs2-dbg-flashboot.log.gz, it shows you can execute 'df' and
'ls' command, although 'ls' reported EIO.
However, success of 'df' means it can open and read /etc/mtab, at least.
Is it installed in /dev/mtdblock2 ?

Is it possible to send the following logs?
- "ls /" after "dmesg -n 8"
 It seems to me that some warnning or notice messages from kernel are filtered
 due to log message level configuration.
 Xattr implementation has a possibility to return -EIO, but I could not found
 those messages in jffs2-dbg-flashboot.log.gz.

- "strace ls /"
 It helps us to know what system call returns -EIO, and whether applications
 actually use xattr features, or not.

> The root partition is in NOR flash (mtd2). Applications use xattr
> features only in /mnt/userdata (also in NOR at mtd3). There are 3
> partitions in NAND (mtd6-8).

There is a possibility that applications use xattr features implicitly
via library functions, I think.
For example, the recent ls in busybox supports to display security context
of SELinux. It calls fgetxattr(2) via libselinux.

> At the end of the nfsboot log, there are shell commands that show that
> manually mounting /dev/mtdblock2 (which gave all the errors in the
> flash boot case) mounts cleanly.

Hmm...
Currently, I have no idea to explain your situation...

--
OSS Platform Development Division, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
