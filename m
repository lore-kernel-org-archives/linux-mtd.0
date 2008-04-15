Received: from ug-out-1314.google.com ([66.249.92.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jlk08-0006g1-KM
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 12:11:05 +0000
Received: by ug-out-1314.google.com with SMTP id 23so622990ugr.45
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Apr 2008 05:11:02 -0700 (PDT)
Message-ID: <90d987c0804150511v7063ebcdx8e769c6c20161899@mail.gmail.com>
Date: Tue, 15 Apr 2008 17:41:01 +0530
From: "rohit h" <hrohit85@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [JFFS2] Running fsstress on JFFS2 causing freeze
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hello everyone.
I am running a filesystem testing application "fsstress" on JFFS2.
The JFFS2 code is from linux-2.6.22 kernel.All the processes spawned
by fsstress do filesystem operations on the JFFS2 partition.After some
time all the processes go into "UNINTERRUPTIBLE SLEEP" state as shown.

bash-2.05a# ps -aux
  PID  Uid     VmSize Stat Command
    1 root        140 S   init [3]
    2 root            SW< [kthreadd]
    3 root            SWN [ksoftirqd/0]
    4 root            SW< [watchdog/0]
    5 root            SW< [events/0]
    6 root            SW< [khelper]
   36 root            SW< [kblockd/0]
   37 root            SW< [omap2_mcspi/0]
   53 root            SW  [pdflush]
   54 root            SW< [kswapd0]
   55 root            SW< [aio/0]
  156 root            SW< [mtdblockd]
  166 root            SW< [kmmcd]
  170 root            SW< [rpciod/0]
  186 root        260 S   /sbin/syslogd
  191 root        120 S   /usr/sbin/inetd
  197 root        892 S   /bin/bash
  200 root            SWN [jffs2_gcd_mtd1]
  201 root        208 S   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  312 root        280 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  313 root        372 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  314 root        392 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  315 root        488 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  316 root        388 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  317 root        376 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  318 root        404 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  319 root        396 D   /tools/fsstress -p 8 -n 100000 -d /tmp -l 0
  337 root        684 R   ps -aux

I checked the entry in /proc/process_id/wchan for each of the sleeping
processes.
( wchan gives the function the process is currently executing ).
Here is the output:
jffs2_garbage_collect_thread -> this is for jffs2_gcd_mtd1
do_wait
jffs2_mknod
jffs2_do_link
lock_rename
jffs2_write_inode_range
lock_rename
lock_rename
lock_rename
lock_rename

I have the feel that there is a deadlock.
Does anybody have any idea about this?
Thanks,
Rohit
