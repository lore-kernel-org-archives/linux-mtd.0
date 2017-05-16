Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQO-0001MT-US
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:19:08 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jani Nikula <jani.nikula@intel.com>,
 Markus Heiser <markus.heiser@darmarit.de>,
 "Herton R. Krzesinski" <herton@redhat.com>,
 Silvio Fricke <silvio.fricke@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v2 17/53] docs-rst: convert filesystems book to ReST
Date: Tue, 16 May 2017 09:16:09 -0300
Message-Id: <90f9f118b75cbafc9114b6f2e8a7f87de170eea0.1494935649.git.mchehab@s-opensource.com>
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

Use pandoc to convert documentation to ReST by calling
Documentation/sphinx/tmplcvt script.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/DocBook/Makefile         |   2 +-
 Documentation/DocBook/filesystems.tmpl | 381 ---------------------------------
 Documentation/conf.py                  |   2 +
 Documentation/filesystems/conf.py      |  10 +
 Documentation/filesystems/index.rst    | 314 +++++++++++++++++++++++++++
 Documentation/index.rst                |   1 +
 6 files changed, 328 insertions(+), 382 deletions(-)
 delete mode 100644 Documentation/DocBook/filesystems.tmpl
 create mode 100644 Documentation/filesystems/conf.py
 create mode 100644 Documentation/filesystems/index.rst

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index b9d2b88b9905..2f767e30b59e 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -8,7 +8,7 @@
 
 DOCBOOKS := z8530book.xml  \
 	    networking.xml \
-	    filesystems.xml lsm.xml \
+	    lsm.xml \
 	    libata.xml mtdnand.xml librs.xml rapidio.xml \
 	    s390-drivers.xml scsi.xml \
 	    sh.xml w1.xml
