Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbYA-00043N-Ia
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:26:06 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 18/53] docs-rst: filesystems: use c domain references where
 needed
Date: Tue, 16 May 2017 09:16:10 -0300
Message-Id: <7a2208f636cc05c06593832bae9f599c73437322.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of just mention the function names, use cross-references
to the kernel-doc tags where pertinent.

While not all function documentation is included here, I
double-checked that all functions mentioned there still
exists.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/filesystems/index.rst | 76 +++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 3bc82e9d22f0..148becd91cba 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -125,27 +125,27 @@ Details
 The journalling layer is easy to use. You need to first of all create a
 journal_t data structure. There are two calls to do this dependent on
 how you decide to allocate the physical media on which the journal
-resides. The jbd2_journal_init_inode() call is for journals stored in
-filesystem inodes, or the jbd2_journal_init_dev() call can be used
+resides. The :c:func:`jbd2_journal_init_inode` call is for journals stored in
+filesystem inodes, or the :c:func:`jbd2_journal_init_dev` call can be used
 for journal stored on a raw device (in a continuous range of blocks). A
 journal_t is a typedef for a struct pointer, so when you are finally
-finished make sure you call jbd2_journal_destroy() on it to free up
+finished make sure you call :c:func:`jbd2_journal_destroy` on it to free up
 any used kernel memory.
 
 Once you have got your journal_t object you need to 'mount' or load the
 journal file. The journalling layer expects the space for the journal
 was already allocated and initialized properly by the userspace tools.
-When loading the journal you must call jbd2_journal_load() to process
+When loading the journal you must call :c:func:`jbd2_journal_load` to process
 journal contents. If the client file system detects the journal contents
 does not need to be processed (or even need not have valid contents), it
-may call jbd2_journal_wipe() to clear the journal contents before
-calling jbd2_journal_load().
+may call :c:func:`jbd2_journal_wipe` to clear the journal contents before
+calling :c:func:`jbd2_journal_load`.
 
 Note that jbd2_journal_wipe(..,0) calls
-jbd2_journal_skip_recovery() for you if it detects any outstanding
-transactions in the journal and similarly jbd2_journal_load() will
-call jbd2_journal_recover() if necessary. I would advise reading
-ext4_load_journal() in fs/ext4/super.c for examples on this stage.
+:c:func:`jbd2_journal_skip_recovery` for you if it detects any outstanding
+transactions in the journal and similarly :c:func:`jbd2_journal_load` will
+call :c:func:`jbd2_journal_recover` if necessary. I would advise reading
+:c:func:`ext4_load_journal` in fs/ext4/super.c for examples on this stage.
 
 Now you can go ahead and start modifying the underlying filesystem.
 Almost.
@@ -154,54 +154,57 @@ You still need to actually journal your filesystem changes, this is done
 by wrapping them into transactions. Additionally you also need to wrap
 the modification of each of the buffers with calls to the journal layer,
 so it knows what the modifications you are actually making are. To do
-this use jbd2_journal_start() which returns a transaction handle.
+this use :c:func:`jbd2_journal_start` which returns a transaction handle.
 
-jbd2_journal_start() and its counterpart jbd2_journal_stop(), which
-indicates the end of a transaction are nestable calls, so you can
+:c:func:`jbd2_journal_start` and its counterpart :c:func:`jbd2_journal_stop`,
+which indicates the end of a transaction are nestable calls, so you can
 reenter a transaction if necessary, but remember you must call
-jbd2_journal_stop() the same number of times as jbd2_journal_start()
-before the transaction is completed (or more accurately leaves the
-update phase). Ext4/VFS makes use of this feature to simplify handling
-of inode dirtying, quota support, etc.
+:c:func:`jbd2_journal_stop` the same number of times as
+:c:func:`jbd2_journal_start` before the transaction is completed (or more
+accurately leaves the update phase). Ext4/VFS makes use of this feature to
+simplify handling of inode dirtying, quota support, etc.
 
 Inside each transaction you need to wrap the modifications to the
 individual buffers (blocks). Before you start to modify a buffer you
