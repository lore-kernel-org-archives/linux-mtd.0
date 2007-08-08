Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIoOa-0005oY-Js
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 17:28:30 +0100
Date: Wed, 8 Aug 2007 18:22:56 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: [Patch 15/18] fs/logfs/Locking
Message-ID: <20070808162256.GQ15319@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20070808161234.GB15319@lazybastard.org>
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- /dev/null	2007-08-05 21:14:35.622844160 +0200
+++ linux-2.6.21logfs/fs/logfs/Locking	2007-08-08 02:57:37.000000000 +0200
@@ -0,0 +1,48 @@
+Locks:
+
+s_victim_mutex
+Protects victim inode for create, unlink, mkdir, rmdir, mknod, link,
+symlink and one variant of rename.  Only one victim inode may exist at
+a time.  In case of unclean unmount, victim inode has to be deleted
+before next read-writable mount.
+
+s_rename_mutex
+Protects victim dd for rename.  Only one victim dd may exist at a
+time.  In case of unclean unmount, victim dd has to be deleted before
+next read-writable mount.
+
+s_write_inode_mutex
+Taken when writing an inode.  Deleted inodes can be locked, preventing
+further iget operations during writeout.  Logfs may need to iget the
+inode for garbage collection, so the inode in question needs to be
+stored in the superblock and used directly without calling iget.
+
+s_journal_sem
+Used for allocating space in journal.
+Also protects super->s_je and super->s_compressed_je.  Those two
+buffers are used unprotected in the mount path, the only valid
+exception.
+
+s_r_sem
+Protects the memory required for reads from the filesystem.
+
+s_w_sem
+Protects the memory required for writes to the filesystem.
+
+s_ino_lock
+Protects s_last_ino.
+
+
+Lock order:
+s_rename_mutex --> s_victim_mutex
+s_rename_mutex --> s_write_inode_mutex
+s_rename_mutex --> s_w_sem
+
+s_victim_mutex --> s_write_inode_mutex
+s_victim_mutex --> s_w_sem
+s_victim_mutex --> s_ino_lock
+
+s_write_inode_mutex --> s_w_sem
+
+s_w_sem --> s_log_sem
+s_w_sem --> s_r_sem
