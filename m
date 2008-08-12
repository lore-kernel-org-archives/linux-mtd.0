Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSrwc-0005fz-JH
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 11:21:43 +0000
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m7CBLSVm015440
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2008 14:21:40 +0300
Message-ID: <48A172B9.5060603@nokia.com>
Date: Tue, 12 Aug 2008 14:23:37 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Possible JFFS2 bug
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I get the following trying to run
mtd-utils/tests/fs-tests/integrity/integck -n3


BUG: unable to handle kernel paging request at f8000000
IP: [<c020cb56>] crc32_le+0x36/0xe2
*pde = 00000000 
Oops: 0000 [#1] PREEMPT SMP 
Modules linked in: jffs2 nandsim nand nand_ids nand_ecc video output [last unloaded: jffs2]

Pid: 3761, comm: jffs2_gcd_mtd0 Not tainted (2.6.27-rc1ubifs30 #18)
EIP: 0060:[<c020cb56>] EFLAGS: 00010202 CPU: 0
EIP is at crc32_le+0x36/0xe2
EAX: c03339a7 EBX: c03339a7 ECX: 3f80cb89 EDX: 0000007f
ESI: f7fffffc EDI: ffffff8f EBP: f67fddfc ESP: f67fdde8
 DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
Process jffs2_gcd_mtd0 (pid: 3761, ti=f67fc000 task=f78a6130 task.ti=f67fc000)
Stack: 3fffffe3 f6032e94 ffffffd3 ffffff8f f67fdec0 f67fdee4 f88e9bf1 00000012 
       00000000 ffffff8f 00000001 f67fde7c f7371ad0 f67fde3c c0184332 00000000 
       f7323708 f604c7b4 f6d6d800 00000010 f7323708 f67fdea8 f88ebbd0 00000000 
Call Trace:
 [<f88e9bf1>] ? jffs2_garbage_collect_live+0xc5c/0xfef [jffs2]
 [<c0184332>] ? iget_locked+0x2a/0x12d
 [<f88ebbd0>] ? jffs2_iget+0xe/0x30d [jffs2]
 [<c011bed1>] ? __enqueue_entity+0xc3/0xee
 [<f88ea4c9>] ? jffs2_garbage_collect_pass+0x545/0x69c [jffs2]
 [<c012e909>] ? __sigqueue_free+0x2f/0x32
 [<c012e7f2>] ? recalc_sigpending+0xe/0x2f
 [<c038f6c1>] ? _spin_unlock_irq+0x8/0x28
 [<f88eb8bc>] ? jffs2_garbage_collect_thread+0x136/0x1a1 [jffs2]
 [<c0123f84>] ? __mmdrop+0x28/0x2f
 [<c011f2dc>] ? finish_task_switch+0x7f/0x85
 [<c011ff43>] ? schedule_tail+0x1a/0x4a
 [<c0103a66>] ? ret_from_fork+0x6/0x1c
 [<f88eb786>] ? jffs2_garbage_collect_thread+0x0/0x1a1 [jffs2]
 [<f88eb786>] ? jffs2_garbage_collect_thread+0x0/0x1a1 [jffs2]
 [<c010478f>] ? kernel_thread_helper+0x7/0x18
 =======================
Code: 89 cf f6 c2 03 0f 85 96 00 00 00 31 c0 83 ff 03 0f 97 c0 85 c0 74 62 89 f8 c1 e8 02 89 45 ec 83 ea 04 89 55 f0 89 d6 89 c1 89 
EIP: [<c020cb56>] crc32_le+0x36/0xe2 SS:ESP 0068:f67fdde8
---[ end trace 1097c72eb5c16624 ]---
