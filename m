From: "Kyungmin Park" <kmpark@infradead.org>
To: "'linux-mtd'" <linux-mtd@lists.infradead.org>
Subject: Abnormal behavior with JFFS2 on latest kernel
Date: Fri, 15 Feb 2008 16:12:22 +0900
Message-ID: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-linux-kernel@vger.kernel.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I got following messages.
INFO: task pdflush:56 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.

What are the meanings?
Too mush running GC in JFFS2 or others?

BR,
Kyungmin Park

/ # /mtd-utils/eraseall /dev/mtd4
/ # mount -t jffs2 /dev/mtdblock4 /jffs2
/ # iozone -A -s 128m -q 32k -U /jffs2 -f /jffs2/test -e
        Iozone: Performance Test of File I/O
                Version $Revision: 3.260 $
                Compiled for 32 bit mode.
                Build: linux-arm

	Run began: Fri Feb 15 15:39:56 2008

        Auto Mode 2. This option is obsolete. Use -az -i0 -i1
        File size set to 131072 KB
        Using Maximum Record Size 32 KB
        Include fsync in write timing
        Command line used: iozone -A -s 128m -q 32k -U /jffs2 -f /jffs2/test -e
        Output is in Kbytes/sec
        Time Resolution = 0.000030 seconds.
        Processor cache size set to 1024 Kbytes.
        Processor cache line size set to 32 bytes.
        File stride size set to 17 * record size.

              KB  reclen   write rewrite    read    reread
          131072       4    3708    3693    15294    15295
          131072       8    3736    3732    15482    15479
          131072      16INFO: task pdflush:56 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
pdflush       D c0216a1c     0    56      2
[<c0216680>] (schedule+0x0/0x41c) from [<c0216f68>] (io_schedule+0x2c/0x48)
[<c0216f3c>] (io_schedule+0x0/0x48) from [<c0063b54>] (sync_page+0x50/0x5c)
 r5:00000000 r4:c3c63c38
[<c0063b04>] (sync_page+0x0/0x5c) from [<c02172b8>] (__wait_on_bit_lock+0x60/0x)
[<c0217258>] (__wait_on_bit_lock+0x0/0x94) from [<c006469c>] (__lock_page+0x88/)
[<c0064614>] (__lock_page+0x0/0x98) from [<c00654ac>] (read_cache_page_async+0x)
 r5:00000000 r4:c03178c0
[<c006536c>] (read_cache_page_async+0x0/0x1b8) from [<c0124fcc>] (jffs2_gc_fetc)
[<c0124fa0>] (jffs2_gc_fetch_page+0x0/0x64) from [<c0121780>] (jffs2_garbage_co)
 r4:0682c000
[<c0120cd4>] (jffs2_garbage_collect_live+0x0/0x11ac) from [<c01225cc>] (jffs2_g)
[<c0121e80>] (jffs2_garbage_collect_pass+0x0/0x844) from [<c0126b18>] (jffs2_fl)
[<c0126a58>] (jffs2_flush_wbuf_gc+0x0/0x18c) from [<c0124bf8>] (jffs2_write_sup)
 r8:c3c63f40 r7:c02ae520 r6:c02aea94 r5:00000000 r4:c3d22a00
[<c0124bb4>] (jffs2_write_super+0x0/0x48) from [<c008a314>] (sync_supers+0x94/0)
 r5:c3d22c40 r4:c3d22c00
[<c008a280>] (sync_supers+0x0/0xd8) from [<c006b578>] (wb_kupdate+0x54/0x144)
 r6:c02a62d0 r5:c3c63fa0 r4:c3c63fac
[<c006b524>] (wb_kupdate+0x0/0x144) from [<c006c828>] (pdflush+0x118/0x1e8)
 r8:c02a62d0 r7:c02ae560 r6:c3c62000 r5:c3c63fa0 r4:c3c63fac
[<c006c710>] (pdflush+0x0/0x1e8) from [<c0050038>] (kthread+0x54/0x80)
 r8:00000000 r7:00000000 r6:00000000 r5:c006c710 r4:fffffffc
[<c004ffe4>] (kthread+0x0/0x80) from [<c003de0c>] (do_exit+0x0/0x66c)
 r5:00000000 r4:00000000
INFO: task iozone:219 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
iozone        D c0216a1c     0   219    215
[<c0216680>] (schedule+0x0/0x41c) from [<c02164d4>] (__down+0xa4/0xfc)
[<c0216430>] (__down+0x0/0xfc) from [<c02163cc>] (__down_failed+0xc/0x20)
 r8:c381ae00 r7:00000000 r6:c381adc0 r5:00000000 r4:0000682a
[<c01182b8>] (jffs2_write_begin+0x0/0x3c0) from [<c00660cc>] (generic_file_buff)
[<c0065fbc>] (generic_file_buffered_write+0x0/0x65c) from [<c0066e58>] (__gener)
[<c0066908>] (__generic_file_aio_write_nolock+0x0/0x580) from [<c0066f00>] (gen)
[<c0066e88>] (generic_file_aio_write+0x0/0xf4) from [<c008870c>] (do_sync_write)
[<c008865c>] (do_sync_write+0x0/0xf4) from [<c0088810>] (vfs_write+0xc0/0xf8)
 r8:c0020224 r7:c3c2ff78 r6:41200000 r5:c3d9a5e0 r4:00004000
[<c0088750>] (vfs_write+0x0/0xf8) from [<c0088904>] (sys_write+0x48/0x74)
 r7:00000004 r6:c3d9a5e0 r5:00000000 r4:06828000
[<c00888bc>] (sys_write+0x0/0x74) from [<c001fa20>] (ret_fast_syscall+0x0/0x2c)
 r6:00000000 r5:00004000 r4:00002000