-need to call jbd2_journal_get_{create,write,undo}_access() as
-appropriate, this allows the journalling layer to copy the unmodified
+need to call :c:func:`jbd2_journal_get_create_access()` /
+:c:func:`jbd2_journal_get_write_access()` /
+:c:func:`jbd2_journal_get_undo_access()` as appropriate, this allows the
+journalling layer to copy the unmodified
 data if it needs to. After all the buffer may be part of a previously
 uncommitted transaction. At this point you are at last ready to modify a
 buffer, and once you are have done so you need to call
-jbd2_journal_dirty_{meta,}data(). Or if you've asked for access to a
+:c:func:`jbd2_journal_dirty_metadata`. Or if you've asked for access to a
 buffer you now know is now longer required to be pushed back on the
-device you can call jbd2_journal_forget() in much the same way as you
-might have used bforget() in the past.
+device you can call :c:func:`jbd2_journal_forget` in much the same way as you
+might have used :c:func:`bforget` in the past.
 
-A jbd2_journal_flush() may be called at any time to commit and
+A :c:func:`jbd2_journal_flush` may be called at any time to commit and
 checkpoint all your transactions.
 
-Then at umount time , in your put_super() you can then call
-jbd2_journal_destroy() to clean up your in-core journal object.
+Then at umount time , in your :c:func:`put_super` you can then call
+:c:func:`jbd2_journal_destroy` to clean up your in-core journal object.
 
 Unfortunately there a couple of ways the journal layer can cause a
 deadlock. The first thing to note is that each task can only have a
 single outstanding transaction at any one time, remember nothing commits
-until the outermost jbd2_journal_stop(). This means you must complete
+until the outermost :c:func:`jbd2_journal_stop`. This means you must complete
 the transaction at the end of each file/inode/address etc. operation you
 perform, so that the journalling system isn't re-entered on another
 journal. Since transactions can't be nested/batched across differing
 journals, and another filesystem other than yours (say ext4) may be
 modified in a later syscall.
 
-The second case to bear in mind is that jbd2_journal_start() can block
+The second case to bear in mind is that :c:func:`jbd2_journal_start` can block
 if there isn't enough space in the journal for your transaction (based
 on the passed nblocks param) - when it blocks it merely(!) needs to wait
 for transactions to complete and be committed from other tasks, so
-essentially we are waiting for jbd2_journal_stop(). So to avoid
-deadlocks you must treat jbd2_journal_start/stop() as if they were
-semaphores and include them in your semaphore ordering rules to prevent
-deadlocks. Note that jbd2_journal_extend() has similar blocking
-behaviour to jbd2_journal_start() so you can deadlock here just as
-easily as on jbd2_journal_start().
+essentially we are waiting for :c:func:`jbd2_journal_stop`. So to avoid
+deadlocks you must treat :c:func:`jbd2_journal_start` /
+:c:func:`jbd2_journal_stop` as if they were semaphores and include them in
+your semaphore ordering rules to prevent
+deadlocks. Note that :c:func:`jbd2_journal_extend` has similar blocking
+behaviour to :c:func:`jbd2_journal_start` so you can deadlock here just as
+easily as on :c:func:`jbd2_journal_start`.
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
@@ -222,13 +225,14 @@ With journal commit callbacks you can ask the journalling layer to call
 a callback function when the transaction is finally committed to disk,
 so that you can do some of your own management. You ask the journalling
 layer for calling the callback by simply setting
-journal->j_commit_callback function pointer and that function is
+``journal->j_commit_callback`` function pointer and that function is
 called after each transaction commit. You can also use
-transaction->t_private_list for attaching entries to a transaction
+``transaction->t_private_list`` for attaching entries to a transaction
 that need processing when the transaction commits.
 
 JBD2 also provides a way to block all transaction updates via
-jbd2_journal_{un,}lock_updates(). Ext4 uses this when it wants a
+:c:func:`jbd2_journal_lock_updates()` /
+:c:func:`jbd2_journal_unlock_updates()`. Ext4 uses this when it wants a
 window with a clean and stable fs for a moment. E.g.
 
 ::
-- 
2.9.3
