Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EA3CN-0005EP-K5
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 06:18:40 -0400
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1EA3CK-0000ch-GV
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 12:18:32 +0200
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.0.0.59) with SMTP id
	M2005083012183225370
	for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2005 12:18:32 +0200
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1EA3CK-0000ki-Cw
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 12:18:32 +0200
Received: from [160.114.37.115] (osl01.inf.u-szeged.hu [160.114.37.115])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 5232323969
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Aug 2005 12:18:32 +0200 (CEST)
Message-ID: <43143349.5020402@inf.u-szeged.hu>
Date: Tue, 30 Aug 2005 12:22:01 +0200
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Probelem with 2.6.13 kernel and latest mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All!

We've got a kernel warning with the lates mtd cvs and linux kernel 2.6.13 which was not present earlier (even with 2.6.12.5).

We used nandsim for testing (64 MB, 128KB erase block) using the following steps:

flash_eraseall -jq /dev/mtd0c
mount -o ro /dev/mtd0c /mnt/flash
mount -o remount,rw /mnt/flash
umount /mnt/flash

and got a following warning message:
Badness in do_exit at kernel/exit.c:787
 [do_exit+1032/1040] do_exit+0x408/0x410
 [complete_and_exit+19/32] complete_and_exit+0x13/0x20
 [pg0+949936634/1069405184] jffs2_garbage_collect_thread+0xda/0x180 [jffs2]
 [_spin_unlock_irq+14/48] _spin_unlock_irq+0xe/0x30
 [sigprocmask+108/208] sigprocmask+0x6c/0xd0
 [_spin_unlock_irq+14/48] _spin_unlock_irq+0xe/0x30
 [schedule_tail+59/160] schedule_tail+0x3b/0xa0
 [ret_from_fork+6/20] ret_from_fork+0x6/0x14
 [pg0+949936416/1069405184] jffs2_garbage_collect_thread+0x0/0x180 [jffs2]
 [pg0+949936416/1069405184] jffs2_garbage_collect_thread+0x0/0x180 [jffs2]
 [kernel_thread_helper+5/16] kernel_thread_helper+0x5/0x10

There is a new line in the kernel (kernel/exit.c, in function do_exit()):

WARN_ON(atomic_read(&tsk->fs_excl));

Does anybody know what it is about exactly?

Thanks,
Zoltan
