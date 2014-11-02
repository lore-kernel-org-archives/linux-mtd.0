Received: from bay004-omc1s22.hotmail.com ([65.54.190.33])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XktWe-0006E7-CU
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 11:40:52 +0000
Message-ID: <BAY176-DS9CAF0187DEFFDC2D1BB65AE980@phx.gbl>
From: "Roy Yang" <smallboss@outlook.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 deadlock in Linux 2.6.32
Date: Sun, 2 Nov 2014 19:40:31 +0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"; reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   I encountered jffs2 deadlock between jffs2 GC and user space reading 
process:

  task                        PC stack   pid father
sync_supers   D ffffffff8011443c     0   131      2 0x00100000
Stack : 0000000000000000 0000000000000000 0000000000000000 ffffffff8339fe90
        000000010032377d a800000101146d50 0000000000000001 a80000000c2871c0
        0000000000000000 0000000000000000 a800000101146d50 ffffffff810055c0
        000000000007a120 ffffffff8335c480 ffffffff8335b1c0 a80000010137fb50
        a80000000c288c80 a80000000c288480 a80000010137fbc0 a80000000c2826b8
        0000000000000002 0000000000000001 ffffffff8034c230 0000000000000002
        0000000000000001 ffffffff8011443c 0000000000000000 0000000000000000
        a80000010137fbb0 ffffffff8034c278 a80000010137fbc0 ffffffff80114914
        0000000000000017 a8000000068f3420 00000000000f7000 00000000000000f7
        a8000000f58d9bf8 00000000000201da a8000000f58d9ae0 ffffffff804695f8
        ...
Call Trace:
[<ffffffff80113cc0>] schedule+0x2a0/0x9b0
[<ffffffff8011443c>] io_schedule+0x6c/0xf8
[<ffffffff8034c278>] sync_page+0x48/0x70
[<ffffffff80114914>] __wait_on_bit_lock+0xc4/0x138
[<ffffffff8034c200>] __lock_page+0x50/0x60
[<ffffffff8034ca34>] do_read_cache_page+0x124/0x1f0
[<ffffffff80474a9c>] jffs2_gc_fetch_page+0x2c/0xa8
[<ffffffff804728d8>] jffs2_garbage_collect_pass+0xff0/0x18a0
[<ffffffff80478424>] jffs2_flush_wbuf_gc+0xa4/0x188
[<ffffffff8047609c>] jffs2_write_super+0x6c/0x80
[<ffffffff8038a1f0>] sync_supers+0x138/0x140
[<ffffffff80361ac4>] bdi_sync_supers+0x44/0x68
[<ffffffff803273e8>] kthread+0x88/0x90
[<ffffffff802e4b20>] kernel_thread_helper+0x10/0x18

CPC           D ffffffff80114e4c     0  2104   2085 0x0c100000
Stack : 0000000000000000 0000000000000001 0000000000000000 0000000000200200
        00000000ffffa0d5 a8000000f5d9f7d0 0000000000000008 a80000000c2b71c0
        0000000000000000 0000000000000002 a8000000f5d9f7d0 ffffffff810055c0
        000000000007a120 ffffffff8335c480 ffffffff8335b1c0 0000000000000001
        0000000000000001 a8000000f58d9a88 ffffffffffffffff a8000000f58d9a8c
        a8000000f5d9f540 0000000000000002 a8000000f58d9a90 000000000000bc5a
        a8000000f58d9c00 ffffffff80114e4c 000000000000001a a8000000f58d9bf8
        a8000000f58d9a90 a8000000f58d9a90 a8000000f5d9f540 00000000000000f7
        a8000000f58d9a88 a8000000f58d9a88 000000000000001a a8000000f58d9bf8
        0000000000100100 0000000000200200 000000000000001a ffffffff80114f70
        ...
Call Trace:
[<ffffffff80113cc0>] schedule+0x2a0/0x9b0
[<ffffffff80114e4c>] __mutex_lock_slowpath+0x18c/0x258
[<ffffffff80114f70>] mutex_lock+0x58/0x70
[<ffffffff80469660>] jffs2_readpage+0x28/0x60
[<ffffffff80355494>] __do_page_cache_readahead+0x21c/0x238
[<ffffffff803554d4>] ra_submit+0x24/0x30
[<ffffffff80355944>] page_cache_async_readahead+0xcc/0x128
[<ffffffff8034e208>] generic_file_aio_read+0x4b8/0x648
[<ffffffff80387664>] do_sync_read+0xbc/0x130
[<ffffffff80388464>] vfs_read+0xbc/0x170
[<ffffffff8038861c>] SyS_read+0x54/0xb8
[<ffffffff80102c44>] handle_sys64+0x44/0x64

The deadlock happened as the follow call trace show:
GC:
jffs2_garbage_collect_live
    mutex_lock(&f->sem)                         (Taken: f->sem)
    jffs2_garbage_collect_dnode [static]
        jffs2_gc_fetch_page
            read_cache_page_async
                do_read_cache_page
                    lock_page(page) [static]    (Block: page lock )

CPC:
generic_file_aio_read
    do_generic_file_read
        page_cache_async_readahead
            ra_submit
            __do_page_cache_readahead          (Taken: page lock)
            readpage: jffs2_readpage
               mutex_lock(&f->sem)                   (Block: f->sem)

The targe system is Cavium CN6230 SOC, with 2.6.32 Linux, NAND flash.
It triggered during the startup just after mounted MTD partitions and
user application reading big file to memory.


Best regards!

Roy Yang 
