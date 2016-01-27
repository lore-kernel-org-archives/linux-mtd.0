Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOSA2-000298-A9
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 15:37:35 +0000
Received: by mail-lf0-x236.google.com with SMTP id c192so8521253lfe.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 07:37:13 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?U3phYsOzIFRhbcOhcw==?= <sztomi89@gmail.com>
Date: Wed, 27 Jan 2016 16:36:32 +0100
Message-ID: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
Subject: JFFS2 deadlock
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

Hello all,

I work on an embedded system running Linux 3.10 and found a deadlock
situation between jffs2_readpage and jffs2_write.
The problem is present on the latest 4.4 kernel too and occurs when
two tasks want to access the same file, one reads and the other writes it.

The kernel stack traces for writer and reader in deadlock:

__switch_to+0x4c/0x98
sleep_on_page+0x10/0x24
__lock_page+0x8c/0x9c
find_lock_page+0x7c/0x94
grab_cache_page_write_begin+0x64/0xd8
jffs2_write_begin+0x6c/0x2ec
generic_file_buffered_write+0x188/0x258
__generic_file_aio_write+0x1e0/0x484
generic_file_aio_write+0x70/0xfc
do_sync_write+0x7c/0xd4
vfs_write+0xc8/0x1b0
SyS_write+0x4c/0xa8
ret_from_syscall+0x0/0x38

__switch_to+0x4c/0x98
jffs2_readpage+0x28/0x5c
generic_file_aio_read+0x22c/0x7a0
do_sync_read+0x7c/0xd4
vfs_read+0xb0/0x170
SyS_read+0x4c/0xa8
ret_from_syscall+0x0/0x38

The root cause here is the locking order of f->sem mutex and pagelock.
jffs2_readpage function gets the page in locked state and then locks
the f->sem mutex, while jffs2_write_begin does it in reverse order.

I found a commit that brought in this bug.
That was a fix for another deadlock issue:
https://github.com/torvalds/linux/commit/5ffd3412ae5536a4c57469cb8ea31887121dcb2e

According to this commit and my code inspections the lock orders may be
the following:
readpage: page lock, f->sem
writepage_begin: f->sem, page lock
writepage_end: page lock, f->sem
GC: f->sem, page lock


Reproducing:
Besides the physical device I can reproduce the deadlock on a desktop debian8
virtual machine too, with a JFFS2 filesystem created on top of nandsim device.
I made it in the following way:

modprobe nandsim first_id_byte=0x20 second_id_byte=0x55
modprobe mtdblock
mkdir /mnt/jffs2
mount -t jffs2 /dev/mtdblock0 /mnt/jffs2/
TEST_FILE="/mnt/jffs2/test"
( while [ true ]; do date > $TEST_FILE; done ) &
( while [ true ]; do cat $TEST_FILE >/dev/null; done ) &

In a short time the date and cat processes will stuck in uninterruptible
sleep state.

Is it a known issue? If not, is there anyone who is familiar with JFFS2
internals and could help me how to correct it?

Best regards,
Tamas