diff --git a/Documentation/DocBook/filesystems.tmpl b/Documentation/DocBook/filesystems.tmpl
deleted file mode 100644
index 6006b6358c86..000000000000
--- a/Documentation/DocBook/filesystems.tmpl
+++ /dev/null
@@ -1,381 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
-	"http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" []>
-
-<book id="Linux-filesystems-API">
- <bookinfo>
-  <title>Linux Filesystems API</title>
-
-  <legalnotice>
-   <para>
-     This documentation is free software; you can redistribute
-     it and/or modify it under the terms of the GNU General Public
-     License as published by the Free Software Foundation; either
-     version 2 of the License, or (at your option) any later
-     version.
-   </para>
-
-   <para>
-     This program is distributed in the hope that it will be
-     useful, but WITHOUT ANY WARRANTY; without even the implied
-     warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-     See the GNU General Public License for more details.
-   </para>
-
-   <para>
-     You should have received a copy of the GNU General Public
-     License along with this program; if not, write to the Free
-     Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
-     MA 02111-1307 USA
-   </para>
-
-   <para>
-     For more details see the file COPYING in the source
-     distribution of Linux.
-   </para>
-  </legalnotice>
- </bookinfo>
-
-<toc></toc>
-
-  <chapter id="vfs">
-     <title>The Linux VFS</title>
-     <sect1 id="the_filesystem_types"><title>The Filesystem types</title>
-!Iinclude/linux/fs.h
-     </sect1>
-     <sect1 id="the_directory_cache"><title>The Directory Cache</title>
-!Efs/dcache.c
-!Iinclude/linux/dcache.h
-     </sect1>
-     <sect1 id="inode_handling"><title>Inode Handling</title>
-!Efs/inode.c
-!Efs/bad_inode.c
-     </sect1>
-     <sect1 id="registration_and_superblocks"><title>Registration and Superblocks</title>
-!Efs/super.c
-     </sect1>
-     <sect1 id="file_locks"><title>File Locks</title>
-!Efs/locks.c
-!Ifs/locks.c
-     </sect1>
-     <sect1 id="other_functions"><title>Other Functions</title>
-!Efs/mpage.c
-!Efs/namei.c
-!Efs/buffer.c
-!Eblock/bio.c
-!Efs/seq_file.c
-!Efs/filesystems.c
-!Efs/fs-writeback.c
-!Efs/block_dev.c
-     </sect1>
-  </chapter>
-
-  <chapter id="proc">
-     <title>The proc filesystem</title>
-
-     <sect1 id="sysctl_interface"><title>sysctl interface</title>
-!Ekernel/sysctl.c
-     </sect1>
-
-     <sect1 id="proc_filesystem_interface"><title>proc filesystem interface</title>
-!Ifs/proc/base.c
-     </sect1>
-  </chapter>
-
-  <chapter id="fs_events">
-     <title>Events based on file descriptors</title>
-!Efs/eventfd.c
-  </chapter>
-
-  <chapter id="sysfs">
-     <title>The Filesystem for Exporting Kernel Objects</title>
-!Efs/sysfs/file.c
-!Efs/sysfs/symlink.c
-  </chapter>
-
-  <chapter id="debugfs">
-     <title>The debugfs filesystem</title>
-
-     <sect1 id="debugfs_interface"><title>debugfs interface</title>
-!Efs/debugfs/inode.c
-!Efs/debugfs/file.c
-     </sect1>
-  </chapter>
-
-  <chapter id="LinuxJDBAPI">
-  <chapterinfo>
-  <title>The Linux Journalling API</title>
-
-  <authorgroup>
-  <author>
-     <firstname>Roger</firstname>
-     <surname>Gammans</surname>
-     <affiliation>
-     <address>
-      <email>rgammans@computer-surgery.co.uk</email>
-     </address>
-    </affiliation>
-     </author>
-  </authorgroup>
-
-  <authorgroup>
-   <author>
-    <firstname>Stephen</firstname>
-    <surname>Tweedie</surname>
-    <affiliation>
-     <address>
-      <email>sct@redhat.com</email>
-     </address>
-    </affiliation>
-   </author>
-  </authorgroup>
-
-  <copyright>
-   <year>2002</year>
-   <holder>Roger Gammans</holder>
-  </copyright>
-  </chapterinfo>
-
-  <title>The Linux Journalling API</title>
-
-    <sect1 id="journaling_overview">
-     <title>Overview</title>
-    <sect2 id="journaling_details">
-     <title>Details</title>
-<para>
-The journalling layer is  easy to use. You need to
-first of all create a journal_t data structure. There are
-two calls to do this dependent on how you decide to allocate the physical
-media on which the journal resides. The jbd2_journal_init_inode() call
-is for journals stored in filesystem inodes, or the jbd2_journal_init_dev()
-call can be used for journal stored on a raw device (in a continuous range
-of blocks). A journal_t is a typedef for a struct pointer, so when
-you are finally finished make sure you call jbd2_journal_destroy() on it
-to free up any used kernel memory.
-</para>
-
-<para>
-Once you have got your journal_t object you need to 'mount' or load the journal
-file. The journalling layer expects the space for the journal was already
-allocated and initialized properly by the userspace tools.  When loading the
-journal you must call jbd2_journal_load() to process journal contents.  If the
-client file system detects the journal contents does not need to be processed
-(or even need not have valid contents), it may call jbd2_journal_wipe() to
-clear the journal contents before calling jbd2_journal_load().
-</para>
-
-<para>
-Note that jbd2_journal_wipe(..,0) calls jbd2_journal_skip_recovery() for you if
-it detects any outstanding transactions in the journal and similarly
-jbd2_journal_load() will call jbd2_journal_recover() if necessary.  I would
-advise reading ext4_load_journal() in fs/ext4/super.c for examples on this
-stage.
-</para>
-
-<para>
-Now you can go ahead and start modifying the underlying
-filesystem. Almost.
-</para>
-
-<para>
-
-You still need to actually journal your filesystem changes, this
-is done by wrapping them into transactions. Additionally you
-also need to wrap the modification of each of the buffers
-with calls to the journal layer, so it knows what the modifications
-you are actually making are. To do this use jbd2_journal_start() which
-returns a transaction handle.
-</para>
-
-<para>
-jbd2_journal_start()
-and its counterpart jbd2_journal_stop(), which indicates the end of a
-transaction are nestable calls, so you can reenter a transaction if necessary,
-but remember you must call jbd2_journal_stop() the same number of times as
-jbd2_journal_start() before the transaction is completed (or more accurately
-leaves the update phase). Ext4/VFS makes use of this feature to simplify
-handling of inode dirtying, quota support, etc.
-</para>
-
-<para>
-Inside each transaction you need to wrap the modifications to the
-individual buffers (blocks). Before you start to modify a buffer you
-need to call jbd2_journal_get_{create,write,undo}_access() as appropriate,
-this allows the journalling layer to copy the unmodified data if it
-needs to. After all the buffer may be part of a previously uncommitted
-transaction.
-At this point you are at last ready to modify a buffer, and once
-you are have done so you need to call jbd2_journal_dirty_{meta,}data().
-Or if you've asked for access to a buffer you now know is now longer
-required to be pushed back on the device you can call jbd2_journal_forget()
-in much the same way as you might have used bforget() in the past.
-</para>
-
-<para>
-A jbd2_journal_flush() may be called at any time to commit and checkpoint
-all your transactions.
-</para>
-
-<para>
-Then at umount time , in your put_super() you can then call jbd2_journal_destroy()
-to clean up your in-core journal object.
-</para>
-
-<para>
-Unfortunately there a couple of ways the journal layer can cause a deadlock.
-The first thing to note is that each task can only have
-a single outstanding transaction at any one time, remember nothing
-commits until the outermost jbd2_journal_stop(). This means
-you must complete the transaction at the end of each file/inode/address
-etc. operation you perform, so that the journalling system isn't re-entered
-on another journal. Since transactions can't be nested/batched
-across differing journals, and another filesystem other than
-yours (say ext4) may be modified in a later syscall.
-</para>
-
-<para>
-The second case to bear in mind is that jbd2_journal_start() can
-block if there isn't enough space in the journal for your transaction
-(based on the passed nblocks param) - when it blocks it merely(!) needs to
-wait for transactions to complete and be committed from other tasks,
-so essentially we are waiting for jbd2_journal_stop(). So to avoid
-deadlocks you must treat jbd2_journal_start/stop() as if they
-were semaphores and include them in your semaphore ordering rules to prevent
-deadlocks. Note that jbd2_journal_extend() has similar blocking behaviour to
-jbd2_journal_start() so you can deadlock here just as easily as on
-jbd2_journal_start().
-</para>
-
-<para>
-Try to reserve the right number of blocks the first time. ;-). This will
-be the maximum number of blocks you are going to touch in this transaction.
-I advise having a look at at least ext4_jbd.h to see the basis on which
-ext4 uses to make these decisions.
-</para>
-
-<para>
-Another wriggle to watch out for is your on-disk block allocation strategy.
-Why? Because, if you do a delete, you need to ensure you haven't reused any
-of the freed blocks until the transaction freeing these blocks commits. If you
-reused these blocks and crash happens, there is no way to restore the contents
-of the reallocated blocks at the end of the last fully committed transaction.
-
-One simple way of doing this is to mark blocks as free in internal in-memory
-block allocation structures only after the transaction freeing them commits.
-Ext4 uses journal commit callback for this purpose.
-</para>
-
-<para>
-With journal commit callbacks you can ask the journalling layer to call a
-callback function when the transaction is finally committed to disk, so that
-you can do some of your own management. You ask the journalling layer for
-calling the callback by simply setting journal->j_commit_callback function
-pointer and that function is called after each transaction commit. You can also
-use transaction->t_private_list for attaching entries to a transaction that
-need processing when the transaction commits.
-</para>
-
-<para>
-JBD2 also provides a way to block all transaction updates via
-jbd2_journal_{un,}lock_updates(). Ext4 uses this when it wants a window with a
-clean and stable fs for a moment.  E.g.
-</para>
-
-<programlisting>
-
-	jbd2_journal_lock_updates() //stop new stuff happening..
-	jbd2_journal_flush()        // checkpoint everything.
-	..do stuff on stable fs
-	jbd2_journal_unlock_updates() // carry on with filesystem use.
-</programlisting>
-
-<para>
-The opportunities for abuse and DOS attacks with this should be obvious,
-if you allow unprivileged userspace to trigger codepaths containing these
-calls.
-</para>
-
-    </sect2>
-
-    <sect2 id="jbd_summary">
-     <title>Summary</title>
-<para>
-Using the journal is a matter of wrapping the different context changes,
-being each mount, each modification (transaction) and each changed buffer
-to tell the journalling layer about them.
-</para>
-
-    </sect2>
-
-    </sect1>
-
-    <sect1 id="data_types">
-     <title>Data Types</title>
-     <para>
-	The journalling layer uses typedefs to 'hide' the concrete definitions
-	of the structures used. As a client of the JBD2 layer you can
-	just rely on the using the pointer as a magic cookie  of some sort.
-
-	Obviously the hiding is not enforced as this is 'C'.
-     </para>
-	<sect2 id="structures"><title>Structures</title>
-!Iinclude/linux/jbd2.h
-	</sect2>
-    </sect1>
-
-    <sect1 id="functions">
-     <title>Functions</title>
-     <para>
-	The functions here are split into two groups those that
-	affect a journal as a whole, and those which are used to
-	manage transactions
-     </para>
-	<sect2 id="journal_level"><title>Journal Level</title>
-!Efs/jbd2/journal.c
-!Ifs/jbd2/recovery.c
-	</sect2>
-	<sect2 id="transaction_level"><title>Transasction Level</title>
-!Efs/jbd2/transaction.c
-	</sect2>
-    </sect1>
-    <sect1 id="see_also">
-     <title>See also</title>
-	<para>
-	  <citation>
-	   <ulink url="http://kernel.org/pub/linux/kernel/people/sct/ext3/journal-design.ps.gz">
-	   	Journaling the Linux ext2fs Filesystem, LinuxExpo 98, Stephen Tweedie
-	   </ulink>
-	  </citation>
-	</para>
-	<para>
-	   <citation>
-	   <ulink url="http://olstrans.sourceforge.net/release/OLS2000-ext3/OLS2000-ext3.html">
-	   	Ext3 Journalling FileSystem, OLS 2000, Dr. Stephen Tweedie
-	   </ulink>
-	   </citation>
-	</para>
-    </sect1>
-
-  </chapter>
-
-  <chapter id="splice">
-      <title>splice API</title>
-  <para>
-	splice is a method for moving blocks of data around inside the
-	kernel, without continually transferring them between the kernel
-	and user space.
-  </para>
-!Ffs/splice.c
-  </chapter>
-
-  <chapter id="pipes">
-      <title>pipes API</title>
-  <para>
-	Pipe interfaces are all for in-kernel (builtin image) use.
-	They are not exported for use by modules.
-  </para>
-!Iinclude/linux/pipe_fs_i.h
-!Ffs/pipe.c
-  </chapter>
-
-</book>
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 2e215477edf5..ad9a4781b330 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -359,6 +359,8 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('driver-api/index', 'driver-api.tex', 'The kernel driver API manual',
      'The kernel development community', 'manual'),
