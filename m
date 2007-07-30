Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFN5V-0004Uj-Gr
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 00:42:38 -0400
Message-ID: <46AD6C1D.4070805@ak.jp.nec.com>
Date: Mon, 30 Jul 2007 13:42:05 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
References: <54323.51026.qm@web57905.mail.re3.yahoo.com>
In-Reply-To: <54323.51026.qm@web57905.mail.re3.yahoo.com>
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

Paul Wakeman wrote:
> KaiGai Kohei <kaigai@ak.jp.nec.com> wrote:
> 
>> KaiGai Kohei wrote:
>>> Is it possible to send the following logs?
>>> - "ls /" after "dmesg -n 8"
> 
> I managed to boot a debug kernel when /mnt/userdata was showing jffs2
> errors. "ls /mnt/userdata" returns IO error.
> 
> aseries# ls /mnt/userdata
> JFFS2 warning: (1783) jffs2_get_inode_nodes: Eep. No valid nodes for
> ino #2.
> JFFS2 warning: (1783) jffs2_do_read_inode_internal: no data nodes found
> for ino #2
> ls: /mnt/userdata/4242-1111-1111-0001: Input/output error

Could you get the above messages in the second ls with the most
detailed kernel messages?

> aseries# echo 8 > /proc/sys/kernel/printk
> aseries# ls /mnt/userdata
> jffs2_follow_link(): target path is 'busybox'
> jffs2_follow_link(): target path is 'ld-2.4.so'
> jffs2_follow_link(): target path is 'libcrypt-2.4.so'
> jffs2_follow_link(): target path is 'libc-2.4.so'
These are required by loading busybox and libraries depends on.

> jffs2_readdir() for dir_i #1
> Dirent 0: ".", ino #1
> Dirent 1: "..", ino #1
> Dirent 2: "4242-1111-1111-0001", ino #2, type 8
> Skipping deletion dirent "4242-1111-1111-0001.new"
busybox tried to getdents(2), and it could obtain three entries and
one dead entry.

> jffs2_readdir() for dir_i #1
> Skipping dirent: "4242-1111-1111-0001", ino #2, type 8, because curofs
> 2 < offset 4
> Skipping dirent: "4242-1111-1111-0001.new", ino #0, type 0, because
> curofs 3 < offset 4
busybox tries to getdents(2) for rest of directory entries,
but no more entries are exist.

> ls: /mnt/userdata/4242-1111-1111-0001: Input/output error
ls in busybox tries to call lstat(2) for all the entries except for "."
and ".." next to getdents(2).
It seems to me something happen on sys_lstat() or its call chain.
Maybe, it fails to resolve the path name, because jffs2 does not have
its i_ops->getattr() handler and generic_fillattr() never fails.

In the above trial, I intended that we can get some warnings from
jffs2/xattr subsystem if incorrect xattr cause the -EIO.

BTW, is the /bin/ls stored on NFS partition when you booted it with
NFS root? What is happen on using /mnt/tmp/bin/ls ?
Is it possible to reproduce with NFS root?

| aseries# df
| Filesystem           1k-blocks      Used Available Use% Mounted on
| /dev/root            150231148 121530312  20946292  85% /
| tmpfs                    55284       520     54764   1% /dev
| rwfs                      1024       836       188  82% /mnt/rwfs
| rwfs                      1024       836       188  82% /tmp
| rwfs                      1024       836       188  82% /var
| rwfs                      1024       836       188  82% /etc
| shm                      55284         4     55280   0% /dev/shm
| /dev/mtdblock6           15360       532     14828   3% /usr/local
| /dev/mtdblock3            2048       388      1660  19% /mnt/userdata
| /dev/mtdblock7            1024        68       956   7% /mnt/crash
| /dev/mtdblock8          114688      3044    111644   3% /mnt/maps
| aseries# ls /
| bin            home           opt            sbin           var
| boot           lib            proc           share
| dev            linuxrc        root           sys
| dir            mnt            rootfs.jffs2   tmp
| etc            null.jffs2     rootfs2.jffs2  usr
| aseries# mount -t jffs2 /dev/mtdblock2 /mnt/tmp
| JFFS2 notice: (1770) jffs2_build_xattr_subsystem: complete building xattr subsys
| tem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
| aseries# ls /mnt/tmp
| bin      etc      linuxrc  proc     share    usr
| dev      home     mnt      root     sys      var
| dir      lib      opt      sbin     tmp
aseries# /mnt/tmp/bin/ls /mnt/tmp
What happen?

>>>  It seems to me that some warnning or notice messages from kernel
>> are filtered
>>>  due to log message level configuration.
>>>  Xattr implementation has a possibility to return -EIO, but I could
>> not found
>>>  those messages in jffs2-dbg-flashboot.log.gz.
>> In addition, is it possible to execute "ls <any other
>> directories/files>" ?
>> e.g) $ ls /mnt
> 
> Yes it is.
> 
> aseries# ls /mnt
> jffs2_follow_link(): target path is 'busybox'
> jffs2_follow_link(): target path is 'ld-2.4.so'
> jffs2_follow_link(): target path is 'libcrypt-2.4.so'
> jffs2_follow_link(): target path is 'libc-2.4.so'
> jffs2_readdir() for dir_i #9
> Dirent 0: ".", ino #9
> Dirent 1: "..", ino #1
> Dirent 2: "nfs", ino #497, type 4
> Dirent 3: "src", ino #499, type 4
> Dirent 4: "userdata", ino #494, type 4
> Dirent 5: "maps", ino #496, type 4
> Dirent 6: "rwfs", ino #498, type 4
> Dirent 7: "cdrom", ino #492, type 4
> Dirent 8: "crash", ino #493, type 4
> Dirent 9: "floppy", ino #495, type 4
> jffs2_readdir() for dir_i #9
> Skipping dirent: "nfs", ino #497, type 4, because curofs 2 < offset 10
> Skipping dirent: "src", ino #499, type 4, because curofs 3 < offset 10
> Skipping dirent: "userdata", ino #494, type 4, because curofs 4 <
> offset 10
> Skipping dirent: "maps", ino #496, type 4, because curofs 5 < offset 10
> Skipping dirent: "rwfs", ino #498, type 4, because curofs 6 < offset 10
> Skipping dirent: "cdrom", ino #492, type 4, because curofs 7 < offset
> 10
> Skipping dirent: "crash", ino #493, type 4, because curofs 8 < offset
> 10
> Skipping dirent: "floppy", ino #495, type 4, because curofs 9 < offset
> 10
> cdrom   crash   userdata    floppy  maps    nfs     rwfs    src
> 
> The /mnt/userdata partition is the one where files have XATTRs.
> 
> Are others using XATTR with jffs2?
> 
> Paul

-- 
OSS Platform Development Division, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
