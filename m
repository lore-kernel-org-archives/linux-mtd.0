Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3YY-0002Aq-OO
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:34:43 +0000
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
Date: Tue, 2 Oct 2012 16:19:10 +0200
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all, 

I have encountered multiple times a deadlock between two JFFS2 threads:

INFO: task jffs2_gcd_mtd5:54 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
jffs2_gcd_mtd5  D c023be78     0    54      2 0x00000000
Backtrace:
Function entered at [<c023babc>] from [<c023c0c0>]  __schedule
Function entered at [<c023c03c>] from [<c023c140>]  schedule
Function entered at [<c023c0c4>] from [<c005ee64>]  io_schedule
 r6:c7942380 r5:c0414a50 r4:c541bd34 r3:00000001
Function entered at [<c005ee54>] from [<c023a328>]  sleep_on_page
Function entered at [<c023a2cc>] from [<c005ee44>]  __wait_on_bit_lock
Function entered at [<c005edd8>] from [<c005f3f0>]  __lock_page
 r6:c7411728 r5:00000083 r4:c034d720
Function entered at [<c005f2fc>] from [<c005f4b8>]  do_read_cache_page
Function entered at [<c005f498>] from [<c0108990>]  read_cache_page_async
Function entered at [<c0108968>] from [<c0105834>]  jffs2_gc_fetch_page
 r4:c74115f8 r3:c541be60
Function entered at [<c0104fa8>] from [<c01064e4>] 
jffs2_garbage_collect_live
Function entered at [<c0105e1c>] from [<c0107820>] 
jffs2_garbage_collect_pass
Function entered at [<c01076dc>] from [<c0033198>] 
jffs2_garbage_collect_thread
Function entered at [<c0033108>] from [<c001d5f0>]  kthread
 r7:00000013 r6:c001d5f0 r5:c0033108 r4:c79b9d84

INFO: task scp:158 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
scp             D c023be78     0   158    157 0x00000000
Backtrace:
Function entered at [<c023babc>] from [<c023c0c0>]  __schedule
Function entered at [<c023c03c>] from [<c023c314>]  schedule
Function entered at [<c023c2ec>] from [<c023afac>] 
schedule_preempt_disabled
 r4:c74115f8 r3:00000000
Function entered at [<c023ae3c>] from [<c023b0d4>]  __mutex_lock_slowpath
Function entered at [<c023b0c0>] from [<c00fd640>]  mutex_lock
 r4:c7411640 r3:00000001
Function entered at [<c00fd3e8>] from [<c005e53c>]  jffs2_write_begin
Function entered at [<c005e454>] from [<c0060110>] 
generic_file_buffered_write
Function entered at [<c005fce0>] from [<c00601ac>] 
__generic_file_aio_write
Function entered at [<c006015c>] from [<c0086a18>]  generic_file_aio_write
 r8:fffffdee r7:c54fbf10 r6:c54fbf70 r5:c54fbe90 r4:c54fd0c0
Function entered at [<c008696c>] from [<c00873a0>]  do_sync_write
 r8:00001000 r7:c54fbf70 r6:017969f8 r5:c54fd0c0 r4:00001000
Function entered at [<c00872e4>] from [<c0087624>]  vfs_write
 r8:00001000 r7:00000000 r6:00083000 r5:017969f8 r4:c54fd0c0
Function entered at [<c00875e0>] from [<c000dec0>]  sys_write
 r8:c000e044 r7:00000004 r6:0000a114 r5:00001000 r4:00000000

The target system is an SoC with a dual ARMv7 (Cortex-A9), and we are 
running the long-term 3.4.11 kernel (whose fs/jffs2/ seems to be pretty 
close to the latest mainline kernel). The deadlock occurred when using scp 
to copy files from a host system to the target system.

The GC thread hangs in lock_page(page), the write thread hangs in the 
first mutex_lock(&f->sem). The cause seems to be an AB-BA deadlock:

jffs2_garbage_collect_live
    mutex_lock(&f->sem)                         (A)
    jffs2_garbage_collect_dnode [inlined]
        jffs2_gc_fetch_page
            read_cache_page_async
                do_read_cache_page
                    lock_page(page) [inlined]
                        __lock_page             (B) ***

jffs2_write_begin
    grab_cache_page_write_begin
        find_lock_page
            lock_page(page)                     (B)
    mutex_lock(&f->sem)                         (A) ***

I have manually analyzed the stacks and confirmed that both threads sit on 
the theme 'struct page'.

Is this a known problem? And more importantly, is there a solution for it?

Best regards,
Thomas Betker

-- 
Thomas Betker, Dept. 1GP1 
Rohde & Schwarz GmbH & Co. KG 
Postbox 80 14 69, 81614 Muenchen, Germany 