+    ('filesystems/index', 'filesystems.tex', 'Linux Filesystems API',
+     'The kernel development community', 'manual'),
     ('gpu/index', 'gpu.tex', 'Linux GPU Driver Developer\'s Guide',
      'The kernel development community', 'manual'),
     ('input/index', 'linux-input.tex', 'The Linux input driver subsystem',
diff --git a/Documentation/filesystems/conf.py b/Documentation/filesystems/conf.py
new file mode 100644
index 000000000000..ea44172af5c4
--- /dev/null
+++ b/Documentation/filesystems/conf.py
@@ -0,0 +1,10 @@
+# -*- coding: utf-8; mode: python -*-
+
+project = "Linux Filesystems API"
+
+tags.add("subproject")
+
+latex_documents = [
+    ('index', 'filesystems.tex', project,
+     'The kernel development community', 'manual'),
+]
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
new file mode 100644
index 000000000000..3bc82e9d22f0
--- /dev/null
+++ b/Documentation/filesystems/index.rst
@@ -0,0 +1,314 @@
+=====================
+Linux Filesystems API
+=====================
+
+The Linux VFS
+=============
+
+The Filesystem types
+--------------------
+
+.. kernel-doc:: include/linux/fs.h
+   :internal:
+
+The Directory Cache
+-------------------
+
+.. kernel-doc:: fs/dcache.c
+   :export:
+
+.. kernel-doc:: include/linux/dcache.h
+   :internal:
+
+Inode Handling
+--------------
+
+.. kernel-doc:: fs/inode.c
+   :export:
+
+.. kernel-doc:: fs/bad_inode.c
+   :export:
+
+Registration and Superblocks
+----------------------------
+
+.. kernel-doc:: fs/super.c
+   :export:
+
+File Locks
+----------
+
+.. kernel-doc:: fs/locks.c
+   :export:
+
+.. kernel-doc:: fs/locks.c
+   :internal:
+
+Other Functions
+---------------
+
+.. kernel-doc:: fs/mpage.c
+   :export:
+
+.. kernel-doc:: fs/namei.c
+   :export:
+
+.. kernel-doc:: fs/buffer.c
+   :export:
+
+.. kernel-doc:: block/bio.c
+   :export:
+
+.. kernel-doc:: fs/seq_file.c
+   :export:
+
+.. kernel-doc:: fs/filesystems.c
+   :export:
+
+.. kernel-doc:: fs/fs-writeback.c
+   :export:
+
+.. kernel-doc:: fs/block_dev.c
+   :export:
+
+The proc filesystem
+===================
+
+sysctl interface
+----------------
+
+.. kernel-doc:: kernel/sysctl.c
+   :export:
+
+proc filesystem interface
+-------------------------
+
+.. kernel-doc:: fs/proc/base.c
+   :internal:
+
+Events based on file descriptors
+================================
+
+.. kernel-doc:: fs/eventfd.c
+   :export:
+
+The Filesystem for Exporting Kernel Objects
+===========================================
+
+.. kernel-doc:: fs/sysfs/file.c
+   :export:
+
+.. kernel-doc:: fs/sysfs/symlink.c
+   :export:
+
+The debugfs filesystem
+======================
+
+debugfs interface
+-----------------
+
+.. kernel-doc:: fs/debugfs/inode.c
+   :export:
+
+.. kernel-doc:: fs/debugfs/file.c
+   :export:
+
+The Linux Journalling API
+=========================
+
+Overview
+--------
+
+Details
+~~~~~~~
+
+The journalling layer is easy to use. You need to first of all create a
+journal_t data structure. There are two calls to do this dependent on
+how you decide to allocate the physical media on which the journal
+resides. The jbd2_journal_init_inode() call is for journals stored in
+filesystem inodes, or the jbd2_journal_init_dev() call can be used
+for journal stored on a raw device (in a continuous range of blocks). A
+journal_t is a typedef for a struct pointer, so when you are finally
+finished make sure you call jbd2_journal_destroy() on it to free up
+any used kernel memory.
+
+Once you have got your journal_t object you need to 'mount' or load the
+journal file. The journalling layer expects the space for the journal
+was already allocated and initialized properly by the userspace tools.
+When loading the journal you must call jbd2_journal_load() to process
+journal contents. If the client file system detects the journal contents
+does not need to be processed (or even need not have valid contents), it
+may call jbd2_journal_wipe() to clear the journal contents before
+calling jbd2_journal_load().
+
+Note that jbd2_journal_wipe(..,0) calls
+jbd2_journal_skip_recovery() for you if it detects any outstanding
+transactions in the journal and similarly jbd2_journal_load() will
+call jbd2_journal_recover() if necessary. I would advise reading
+ext4_load_journal() in fs/ext4/super.c for examples on this stage.
+
+Now you can go ahead and start modifying the underlying filesystem.
+Almost.
+
+You still need to actually journal your filesystem changes, this is done
+by wrapping them into transactions. Additionally you also need to wrap
+the modification of each of the buffers with calls to the journal layer,
+so it knows what the modifications you are actually making are. To do
+this use jbd2_journal_start() which returns a transaction handle.
+
+jbd2_journal_start() and its counterpart jbd2_journal_stop(), which
+indicates the end of a transaction are nestable calls, so you can
+reenter a transaction if necessary, but remember you must call
+jbd2_journal_stop() the same number of times as jbd2_journal_start()
+before the transaction is completed (or more accurately leaves the
+update phase). Ext4/VFS makes use of this feature to simplify handling
+of inode dirtying, quota support, etc.
+
+Inside each transaction you need to wrap the modifications to the
+individual buffers (blocks). Before you start to modify a buffer you
+need to call jbd2_journal_get_{create,write,undo}_access() as
+appropriate, this allows the journalling layer to copy the unmodified
+data if it needs to. After all the buffer may be part of a previously
+uncommitted transaction. At this point you are at last ready to modify a
+buffer, and once you are have done so you need to call
+jbd2_journal_dirty_{meta,}data(). Or if you've asked for access to a
+buffer you now know is now longer required to be pushed back on the
+device you can call jbd2_journal_forget() in much the same way as you
+might have used bforget() in the past.
+
+A jbd2_journal_flush() may be called at any time to commit and
+checkpoint all your transactions.
+
+Then at umount time , in your put_super() you can then call
+jbd2_journal_destroy() to clean up your in-core journal object.
+
+Unfortunately there a couple of ways the journal layer can cause a
+deadlock. The first thing to note is that each task can only have a
+single outstanding transaction at any one time, remember nothing commits
+until the outermost jbd2_journal_stop(). This means you must complete
+the transaction at the end of each file/inode/address etc. operation you
+perform, so that the journalling system isn't re-entered on another
+journal. Since transactions can't be nested/batched across differing
+journals, and another filesystem other than yours (say ext4) may be
+modified in a later syscall.
+
+The second case to bear in mind is that jbd2_journal_start() can block
+if there isn't enough space in the journal for your transaction (based
+on the passed nblocks param) - when it blocks it merely(!) needs to wait
+for transactions to complete and be committed from other tasks, so
+essentially we are waiting for jbd2_journal_stop(). So to avoid
+deadlocks you must treat jbd2_journal_start/stop() as if they were
+semaphores and include them in your semaphore ordering rules to prevent
+deadlocks. Note that jbd2_journal_extend() has similar blocking
+behaviour to jbd2_journal_start() so you can deadlock here just as
+easily as on jbd2_journal_start().
+
+Try to reserve the right number of blocks the first time. ;-). This will
+be the maximum number of blocks you are going to touch in this
+transaction. I advise having a look at at least ext4_jbd.h to see the
+basis on which ext4 uses to make these decisions.
+
+Another wriggle to watch out for is your on-disk block allocation
+strategy. Why? Because, if you do a delete, you need to ensure you
+haven't reused any of the freed blocks until the transaction freeing
+these blocks commits. If you reused these blocks and crash happens,
+there is no way to restore the contents of the reallocated blocks at the
+end of the last fully committed transaction. One simple way of doing
+this is to mark blocks as free in internal in-memory block allocation
+structures only after the transaction freeing them commits. Ext4 uses
+journal commit callback for this purpose.
+
+With journal commit callbacks you can ask the journalling layer to call
+a callback function when the transaction is finally committed to disk,
+so that you can do some of your own management. You ask the journalling
+layer for calling the callback by simply setting
+journal->j_commit_callback function pointer and that function is
+called after each transaction commit. You can also use
+transaction->t_private_list for attaching entries to a transaction
+that need processing when the transaction commits.
+
+JBD2 also provides a way to block all transaction updates via
+jbd2_journal_{un,}lock_updates(). Ext4 uses this when it wants a
+window with a clean and stable fs for a moment. E.g.
+
+::
+
+
+        jbd2_journal_lock_updates() //stop new stuff happening..
+        jbd2_journal_flush()        // checkpoint everything.
+        ..do stuff on stable fs
+        jbd2_journal_unlock_updates() // carry on with filesystem use.
+
+The opportunities for abuse and DOS attacks with this should be obvious,
+if you allow unprivileged userspace to trigger codepaths containing
+these calls.
+
+Summary
+~~~~~~~
+
+Using the journal is a matter of wrapping the different context changes,
+being each mount, each modification (transaction) and each changed
+buffer to tell the journalling layer about them.
+
+Data Types
+----------
+
+The journalling layer uses typedefs to 'hide' the concrete definitions
+of the structures used. As a client of the JBD2 layer you can just rely
+on the using the pointer as a magic cookie of some sort. Obviously the
+hiding is not enforced as this is 'C'.
+
+Structures
+~~~~~~~~~~
+
+.. kernel-doc:: include/linux/jbd2.h
+   :internal:
+
+Functions
+---------
+
+The functions here are split into two groups those that affect a journal
+as a whole, and those which are used to manage transactions
+
+Journal Level
+~~~~~~~~~~~~~
+
+.. kernel-doc:: fs/jbd2/journal.c
+   :export:
+
+.. kernel-doc:: fs/jbd2/recovery.c
+   :internal:
+
+Transasction Level
+~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: fs/jbd2/transaction.c
+   :export:
+
+See also
+--------
+
+`Journaling the Linux ext2fs Filesystem, LinuxExpo 98, Stephen
+Tweedie <http://kernel.org/pub/linux/kernel/people/sct/ext3/journal-design.ps.gz>`__
+
+`Ext3 Journalling FileSystem, OLS 2000, Dr. Stephen
+Tweedie <http://olstrans.sourceforge.net/release/OLS2000-ext3/OLS2000-ext3.html>`__
+
+splice API
+==========
+
+splice is a method for moving blocks of data around inside the kernel,
+without continually transferring them between the kernel and user space.
+
+.. kernel-doc:: fs/splice.c
+
+pipes API
+=========
+
+Pipe interfaces are all for in-kernel (builtin image) use. They are not
+exported for use by modules.
+
+.. kernel-doc:: include/linux/pipe_fs_i.h
+   :internal:
+
+.. kernel-doc:: fs/pipe.c
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 01a24486ea5f..dae365f3820e 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -73,6 +73,7 @@ needed).
    security/index
    sound/index
    crypto/index
+   filesystems/index
 
 Korean translations
 -------------------
-- 
2.9.3
