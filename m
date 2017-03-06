Received: from mail-yw0-x233.google.com ([2607:f8b0:4002:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cktt4-0007NL-Ic
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 14:45:24 +0000
Received: by mail-yw0-x233.google.com with SMTP id o4so59321395ywd.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Mar 2017 06:45:01 -0800 (PST)
MIME-Version: 1.0
From: Steven Walter <swalter@lexmark.com>
Date: Mon, 6 Mar 2017 09:44:40 -0500
Message-ID: <CAN2xnYz=jRUQdYjfGNd7PQQNvG=EUNfpEVtNMSjXCUy98m0OZA@mail.gmail.com>
Subject: jffs2: lock ordering between alloc_sem and lock_page()
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In fs/jffs2/README.Locking, it states to never lock a page cache page with
f->sem held; does this also hold for the alloc_sem mutex?

I ask because I've observed a deadlock that seems to be the result of a
lock ordering problem between alloc_sem and lock_page.  Unfortunately this
deadlock occurred during normal operation and I've not been able to
reproduce it since.  Here are the call stacks in question (note that this
was on a 4.2 kernel, but I don't see any changes in later kernels that
might address the issue):

[<c04d43b4>] (__schedule) from [<c04d46e8>] (schedule+0xb4/0xcc)
[<c04d46e8>] (schedule) from [<c04d8770>] (schedule_timeout+0x2c/0x258)
[<c04d8770>] (schedule_timeout) from [<c04d3f38>]
(io_schedule_timeout+0xb8/0x134)
[<c04d3f38>] (io_schedule_timeout) from [<c04d4f74>] (bit_wait_io+0x64/0x6c)
[<c04d4f74>] (bit_wait_io) from [<c04d4b54>] (__wait_on_bit+0x6c/0xb4)
[<c04d4b54>] (__wait_on_bit) from [<c00e7988>] (wait_on_page_bit+0x9c/0xac)
[<c00e7988>] (wait_on_page_bit) from [<c00e79cc>]
(wait_on_page_read+0x34/0x5c)
[<c00e79cc>] (wait_on_page_read) from [<c00e8228>]
(do_read_cache_page+0xb0/0x194)
[<c00e8228>] (do_read_cache_page) from [<c00e8334>]
(read_cache_page+0x28/0x30)
[<c00e8334>] (read_cache_page) from [<bf275268>]
(jffs2_gc_fetch_page+0x30/0x4c [jffs2])
[<bf275268>] (jffs2_gc_fetch_page [jffs2]) from [<bf2786f8>]
(jffs2_garbage_collect_live+0x8dc/0xe84 [jffs2])
[<bf2786f8>] (jffs2_garbage_collect_live [jffs2]) from [<bf272edc>]
(jffs2_garbage_collect_pass+0x6b4/0x7a8 [jffs2])
[<bf272edc>] (jffs2_garbage_collect_pass [jffs2]) from [<bf27428c>]
(jffs2_garbage_collect_thread+0x210/0x26c [jffs2])
[<bf27428c>] (jffs2_garbage_collect_thread [jffs2]) from [<c00464ac>]
(kthread+0xf4/0x10c)
[<c00464ac>] (kthread) from [<c00104e8>] (ret_from_fork+0x14/0x2c)

[<c04d43b4>] (__schedule) from [<c04d46e8>] (schedule+0xb4/0xcc)
[<c04d46e8>] (schedule) from [<c04d4a1c>]
(schedule_preempt_disabled+0x20/0x2c)
[<c04d4a1c>] (schedule_preempt_disabled) from [<c04d71e8>]
(__mutex_lock_slowpath+0x240/0x3fc)
[<c04d71e8>] (__mutex_lock_slowpath) from [<c04d73d4>]
(mutex_lock+0x30/0x4c)
[<c04d73d4>] (mutex_lock) from [<bf26e2b4>] (jffs2_reserve_space+0x44/0x2b0
[jffs2])
[<bf26e2b4>] (jffs2_reserve_space [jffs2]) from [<bf270c98>]
(jffs2_write_inode_range+0x74/0x2d8
[jffs2])
[<bf270c98>] (jffs2_write_inode_range [jffs2]) from [<bf26bc90>]
(jffs2_write_end+0x114/0x214
[jffs2])
[<bf26bc90>] (jffs2_write_end [jffs2]) from [<c00e88b8>]
(generic_perform_write+0x14c/0x1d4)
[<c00e88b8>] (generic_perform_write) from [<c00e9d64>]
(__generic_file_write_iter+0xc8/0x1ac)
[<c00e9d64>] (__generic_file_write_iter) from [<c00e9fec>]
(generic_file_write_iter+0x1a4/0x23c)
[<c00e9fec>] (generic_file_write_iter) from [<c013ab9c>]
(__vfs_write+0xb8/0xe4)
[<c013ab9c>] (__vfs_write) from [<c013b318>] (vfs_write+0xbc/0x18c)
[<c013b318>] (vfs_write) from [<c013bc44>] (SyS_pwrite64+0x70/0x90)
[<c013bc44>] (SyS_pwrite64) from [<c00105b4>] (__sys_trace_return+0x0/0x2c)

In the vfs_write path, alloc_sem is grabbed after lock_page().  In the
garbage collection path, we try to lock the page while holding alloc_sem.

Isn't this an AB-BA deadlock?
-- 
Steven Walter <swalter@lexmark.com>
