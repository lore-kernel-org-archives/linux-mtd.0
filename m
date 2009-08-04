Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MYFRK-0004ZN-KI
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 08:32:14 +0000
Received: from bzq-79-180-129-18.red.bezeqint.net ([79.180.129.18]:50391
	helo=felix.lan) by vega.surpasshosting.com with esmtpa (Exim 4.69)
	(envelope-from <felix@embedded-sol.com>) id 1MYFRH-00065C-Ij
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 04:32:07 -0400
Message-ID: <4A77F205.5090001@embedded-sol.com>
Date: Tue, 04 Aug 2009 11:32:05 +0300
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
Subject: Jffs2 soft lockup on 2.6.31-rc5
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm getting soft lockups on Freescale MPC8536DS board running 2.6.31-rc5.
MTD device is 60M partition on Spansion 128MB NOR flash (S29GL01GP).

To reproduce the problem, I run

flash_eraseall /dev/mtd4
mount -t jffs2 /dev/mtdblock4 /mnt
sync

The lockup messages look like this:

INFO: task sync:1096 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Call Trace:
[df04dd50] [28022248] 0x28022248 (unreliable)
[df04de10] [c00078e4] __switch_to+0x64/0xd0
[df04de20] [c029df08] schedule+0x188/0x2e0
[df04de50] [c029ebc8] __mutex_lock_slowpath+0xd4/0x1f8
[df04dea0] [c029ed04] mutex_lock+0x18/0x34
[df04dec0] [c007ed64] lock_super+0x28/0x38
[df04ded0] [c0111148] jffs2_write_super+0x1c/0x6c
[df04dee0] [c01111b0] jffs2_sync_fs+0x18/0x4c
[df04df00] [c009e70c] __sync_filesystem+0x3c/0x5c
[df04df10] [c009e7f8] sync_filesystems+0xcc/0x10c
[df04df30] [c009e91c] sys_sync+0x1c/0x50
[df04df40] [c000f7e4] ret_from_syscall+0x0/0x3c


The system does not lock completely, the sync returns after 2 lockup 
messages
and jffs2 partition is fully  usable.

The problem is not reproducible if I use ubifs or just copy data to 
/dev/mtd4.
So it seems the problem is related to jffs2.  Any ideas what can be 
wrong and
how to fix it  ?

Thanks.

Felix.
